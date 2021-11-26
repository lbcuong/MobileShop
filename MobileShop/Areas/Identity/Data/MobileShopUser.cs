using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Identity.Data
{
    public class MobileShopUser : IdentityUser
    {
        [PersonalData]
        [Display(Name = "Full Name")]
        public string Name { get; set; }

        [PersonalData]
        public string Gender { get; set; }

        [PersonalData]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:MMMM dd, yyyy}", ApplyFormatInEditMode = true)]
        [Display(Name = "Birth Date")]
        public DateTime DOB { get; set; }

        [PersonalData]
        public string Address { get; set; }
    }
}
