using Microsoft.EntityFrameworkCore.Migrations;

namespace MobileShop.Migrations
{
    public partial class UpdateSalesOrderDetailTable2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "SalesPrice",
                table: "SalesOrderDetail",
                type: "decimal(15,0)",
                nullable: false,
                defaultValue: 0m);
        }
        protected override void Down(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.DropColumn(
                name: "SalesPrice",
                table: "SalesOrderDetail");
        }
    }
}
