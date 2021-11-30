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
    public class ReplyReviewsController : Controller
    {
        private readonly MobileShopContext _context;

        public ReplyReviewsController(MobileShopContext context)
        {
            _context = context;
        }

        // GET: Admin/ReplyReviews
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["UserReviewSortParm"] = sortOrder == "UserReviewAsc" ? "UserReviewDesc" : "UserReviewAsc";
            ViewData["UserRoleSortParm"] = sortOrder == "UserRoleAsc" ? "UserRoleDesc" : "UserRoleAsc";
            ViewData["UserReplySortParm"] = sortOrder == "UserReplyAsc" ? "UserReplyDesc" : "UserReplyAsc";
            ViewData["CommentSortParm"] = sortOrder == "CommentAsc" ? "CommentDesc" : "CommentAsc";
            ViewData["ReplyDateSortParm"] = sortOrder == "ReplyDateAsc" ? "ReplyDateDesc" : "ReplyDateAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.ReplyReview
                                    .Include(r => r.Review)
                                        .ThenInclude(r => r.Item)
                                    select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.Review.UserName.Contains(searchString)
                                                              || s.UserRole.Contains(searchString)
                                                              || s.Review.Item.Name.Contains(searchString)
                                                              || s.UserName.Contains(searchString)
                                                              || s.Comment.Contains(searchString)
                                                              || s.ReplyDate.ToString().Contains(searchString));
            }

            switch (sortOrder)
            {
                case "UserReviewAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Review.UserName);
                    break;
                case "UserReviewDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Review.UserName);
                    break;
                case "UserRoleAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.UserRole);
                    break;
                case "UserRoleDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.UserRole);
                    break;
                case "UserReplyAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.UserName);
                    break;
                case "UserReplyDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.UserName);
                    break;
                case "CommentAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Comment);
                    break;
                case "CommentDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Comment);
                    break;
                case "ReplyDateAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.ReplyDate);
                    break;
                case "ReplyDateDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.ReplyDate);
                    break;
            }

            return View(await mobileShopContext.ToListAsync());
        }

        // GET: Admin/ReplyReviews/Create
        public IActionResult Create()
        {
            var item = _context.Item
                .Select(s => new
                {
                    Text = s.Name,
                    Value = s.ItemId
                })
                .ToList();

            ViewData["ItemId"] = new SelectList(item, "Value", "Text");
            return View();
        }

        // POST: Admin/ReplyReviews/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ReplyReviewId,ReviewId,UserName,UserRole,Comment,ReplyDate")] ReplyReview replyReview)
        {
            if (ModelState.IsValid)
            {
                _context.Add(replyReview);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            var item = _context.Item
                .Select(s => new
                {
                    Text = s.Name,
                    Value = s.ItemId
                })
                .ToList();

            ViewData["ItemId"] = new SelectList(item, "Value", "Text");
            return View(replyReview);
        }

        // GET: Admin/ReplyReviews/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var replyReview = await _context.ReplyReview.FindAsync(id);
            if (replyReview == null)
            {
                return NotFound();
            }
            var item = _context.Item
                .Select(s => new
                {
                    Text = s.Name,
                    Value = s.ItemId
                })
                .ToList();

            ViewData["ItemId"] = new SelectList(item, "Value", "Text");
            return View(replyReview);
        }

        // POST: Admin/ReplyReviews/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ReplyReviewId,ReviewId,UserName,UserRole,Comment,ReplyDate")] ReplyReview replyReview)
        {
            if (id != replyReview.ReplyReviewId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(replyReview);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ReplyReviewExists(replyReview.ReplyReviewId))
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

            var item = _context.Item
                .Select(s => new
                {
                    Text = s.Name,
                    Value = s.ItemId
                })
                .ToList();

            ViewData["ItemId"] = new SelectList(item, "Value", "Text");
            return View(replyReview);
        }

        // GET: Admin/ReplyReviews/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var replyReview = await _context.ReplyReview
                .Include(r => r.Review)
                    .ThenInclude(r => r.Item)
                .FirstOrDefaultAsync(m => m.ReplyReviewId == id);
            if (replyReview == null)
            {
                return NotFound();
            }

            return View(replyReview);
        }

        // POST: Admin/ReplyReviews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var replyReview = await _context.ReplyReview.FindAsync(id);
            _context.ReplyReview.Remove(replyReview);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ReplyReviewExists(int id)
        {
            return _context.ReplyReview.Any(e => e.ReplyReviewId == id);
        }
    }
}
