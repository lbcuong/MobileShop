using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MobileShop.Areas.Admin.Models;
using MobileShop.Areas.Identity.Data;
using MobileShop.Models;

namespace MobileShop.Data
{
    public class MobileShopContext : IdentityDbContext<MobileShopUser>
    {
        public MobileShopContext(DbContextOptions<MobileShopContext> options)
            : base(options)
        {
        }
        public DbSet<ItemGroup> ItemGroup { get; set; }
        public DbSet<ItemCategory> ItemCategory { get; set; }
        public DbSet<Item> Item { get; set; }
        public DbSet<ItemColor> Color { get; set; }
        public DbSet<MobilePhone> MobilePhone { get; set; }
        public DbSet<Stock> Stock { get; set; }
        public DbSet<ItemImages> ItemImages { get; set; }
        public DbSet<PaymentMethod> PaymentMethod { get; set; }
        public DbSet<Review> Review { get; set; }
        public DbSet<ReplyReview> ReplyReview { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<OrderDetail> OrderDetail { get; set; }

    }
}
