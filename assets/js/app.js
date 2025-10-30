$(document).ready(function() {
    // Configuration des couleurs
    const colors = {
        primari: '#44f28f',
        secondari: '#5ce5f4',
        accent: '#44f2ca'
    };

    // Graphique des secteurs
    var secteurChart = new ApexCharts(document.querySelector("#chartSecteurs"), {
        series: [{
            name: '2024',
            data: [5.3, -3.3, 5.0]
        }, {
            name: '2025', 
            data: [7.8, 3.4, 5.4]
        }],
        chart: {
            type: 'bar',
            height: 350
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '55%',
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        xaxis: {
            categories: ['Secteur primaire', 'Secteur secondaire', 'Secteur tertiaire'],
        },
        yaxis: {
            title: {
                text: 'Taux de croissance (%)'
            }
        },
        fill: {
            opacity: 1,
            colors: [colors.primari, colors.secondari]
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return val + "%"
                }
            }
        }
    });
    secteurChart.render();

    // Graphique des recettes
    var recetteChart = new ApexCharts(document.querySelector("#chartRecettes"), {
        series: [{
            name: 'Impôts',
            data: [4636.5, 5928.4]
        }, {
            name: 'Douanes',
            data: [3768.0, 4366.0]
        }, {
            name: 'Recettes non fiscales',
            data: [345.9, 491.7]
        }, {
            name: 'Dons',
            data: [1086.3, 2478.6]
        }],
        chart: {
            type: 'bar',
            height: 350,
            stacked: true,
        },
        plotOptions: {
            bar: {
                horizontal: false,
            },
        },
        xaxis: {
            categories: ['2024', '2025'],
        },
        fill: {
            opacity: 1,
            colors: [colors.primari, colors.secondari, colors.accent, '#ff6b6b']
        },
        legend: {
            position: 'top',
        },
        yaxis: {
            title: {
                text: 'Milliards d\'Ariary'
            }
        }
    });
    recetteChart.render();

    // Initialisation des DataTables
    $('.table').DataTable({
        responsive: true,
        language: {
            url: '//cdn.datatables.net/plug-ins/1.10.25/i18n/French.json'
        }
    });
});