using MobileShop.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Admin.Models
{
    public class Review
    {
        [Key]
        public int ReviewId { get; set; }

        [Display(Name = "User name")]
        public string UserName { get; set; }

        [Display(Name = "User role")]
        public string UserRole { get; set; }

        [Display(Name = "Item")]
        public int ItemId { get; set; }
        [ForeignKey("ItemId")]
        public Item Item { get; set; }

        public string Comment { get; set; }

        public int Rate { get; set; }

        [Display(Name = "Comment Date")]
        public DateTime CommentDate { get; set; }

        public ICollection<ReplyReview> Replies { get; set; }
    }
}
