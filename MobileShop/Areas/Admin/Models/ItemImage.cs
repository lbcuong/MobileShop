using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Admin.Models
{
    public class ItemImage
    {
        [Key]
        public int ItemImageId { get; set; }

        [Display(Name = "Item")]
        public int ItemId { get; set; }
        [ForeignKey("ItemId")]
        public Item Item { get; set; }

        public string Images { get; set; }

        [Required]
        [NotMapped]
        [Display(Name = "Images")]
        public List<IFormFile> ImageFile { get; set; }
    }
}
