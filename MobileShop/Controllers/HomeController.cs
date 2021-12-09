using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Data;
using MobileShop.Models;

namespace MobileShop.Controllers
{
    [AllowAnonymous]
    public class HomeController : Controller
    {
        private readonly MobileShopContext _context;

        public HomeController(MobileShopContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var banners = _context.Banner.OrderByDescending(o => o.CreatedDate).Take(10).ToList();
            ViewBag.Banners = banners;

            var bestSalesMobiles = (from m in _context.Item
                                        let totalQuantity = (from i in _context.SalesOrderDetail
                                        where i.ItemId == m.ItemId
                                        select i.Quantity).Sum()
                                    where totalQuantity > 0
                                    orderby totalQuantity descending
                                    select m).Take(20).ToList();
            ViewBag.BestSalesMobiles = bestSalesMobiles;

            var subbestSalesMobiles1 = bestSalesMobiles.Take(5).ToList();
            ViewBag.SubbestSalesMobiles1 = subbestSalesMobiles1;

            var subbestSalesMobiles2 = bestSalesMobiles.Skip(5).Take(5).ToList();
            ViewBag.SubbestSalesMobiles2 = subbestSalesMobiles2;

            var subbestSalesMobiles3 = bestSalesMobiles.Skip(10).Take(5).ToList();
            ViewBag.SubbestSalesMobiles3 = subbestSalesMobiles3;

            var subbestSalesMobiles4 = bestSalesMobiles.Skip(15).Take(5).ToList();
            ViewBag.SubbestSalesMobiles4 = subbestSalesMobiles4;

            return View();
        }

        public JsonResult AutoComplete(string prefix)
        {
            var items = (from item in _context.Item
                             where item.Name.StartsWith(prefix)
                             select new
                             {
                                 label = item.Name,
                                 val = item.ItemId
                             }).Take(10).ToList();

            return Json(items);
        }

        public async Task<IActionResult> Filter(string sortOrder, string searchString, string currentFilter, int? pageNumber)
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
                    .Include(i => i.ItemGroup);

            var brands = _context.Item
                    .Include(i => i.ItemCategory)
                    .Include(i => i.ItemGroup)
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

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
