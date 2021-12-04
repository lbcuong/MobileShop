using BraintreeHttp;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MobileShop.Areas.Identity.Data;
using MobileShop.Data;
using MobileShop.Areas.Admin.Models;
using MobileShop.Models;
using PayPal.Core;
using PayPal.v1.Payments;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
namespace MobileShop.Controllers
{
    public class CheckOutController : CartController
    {
        private readonly MobileShopContext _context;
        private readonly UserManager<MobileShopUser> _userManager;
        private readonly string _clientId;
        private readonly string _clientSecret;

        public decimal USDCurrency = 22840;

        public CheckOutController(MobileShopContext context, UserManager<MobileShopUser> userManager, IConfiguration config) : base(context)
        {
            _context = context;
            _userManager = userManager;
            _clientId = config["PaypalSettings:clientId"];
            _clientSecret = config["PaypalSettings:clientSecret"];
        }

        // Display Check Out
        [Authorize(Roles = "Member")]
        public async Task<IActionResult> CheckOut()
        {
            if (ModelState.IsValid)
            {
                var currentUser = await _userManager.GetUserAsync(HttpContext.User);

                var checkOut = new CheckOut
                {
                    CartItem = GetCartItems(),
                    Name = currentUser.Name,
                    PhoneNumber = currentUser.PhoneNumber,
                    Address = currentUser.Address
                };

                if (checkOut.CartItem.Count == 0)
                {
                    return RedirectToAction("Index", "Cart");
                }
                else
                {
                    return View(checkOut);
                }
            }
            return RedirectToAction("Index", "Cart");
        }

        [Authorize(Roles = "Member")]
        public async Task<IActionResult> PaypalCheckOut()
        {
            var environment = new SandboxEnvironment(_clientId, _clientSecret);
            var client = new PayPalHttpClient(environment);

            var itemList = new ItemList()
            {
                Items = new List<PayPal.v1.Payments.Item>()
            };
            var total = Math.Round(GetCartItems().Sum(s => s.SubTotal) / USDCurrency, 2);
            foreach (var item in GetCartItems())
            {
                itemList.Items.Add(new PayPal.v1.Payments.Item()
                {
                    Name = item.Item.Name,
                    Currency = "USD",
                    Price = Math.Round(item.Item.Price / USDCurrency, 2).ToString(),
                    Quantity = item.Quantity.ToString(),
                    Sku = "sku",
                    Tax = "0"
                });
            }



            var paypalOrderId = DateTime.Now.Ticks;
            var hostname = $"{HttpContext.Request.Scheme}://{HttpContext.Request.Host}";
            var payment = new Payment()
            {
                Intent = "sale",
                Transactions = new List<Transaction>()
                {
                    new Transaction()
                    {
                        Amount = new Amount()
                        {
                            Total = total.ToString(),
                            Currency = "USD",
                            Details = new AmountDetails
                            {
                                Tax = "0",
                                Shipping = "0",
                                Subtotal = total.ToString()
                            }
                        },
                        ItemList = itemList,
                        Description = $"Invoice #{paypalOrderId}",
                        InvoiceNumber = paypalOrderId.ToString()
                    }
                },

                RedirectUrls = new RedirectUrls()
                {
                    CancelUrl = $"{hostname}/CheckOut/CheckoutFail",
                    ReturnUrl = $"{hostname}/CheckOut/CheckoutSuccess"
                },

                Payer = new Payer()
                {
                    PaymentMethod = "paypal"
                }
            };
            PaymentCreateRequest request = new PaymentCreateRequest();
            request.RequestBody(payment);

            try
            {


                var response = await client.Execute(request);
                var statusCode = response.StatusCode;
                Payment result = response.Result<Payment>();

                var links = result.Links.GetEnumerator();
                string paypalRedirectUrl = null;
                while (links.MoveNext())
                {
                    LinkDescriptionObject lnk = links.Current;
                    if (lnk.Rel.ToLower().Trim().Equals("approval_url"))
                    {
                        //saving the payapalredirect URL to which user will be redirected for payment  
                        paypalRedirectUrl = lnk.Href;
                    }
                }

                return Redirect(paypalRedirectUrl);
            }
            catch (HttpException httpException)
            {
                var statusCode = httpException.StatusCode;
                var debugId = httpException.Headers.GetValues("PayPal-Debug-Id").FirstOrDefault();

                //Process when Checkout with Paypal fails
                return Redirect("/CheckOut/CheckoutFail");
            }

        }

        public IActionResult CheckoutFail()
        {
            return View();
        }
        public async Task<IActionResult> CheckoutSuccess()
        {
            var currentUser = await _userManager.GetUserAsync(HttpContext.User);
            var orderTotal = Math.Round(GetCartItems().Sum(s => s.SubTotal), 2);

            var order = new Areas.Admin.Models.Order
            {
                UserName = currentUser.UserName,
                Total = orderTotal,
                OrderDate = DateTime.Now,
                Name = currentUser.Name,
                PhoneNumber = currentUser.PhoneNumber,
                Address = currentUser.Address,
                Status = "To Pack"
            };

            _context.Add(order);
            await _context.SaveChangesAsync();

            foreach (var item in GetCartItems())
            {
                var orderdetail = new OrderDetail
                {
                    OrderId = order.OrderId,
                    ItemId = item.Item.ItemId,
                    Quantity = item.Quantity

                };
                _context.Add(orderdetail);
            }
            await _context.SaveChangesAsync();

            ClearCart();

            return RedirectToAction(nameof(IndexCheckoutSuccess));
        }

        public IActionResult IndexCheckoutSuccess()
        {
            return View();
        }
    }
}
