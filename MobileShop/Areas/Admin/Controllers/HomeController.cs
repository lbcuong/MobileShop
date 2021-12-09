using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MobileShop.Data;
using MobileShop.Models;
using System.Diagnostics;
using System.Linq;

namespace MobileShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin, Staff")]
    public class HomeController : Controller
    {
        private readonly MobileShopContext _context;

        public HomeController(MobileShopContext context)
        {
            _context = context;
        }

        // GET: HomeController
        public ActionResult Index()
        {
            var totalOrder = _context.SalesOrder;
            ViewBag.TotalOrder = totalOrder.Count();

            var totalSales = _context.SalesOrder.Where(s => s.Status == "Delivered").Sum(s => s.Total);
            ViewBag.TotalSales = totalSales;

            var totalPurchase = _context.PurchaseOrder.Where(s => s.Status == "Received").Sum(s => s.Total);
            ViewBag.TotalPurchase = totalPurchase;

            var revenue = totalSales - totalPurchase;
            ViewBag.Revenue = revenue;

            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
