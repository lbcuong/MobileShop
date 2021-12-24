using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MobileShop.Data;
using MobileShop.Models;
using System;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

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
        [HttpGet]
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
            var itemsSoldTotal = from m in _context.SalesOrder
                           .Include(s => s.SalesOrderDetail)
                               .ThenInclude(s => s.Item)
                               .AsEnumerable()
                                     join j in _context.SalesOrderDetail on m.SalesOrderId equals j.SalesOrderId
                                     join i in _context.Item on j.ItemId equals i.ItemId
                                     where m.Status == "Delivering" || m.Status == "Delivered"
                                     group j by j.ItemId into g
                                     select new { name = g.First().Item.Name, quantity = g.Sum(s => s.Quantity) };

            DataTable itemsSoldChart = new DataTable();
            itemsSoldChart.Columns.AddRange(new DataColumn[]
            {
            new DataColumn("Item", typeof(string)),
            new DataColumn("Sold", typeof(int))
            });

            foreach (var item in itemsSoldTotal)
            {
                itemsSoldChart.Rows.Add(item.name, item.quantity);
            }
            ViewBag.ItemsSoldTotalChart = itemsSoldChart.AsEnumerable();
            ViewBag.ItemsSoldTotal = string.Join(",", itemsSoldChart.AsEnumerable().Select(r => r.Field<string>("Item")).ToArray());
            ViewBag.QuantityItemsSoldTotal = string.Join(",", itemsSoldChart.AsEnumerable().Select(r => r.Field<int>("Sold")).ToArray());

            var yesterday = DateTime.Today.AddDays(-1);
            ViewBag.Yesterday = yesterday;
            var totalOrderYesterday = _context.SalesOrder.Where(s => s.OrderDate >= yesterday && s.OrderDate < DateTime.Today);
            ViewBag.TotalOrderYesterday = totalOrderYesterday.Count();
            var totalSalesYesterday = _context.SalesOrder.Where(s => s.Status == "Delivered" && s.OrderDate >= yesterday && s.OrderDate < DateTime.Today).Sum(s => s.Total);
            ViewBag.TotalSalesYesterday = totalSalesYesterday;
            var itemsSoldYesterday = from m in _context.SalesOrder
                                       .Include(s => s.SalesOrderDetail)
                                           .ThenInclude(s => s.Item)
                                           .AsEnumerable()
                                   join j in _context.SalesOrderDetail on m.SalesOrderId equals j.SalesOrderId
                                   join i in _context.Item on j.ItemId equals i.ItemId
                                   where (m.OrderDate >= yesterday && m.OrderDate < DateTime.Today) && (m.Status == "Delivering" || m.Status == "Delivered")
                                   group j by j.ItemId into g
                                   select new { name = g.First().Item.Name, quantity = g.Sum(s => s.Quantity) };

            DataTable itemsSoldYesterdayChart = new DataTable();
            itemsSoldYesterdayChart.Columns.AddRange(new DataColumn[]
            {
            new DataColumn("Item", typeof(string)),
            new DataColumn("Sold", typeof(int))
            });

            foreach ( var item in itemsSoldYesterday)
            {
                itemsSoldYesterdayChart.Rows.Add(item.name, item.quantity);
            }
            ViewBag.ItemsSoldYesterdayChart = itemsSoldYesterdayChart.AsEnumerable();
            ViewBag.ItemsSoldYesterday = string.Join(",", itemsSoldYesterdayChart.AsEnumerable().Select(r => r.Field<string>("Item")).ToArray());
            ViewBag.QuantityItemsSoldYesterday = string.Join(",", itemsSoldYesterdayChart.AsEnumerable().Select(r => r.Field<int>("Sold")).ToArray());

            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
