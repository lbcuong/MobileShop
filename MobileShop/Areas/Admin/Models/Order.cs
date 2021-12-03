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

        [StringLength(256)]
        [Required]
        public string UserName { get; set; }

        [Required]
        public string Name { get; set; }

        public string PhoneNumber { get; set; }

        [Required]
        public string Address { get; set; }

        [Required]
        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        [Column(TypeName = "decimal(15, 0)")]
        public decimal Total { get; set; }

        [Required]
        public DateTime OrderDate { get; set; }

        [Required]
        public string Status { get; set; }

        [Required]
        public ICollection<OrderDetail> OrderDetail { get; set; }
    }
}
