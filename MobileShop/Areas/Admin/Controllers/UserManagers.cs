using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Areas.Identity.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MobileShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin, Staff")]
    public class UserManagers : Controller
    {
        private readonly UserManager<MobileShopUser> _userManager;
        public UserManagers(UserManager<MobileShopUser> userManager)
        {
            _userManager = userManager;
        }
        public async Task<IActionResult> Index(string searchString, string sortOrder, string currentFilter)
        {
            ViewData["UserNameSortParm"] = sortOrder == "UserNameAsc" ? "UserNameDesc" : "UserNameAsc";
            ViewData["EmailSortParm"] = sortOrder == "EmailAsc" ? "EmailDesc" : "EmailAsc";
            ViewData["EmailConfirmedSortParm"] = sortOrder == "EmailConfirmedAsc" ? "EmailConfirmedDesc" : "EmailConfirmedAsc";
            ViewData["PhoneNumberSortParm"] = sortOrder == "PhoneNumberAsc" ? "PhoneNumberDesc" : "PhoneNumberAsc";
            ViewData["PhoneNumberConfirmedSortParm"] = sortOrder == "PhoneNumberConfirmedAsc" ? "PhoneNumberConfirmedDesc" : "PhoneNumberConfirmedAsc";
            ViewData["NameSortParm"] = sortOrder == "NameAsc" ? "NameDesc" : "NameAsc";
            ViewData["GenderSortParm"] = sortOrder == "GenderAsc" ? "GenderDesc" : "GenderAsc";
            ViewData["DOBSortParm"] = sortOrder == "DOBAsc" ? "DOBDesc" : "DOBAsc";

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var users = _userManager.Users.Select(c => new UserInRole()
            {
                Username = c.UserName,
                Role = string.Join(",", _userManager.GetRolesAsync(c).Result.ToArray()),
                Email = c.Email,
                EmailConfirmed = c.EmailConfirmed,
                PhoneNumber = c.PhoneNumber,
                PhoneNumberConfirmed = c.PhoneNumberConfirmed,
                Name = c.Name,
                Gender = c.Gender,
                DOB = c.DOB,
            });

            if (!String.IsNullOrEmpty(searchString))
            {
                users = users.Where(s => s.Username.Contains(searchString)
                                      || s.Email.Contains(searchString)
                                      || s.PhoneNumber.Contains(searchString)
                                      || s.Name.Contains(searchString)
                                      || s.Gender.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "UserNameAsc":
                    users = users.OrderBy(s => s.Username);
                    break;
                case "UserNameDesc":
                    users = users.OrderByDescending(s => s.Username);
                    break;
                case "EmailAsc":
                    users = users.OrderBy(s => s.Email);
                    break;
                case "EmailDesc":
                    users = users.OrderByDescending(s => s.Email);
                    break;
                case "EmailConfirmedAsc":
                    users = users.OrderBy(s => s.EmailConfirmed);
                    break;
                case "EmailConfirmedDesc":
                    users = users.OrderByDescending(s => s.EmailConfirmed);
                    break;
                case "PhoneNumberAsc":
                    users = users.OrderBy(s => s.PhoneNumber);
                    break;
                case "PhoneNumberDesc":
                    users = users.OrderByDescending(s => s.PhoneNumber);
                    break;
                case "PhoneNumberConfirmedAsc":
                    users = users.OrderBy(s => s.PhoneNumberConfirmed);
                    break;
                case "PhoneNumberConfirmedDesc":
                    users = users.OrderByDescending(s => s.PhoneNumberConfirmed);
                    break;
                case "NameAsc":
                    users = users.OrderBy(s => s.Name);
                    break;
                case "NameDesc":
                    users = users.OrderByDescending(s => s.Name);
                    break;
                case "GenderAsc":
                    users = users.OrderBy(s => s.Gender);
                    break;
                case "GenderDesc":
                    users = users.OrderByDescending(s => s.Gender);
                    break;
                case "DOBAsc":
                    users = users.OrderBy(s => s.DOB);
                    break;
                case "DOBDesc":
                    users = users.OrderByDescending(s => s.DOB);
                    break;
            }
            return View(await users.ToListAsync());
        }

        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create(string Email, string Password)
        {
            var user = new MobileShopUser
            {
                UserName = Email,
                Email = Email,
                EmailConfirmed = true
            };
            var i = await _userManager.FindByEmailAsync(user.Email);
            if (i == null)
            {
                var staffUser = await _userManager.CreateAsync(user, Password);
                if (staffUser.Succeeded)
                {
                    await _userManager.AddToRoleAsync(user, "Staff");
                    TempData["SuccessMessage"] = "Data successfully added!";
                    return RedirectToAction(nameof(Create));
                }
            }
            return RedirectToAction(nameof(Create));
        }
    }
}

