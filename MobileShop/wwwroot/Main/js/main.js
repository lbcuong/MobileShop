$(document).ready(function () {
    $(".updatecartitem").click(function (event) {
        event.preventDefault();
        var productid = $(this).attr("data-productid");
        var quantity = $("#quantity-" + productid).val();
        $.ajax({
            type: "POST",
            dataType: 'JSON',
            contentType: "application/x-www-form-urlencoded",
            url: "@Url.Action('UpdateCart', 'MobilePhones')",
            data: {
                itemId: productid,
                Quantity: quantity
            },
            success: function (response) {
                window.location.href = response.redirectToUrl;
            }
        });
    });
});
