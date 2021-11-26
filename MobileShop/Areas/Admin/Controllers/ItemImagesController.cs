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

            var mobileShopContext = from m in _context.ItemImages
                .Include(i => i.Stock)
                    .ThenInclude(i => i.MobilePhone)
                        .ThenInclude(i => i.Item)
                .Include(i => i.Stock)
                    .ThenInclude(i => i.ItemColor)
                                    select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.Images.Contains(searchString)
                                                              || s.Stock.MobilePhone.Item.Name.Contains(searchString)
                                                              || s.Stock.MobilePhone.RAM.Contains(searchString)
                                                              || s.Stock.MobilePhone.GPU.Contains(searchString)
                                                              || s.Stock.ItemColor.Name.Contains(searchString));
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
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Stock.MobilePhone.Item.Name);
                    break;
                case "NameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Stock.MobilePhone.Item.Name);
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
            var MobilePhoneInfo = _context.Stock
                .Select(s => new
                {
                    Text = s.MobilePhone.Item.Name + " (" + s.MobilePhone.RAM + "/ " + s.MobilePhone.Storage + ")" + " " + s.ItemColor.Name,
                    Value = s.StockId
                })
                .ToList();

            ViewData["StockId"] = new SelectList(MobilePhoneInfo, "Value", "Text");
            return View();
        }

        // POST: Admin/ItemImages/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([Bind("ItemImageId,StockId,ImageFile,CreatedDate,UpdatedDate")] ItemImages itemImages)
        {
            string uniqueFileName = null;

            if (ModelState.IsValid)
            {
                string RootPath = _hostEnvironment.WebRootPath;
                uniqueFileName = itemImages.ImageFile.FileName + "_" + Guid.NewGuid().ToString();
                string Extension = Path.GetExtension(itemImages.ImageFile.FileName);
                itemImages.Images = uniqueFileName += Extension;
                string ImagePath = Path.Combine(RootPath + "/lib/images/", uniqueFileName);
                using (var fileStream = new FileStream(ImagePath, FileMode.Create))
                {
                    await itemImages.ImageFile.CopyToAsync(fileStream);
                }

                _context.Add(itemImages);
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

            ViewData["StockId"] = new SelectList(MobilePhoneInfo, "Value", "Text", itemImages.StockId);
            return View(itemImages);
        }

        // GET: Admin/ItemImages/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var itemImages = await _context.ItemImages.FindAsync(id);
            if (itemImages == null)
            {
                return NotFound();
            }
            var MobilePhoneInfo = _context.Stock
                .Select(s => new
                {
                    Text = s.MobilePhone.Item.Name + " (" + s.MobilePhone.RAM + "/ " + s.MobilePhone.Storage + ")" + " " + s.ItemColor.Name,
                    Value = s.StockId
                })
                .ToList();

            ViewData["StockId"] = new SelectList(MobilePhoneInfo, "Value", "Text", itemImages.StockId);
            return View(itemImages);
        }

        // POST: Admin/ItemImages/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int id, [Bind("ItemImageId,StockId,ImageFile,CreatedDate,UpdatedDate")] ItemImages itemImages)
        {

            if (id != itemImages.ItemImageId)
            {
                return NotFound();
            }


            if (ModelState.IsValid)
            {
                try
                {
                    string uniqueFileName = null;
                    string RootPath = _hostEnvironment.WebRootPath;
                    uniqueFileName = itemImages.ImageFile.FileName + "_" + Guid.NewGuid().ToString();
                    string Extension = Path.GetExtension(itemImages.ImageFile.FileName);
                    itemImages.Images = uniqueFileName += Extension;

                    if (itemImages.Images != null)
                    {
                        if (itemImages.ImageFile != null)
                        {
                            string ImagePath = Path.Combine(RootPath + "/lib/images/", uniqueFileName);
                            using (var fileStream = new FileStream(ImagePath, FileMode.Create))
                            {
                                await itemImages.ImageFile.CopyToAsync(fileStream);
                            }
                        }
                    }

                    _context.Update(itemImages);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ItemImagesExists(itemImages.ItemImageId))
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

            ViewData["StockId"] = new SelectList(MobilePhoneInfo, "Value", "Text", itemImages.StockId);
            return View(itemImages);
        }

        // GET: Admin/ItemImages/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var itemImages = await _context.ItemImages
                .Include(i => i.Stock)
                    .ThenInclude(i => i.MobilePhone)
                        .ThenInclude(i => i.Item)
                .Include(i => i.Stock)
                    .ThenInclude(i => i.ItemColor)
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
            var itemImages = await _context.ItemImages.FindAsync(id);
            _context.ItemImages.Remove(itemImages);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ItemImagesExists(int id)
        {
            return _context.ItemImages.Any(e => e.ItemImageId == id);
        }
    }
}
