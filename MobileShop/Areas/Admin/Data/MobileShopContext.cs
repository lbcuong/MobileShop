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
        public DbSet<ItemImage> ItemImage { get; set; }
        public DbSet<Review> Review { get; set; }
        public DbSet<ReplyReview> ReplyReview { get; set; }
        public DbSet<SalesOrder> SalesOrder { get; set; }
        public DbSet<SalesOrderDetail> SalesOrderDetail { get; set; }
        public DbSet<PurchaseOrder> PurchaseOrder { get; set; }
        public DbSet<PurchaseOrderDetail> PurchaseOrderDetail { get; set; }
        public DbSet<PromotionBanner> PromotionBanner { get; set; }
        public DbSet<Supplier> Supplier { get; set; }
    }
}
