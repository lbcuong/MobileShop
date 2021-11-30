using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Data;

namespace MobileShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin, Staff")]
    public class ItemImagesController : Controller
    {
        private readonly MobileShopContext _context;

        private readonly IWebHostEnvironment _hostEnvironment;

        public ItemImagesController(MobileShopContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _hostEnvironment = hostEnvironment;
        }

        // GET: Admin/ItemImages
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["ImageSortParm"] = sortOrder == "ImageAsc" ? "ImageDesc" : "ImageAsc";
            ViewData["NameSortParm"] = sortOrder == "NameAsc" ? "NameDesc" : "NameAsc";
            ViewData["CreatedDateSortParm"] = sortOrder == "CreatedDateAsc" ? "CreatedDateDesc" : "CreatedDateAsc";
            ViewData["UpdatedDateSortParm"] = sortOrder == "UpdatedDateAsc" ? "UpdatedDateDesc" : "UpdatedDateAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.ItemImage
                        .Include(i => i.Item)
                                    select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.Images.Contains(searchString)
                                                              || s.Item.Name.Contains(searchString)
                                                              || s.CreatedDate.ToString().Contains(searchString)
                                                              || s.UpdatedDate.ToString().Contains(searchString));
            }

            switch (sortOrder)
            {
                case "ImageAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Images);
                    break;
                case "ImageDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Images);
                    break;
                case "NameAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Item.Name);
                    break;
                case "NameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Item.Name);
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

        // GET: Admin/ItemImages/Create
        [Authorize(Roles = "Admin")]
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

        // POST: Admin/ItemImages/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([Bind("ItemImageId,ItemId,ImageFile,CreatedDate,UpdatedDate")] ItemImage itemImage)
        {
            string uniqueFileName = null;

            if (ModelState.IsValid)
            {
                string RootPath = _hostEnvironment.WebRootPath;
                uniqueFileName = itemImage.ImageFile.FileName + "_" + Guid.NewGuid().ToString();
                string Extension = Path.GetExtension(itemImage.ImageFile.FileName);
                itemImage.Images = uniqueFileName += Extension;
                string ImagePath = Path.Combine(RootPath + "/lib/images/", uniqueFileName);
                using (var fileStream = new FileStream(ImagePath, FileMode.Create))
                {
                    await itemImage.ImageFile.CopyToAsync(fileStream);
                }

                _context.Add(itemImage);
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
            return View(itemImage);
        }

        // GET: Admin/ItemImages/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var itemImages = await _context.ItemImage.FindAsync(id);
            if (itemImages == null)
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
            return View(itemImages);
        }

        // POST: Admin/ItemImages/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int id, [Bind("ItemImageId,ItemId,ImageFile,CreatedDate,UpdatedDate")] ItemImage itemImage)
        {

            if (id != itemImage.ItemImageId)
            {
                return NotFound();
            }


            if (ModelState.IsValid)
            {
                try
                {
                    string uniqueFileName = null;
                    string RootPath = _hostEnvironment.WebRootPath;
                    uniqueFileName = itemImage.ImageFile.FileName + "_" + Guid.NewGuid().ToString();
                    string Extension = Path.GetExtension(itemImage.ImageFile.FileName);
                    itemImage.Images = uniqueFileName += Extension;

                    if (itemImage.Images != null)
                    {
                        if (itemImage.ImageFile != null)
                        {
                            string ImagePath = Path.Combine(RootPath + "/lib/images/", uniqueFileName);
                            using (var fileStream = new FileStream(ImagePath, FileMode.Create))
                            {
                                await itemImage.ImageFile.CopyToAsync(fileStream);
                            }
                        }
                    }

                    _context.Update(itemImage);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ItemImagesExists(itemImage.ItemImageId))
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
            return View(itemImage);
        }

        // GET: Admin/ItemImages/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var itemImages = await _context.ItemImage
                        .Include(i => i.Item)
                        .FirstOrDefaultAsync(m => m.ItemImageId == id);
            if (itemImages == null)
            {
                return NotFound();
            }

            return View(itemImages);
        }

        // POST: Admin/ItemImages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var itemImages = await _context.ItemImage.FindAsync(id);
            _context.ItemImage.Remove(itemImages);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ItemImagesExists(int id)
        {
            return _context.ItemImage.Any(e => e.ItemImageId == id);
        }
    }
}
