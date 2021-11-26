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
    public class PaymentMethodsController : Controller
    {
        private readonly MobileShopContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;

        public PaymentMethodsController(MobileShopContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            this._hostEnvironment = hostEnvironment;
        }

        // GET: Admin/PaymentMethods
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

            var mobileShopContext = from m in _context.PaymentMethod
                                    select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.Images.Contains(searchString)
                                                              || s.Name.Contains(searchString));
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

            return View(await _context.PaymentMethod.ToListAsync());
        }

        // GET: Admin/PaymentMethods/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {
            var mobileShopContext = from m in _context.PaymentMethod
                                    select m;

            return View();
        }

        // POST: Admin/PaymentMethods/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PaymentMethodId,Name,ImageFile,CreatedDate,UpdatedDate")] PaymentMethod paymentMethod)
        {
            string uniqueFileName = null;
            if (ModelState.IsValid)
            {
                string RootPath = _hostEnvironment.WebRootPath;
                uniqueFileName = paymentMethod.ImageFile.FileName + "_" + Guid.NewGuid().ToString();
                string Extension = Path.GetExtension(paymentMethod.ImageFile.FileName);
                paymentMethod.Images = uniqueFileName += Extension;
                string ImagePath = Path.Combine(RootPath + "/lib/images/logo/", uniqueFileName);
                using (var fileStream = new FileStream(ImagePath, FileMode.Create))
                {
                    await paymentMethod.ImageFile.CopyToAsync(fileStream);
                }

                _context.Add(paymentMethod);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            var mobileShopContext = from m in _context.PaymentMethod
                                    select m;

            return View(paymentMethod);
        }

        // GET: Admin/PaymentMethods/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var paymentMethod = await _context.PaymentMethod.FindAsync(id);

            if (paymentMethod == null)
            {
                return NotFound();
            }
            return View(paymentMethod);
        }

        // POST: Admin/PaymentMethods/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int id, [Bind("PaymentMethodId,Name,ImageFile,CreatedDate,UpdatedDate")] PaymentMethod paymentMethod)
        {
            if (id != paymentMethod.PaymentMethodId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    string uniqueFileName = null;
                    string RootPath = _hostEnvironment.WebRootPath;
                    uniqueFileName = paymentMethod.ImageFile.FileName + "_" + Guid.NewGuid().ToString();
                    string Extension = Path.GetExtension(paymentMethod.ImageFile.FileName);
                    paymentMethod.Images = uniqueFileName += Extension;

                    if (paymentMethod.Images != null)
                    {
                        if (paymentMethod.ImageFile != null)
                        {
                            string ImagePath = Path.Combine(RootPath + "/lib/images/logo/", uniqueFileName);
                            using (var fileStream = new FileStream(ImagePath, FileMode.Create))
                            {
                                await paymentMethod.ImageFile.CopyToAsync(fileStream);
                            }
                        }
                    }

                    _context.Update(paymentMethod);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PaymentMethodExists(paymentMethod.PaymentMethodId))
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
            return View(paymentMethod);
        }

        // GET: Admin/PaymentMethods/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var paymentMethod = await _context.PaymentMethod
                .FirstOrDefaultAsync(m => m.PaymentMethodId == id);
            if (paymentMethod == null)
            {
                return NotFound();
            }

            return View(paymentMethod);
        }

        // POST: Admin/PaymentMethods/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var paymentMethod = await _context.PaymentMethod.FindAsync(id);
            _context.PaymentMethod.Remove(paymentMethod);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PaymentMethodExists(int id)
        {
            return _context.PaymentMethod.Any(e => e.PaymentMethodId == id);
        }
    }
}
