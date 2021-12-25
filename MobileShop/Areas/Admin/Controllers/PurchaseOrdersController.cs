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
    public class PurchaseOrdersController : Controller
    {
        private readonly MobileShopContext _context;
        private readonly UserManager<MobileShopUser> _userManager;

        public PurchaseOrdersController(MobileShopContext context, UserManager<MobileShopUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: Admin/Orders
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["OrderSortParm"] = sortOrder == "OrderAsc" ? "OrderDesc" : "OrderAsc";
            ViewData["SupplierNameSortParm"] = sortOrder == "SupplierNameAsc" ? "SupplierNameDesc" : "SupplierNameAsc";
            ViewData["TotalSortParm"] = sortOrder == "TotalAsc" ? "TotalDesc" : "TotalAsc";
            ViewData["OrderDateSortParm"] = sortOrder == "OrderDateAsc" ? "OrderDateDesc" : "OrderDateAsc";
            ViewData["StatusSortParm"] = sortOrder == "StatusAsc" ? "StatusDesc" : "StatusAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.PurchaseOrder
                .Include(s => s.PurchaseOrderDetail)
                    .ThenInclude(s => s.Item)
                .Include(s => s.Supplier)
                .OrderByDescending(o => o.OrderDate)
                                    select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.Supplier.Name.Contains(searchString)
                                                              || s.Total.ToString().Contains(searchString)
                                                              || s.OrderDate.ToString().Contains(searchString)
                                                              || s.Status.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "OrderAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.PurchaseOrderId);
                    break;
                case "OrderDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.PurchaseOrderId);
                    break;
                case "SupplierNameAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Supplier.Name);
                    break;
                case "SupplierNameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Supplier.Name);
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

        // GET: Admin/PurchaseOrders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var purchaseOrder = _context.PurchaseOrder
                .Include(s => s.PurchaseOrderDetail)
                    .ThenInclude(s => s.Item)
                .Include(s => s.Supplier)
                .Where(u => u.PurchaseOrderId == id);

            if (purchaseOrder == null)
            {
                return NotFound();
            }

            return View(await purchaseOrder.ToListAsync());
        }

        // GET: Admin/PurchaseOrders/Create
        [Authorize(Roles = "Staff")]
        public IActionResult Create()
        {
            PurchaseOrder purchaseOrders = new PurchaseOrder();
            purchaseOrders.PurchaseOrderDetail.Add(new PurchaseOrderDetail() { PurchaseOrderDetailId = 0 });

            ViewBag.ItemId = _context.Item.Select(x => new SelectListItem { Text = x.Name, Value = x.ItemId.ToString() }).ToList();
            ViewData["SupplierId"] = new SelectList(_context.Supplier, "SupplierId", "Name");
            return View(purchaseOrders);
        }

        // POST: Admin/PurchaseOrders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> Create(PurchaseOrder purchaseOrder)
        {
            if (ModelState.IsValid)
            {
                purchaseOrder.OrderDate = DateTime.Now;
                _context.Add(purchaseOrder);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Data successfully added!";
                return RedirectToAction(nameof(Create));
            }

            ViewBag.ItemId = _context.Item.Select(x => new SelectListItem { Text = x.Name, Value = x.ItemId.ToString() }).ToList();
            ViewData["SupplierId"] = new SelectList(_context.Supplier, "SupplierId", "Name", purchaseOrder.SupplierId);
            return View(purchaseOrder);
        }

        // GET: Admin/PurchaseOrders/Edit/5
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var purchaseOrder = await _context.PurchaseOrder.FindAsync(id);
            if (purchaseOrder == null)
            {
                return NotFound();
            }
            ViewData["SupplierId"] = new SelectList(_context.Supplier, "SupplierId", "Name", purchaseOrder.SupplierId);
            return View(purchaseOrder);
        }

        // POST: Admin/PurchaseOrders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> Edit(int id, PurchaseOrder purchaseOrder)
        {
            if (id != purchaseOrder.PurchaseOrderId)
            {
                return NotFound();
            }
            _context.Update(purchaseOrder);
            await _context.SaveChangesAsync();

            if (purchaseOrder.Status == "Received")
            {
                var purchaseOrderDetail = _context.PurchaseOrderDetail.Include(s => s.Item).Where(u => u.PurchaseOrderId == id).AsNoTracking().ToList();

                foreach (var item in purchaseOrderDetail)
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
                        Quantity = item.Item.Quantity + item.Quantity,
                        Image = item.Item.Image
                    };
                    _context.Item.Update(quantity);
                }
                await _context.SaveChangesAsync();
            }
            TempData["SuccessMessage"] = "Data successfully updated!";
            ViewData["SupplierId"] = new SelectList(_context.Supplier, "SupplierId", "Name", purchaseOrder.SupplierId);
            return RedirectToAction(nameof(Index));
        }

        private bool OrderExists(int id)
        {
            return _context.PurchaseOrder.Any(e => e.PurchaseOrderId == id);
        }
    }
}
