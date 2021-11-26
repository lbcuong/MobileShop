using System;
using System.ComponentModel.DataAnnotations;

namespace MobileShop.Areas.Admin.Models
{
    public class ItemCategory
    {
        public int ItemCategoryId { get; set; }

        [StringLength(50)]
        [Required]
        public string Name { get; set; }

        [Display(Name = "Created Date")]
        public DateTime CreatedDate { get; set; }

        [Display(Name = "Updated Date")]
        public DateTime? UpdatedDate { get; set; }
    }
}
