using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Areas.Identity.Data;
using MobileShop.Data;

namespace MobileShop.Areas.Identity.Pages.Account.Manage
{
    public partial class OrdersController : Controller
    {
        private readonly UserManager<MobileShopUser> _userManager;
        private readonly MobileShopContext _context;

        public OrdersController(UserManager<MobileShopUser> userManager, MobileShopContext context)
        {
            _userManager = userManager;
            _context = context;
        }

        public async Task<IActionResult> Index(string searchString, string currentFilter)
        {
            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var currentUser = await _userManager.GetUserAsync(HttpContext.User);
            var order = _context.Order
                .Include(s => s.OrderDetail)
                    .ThenInclude(s => s.Item)
                        .ThenInclude(s => s.Stock)
                            .ThenInclude(s => s.ItemColor)
                .Include(s => s.OrderDetail)
                    .ThenInclude(s => s.Item)
                        .ThenInclude(s => s.Stock)
                            .ThenInclude(s => s.MobilePhone)
                                .ThenInclude(s => s.Item)
                .Where(u => u.UserName == currentUser.UserName)
                .OrderByDescending(o => o.OrderDate);

            if (!String.IsNullOrEmpty(searchString))
            {
                if (searchString == "last-7-days")
                {
                    var startDate = DateTime.Today.AddDays(-7);
                    var endDate = DateTime.Today.AddDays(1);
                    order = (IOrderedQueryable<Order>)order.Where(s => s.OrderDate >= startDate && s.OrderDate <= endDate);
                }
                else if (searchString == "last-30-days")
                {
                    var startDate = DateTime.Today.AddDays(-30);
                    var endDate = DateTime.Today.AddDays(1);
                    order = (IOrderedQueryable<Order>)order.Where(s => s.OrderDate >= startDate && s.OrderDate <= endDate);
                }
                else if (searchString == "last-100-days")
                {
                    var startDate = DateTime.Today.AddDays(-100);
                    var endDate = DateTime.Today.AddDays(1);
                    order = (IOrderedQueryable<Order>)order.Where(s => s.OrderDate >= startDate && s.OrderDate <= endDate);
                }

            }

            return View(await order.ToListAsync());
        }

        public async Task<IActionResult> Detail(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var currentUser = await _userManager.GetUserAsync(HttpContext.User);
            var order = _context.Order
                .Include(s => s.OrderDetail)
                    .ThenInclude(s => s.Item)
                        .ThenInclude(s => s.Stock)
                            .ThenInclude(s => s.ItemColor)
                .Include(s => s.OrderDetail)
                    .ThenInclude(s => s.Item)
                        .ThenInclude(s => s.Stock)
                            .ThenInclude(s => s.MobilePhone)
                                .ThenInclude(s => s.Item)
                .Where(u => u.UserName == currentUser.UserName && u.OrderId == id);

            if (order == null)
            {
                return NotFound();
            }

            return View(await order.ToListAsync());
        }
    }
}
