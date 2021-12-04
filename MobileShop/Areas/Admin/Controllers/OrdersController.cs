using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Areas.Identity.Data;
using MobileShop.Data;

namespace MobileShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin, Staff")]
    public class OrdersController : Controller
    {
        private readonly MobileShopContext _context;
        private readonly UserManager<MobileShopUser> _userManager;

        public OrdersController(MobileShopContext context, UserManager<MobileShopUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: Admin/Orders
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["OrderSortParm"] = sortOrder == "OrderAsc" ? "OrderDesc" : "OrderAsc";
            ViewData["UserNameSortParm"] = sortOrder == "UserNameAsc" ? "UserNameDesc" : "UserNameAsc";
            ViewData["NameSortParm"] = sortOrder == "NameAsc" ? "NameDesc" : "NameAsc";
            ViewData["PhoneNumberSortParm"] = sortOrder == "PhoneNumberAsc" ? "PhoneNumberDesc" : "PhoneNumberAsc";
            ViewData["AddressSortParm"] = sortOrder == "AddressAsc" ? "AddressDesc" : "AddressAsc";
            ViewData["TotalSortParm"] = sortOrder == "TotalAsc" ? "TotalDesc" : "TotalAsc";
            ViewData["OrderDateSortParm"] = sortOrder == "OrderDateAsc" ? "OrderDateDesc" : "OrderDateAsc";
            ViewData["StatusSortParm"] = sortOrder == "StatusAsc" ? "StatusDesc" : "StatusAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.Order
                .Include(s => s.OrderDetail)
                    .ThenInclude(s => s.Item)
                .OrderByDescending(o => o.OrderDate)
                                    select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.UserName.Contains(searchString)
                                                              || s.Name.Contains(searchString)
                                                              || s.PhoneNumber.Contains(searchString)
                                                              || s.Address.Contains(searchString)
                                                              || s.Total.ToString().Contains(searchString)
                                                              || s.OrderDate.ToString().Contains(searchString)
                                                              || s.Status.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "OrderAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.OrderId);
                    break;
                case "OrderDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.OrderId);
                    break;
                case "UserNameAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.UserName);
                    break;
                case "UserNameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.UserName);
                    break;
                case "NameAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Name);
                    break;
                case "NameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Name);
                    break;
                case "PhoneNumberAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.PhoneNumber);
                    break;
                case "PhoneNumberDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.PhoneNumber);
                    break;
                case "AddressAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Address);
                    break;
                case "AddressDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Address);
                    break;
                case "TotalAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Total);
                    break;
                case "TotalDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Total);
                    break;
                case "OrderDateAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.OrderDate);
                    break;
                case "OrderDateDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.OrderDate);
                    break;
                case "StatusAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Status);
                    break;
                case "StatusDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Status);
                    break;
            }
            return View(await mobileShopContext.ToListAsync());
        }

        // GET: Admin/Orders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = _context.Order
                .Include(s => s.OrderDetail)
                    .ThenInclude(s => s.Item)
                .Where(u => u.OrderId == id);

            if (order == null)
            {
                return NotFound();
            }

            return View(await order.ToListAsync());
        }

        // GET: Admin/Orders/Edit/5
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Order.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }
            return View(order);
        }

        // POST: Admin/Orders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> Edit(int id, [Bind("OrderId,UserName,Name,PhoneNumber,Address,Total,OrderDate,Status")] Order order)
        {
            if (id != order.OrderId)
            {
                return NotFound();
            }
            _context.Update(order);
            await _context.SaveChangesAsync();

            if (order.Status == "Delivering")
            {
                var orderDetail = _context.OrderDetail.Include(s => s.Item).Where(u => u.OrderId == id).AsNoTracking().ToList();

                foreach (var item in orderDetail)
                {
                    var quantity = new Item
                    {
                        ItemId = item.Item.ItemId,
                        ItemCategoryId = item.Item.ItemCategoryId,
                        ItemGroupId = item.Item.ItemGroupId,
                        Name = item.Item.Name,
                        CreatedDate = item.Item.CreatedDate,
                        UpdatedDate = DateTime.Now,
                        Detail = item.Item.Detail,
                        Price = item.Item.Price,
                        Quantity = item.Item.Quantity - item.Quantity,
                        Image = item.Item.Image
                    };
                    _context.Item.Update(quantity);
                }
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }

        private bool OrderExists(int id)
        {
            return _context.Order.Any(e => e.OrderId == id);
        }
    }
}
