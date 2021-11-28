using MobileShop.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Models
{
    public class CartItem
    {
        public int Quantity { set; get; }
        public ItemImages Item { set; get; }

        public decimal SubTotal => Item.Stock.Price * Quantity;

    }
}
