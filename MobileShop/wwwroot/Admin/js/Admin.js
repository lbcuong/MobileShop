$(document).ready(function () {
    $('.multiple-image-input').on("change", function () {
        var fileLabel = $(this).next('.multiple-image-label');
        var files = $(this)[0].files;
        if (files.length > 1) {
            fileLabel.html(files.length + ' files selected');
        }
        else if (files.length == 1) {
            fileLabel.html(files[0].name);
        }
    });

    $("#image-input").change(function () {
        if (typeof (FileReader) != "undefined") {
            $(".existing-image").hide();
            var dvPreview = $("#imagePreview");
            dvPreview.html("");
            $($(this)[0].files).each(function () {
                var file = $(this);
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = $("<img />");
                    img.attr("style", "width: 15rem; padding: 0.5rem 0.5rem 0.5rem 0");
                    img.attr("src", e.target.result);
                    dvPreview.append(img);
                }
                reader.readAsDataURL(file[0]);
            });
        }
        else {
            alert("This browser does not support HTML5 FileReader.");
        }
    });

    $("#multiple-image-input").change(function () {
        if (typeof (FileReader) != "undefined") {
            $(".existing-multiple-image").hide();
            var dvPreview = $("#multipleImagePreview");
            dvPreview.html("");
            $($(this)[0].files).each(function () {
                var file = $(this);
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = $("<img />");
                    img.attr("style", "width: 15rem; padding: 0.5rem 0.5rem 0.5rem 0");
                    img.attr("src", e.target.result);
                    dvPreview.append(img);
                }
                reader.readAsDataURL(file[0]);
            });
        } else {
            alert("This browser does not support HTML5 FileReader.");
        }
    });

    var message = '@Html.Raw((string)TempData["SuccessMessage"])';
    if (message != null) {
        $(".show-success-message").fadeIn('fast', function () {
            $(".show-success-message").delay(5000).fadeOut('slow');
        });
    }
});

function CalculateTotal() {
    var importPrice = document.getElementsByClassName('import-price');
    document.getElementsByClassName('import-price').value = importPrice.toLocaleString();
    var total = 0;
    var i;
    for (i = 0; i < importPrice.length; i++) {
        total = total + eval(importPrice[i].value);
    }

    document.getElementById('total').value = total.toLocaleString();

    return;
}

document.addEventListener('change', function (event) {
    if (event.target.classList.contains('import-price')) {
        CalculateTotal();
    }
}, false);

function DeleteItem(btn) {
    var table = document.getElementById('purchaseOrderDetail');
    var rows = table.getElementsByTagName('tr');

    if (rows.length == 2) {
        return;
    }

    $(btn).closest('tr').remove();

    CalculateTotal();
}

function AddItem(btn) {
    var table = document.getElementById('purchaseOrderDetail');
    var rows = table.getElementsByTagName('tr');

    var rowOuterHtml = rows[rows.length - 1].outerHTML;

    var lastrowIdx = rows.length - 2;
    var nextrowIdx = eval(lastrowIdx) + 1;

    rowOuterHtml = rowOuterHtml.replaceAll('_' + lastrowIdx + '_', '_' + nextrowIdx + '_');
    rowOuterHtml = rowOuterHtml.replaceAll('[' + lastrowIdx + ']', '[' + nextrowIdx + ']');
    rowOuterHtml = rowOuterHtml.replaceAll('-' + lastrowIdx, '-' + nextrowIdx);

    var newRow = table.insertRow();
    newRow.innerHTML = rowOuterHtml;
}

ClassicEditor
    .create(document.querySelector('#detail'), {
        // toolbar: [ 'heading', '|', 'bold', 'italic', 'link' ]

        ckfinder: { uploadUrl: '/lib/images/News/' }
    })
    .then(editor => {
        window.editor = editor;
    })
    .catch(err => {
        console.error(err.stack);
    });

// items Sold Total Chart
$(function () {
    var labels = itemsSoldTotalChart_labels;
    var datas = itemsSoldTotalChart_datas;
    var labelsArray = new Array();
    var dataArray = new Array();
    var colorArray = new Array();
    for (var i = 0; i < labels.split(',').length; i++) {
        labelsArray.push(labels.split(',')[i]);
        dataArray.push(datas.split(',')[i]);
        colorArray.push(getRandomColor());
    }

    new Chart(document.getElementById("itemsSoldTotalChart").getContext('2d'), {
        type: 'pie',
        data: {
            labels: labelsArray,
            datasets: [{
                backgroundColor: colorArray,
                data: dataArray
            }]
        },
        options: {
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
});

// items Sold Yesterday Chart
$(function () {
    var labels = itemsSoldYesterdayChart_labels;
    var datas = itemsSoldYesterdayChart_datas;
    var labelsArray = new Array();
    var dataArray = new Array();
    var colorArray = new Array();
    for (var i = 0; i < labels.split(',').length; i++) {
        labelsArray.push(labels.split(',')[i]);
        dataArray.push(datas.split(',')[i]);
        colorArray.push(getRandomColor());
    }

    new Chart(document.getElementById("itemsSoldYesterdayChart").getContext('2d'), {
        type: 'pie',
        data: {
            labels: labelsArray,
            datasets: [{
                backgroundColor: colorArray,
                data: dataArray
            }]
        },
        options: {
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
});

function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}



const labels = [
    'Jan',
    'Fer',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
];

const data = {
    labels: labels,
    datasets: [{
        label: 'Sales',
        backgroundColor: 'rgb(18, 165, 214)',
        borderColor: 'rgb(18, 165, 214)',
        data: [1000000000, 4000000000, 5000000000, 4000000000, 7000000000, 7000000000, 15000000000, 16000000000, 20000000000, 25000000000, 30000000000, 29000000000],
        pointBackgroundColor: 'lightgray',
        tension: 0.1
    }]
};

const config = {
    type: 'line',
    data: data,
    options: {
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                        font: {
                            size: 15,
                        },
                    // Include a dollar sign in the ticks
                    callback: function (value, index, values) {
                        if (parseInt(value) >= 1000) {
                            return '₫ ' + value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        }
                        else
                        {
                            return '₫ ' + value;
                        }
                    }
                }
            }
        }
    }
};

var EachMonthRevenueChart = new Chart(
    document.getElementById('YearSalesChart'),
    config
);