using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Data;

namespace MobileShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin, Staff")]
    public class ItemsController : Controller
    {
        private readonly MobileShopContext _context;

        public ItemsController(MobileShopContext context)
        {
            _context = context;
        }

        // GET: Admin/Items
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["CategorySortParm"] = sortOrder == "CategoryAsc" ? "CategoryDesc" : "CategoryAsc";
            ViewData["GroupSortParm"] = sortOrder == "GroupAsc" ? "GroupDesc" : "GroupAsc";
            ViewData["NameSortParm"] = sortOrder == "NameAsc" ? "NameDesc" : "NameAsc";
            ViewData["PriceSortParm"] = sortOrder == "PriceAsc" ? "PriceDesc" : "PriceAsc";
            ViewData["QuantitySortParm"] = sortOrder == "QuantityAsc" ? "QuantityDesc" : "QuantityAsc";
            ViewData["CreatedDateSortParm"] = sortOrder == "CreatedDateAsc" ? "CreatedDateDesc" : "CreatedDateAsc";
            ViewData["UpdatedDateSortParm"] = sortOrder == "UpdatedDateAsc" ? "UpdatedDateDesc" : "UpdatedDateAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.Item
                .Include(i => i.ItemCategory)
                .Include(i => i.ItemGroup)
                select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.ItemCategory.Name.Contains(searchString)
                                                              || s.ItemGroup.Name.Contains(searchString)
                                                              || s.Name.Contains(searchString)
                                                              || s.Quantity.ToString().Contains(searchString)
                                                              || s.Price.ToString().Contains(searchString)
                                                              || s.CreatedDate.ToString().Contains(searchString)
                                                              || s.UpdatedDate.ToString().Contains(searchString));
            }

            switch (sortOrder)
            {
                case "CategoryAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.ItemCategory.Name);
                    break;
                case "CategoryDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.ItemCategory.Name);
                    break;
                case "GroupAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.ItemGroup.Name);
                    break;
                case "GroupDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.ItemGroup.Name);
                    break;
                case "NameAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Name);
                    break;
                case "NameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Name);
                    break;
                case "PriceAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Price);
                    break;
                case "PriceDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Price);
                    break;
                case "QuantityAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Quantity);
                    break;
                case "QuantityDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Quantity);
                    break;
                case "CreatedDateAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.CreatedDate);
                    break;
                case "CreatedDateDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.CreatedDate);
                    break;
                case "UpdatedDateAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.UpdatedDate);
                    break;
                case "UpdatedDateDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.UpdatedDate);
                    break;
            }

            return View(await mobileShopContext.ToListAsync());
        }

        // GET: Admin/items1/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var items = await _context.Item
                .Include(i => i.ItemCategory)
                .Include(i => i.ItemGroup)
                .FirstOrDefaultAsync(m => m.ItemId == id);
            if (items == null)
            {
                return NotFound();
            }

            return View(items);
        }

        // GET: Admin/Items/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {
            ViewData["ItemCategoryId"] = new SelectList(_context.ItemCategory, "ItemCategoryId", "Name");
            ViewData["ItemGroupId"] = new SelectList(_context.ItemGroup, "ItemGroupId", "Name");
            return View();
        }

        // POST: Admin/Items/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([Bind("ItemId,ItemCategoryId,ItemGroupId,Name,CreatedDate,UpdatedDate,Detail,Price,Quantity")] Item item)
        {
            if (ModelState.IsValid)
            {
                _context.Add(item);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ItemCategoryId"] = new SelectList(_context.ItemCategory, "ItemCategoryId", "Name", item.ItemCategoryId);
            ViewData["ItemGroupId"] = new SelectList(_context.ItemGroup, "ItemGroupId", "Name", item.ItemGroupId);
            return View(item);
        }

        // GET: Admin/Items/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var item = await _context.Item.FindAsync(id);
            if (item == null)
            {
                return NotFound();
            }
            ViewData["ItemCategoryId"] = new SelectList(_context.ItemCategory, "ItemCategoryId", "Name", item.ItemCategoryId);
            ViewData["ItemGroupId"] = new SelectList(_context.ItemGroup, "ItemGroupId", "Name", item.ItemGroupId);
            return View(item);
        }

        // POST: Admin/Items/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int id, [Bind("ItemId,ItemCategoryId,ItemGroupId,Name,CreatedDate,UpdatedDate,Detail,Price,Quantity")] Item item)
        {
            if (id != item.ItemId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(item);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ItemExists(item.ItemId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ItemCategoryId"] = new SelectList(_context.ItemCategory, "ItemCategoryId", "Name", item.ItemCategoryId);
            ViewData["ItemGroupId"] = new SelectList(_context.ItemGroup, "ItemGroupId", "Name", item.ItemGroupId);
            return View(item);
        }

        // GET: Admin/Items/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var item = await _context.Item
                .Include(i => i.ItemCategory)
                .Include(i => i.ItemGroup)
                .FirstOrDefaultAsync(m => m.ItemId == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }

        // POST: Admin/Items/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var item = await _context.Item.FindAsync(id);
            _context.Item.Remove(item);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ItemExists(int id)
        {
            return _context.Item.Any(e => e.ItemId == id);
        }
    }
}
