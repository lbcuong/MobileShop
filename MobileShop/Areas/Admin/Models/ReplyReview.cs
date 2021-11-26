using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Admin.Models
{
    public class ReplyReview
    {
        [Key]
        public int ReplyReviewId { get; set; }

        [Display(Name = "Review")]
        public int ReviewId { get; set; }
        [ForeignKey("ReviewId")]
        public Review Review { get; set; }

        [Display(Name = "User name")]
        public string UserName { get; set; }

        [Display(Name = "User role")]
        public string UserRole { get; set; }

        public string Comment { get; set; }

        [Display(Name = "Comment Date")]
        public DateTime ReplyDate { get; set; }
    }
}
