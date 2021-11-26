using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using MobileShop.Data;
using System;
using System.Linq;

namespace MobileShop.Areas.Admin.Models
{
    public static class SeedData
    {
        public static void Initialize(IServiceProvider serviceProvider)
        {
            using (var context = new MobileShopContext(
                serviceProvider.GetRequiredService<
                    DbContextOptions<MobileShopContext>>()))
            {
            }
        }
    }
}