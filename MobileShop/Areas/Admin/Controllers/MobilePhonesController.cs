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
    public class MobilePhonesController : Controller
    {
        private readonly MobileShopContext _context;

        public MobilePhonesController(MobileShopContext context)
        {
            _context = context;
        }

        // GET: Admin/MobilePhones
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["NameSortParm"] = sortOrder == "NameAsc" ? "NameDesc" : "NameAsc";
            ViewData["ScreenSortParm"] = sortOrder == "ScreenAsc" ? "ScreenDesc" : "ScreenAsc";
            ViewData["OSSortParm"] = sortOrder == "OSAsc" ? "OSDesc" : "OSAsc";
            ViewData["MainCameraSortParm"] = sortOrder == "MainCameraAsc" ? "MainCameraDesc" : "MainCameraAsc";
            ViewData["SelfieCameraSortParm"] = sortOrder == "SelfieCameraAsc" ? "SelfieCameraDesc" : "SelfieCameraAsc";
            ViewData["ChipsetDateSortParm"] = sortOrder == "ChipsetAsc" ? "ChipsetDesc" : "ChipsetAsc";
            ViewData["CPUSortParm"] = sortOrder == "CPUAsc" ? "CPUDesc" : "CPUAsc";
            ViewData["GPUSortParm"] = sortOrder == "GPUAsc" ? "GPUDesc" : "GPUAsc";
            ViewData["RAMSortParm"] = sortOrder == "RAMAsc" ? "RAMDesc" : "RAMAsc";
            ViewData["StorageSortParm"] = sortOrder == "StorageAsc" ? "StorageDesc" : "StorageAsc";
            ViewData["SIMSortParm"] = sortOrder == "SIMAsc" ? "SIMDesc" : "SIMAsc";
            ViewData["PinSortParm"] = sortOrder == "PinAsc" ? "PinDesc" : "PinAsc";
            ViewData["CreatedDateSortParm"] = sortOrder == "CreatedDateAsc" ? "CreatedDateDesc" : "CreatedDateAsc";
            ViewData["UpdatedDateSortParm"] = sortOrder == "UpdatedDateAsc" ? "UpdatedDateDesc" : "UpdatedDateAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var mobileShopContext = from m in _context.MobilePhone
                .Include(m => m.Item) 
                select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                mobileShopContext = mobileShopContext.Where(s => s.Item.Name.Contains(searchString)
                                                              || s.Screen.Contains(searchString)
                                                              || s.OS.Contains(searchString)
                                                              || s.MainCamera.Contains(searchString)
                                                              || s.SelfieCamera.Contains(searchString)
                                                              || s.Chipset.Contains(searchString)
                                                              || s.CPU.Contains(searchString)
                                                              || s.GPU.Contains(searchString)
                                                              || s.RAM.Contains(searchString)
                                                              || s.Storage.Contains(searchString)
                                                              || s.SIM.Contains(searchString)
                                                              || s.Pin.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "NameAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Item.Name);
                    break;
                case "NameDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Item.Name);
                    break;
                case "ScreenAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Screen);
                    break;
                case "ScreenDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Screen);
                    break;
                case "OSAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.OS);
                    break;
                case "OSDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.OS);
                    break;
                case "MainCameraAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.MainCamera);
                    break;
                case "MainCameraDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.MainCamera);
                    break;
                case "SelfieCameraAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.SelfieCamera);
                    break;
                case "SelfieCameraDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.SelfieCamera);
                    break;
                case "ChipsetAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Chipset);
                    break;
                case "ChipsetDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Chipset);
                    break;
                case "CPUAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.CPU);
                    break;
                case "CPUDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.CPU);
                    break;
                case "GPUAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.GPU);
                    break;
                case "GPUDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.GPU);
                    break;
                case "RAMAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.RAM);
                    break;
                case "RAMDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.RAM);
                    break;
                case "StorageAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Storage);
                    break;
                case "StorageDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Storage);
                    break;
                case "SIMAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.SIM);
                    break;
                case "SIMDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.SIM);
                    break;
                case "PinAsc":
                    mobileShopContext = mobileShopContext.OrderBy(s => s.Pin);
                    break;
                case "PinDesc":
                    mobileShopContext = mobileShopContext.OrderByDescending(s => s.Pin);
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

        // GET: Admin/MobilePhones/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {
            ViewData["ItemId"] = new SelectList(_context.Item, "ItemId", "Name");
            return View();
        }

        // POST: Admin/MobilePhones/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([Bind("MobilePhoneId,ItemId,Screen,MainCamera,SelfieCamera,OS,Chipset,CPU,GPU,RAM,Storage,SIM,Pin,CreatedDate,UpdatedDate")] MobilePhone mobilePhone)
        {
            if (ModelState.IsValid)
            {
                _context.Add(mobilePhone);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ItemId"] = new SelectList(_context.Item, "ItemId", "Name", mobilePhone.ItemId);
            return View(mobilePhone);
        }

        // GET: Admin/MobilePhones/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mobilePhone = await _context.MobilePhone.FindAsync(id);
            if (mobilePhone == null)
            {
                return NotFound();
            }
            ViewData["ItemId"] = new SelectList(_context.Item, "ItemId", "Name", mobilePhone.ItemId);
            return View(mobilePhone);
        }

        // POST: Admin/MobilePhones/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int id, [Bind("MobilePhoneId,ItemId,Screen,MainCamera,SelfieCamera,OS,Chipset,CPU,GPU,RAM,Storage,SIM,Pin,CreatedDate,UpdatedDate")] MobilePhone mobilePhone)
        {
            if (id != mobilePhone.MobilePhoneId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(mobilePhone);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MobilePhoneExists(mobilePhone.MobilePhoneId))
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
            ViewData["ItemId"] = new SelectList(_context.Item, "ItemId", "Name", mobilePhone.ItemId);
            return View(mobilePhone);
        }

        // GET: Admin/MobilePhones/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mobilePhone = await _context.MobilePhone
                .Include(m => m.Item)
                .FirstOrDefaultAsync(m => m.MobilePhoneId == id);
            if (mobilePhone == null)
            {
                return NotFound();
            }

            return View(mobilePhone);
        }

        // POST: Admin/MobilePhones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var mobilePhone = await _context.MobilePhone.FindAsync(id);
            _context.MobilePhone.Remove(mobilePhone);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MobilePhoneExists(int id)
        {
            return _context.MobilePhone.Any(e => e.MobilePhoneId == id);
        }
    }
}
