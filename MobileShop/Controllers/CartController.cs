using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MobileShop.Data;
using MobileShop.Models;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Controllers
{
    public class CartController : Controller
    {
        private readonly MobileShopContext _context;

        public CartController(MobileShopContext context)
        {
            _context = context;
        }

        // Key for Cart
        public const string CARTKEY = "cart";

        // Get cart item's list from Cart in Session
        [Authorize(Roles = "Member")]
        public List<CartItem> GetCartItems()
        {

            var session = HttpContext.Session;
            string jsoncart = session.GetString(CARTKEY);
            if (jsoncart != null)
            {
                return JsonConvert.DeserializeObject<List<CartItem>>(jsoncart);
            }
            return new List<CartItem>();
        }

        // Remove cart item from Cart in Session
        [Authorize(Roles = "Member")]
        void ClearCart()
        {
            var session = HttpContext.Session;
            session.Remove(CARTKEY);
        }

        // Store Cart with cart items to session
        [Authorize(Roles = "Member")]
        void SaveCartSession(List<CartItem> ls)
        {
            var session = HttpContext.Session;
            string jsoncart = JsonConvert.SerializeObject(ls);
            session.SetString(CARTKEY, jsoncart);
        }

        // Display Cart
        [Authorize(Roles = "Member")]
        public IActionResult Index()
        {
            var cart = GetCartItems();
            return View(cart);
        }

        // Add items to Cart
        [Authorize(Roles = "Member")]
        public async Task<IActionResult> AddToCart(int itemId, int quantity)
        {

            var item = await _context.ItemImages
                .Include(i => i.Stock)
                    .ThenInclude(i => i.MobilePhone)
                        .ThenInclude(i => i.Item)
                .Include(i => i.Stock)
                    .ThenInclude(i => i.ItemColor)
                            .Where(s => s.ItemImageId == itemId)
                            .FirstOrDefaultAsync();

            if (item == null)
            {
                return NotFound("There is no item in your Cart");
            }

            var cart = GetCartItems();
            var cartItem = cart.Find(i => i.Item.ItemImageId == itemId);
            if (cartItem != null)
            {
                // If item exist in cart, increase 1
                cartItem.Quantity++;

                if (cartItem.Quantity >= item.Stock.Quantity)
                {
                    cartItem.Quantity = item.Stock.Quantity;
                }
            }
            else
            {
                //  Add new item to cart
                cart.Add(new CartItem() { Quantity = quantity, Item = item });
            }

            // Save cart to Session
            SaveCartSession(cart);

            return Json(new { redirectToUrl = Url.Action("Detail", "MobilePhones", new { id = itemId }) });
        }

        // Remove items from cart
        [Authorize(Roles = "Member")]
        public IActionResult RemoveCart(int itemId)
        {

            var cart = GetCartItems();
            var cartItem = cart.Find(p => p.Item.ItemImageId == itemId);
            if (cartItem != null)
            {
                cart.Remove(cartItem);
            }

            SaveCartSession(cart);

            return RedirectToAction(nameof(Index));
        }

        // Update Item in Cart
        [HttpPost]
        [Authorize(Roles = "Member")]
        public IActionResult UpdateCart(int itemId, int quantity)
        {
            var cart = GetCartItems();
            var cartItem = cart.Find(i => i.Item.ItemImageId == itemId);
            if (cartItem != null)
            {
                // If item exist, increase
                cartItem.Quantity = quantity;
            }
            SaveCartSession(cart);

            return Json(new { redirectToUrl = Url.Action("Index", "Cart") });
        }
    }
}
