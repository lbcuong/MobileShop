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
    public class BannersController : Controller
    {
        private readonly MobileShopContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;
        public BannersController(MobileShopContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _hostEnvironment = hostEnvironment;
        }

        // GET: Admin/Banners
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["NameSortParm"] = sortOrder == "NameAsc" ? "NameDesc" : "NameAsc";
            ViewData["CreatedDateSortParm"] = sortOrder == "CreatedDateAsc" ? "CreatedDateDesc" : "CreatedDateAsc";
            ViewData["UpdatedDateSortParm"] = sortOrder == "UpdatedDateAsc" ? "UpdatedDateDesc" : "UpdatedDateAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.Banner
                                    select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.Name.Contains(searchString)
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
        public async Task<IActionResult> Create([Bind("BannerId,Name,ImageFile,CreatedDate,UpdatedDate")] Banner banner)
        {
            if (ModelState.IsValid)
            {
                string folderPath = "/lib/images/banners/";
                banner.Image = await UploadImage(folderPath, banner.ImageFile);
                banner.CreatedDate = DateTime.Now;

                _context.Add(banner);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Data successfully added!";
                return RedirectToAction(nameof(Create));
            }
            return View(banner);
        }

        // GET: Admin/Banners/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var banner = await _context.Banner.FindAsync(id);
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
        public async Task<IActionResult> Edit(int id, Banner banner)
        {
            if (id != banner.BannerId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    string RootPath = _hostEnvironment.WebRootPath;
                    string folderPath = "/lib/images/banners/";
                    var existingMainImage = _context.Banner.Where(x => x.BannerId == id).Select(s => s.Image).FirstOrDefault();
                    if ( banner.ImageFile != null)
                    {
                        if (existingMainImage != null && System.IO.File.Exists(RootPath + folderPath + existingMainImage))
                        {
                            System.IO.File.Delete(RootPath + folderPath + existingMainImage);
                        }

                        string mainImageFile = await UploadImage(folderPath, banner.ImageFile);

                        Banner Banner = new Banner
                        {
                            BannerId = banner.BannerId,
                            Name = banner.Name,
                            Image = mainImageFile,
                            CreatedDate = banner.CreatedDate,
                            UpdatedDate = DateTime.Now
                        };

                        _context.Update(Banner);
                        await _context.SaveChangesAsync();
                        TempData["SuccessMessage"] = "Data successfully updated!";
                    }
                    else
                    {
                        Banner Banner = new Banner
                        {
                            BannerId = banner.BannerId,
                            Name = banner.Name,
                            Image = existingMainImage,
                            CreatedDate = banner.CreatedDate,
                            UpdatedDate = DateTime.Now
                        };

                        _context.Update(Banner);
                        await _context.SaveChangesAsync();
                        TempData["SuccessMessage"] = "Data successfully updated!";
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BannerExists(banner.BannerId))
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
            return View(banner);
        }

        // GET: Admin/Banners/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var banner = await _context.Banner
                .FirstOrDefaultAsync(m => m.BannerId == id);
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
            var banner = await _context.Banner.FindAsync(id);

            string RootPath = _hostEnvironment.WebRootPath;
            string folderPath = "/lib/images/banners/";
            var existingMainImage = _context.Banner.Where(x => x.BannerId == id).Select(s => s.Image).FirstOrDefault();
            if (existingMainImage != null && System.IO.File.Exists(RootPath + folderPath + existingMainImage))
            {
                System.IO.File.Delete(RootPath + folderPath + existingMainImage);
            }

            _context.Banner.Remove(banner);
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
            return _context.Banner.Any(e => e.BannerId == id);
        }
    }
}
