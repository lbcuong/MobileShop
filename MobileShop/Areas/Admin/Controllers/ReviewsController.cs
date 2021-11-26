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
    public class ReviewsController : Controller
    {
        private readonly MobileShopContext _context;

        public ReviewsController(MobileShopContext context)
        {
            _context = context;
        }

        // GET: Admin/Ratings
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["UserNameSortParm"] = sortOrder == "UserNameAsc" ? "UserNameDesc" : "UserNameAsc";
            ViewData["UserRoleSortParm"] = sortOrder == "UserRoleAsc" ? "UserRoleDesc" : "UserRoleAsc";
            ViewData["ItemNameSortParm"] = sortOrder == "ItemNameAsc" ? "ItemNameDesc" : "ItemNameAsc";
            ViewData["CommentSortParm"] = sortOrder == "CommentAsc" ? "CommentDesc" : "CommentAsc";
            ViewData["RateSortParm"] = sortOrder == "RateAsc" ? "RateDesc" : "RateAsc";
            ViewData["CommentDateSortParm"] = sortOrder == "CommentDateAsc" ? "CommentDateDesc" : "CommentDateAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.Review
                            .Include(r => r.ItemImages)
                               .ThenInclude(i => i.Stock)
                                   .ThenInclude(i => i.MobilePhone)
                                       .ThenInclude(i => i.Item)
                            .Include(r => r.ItemImages)
                               .ThenInclude(i => i.Stock)
                                   .ThenInclude(i => i.ItemColor)
                                    select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.UserName.Contains(searchString)
                                                              || s.UserRole.Contains(searchString)
                                                              || s.ItemImages.Stock.MobilePhone.Item.Name.Contains(searchString)
                                                              || s.Comment.Contains(searchString)
                                                              || s.Rate.ToString().Contains(searchString)
                                                              || s.CommentDate.ToString().Contains(searchString));
            }

            switch (sortOrder)
            {
                case "UserNameAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.UserName);
                    break;
                case "UserNameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.UserName);
                    break;
                case "UserRoleAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.UserRole);
                    break;
                case "UserRoleDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.UserRole);
                    break;
                case "ItemNameAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.ItemImages.Stock.MobilePhone.Item.Name);
                    break;
                case "ItemNameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.ItemImages.Stock.MobilePhone.Item.Name);
                    break;
                case "CommentAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Comment);
                    break;
                case "CommentDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Comment);
                    break;
                case "RateAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Rate);
                    break;
                case "RateDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Rate);
                    break;
                case "CommentDateAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.CommentDate);
                    break;
                case "CommentDateDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.CommentDate);
                    break;
            }

            return View(await mobileShopContext.ToListAsync());
        }

        // GET: Admin/Reviews/Create
        public IActionResult Create()
        {
            var MobilePhoneInfo = _context.Stock
                .Select(s => new
                {
                    Text = s.MobilePhone.Item.Name + " (" + s.MobilePhone.RAM + "/ " + s.MobilePhone.Storage + ")" + " " + s.ItemColor.Name,
                    Value = s.StockId
                })
                .ToList();

            ViewData["ItemImageId"] = new SelectList(MobilePhoneInfo, "Value", "Text");

            return View();
        }

        // POST: Admin/Reviews/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ReviewId,UserName,UserRole,ItemImageId,Comment,Rate,CommentDate")] Review review)
        {
            if (ModelState.IsValid)
            {
                _context.Add(review);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            var MobilePhoneInfo = _context.Stock
                .Select(s => new
                {
                    Text = s.MobilePhone.Item.Name + " (" + s.MobilePhone.RAM + "/ " + s.MobilePhone.Storage + ")" + " " + s.ItemColor.Name,
                    Value = s.StockId
                })
                .ToList();

            ViewData["ItemImageId"] = new SelectList(MobilePhoneInfo, "Value", "Text");

            return View(review);
        }

        // GET: Admin/Reviews/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var review = await _context.Review.FindAsync(id);

            var MobilePhoneInfo = _context.Stock
                .Select(s => new
                {
                    Text = s.MobilePhone.Item.Name + " (" + s.MobilePhone.RAM + "/ " + s.MobilePhone.Storage + ")" + " " + s.ItemColor.Name,
                    Value = s.StockId
                })
                .ToList();

            if (review == null)
            {
                return NotFound();
            }

            ViewData["ItemImageId"] = new SelectList(MobilePhoneInfo, "Value", "Text");
            return View(review);
        }

        // POST: Admin/Reviews/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ReviewId,UserName,UserRole,ItemImageId,Comment,Rate,CommentDate")] Review review)
        {
            if (id != review.ReviewId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(review);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ReviewExists(review.ReviewId))
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
            var MobilePhoneInfo = _context.Stock
                .Select(s => new
                {
                    Text = s.MobilePhone.Item.Name + " (" + s.MobilePhone.RAM + "/ " + s.MobilePhone.Storage + ")" + " " + s.ItemColor.Name,
                    Value = s.StockId
                })
                .ToList();

            ViewData["ItemImageId"] = new SelectList(MobilePhoneInfo, "Value", "Text");
            return View(review);
        }

        // GET: Admin/Reviews/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var review = await _context.Review
                .Include(r => r.ItemImages)
                    .ThenInclude(i => i.Stock)
                        .ThenInclude(i => i.MobilePhone)
                            .ThenInclude(i => i.Item)
                    .Include(r => r.ItemImages)
                       .ThenInclude(i => i.Stock)
                           .ThenInclude(i => i.ItemColor)
                .FirstOrDefaultAsync(m => m.ReviewId == id);
            if (review == null)
            {
                return NotFound();
            }

            return View(review);
        }

        // POST: Admin/Reviews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var review = await _context.Review.FindAsync(id);
            _context.Review.Remove(review);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ReviewExists(int id)
        {
            return _context.Review.Any(e => e.ReviewId == id);
        }
    }
}
