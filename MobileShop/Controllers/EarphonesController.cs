using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Areas.Identity.Data;
using MobileShop.Data;
using MobileShop.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Controllers
{
    public class EarphonesController : Controller
    {
        private readonly MobileShopContext _context;
        private readonly UserManager<MobileShopUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public EarphonesController(MobileShopContext context, UserManager<MobileShopUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _context = context;
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public async Task<IActionResult> Index(string sortOrder, string searchString, string currentFilter, int? pageNumber)
        {
            ViewData["PriceAscSortParm"] = sortOrder == "PriceAsc" ? "PriceAsc" : "PriceAsc";
            ViewData["PriceDescSortParm"] = sortOrder == "PriceDesc" ? "PriceDesc" : "PriceDesc";
            ViewData["NewDescSortParm"] = sortOrder == "NewDesc" ? "NewDesc" : "NewDesc";
            ViewData["CurrentSort"] = sortOrder;

            if (searchString != null)
            {
                pageNumber = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            IQueryable<Item> mobileShopContext = _context.Item
                    .Include(i => i.ItemCategory)
                    .Include(i => i.ItemGroup)
                    .Where(s => s.ItemCategoryId == 6);

            var brands = _context.Item
                    .Include(i => i.ItemCategory)
                    .Include(i => i.ItemGroup)
                    .Where(s => s.ItemCategoryId == 6)
                    .Select(s => s.ItemGroup.Name).Distinct();
            ViewBag.Brands = brands;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.Name.Contains(searchString));
            }

            ViewBag.totalItem = mobileShopContext.Count();
            ViewBag.SearchString = searchString;

            switch (sortOrder)
            {
                case "PriceDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Price);
                    break;
                case "PriceAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Price);
                    break;
                case "NewDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.CreatedDate);
                    break;
            }

            int pageSize = 10;
            return View(await PaginatedList<Item>.CreateAsync(mobileShopContext.AsNoTracking(), pageNumber ?? 1, pageSize));
        }

        public async Task<IActionResult> Detail(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mobilePhoneDetail = await _context.Item
                                .Include(i => i.ItemCategory)
                                .Include(i => i.ItemGroup)
                                .Include(i => i.PromotionBanner)
                                .FirstOrDefaultAsync(m => m.ItemId == id);

            if (mobilePhoneDetail == null)
            {
                return NotFound();
            }
            var images = _context.ItemImage.Include(i => i.Item).Where(d => d.ItemId.Equals(id.Value)).ToList();
            ViewBag.Images = images;

            var reviews = _context.Review.Include(i => i.Replies).Where(d => d.ItemId.Equals(id.Value)).ToList();
            ViewBag.Reviews = reviews;

            var countReview = reviews.Count;
            ViewBag.CountReview = countReview;

            var currentItem = _context.Item.Find(id);
            var relatedItem = _context.Item.Where(d => d.ItemId != id && d.ItemGroupId == currentItem.ItemGroupId && d.ItemCategoryId == currentItem.ItemCategoryId).Take(20).ToList();
            ViewBag.RelatedItems = relatedItem;

            var subrelatedItem1 = relatedItem.Take(5).ToList();
            ViewBag.SubrelatedItem1 = subrelatedItem1;

            var subrelatedItem2 = relatedItem.Skip(5).Take(5).ToList();
            ViewBag.SubrelatedItem2 = subrelatedItem2;

            var subrelatedItem3 = relatedItem.Skip(10).Take(5).ToList();
            ViewBag.SubrelatedItem3 = subrelatedItem3;

            var subrelatedItem4 = relatedItem.Skip(15).Take(5).ToList();
            ViewBag.SubrelatedItem4 = subrelatedItem4;

            if (countReview != 0)
            {
                var averageRating = _context.Review.Where(d => d.ItemId.Equals(id.Value)).Average(a => a.Rate);
                averageRating = Math.Round(averageRating, 1);
                ViewBag.averageRating = averageRating;
            }
            else
            {
                int averageRating = 0;
                ViewBag.averageRating = averageRating;
            }

            var fiveStar = _context.Review.Where(d => d.ItemId.Equals(id.Value) && d.Rate == 5);
            ViewBag.FiveStar = fiveStar.Count();
            var fourStar = _context.Review.Where(d => d.ItemId.Equals(id.Value) && d.Rate == 4);
            ViewBag.FourStar = fourStar.Count();
            var threeStar = _context.Review.Where(d => d.ItemId.Equals(id.Value) && d.Rate == 3);
            ViewBag.ThreeStar = threeStar.Count();
            var twoStar = _context.Review.Where(d => d.ItemId.Equals(id.Value) && d.Rate == 2);
            ViewBag.TwoStar = twoStar.Count();
            var oneStar = _context.Review.Where(d => d.ItemId.Equals(id.Value) && d.Rate == 1);
            ViewBag.OneStar = oneStar.Count();

            return View(mobilePhoneDetail);
        }

        [HttpPost]
        public async Task<IActionResult> SendReview(int itemId, string comment, int rate)
        {
            if (ModelState.IsValid)
            {
                var currentUser = await _userManager.GetUserAsync(HttpContext.User);
                var Review = new Review
                {
                    UserName = currentUser.UserName,
                    UserRole = string.Join(",", _userManager.GetRolesAsync(currentUser).Result.ToArray()),
                    ItemId = itemId,
                    Comment = comment,
                    Rate = rate,
                    CommentDate = DateTime.Now
                };

                _context.Add(Review);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction("Detail", "Earphones", new { id = itemId });
        }

        [HttpPost]
        public async Task<IActionResult> Reply(int itemId, int reviewId, string comment)
        {
            if (ModelState.IsValid)
            {
                var currentUser = await _userManager.GetUserAsync(HttpContext.User);
                var reply = new ReplyReview
                {
                    ReviewId = reviewId,
                    UserName = currentUser.UserName,
                    UserRole = string.Join(",", _userManager.GetRolesAsync(currentUser).Result.ToArray()),
                    Comment = comment,
                    ReplyDate = DateTime.Now
                };

                _context.Add(reply);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction("Detail", "Earphones", new { id = itemId });
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
