using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Admin.Models
{
    public class ItemImages
    {
        [Key]
        public int ItemImageId { get; set; }

        [Display(Name = "Item")]
        public int StockId { get; set; }
        [ForeignKey("StockId")]
        public Stock Stock { get; set; }

        public string Images { get; set; }

        [Required]
        [NotMapped]
        [Display(Name = "Images")]
        public IFormFile ImageFile { get; set; }

        [Display(Name = "Created Date")]
        public DateTime CreatedDate { get; set; }

        [Display(Name = "Updated Date")]
        public DateTime? UpdatedDate { get; set; }
    }
}
