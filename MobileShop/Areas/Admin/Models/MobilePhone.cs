using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MobileShop.Areas.Admin.Models
{
    public class MobilePhone
    {
        public int MobilePhoneId { get; set; }

        [Display(Name = "Name")]
        public int ItemId { get; set; }
        [ForeignKey("ItemId")]
        public Item Item { get; set; }

        public string Screen { get; set; }

        [Display(Name = "Main Camera")]
        public string MainCamera { get; set; }

        [Display(Name = "Selfie Camera")]
        public string SelfieCamera { get; set; }

        public string OS { get; set; }

        public string Chipset { get; set; }

        public string CPU { get; set; }

        public string GPU { get; set; }

        public string RAM { get; set; }

        public string Storage { get; set; }

        public string SIM { get; set; }

        public string Pin { get; set; }

        [Display(Name = "Created Date")]
        public DateTime CreatedDate { get; set; }

        [Display(Name = "Updated Date")]
        public DateTime? UpdatedDate { get; set; }
    }
}
