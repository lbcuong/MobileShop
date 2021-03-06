using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MobileShop.Areas.Admin.Models
{
    public class Item
    {
        [Key]
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

        public string Image { get; set; }

        [NotMapped]
        [Display(Name = "Image")]
        public IFormFile MainImage { get; set; }

        [Display(Name = "Promotion Name")]
        public int? PromotionBannerId { get; set; }
        [ForeignKey("PromotionBannerId")]
        public PromotionBanner PromotionBanner { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        [Column(TypeName = "decimal(15, 0)")]
        public decimal Price { get; set; }

        [Display(Name = "Promotion Percentage")]
        [Range(0.0, 1)]
        [Column(TypeName = "decimal(2, 1)")]
        public decimal PromotionPercentage { get; set; }

        [Display(Name = "Created Date")]
        public DateTime CreatedDate { get; set; }

        [Display(Name = "Updated Date")]
        public DateTime? UpdatedDate { get; set; }


        [Display(Name = "Secondary Images")]
        [NotMapped]
        public List<IFormFile> SecondaryImages { get; set; }

        public ICollection<ItemImage> ItemImage { get; set; }

        [Display(Name = "Promotion Price")]
        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        [Column(TypeName = "decimal(15, 0)")]
        public decimal PromotionPrice => Price - (Price * PromotionPercentage);

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        [Column(TypeName = "decimal(3, 0)")]
        public decimal PromotionPercentageConvert => PromotionPercentage * 100;
    }
}
