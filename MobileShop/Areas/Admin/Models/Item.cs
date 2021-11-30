using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MobileShop.Areas.Admin.Models
{
    public class Item
    {
        public int ItemId { get; set; }

        [Display(Name = "Category")]
        public int ItemCategoryId { get; set; }
        [ForeignKey("ItemCategoryId")]
        public ItemCategory ItemCategory { get; set; }

        [Display(Name = "Group")]
        public int ItemGroupId { get; set; }
        [ForeignKey("ItemGroupId")]
        public ItemGroup ItemGroup { get; set; }

        [StringLength(100)]
        [Required]
        public string Name { get; set; }

        public int Quantity { get; set; }

        public string Detail { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        [Column(TypeName = "decimal(15, 0)")]
        public decimal Price { get; set; }

        [Display(Name = "Created Date")]
        public DateTime CreatedDate { get; set; }

        [Display(Name = "Updated Date")]
        public DateTime? UpdatedDate { get; set; }

        public ICollection<ItemImage> ItemImage { get; set; }
    }
}
