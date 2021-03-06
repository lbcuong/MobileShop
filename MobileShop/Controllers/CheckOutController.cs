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
                decimal total = 0;
                int totalItem = 0;

                foreach (var cartItem in GetCartItems())
                {
                    if (cartItem.Item.Price != cartItem.Item.PromotionPrice)
                    {
                        if (cartItem.Item.PromotionBanner.PromotionStartDate <= DateTime.Now && cartItem.Item.PromotionBanner.PromotionEndDate >= DateTime.Now)
                        {
                            var totalPrice = cartItem.Quantity * cartItem.Item.PromotionPrice;
                            total += totalPrice;
                            totalItem += cartItem.Quantity;
                        }
                        else
                        {
                            var totalPrice = cartItem.Quantity * cartItem.Item.Price;
                            total += totalPrice;
                            totalItem += cartItem.Quantity;
                        }
                    }
                    else
                    {
                        var totalPrice = cartItem.Quantity * cartItem.Item.Price;
                        total += totalPrice;
                        totalItem += cartItem.Quantity;
                    }
                }

                ViewBag.Total = total;
                ViewBag.TotalItem = totalItem;

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
        /*
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
                    CancelUrl = $"{hostname}/CheckOut/PaymentFailed",
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
                return Redirect("/CheckOut/PaymentFailed");
            }

        }
        */
        public IActionResult PaymentFailed()
        {
            return View();
        }
        public async Task<IActionResult> CheckoutSuccess()
        {
            var currentUser = await _userManager.GetUserAsync(HttpContext.User);
            decimal orderTotal = 0;
            foreach (var item in GetCartItems())
            {
                if (item.Item.Price != item.Item.PromotionPrice)
                {
                    if (item.Item.PromotionBanner.PromotionStartDate <= DateTime.Now && item.Item.PromotionBanner.PromotionEndDate >= DateTime.Now)
                    {
                        orderTotal += item.Item.PromotionPrice * item.Quantity;
                    }
                    else
                    {
                        orderTotal += item.Item.Price * item.Quantity;
                    }
                }
                else
                {
                    orderTotal += item.Item.Price * item.Quantity;
                }
            }

            var salesOrder = new Areas.Admin.Models.SalesOrder
            {
                UserName = currentUser.UserName,
                Total = orderTotal,
                OrderDate = DateTime.Now,
                Name = currentUser.Name,
                PhoneNumber = currentUser.PhoneNumber,
                Address = currentUser.Address,
                Status = "To Pack"
            };

            _context.Add(salesOrder);
            await _context.SaveChangesAsync();

            foreach (var item in GetCartItems())
            {
                decimal salesPrice = 0;
                if (item.Item.Price != item.Item.PromotionPrice)
                {
                    if (item.Item.PromotionBanner.PromotionStartDate <= DateTime.Now && item.Item.PromotionBanner.PromotionEndDate >= DateTime.Now)
                    {
                        salesPrice = item.Item.PromotionPrice;
                    }
                    else
                    {
                        salesPrice = item.Item.Price;
                    }
                }
                else
                {
                    salesPrice = item.Item.Price;
                }
                var salesOrderdetail = new SalesOrderDetail
                {
                    SalesOrderId = salesOrder.SalesOrderId,
                    ItemId = item.Item.ItemId,
                    Quantity = item.Quantity,
                    SalesPrice = salesPrice
                };
                _context.Add(salesOrderdetail);
            }
            await _context.SaveChangesAsync();

            ClearCart();

            return RedirectToAction(nameof(PaymentSuccess));
        }

        public IActionResult PaymentSuccess()
        {
            return View();
        }
    }
}
