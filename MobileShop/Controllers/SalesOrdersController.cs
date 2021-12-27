using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Areas.Identity.Data;
using MobileShop.Data;

namespace MobileShop.Areas.Identity.Pages.Account.Manage
{
    public partial class SalesOrdersController : Controller
    {
        private readonly UserManager<MobileShopUser> _userManager;
        private readonly MobileShopContext _context;

        public SalesOrdersController(UserManager<MobileShopUser> userManager, MobileShopContext context)
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
            var salesOrder = _context.SalesOrder
                .Include(s => s.SalesOrderDetail)
                    .ThenInclude(s => s.Item)
                        .ThenInclude(s => s.ItemImage)
                .Where(u => u.UserName == currentUser.UserName)
                .OrderByDescending(o => o.OrderDate);

            if (!String.IsNullOrEmpty(searchString))
            {
                if (searchString == "last-7-days")
                {
                    var startDate = DateTime.Today.AddDays(-7);
                    var endDate = DateTime.Today.AddDays(1);
                    salesOrder = (IOrderedQueryable<SalesOrder>)salesOrder.Where(s => s.OrderDate >= startDate && s.OrderDate <= endDate);
                }
                else if (searchString == "last-30-days")
                {
                    var startDate = DateTime.Today.AddDays(-30);
                    var endDate = DateTime.Today.AddDays(1);
                    salesOrder = (IOrderedQueryable<SalesOrder>)salesOrder.Where(s => s.OrderDate >= startDate && s.OrderDate <= endDate);
                }
                else if (searchString == "last-100-days")
                {
                    var startDate = DateTime.Today.AddDays(-100);
                    var endDate = DateTime.Today.AddDays(1);
                    salesOrder = (IOrderedQueryable<SalesOrder>)salesOrder.Where(s => s.OrderDate >= startDate && s.OrderDate <= endDate);
                }

            }

            return View(await salesOrder.ToListAsync());
        }

        public async Task<IActionResult> Detail(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var currentUser = await _userManager.GetUserAsync(HttpContext.User);
            var salesOrder = _context.SalesOrder
                .Include(s => s.SalesOrderDetail)
                    .ThenInclude(s => s.Item)
                        .ThenInclude(s => s.ItemImage)
                .Where(u => u.UserName == currentUser.UserName && u.SalesOrderId == id);

            if (salesOrder == null)
            {
                return NotFound();
            }

            return View(await salesOrder.ToListAsync());
        }

        // GET: Admin/Orders/Edit/5
        [Authorize(Roles = "Member")]
        public async Task<IActionResult> Cancel(int? id)
        {
            if (ModelState.IsValid)
            {
                if (id == null)
                {
                    return NotFound();
                }
                var salesOrder = await _context.SalesOrder.FindAsync(id);
                var currentUser = await _userManager.GetUserAsync(HttpContext.User);
                var salesOrderDetails = _context.SalesOrder
                    .Include(s => s.SalesOrderDetail)
                        .ThenInclude(s => s.Item)
                            .ThenInclude(s => s.ItemImage)
                    .Where(u => u.UserName == currentUser.UserName && u.SalesOrderId == id);
                ViewBag.SalesOrderDetail = salesOrderDetails;

                if (salesOrder == null)
                {
                    return NotFound();
                }
                return View(salesOrder);
            }
            return RedirectToAction(nameof(Index));
        }

        // POST: Admin/Orders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Member")]
        public async Task<IActionResult> Cancel(int id, [Bind("SalesOrderId,UserName,Name,PhoneNumber,Address,Total,OrderDate,Status")] SalesOrder salesOrder)
        {
            if (id != salesOrder.SalesOrderId)
            {
                return NotFound();
            }

            _context.Update(salesOrder);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        private bool OrderExists(int id)
        {
            return _context.SalesOrder.Any(e => e.SalesOrderId == id);
        }
    }
}
