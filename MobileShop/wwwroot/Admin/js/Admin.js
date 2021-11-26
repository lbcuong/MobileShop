$(document).ready(function () {

    $("#show-hide").click(function () {
        $(".sidebar").toggle();
    });
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
        label: 'Doanh thu',
        backgroundColor: 'rgb(18, 165, 214)',
        borderColor: 'rgb(18, 165, 214)',
        data: [10, 5, 2, 20],
        pointBackgroundColor: '#007bff',
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