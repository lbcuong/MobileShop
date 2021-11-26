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
    public class StocksController : Controller
    {
        private readonly MobileShopContext _context;

        public StocksController(MobileShopContext context)
        {
            _context = context;

        }

        // GET: Admin/Stocks
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["MobilePhoneSortParm"] = sortOrder == "MobilePhoneAsc" ? "MobilePhoneDesc" : "MobilePhoneAsc";
            ViewData["ItemColorSortParm"] = sortOrder == "ItemColorAsc" ? "ItemColorDesc" : "ItemColorAsc";
            ViewData["QuantitySortParm"] = sortOrder == "QuantityAsc" ? "QuantityDesc" : "QuantityAsc";
            ViewData["PriceSortParm"] = sortOrder == "PriceAsc" ? "PriceDesc" : "PriceAsc";
            ViewData["CreatedDateSortParm"] = sortOrder == "CreatedDateAsc" ? "CreatedDateDesc" : "CreatedDateAsc";
            ViewData["UpdatedDateSortParm"] = sortOrder == "UpdatedDateAsc" ? "UpdatedDateDesc" : "UpdatedDateAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.Stock
                .Include(s => s.ItemColor)
                .Include(s => s.MobilePhone)
                    .ThenInclude(s => s.Item)
                select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.MobilePhone.Item.Name.Contains(searchString)
                                                              || s.MobilePhone.RAM.Contains(searchString)
                                                              || s.MobilePhone.GPU.Contains(searchString)
                                                              || s.ItemColor.Name.Contains(searchString));
            }
            switch (sortOrder)
            {
                case "MobilePhoneAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.MobilePhone.Item.Name);
                    break;
                case "MobilePhoneDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.MobilePhone.Item.Name);
                    break;
                case "ItemColorAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.ItemColor.Name);
                    break;
                case "ItemColorDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.ItemColor.Name);
                    break;
                case "QuantityAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Quantity);
                    break;
                case "QuantityDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Quantity);
                    break;
                case "PriceAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Price);
                    break;
                case "PriceDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Price);
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

        // GET: Admin/Stocks/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {
            var MobilePhoneInfo = _context.MobilePhone
                .Select(s => new
                {
                    Text = s.Item.Name + " (" + s.RAM + "/ " + s.Storage + ")",
                    Value = s.MobilePhoneId
                })
                .ToList();

            ViewData["ItemColorId"] = new SelectList(_context.Color, "ItemColorId", "Name");
            ViewData["MobilePhoneId"] = new SelectList(MobilePhoneInfo, "Value", "Text");
            return View();
        }

        // POST: Admin/Stocks/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([Bind("StockId,MobilePhoneId,ItemColorId,Quantity,Price,CreatedDate,UpdatedDate")] Stock stock)
        {
            if (ModelState.IsValid)
            {
                _context.Add(stock);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            var MobilePhoneInfo = _context.MobilePhone
                .Select(s => new
                {
                    Text = s.Item.Name + " (" + s.RAM + "/ " + s.Storage + ")",
                    Value = s.MobilePhoneId
                })
                .ToList();

            ViewData["ItemColorId"] = new SelectList(_context.Color, "ItemColorId", "Name", stock.ItemColorId);
            ViewData["MobilePhoneId"] = new SelectList(MobilePhoneInfo, "Value", "Text", stock.MobilePhoneId);
            return View(stock);
        }

        // GET: Admin/Stocks/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var stock = await _context.Stock.FindAsync(id);
            if (stock == null)
            {
                return NotFound();
            }
            var MobilePhoneInfo = _context.MobilePhone
                .Select(s => new
                {
                    Text = s.Item.Name + " (" + s.RAM + "/ " + s.Storage + ")",
                    Value = s.MobilePhoneId
                })
                .ToList();

            ViewData["ItemColorId"] = new SelectList(_context.Color, "ItemColorId", "Name", stock.ItemColorId);
            ViewData["MobilePhoneId"] = new SelectList(MobilePhoneInfo, "Value", "Text", stock.MobilePhoneId);
            return View(stock);
        }

        // POST: Admin/Stocks/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int id, [Bind("StockId,MobilePhoneId,ItemColorId,Quantity,Price,CreatedDate,UpdatedDate")] Stock stock)
        {
            if (id != stock.StockId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(stock);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!StockExists(stock.StockId))
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
            var MobilePhoneInfo = _context.MobilePhone
                .Select(s => new
                {
                    Text = s.Item.Name + " (" + s.RAM + "/ " + s.Storage + ")",
                    Value = s.MobilePhoneId
                })
                .ToList();

            ViewData["ItemColorId"] = new SelectList(_context.Color, "ItemColorId", "Name", stock.ItemColorId);
            ViewData["MobilePhoneId"] = new SelectList(_context.Item, "ItemId", "Name", stock.MobilePhoneId);
            return View(stock);
        }

        // GET: Admin/Stocks/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var stock = await _context.Stock
                .Include(s => s.ItemColor)
                .Include(s => s.MobilePhone)
                    .ThenInclude(s => s.Item)
                .FirstOrDefaultAsync(m => m.StockId == id);
            if (stock == null)
            {
                return NotFound();
            }

            return View(stock);
        }

        // POST: Admin/Stocks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var stock = await _context.Stock.FindAsync(id);
            _context.Stock.Remove(stock);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool StockExists(int id)
        {
            return _context.Stock.Any(e => e.StockId == id);
        }
    }
}
