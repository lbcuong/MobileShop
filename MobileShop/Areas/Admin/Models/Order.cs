using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Admin.Models
{
    public class Order
    {
        [Key]
        public int OrderId { get; set; }
        public string UserName { get; set; }

        [Column(TypeName = "decimal(15, 0)")]
        public decimal Total { get; set; }
        public DateTime OrderDate { get; set; }

    }
}
