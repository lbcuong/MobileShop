using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Admin.Models
{
    public class UserInRole
    {
        [Display(Name = "User name")]
        public string Username { get; set; }

        public string Role { get; set; }

        public string Email { get; set; }

        [Display(Name = "Email Confirmed")]
        public bool EmailConfirmed { get; set; }

        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }

        [Display(Name = "Phone Number Confirmed")]
        public bool PhoneNumberConfirmed { get; set; }

        public string Name { get; set; }

        public string Gender { get; set; }

        [Display(Name = "Birth Day")]
        public DateTime DOB { get; set; }
    }
}
