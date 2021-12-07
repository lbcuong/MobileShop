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
        } else {
            alert("This browser does not support HTML5 FileReader.");
        }
    });

    $("#multiple-image-input").change(function () {
        if (typeof (FileReader) != "undefined") {
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
});

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

const labels = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
];

const data = {
    labels: labels,
    datasets: [{
        label: 'Sales',
        backgroundColor: 'rgb(18, 165, 214)',
        borderColor: 'rgb(18, 165, 214)',
        data: [10, 5, 2, 3, 4, 7, 15, 16, 20],
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
                    // Include a dollar sign in the ticks
                    callback: function (value, index, values) {
                        return value + '₫';
                    }
                }
            }
        }
    }
};

const labels1 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
];

const data1 = {
    labels: labels1,
    datasets: [{
        label: 'Doanh thu',
        backgroundColor: 'rgb(18, 165, 214)',
        borderColor: 'rgb(18, 165, 214)',
        data: [10, 5, 2, 20],
        pointBackgroundColor: '#007bff',
    }]
};
const config1 = {
    type: 'bar',
    data: data1,
    options: {
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    // Include a dollar sign in the ticks
                    callback: function (value, index, values) {
                        return value + '₫';
                    }
                }
            }
        }
    }
};

var EachMonthRevenueChart = new Chart(
    document.getElementById('EachMonthRevenueChart'),
    config
);

var EachMonthRevenueChart = new Chart(
    document.getElementById('EachYearRevenueChart'),
    config1
);