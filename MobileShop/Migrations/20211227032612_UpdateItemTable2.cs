using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MobileShop.Migrations
{
    public partial class UpdateItemTable2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Banner");

            migrationBuilder.AddColumn<bool>(
                name: "OnSale",
                table: "Item",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "PromotionBannerId",
                table: "Item",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<decimal>(
                name: "PromotionPercentage",
                table: "Item",
                type: "decimal(2,1)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.CreateTable(
                name: "PromotionBanner",
                columns: table => new
                {
                    PromotionBannerId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Image = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PromotionPercentageLimit = table.Column<decimal>(type: "decimal(2,1)", nullable: false),
                    PromotionStartDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    PromotionEndDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedDate = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PromotionBanner", x => x.PromotionBannerId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Item_PromotionBannerId",
                table: "Item",
                column: "PromotionBannerId");

            migrationBuilder.AddForeignKey(
                name: "FK_Item_PromotionBanner_PromotionBannerId",
                table: "Item",
                column: "PromotionBannerId",
                principalTable: "PromotionBanner",
                principalColumn: "PromotionBannerId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Item_PromotionBanner_PromotionBannerId",
                table: "Item");

            migrationBuilder.DropTable(
                name: "PromotionBanner");

            migrationBuilder.DropIndex(
                name: "IX_Item_PromotionBannerId",
                table: "Item");

            migrationBuilder.DropColumn(
                name: "OnSale",
                table: "Item");

            migrationBuilder.DropColumn(
                name: "PromotionBannerId",
                table: "Item");

            migrationBuilder.DropColumn(
                name: "PromotionPercentage",
                table: "Item");

            migrationBuilder.CreateTable(
                name: "Banner",
                columns: table => new
                {
                    BannerId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Image = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    UpdatedDate = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Banner", x => x.BannerId);
                });
        }
    }
}
