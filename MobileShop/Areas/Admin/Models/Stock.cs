using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Admin.Models
{
    public class Stock
    {
        public int StockId { get; set; }

        [Display(Name = "Mobile Phone")]
        public int MobilePhoneId { get; set; }
        [ForeignKey("MobilePhoneId")]
        public MobilePhone MobilePhone { get; set; }

        [Display(Name = "Color")]
        public int ItemColorId { get; set; }
        [ForeignKey("ItemColorId")]
        public ItemColor ItemColor { get ; set; }

        public int Quantity { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        [Column(TypeName = "decimal(15, 0)")]
        public decimal Price { get; set; }

        [Display(Name = "Created Date")]
        [DataType(DataType.DateTime)]
        public DateTime CreatedDate { get; set; }

        [Display(Name = "Updated Date")]
        public DateTime? UpdatedDate { get; set; }
    }
}
