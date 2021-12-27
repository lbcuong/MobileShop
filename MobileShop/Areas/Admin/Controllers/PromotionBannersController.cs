using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Data;

namespace MobileShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin, Staff")]
    public class PromotionBannersController : Controller
    {
        private readonly MobileShopContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;
        public PromotionBannersController(MobileShopContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _hostEnvironment = hostEnvironment;
        }

        // GET: Admin/Banners
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["NameSortParm"] = sortOrder == "NameAsc" ? "NameDesc" : "NameAsc";
            ViewData["PromotionPercentageLimitSortParm"] = sortOrder == "PromotionPercentageLimitAsc" ? "PromotionPercentageLimitDesc" : "PromotionPercentageLimitAsc";
            ViewData["PromotionStartDateSortParm"] = sortOrder == "PromotionStartDateAsc" ? "PromotionStartDateDesc" : "PromotionStartDateAsc";
            ViewData["PromotionEndDateSortParm"] = sortOrder == "PromotionEndDateAsc" ? "PromotionEndDateDesc" : "PromotionEndDateAsc";
            ViewData["CreatedDateSortParm"] = sortOrder == "CreatedDateAsc" ? "CreatedDateDesc" : "CreatedDateAsc";
            ViewData["UpdatedDateSortParm"] = sortOrder == "UpdatedDateAsc" ? "UpdatedDateDesc" : "UpdatedDateAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.PromotionBanner
                                    select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.Name.Contains(searchString)
                                                              || s.PromotionPercentageLimit.ToString().Contains(searchString)
                                                              || s.PromotionStartDate.ToString().Contains(searchString)
                                                              || s.PromotionEndDate.ToString().Contains(searchString)
                                                              || s.CreatedDate.ToString().Contains(searchString)
                                                              || s.UpdatedDate.ToString().Contains(searchString));
            }

            switch (sortOrder)
            {
                case "NameAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Name);
                    break;
                case "NameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Name);
                    break;
                case "PromotionPercentageLimitAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.PromotionPercentageLimit);
                    break;
                case "PromotionPercentageLimitDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.PromotionPercentageLimit);
                    break;
                case "PromotionStartDateAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.PromotionStartDate);
                    break;
                case "PromotionStartDateDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.PromotionStartDate);
                    break;
                case "PromotionEndDateAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.PromotionEndDate);
                    break;
                case "PromotionEndDateDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.PromotionEndDate);
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

        // GET: Admin/Banners/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Banners/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([Bind("BannerId,Name,PromotionPercentageLimit,PromotionStartDate,PromotionEndDate,ImageFile,CreatedDate,UpdatedDate")] PromotionBanner promotionBanner)
        {
            if (ModelState.IsValid)
            {
                if (promotionBanner.ImageFile != null)
                { 
                    string folderPath = "/lib/images/banners/";
                    promotionBanner.Image = await UploadImage(folderPath, promotionBanner.ImageFile);
                }
                else
                {
                    promotionBanner.Image = null;
                }
                promotionBanner.CreatedDate = DateTime.Now;

                _context.Add(promotionBanner);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Data successfully added!";
                return RedirectToAction(nameof(Create));
            }
            return View(promotionBanner);
        }

        // GET: Admin/Banners/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var banner = await _context.PromotionBanner.FindAsync(id);
            if (banner == null)
            {
                return NotFound();
            }
            return View(banner);
        }

        // POST: Admin/Banners/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int id, PromotionBanner promotionBanner)
        {
            if (id != promotionBanner.PromotionBannerId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    string RootPath = _hostEnvironment.WebRootPath;
                    string folderPath = "/lib/images/banners/";
                    var existingMainImage = _context.PromotionBanner.Where(x => x.PromotionBannerId == id).Select(s => s.Image).FirstOrDefault();
                    if (promotionBanner.ImageFile != null)
                    {
                        if (existingMainImage != null && System.IO.File.Exists(RootPath + folderPath + existingMainImage))
                        {
                            System.IO.File.Delete(RootPath + folderPath + existingMainImage);
                        }

                        string mainImageFile = await UploadImage(folderPath, promotionBanner.ImageFile);

                        PromotionBanner PromotionBanner = new PromotionBanner
                        {
                            PromotionBannerId = promotionBanner.PromotionBannerId,
                            Name = promotionBanner.Name,
                            Image = mainImageFile,
                            PromotionPercentageLimit = promotionBanner.PromotionPercentageLimit,
                            PromotionStartDate = promotionBanner.PromotionStartDate,
                            PromotionEndDate = promotionBanner.PromotionEndDate,
                            CreatedDate = promotionBanner.CreatedDate,
                            UpdatedDate = DateTime.Now
                        };

                        _context.Update(PromotionBanner);
                        await _context.SaveChangesAsync();
                        TempData["SuccessMessage"] = "Data successfully updated!";
                    }
                    else
                    {
                        PromotionBanner PromotionBanner = new PromotionBanner
                        {
                            PromotionBannerId = promotionBanner.PromotionBannerId,
                            Name = promotionBanner.Name,
                            Image = existingMainImage,
                            PromotionPercentageLimit = promotionBanner.PromotionPercentageLimit,
                            PromotionStartDate = promotionBanner.PromotionStartDate,
                            PromotionEndDate = promotionBanner.PromotionEndDate,
                            CreatedDate = promotionBanner.CreatedDate,
                            UpdatedDate = DateTime.Now
                        };

                        _context.Update(PromotionBanner);
                        await _context.SaveChangesAsync();
                        TempData["SuccessMessage"] = "Data successfully updated!";
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BannerExists(promotionBanner.PromotionBannerId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Edit));
            }
            return View(promotionBanner);
        }

        // GET: Admin/Banners/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var banner = await _context.PromotionBanner
                .FirstOrDefaultAsync(m => m.PromotionBannerId == id);
            if (banner == null)
            {
                return NotFound();
            }

            return View(banner);
        }

        // POST: Admin/Banners/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var banner = await _context.PromotionBanner.FindAsync(id);

            string RootPath = _hostEnvironment.WebRootPath;
            string folderPath = "/lib/images/banners/";
            var existingMainImage = _context.PromotionBanner.Where(x => x.PromotionBannerId == id).Select(s => s.Image).FirstOrDefault();
            if (existingMainImage != null && System.IO.File.Exists(RootPath + folderPath + existingMainImage))
            {
                System.IO.File.Delete(RootPath + folderPath + existingMainImage);
            }

            _context.PromotionBanner.Remove(banner);
            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = "Data successfully deleted!";
            return RedirectToAction(nameof(Index));
        }

        private async Task<string> UploadImage(string folderPath, IFormFile image)
        {
            string RootPath = _hostEnvironment.WebRootPath;
            string uniqueFileName = image.FileName + "_" + Guid.NewGuid().ToString();
            string Extension = Path.GetExtension(image.FileName);
            uniqueFileName = uniqueFileName += Extension;
            string ImagePath = Path.Combine(RootPath + folderPath, uniqueFileName);
            using (var fileStream = new FileStream(ImagePath, FileMode.Create))
            {
                await image.CopyToAsync(fileStream);
            }

            return uniqueFileName;
        }

        private bool BannerExists(int id)
        {
            return _context.PromotionBanner.Any(e => e.PromotionBannerId == id);
        }
    }
}
