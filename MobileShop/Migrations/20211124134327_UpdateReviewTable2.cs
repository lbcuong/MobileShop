using Microsoft.EntityFrameworkCore.Migrations;

namespace MobileShop.Migrations
{
    public partial class UpdateReviewTable2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Rating_ItemImages_ItemImageId",
                table: "Rating");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Rating",
                table: "Rating");

            migrationBuilder.RenameTable(
                name: "Rating",
                newName: "Review");

            migrationBuilder.RenameIndex(
                name: "IX_Rating_ItemImageId",
                table: "Review",
                newName: "IX_Review_ItemImageId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Review",
                table: "Review",
                column: "ReviewId");

            migrationBuilder.AddForeignKey(
                name: "FK_Review_ItemImages_ItemImageId",
                table: "Review",
                column: "ItemImageId",
                principalTable: "ItemImages",
                principalColumn: "ItemImageId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Review_ItemImages_ItemImageId",
                table: "Review");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Review",
                table: "Review");

            migrationBuilder.RenameTable(
                name: "Review",
                newName: "Rating");

            migrationBuilder.RenameIndex(
                name: "IX_Review_ItemImageId",
                table: "Rating",
                newName: "IX_Rating_ItemImageId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Rating",
                table: "Rating",
                column: "ReviewId");

            migrationBuilder.AddForeignKey(
                name: "FK_Rating_ItemImages_ItemImageId",
                table: "Rating",
                column: "ItemImageId",
                principalTable: "ItemImages",
                principalColumn: "ItemImageId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
