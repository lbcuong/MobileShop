$(document).ready(function () {
    // Send data to AddToCart() function
    $(".addtocart").click(function (event) {
        event.preventDefault();
        var itemId = $(this).attr("data-itemId");
        var quantity = $("#quantity-" + itemId).val();
        var categoryURL = $(this).attr("data-categoryURL");
        $.ajax({
            type: "POST",
            dataType: 'JSON',
            contentType: "application/x-www-form-urlencoded",
            url: "/Cart/AddToCart",
            data: {
                itemId: itemId,
                quantity: quantity,
                categoryURL: categoryURL
            },
            success: function (response) {
                window.location.href = response.redirectToUrl;

            }
        });
    });

    $(".updatecartitem").click(function (event) {
        event.preventDefault();
        var itemId = $(this).attr("data-itemId");
        var maxQuantity = $(this).data("max");
        var minQuantity = $(this).data("min");
        var quantity = +$("#quantity-" + itemId).val();
        if ($(this).hasClass("plus-cart")) {
            if (quantity < maxQuantity) {
                quantity = +$("#quantity-" + itemId).val() + 1;
            }
            else {
                $(this).hasClass("plus-cart").prop("disabled", true);
            }
        }
        if ($(this).hasClass("minus-cart")) {
            if (quantity > minQuantity) {
                quantity = +$("#quantity-" + itemId).val() - 1;
            }
            else {
                $(this).hasClass("minus-cart").prop("disabled", true);
            }
        }
        $.ajax({
            type: "POST",
            dataType: 'JSON',
            contentType: "application/x-www-form-urlencoded",
            url: "/Cart/UpdateCart",
            data: {
                itemId: itemId,
                Quantity: quantity
            },
            success: function (response) {
                window.location.href = response.redirectToUrl;
            }
        });
    });


    $("#minus").prop("disabled", true);
    // Plus button
    $("#plus").on('click', function () {
        if ($(".quantity-control").val() < $(this).data("max")) {
            $(".quantity-control").val(Number($(".quantity-control").val()) + 1);
        }

        if ($(".quantity-control").val() > $(this).data("min")) {
            $("#minus").prop("disabled", true);
        }
        else {
            $("#minus").prop("disabled", false);
        }

        if ($(".quantity-control").val() < $(this).data("max")) {
            $("#plus").prop("disabled", false);
        }
        else {
            $("#plus").prop("disabled", true);
        }
    });

    // Minus button
    $("#minus").on('click', function () {
        if ($(".quantity-control").val() > $(this).data("min")) {
            $(".quantity-control").val(Number($(".quantity-control").val()) - 1);
        }

        if ($(".quantity-control").val() > $(this).data("min")) {
            $("#minus").prop("disabled", false);
        }
        else {
            $("#minus").prop("disabled", true);
        }

        if ($(".quantity-control").val() >= $(this).data("max")) {
            $("#plus").prop("disabled", true);
        }
        else {
            $("#plus").prop("disabled", false);
        }
    });


    $('.quantity-control').keyup(function () {
        if ($(".quantity-control").val() == $("#minus").data("min")) {
            $("#minus").prop("disabled", true);
        }
        else {
            $("#minus").prop("disabled", false);
        }

        if ($(".quantity-control").val() == $("#plus").data("max")) {
            $("#plus").prop("disabled", true);
        }
        else {
            $("#plus").prop("disabled", false);
        }
    });

    // Plus button in cart
    $(".plus-cart").click(function () {
        if ($(this).prev().val() < $(this).data("max")) {
            $(this).prev().val(+$(this).prev().val() + 1);
        }
    });

    // Minus button in cart
    $(".minus-cart").click(function () {
        if ($(this).next().val() > $(this).data("min")) {
            $(this).next().val(+$(this).next().val() - 1);
        }
    });

    $(function () {
        $("#SearchString").autocomplete({
            source: function (request, response) {
                $.ajax({
                    type: "POST",
                    dataType: 'JSON',
                    contentType: "application/x-www-form-urlencoded",
                    url: "/Home/AutoComplete",
                    data: { "prefix": request.term },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return item;
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $("#SearchString").val(i.item.val);
            },
            minLength: 1
        });
    });

    // Star Rating
    $(function () {

        $("#rateYo").rateYo({
            rating: 0,
            numStars: 5,
            maxValue: 5,
            fullStar: true,
            onChange: function (rating, rateYoInstance) {
                $('#rating').val(rating);
            }
        });

    });

    $(".rating").each(function () {
        var ratingId = parseInt($(this).attr("data-rating"));
        var rating = $(this).attr("data-rate");

        $('#' + ratingId).rateYo({
            rating: rating,
            readOnly: true,
            starWidth: "20px"
        });
    });

    $(".average-rating").each(function () {
        var rating = $(this).attr("data-rate");

        $('#average-rating').rateYo({
            rating: rating,
            readOnly: true
        });
    });

    $(".commentBox").each(function (e) {
        $(this).keypress(function (e) {
            if (e.which === 13 && !e.shiftKey) {
                e.preventDefault();

                $(this).closest("form").submit();
            }
        });
    });

    $(".comment-box-expand").click(function (e) {
        e.preventDefault();
        var rating = $(this).attr("data-expand");
        $("#commentbox-" + rating).show();
    });


    $('.form-quantity').keypress(function (event) {
        var txt = String.fromCharCode(event.which);
        if (!txt.match(/[0-9]/)) {
            return false;
        }
    });

    $('.form-quantity').on('input', function () {

        var max = $(this).data("max");
        var value = $(this).val();

        if ((value !== '') && (value.indexOf('.') === -1)) {

            $(this).val(Math.max(Math.min(value, max), 1));
        }
    });

    var message = '@Html.Raw((string)TempData["SuccessMessage"])';
    if (message != null) {
        $(".show-success-message").fadeIn('fast', function () {
            $(".show-success-message").delay(5000).fadeOut('slow');
        });
    }

    initializeStatistics();
});

function initializeStatistics() {
    if (ratings.length === 0) {
        console.log("There are no ratings");
        return;
    }
    // convert ratings to stars
    var stars = {
        1: [],
        2: [],
        3: [],
        4: [],
        5: []
    };
    // add the ratings to its respective star array
    ratings.forEach(function (rate) {
        var star = getStarFromScore(rate);
        stars[star].push(rate)
    })

    // Find largest star in scope 1-5 star
    var largestRate = 0;
    for (var i = 1; i <= 5; i++) {
        if (stars[i].length > largestRate) {
            largestRate = stars[i].length
        }
    }

    // we know there will always be 5 stars / bars
    for (var i = 1; i <= 5; i++) {
        var bar = $(".bar-" + i);
        var desc = $("#desc" + i);
        var width = stars[i].length / largestRate;
        bar.width((width * 100) + "%");
        desc.html(stars[i].length)
    }

    function getStarFromScore(score) {
        switch (true) {
            case (score == 1):
                return 1;
            case (score == 2):
                return 2;
            case (score == 3):
                return 3;
            case (score == 4):
                return 4;
            default:
                return 5;
        }
    }
}

function changeImage(element) {

    var main_item_image = document.getElementById('main-item-image');
    main_item_image.src = element.src;
}
