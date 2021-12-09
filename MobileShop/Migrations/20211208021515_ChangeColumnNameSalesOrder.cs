using Microsoft.EntityFrameworkCore.Migrations;

namespace MobileShop.Migrations
{
    public partial class ChangeColumnNameSalesOrder : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SalesOrderDetail_SalesOrder_OrderId",
                table: "SalesOrderDetail");

            migrationBuilder.RenameColumn(
                name: "OrderId",
                table: "SalesOrderDetail",
                newName: "SalesOrderId");

            migrationBuilder.RenameColumn(
                name: "OrderDetailId",
                table: "SalesOrderDetail",
                newName: "SalesOrderDetailId");

            migrationBuilder.RenameIndex(
                name: "IX_SalesOrderDetail_OrderId",
                table: "SalesOrderDetail",
                newName: "IX_SalesOrderDetail_SalesOrderId");

            migrationBuilder.RenameColumn(
                name: "OrderId",
                table: "SalesOrder",
                newName: "SalesOrderId");

            migrationBuilder.AddForeignKey(
                name: "FK_SalesOrderDetail_SalesOrder_SalesOrderId",
                table: "SalesOrderDetail",
                column: "SalesOrderId",
                principalTable: "SalesOrder",
                principalColumn: "SalesOrderId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SalesOrderDetail_SalesOrder_SalesOrderId",
                table: "SalesOrderDetail");

            migrationBuilder.RenameColumn(
                name: "SalesOrderId",
                table: "SalesOrderDetail",
                newName: "OrderId");

            migrationBuilder.RenameColumn(
                name: "SalesOrderDetailId",
                table: "SalesOrderDetail",
                newName: "OrderDetailId");

            migrationBuilder.RenameIndex(
                name: "IX_SalesOrderDetail_SalesOrderId",
                table: "SalesOrderDetail",
                newName: "IX_SalesOrderDetail_OrderId");

            migrationBuilder.RenameColumn(
                name: "SalesOrderId",
                table: "SalesOrder",
                newName: "OrderId");

            migrationBuilder.AddForeignKey(
                name: "FK_SalesOrderDetail_SalesOrder_OrderId",
                table: "SalesOrderDetail",
                column: "OrderId",
                principalTable: "SalesOrder",
                principalColumn: "OrderId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
