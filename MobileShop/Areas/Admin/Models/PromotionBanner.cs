using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Admin.Models
{
    public class PromotionBanner
    {
        [Key]
        public int PromotionBannerId { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public string Image { get; set; }

        [Display(Name = "Promotion Percentage Limit")]
        [Range(0.0, 1)]
        [Column(TypeName = "decimal(2, 1)")]
        public decimal PromotionPercentageLimit { get; set; }

        [Display(Name = "Start Date")]
        public DateTime PromotionStartDate { get; set; }

        [Display(Name = "End Date")]
        public DateTime PromotionEndDate { get; set; }

        [NotMapped]
        [Display(Name = "Image")]
        public IFormFile ImageFile { get; set; }

        [Display(Name = "Created Date")]
        public DateTime CreatedDate { get; set; }

        [Display(Name = "Updated Date")]
        public DateTime? UpdatedDate { get; set; }
    }
}
