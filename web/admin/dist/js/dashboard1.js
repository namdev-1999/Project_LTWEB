$(function () {
    "use strict";
    //This is for the Notification top right
    $.toast({
        heading: 'Welcome to Banana Admin'
        , text: 'Use the predefined ones, or specify a custom position object.'
        , position: 'top-right'
        , loaderBg: '#ff6849'
        , icon: 'info'
        , hideAfter: 3500
        , stack: 6
    })
    // ============================================================== 
    // Our Visitor
    // ============================================================== 

    var chart = c3.generate({
        bindto: '#visitor',
        data: {
            columns: [
                ['ADIDAS', document.getElementById('ADIDAS-inmonth').value],
                ['NIKE', document.getElementById('NIKE-inmonth').value],
                ['JORDAN', document.getElementById('JORDAN-inmonth').value],
                ['OTHER', document.getElementById('OTHER-inmonth').value],

            ],

            type: 'donut',
            onclick: function (d, i) {
                console.log("onclick", d, i);
            },
            onmouseover: function (d, i) {
                console.log("onmouseover", d, i);
            },
            onmouseout: function (d, i) {
                console.log("onmouseout", d, i);
            }
        },
        donut: {
            label: {
                show: false
            },
            title: "Visits",
            width: 30,

        },

        legend: {
            hide: true
            //or hide: 'data1'
            //or hide: ['data1', 'data2']
        },
        color: {
            pattern: ['#009efb', '#7460ee', '#f62d51', '#36bea6']
        }
    });
    // ============================================================== 
    // Our Income
    // ==============================================================
    var type1 = eval(document.getElementById("1").value);
    var type2 = eval(document.getElementById("2").value);
    var type3 = eval(document.getElementById("3").value);
    var type4 = eval(document.getElementById("4").value);
    var tong = eval(type1+type2+type3+type4)
    var loiTong = eval((type1 * 0.1) + (type2 * 0.2) + (type3 * 0.3) + (type4 * 0.4));

    var chart = c3.generate({
        bindto: '#income',
        data: {
            columns: [
                ['Doanh thu', tong, type1, type2, type3, type4],
                ['Lợi nhuận', loiTong, type1 * 0.1, type2 * 0.2, type2 * 0.3, type4 * 0.4]
            ],
            type: 'bar'
        },
        bar: {
            space: 0.2,
            // or
            width: 15 // this makes bar width 100px
        },
        axis: {
            y: {
                tick: {
                    count: 5,

                    outer: false
                }
            }
        },
        legend: {
            hide: true
            //or hide: 'data1'
            //or hide: ['data1', 'data2']
        },
        grid: {
            x: {
                show: false
            },
            y: {
                show: true
            }
        },
        size: {
            height: 290
        },
        color: {
            pattern: ['#7460ee', '#009efb']
        }
    });
    // Dashboard 1 Morris-chart
    Morris.Area({
        element: 'morris-area-chart'
        , data: [{
            period: '2010'
            , iphone: 0
            , ipad: 0
            , itouch: 0
        }, {
            period: '2011'
            , iphone: 130
            , ipad: 100
            , itouch: 80
        }, {
            period: '2012'
            , iphone: 80
            , ipad: 60
            , itouch: 70
        }, {
            period: '2013'
            , iphone: 70
            , ipad: 200
            , itouch: 140
        }, {
            period: '2014'
            , iphone: 180
            , ipad: 150
            , itouch: 140
        }, {
            period: '2015'
            , iphone: 105
            , ipad: 100
            , itouch: 80
        }
            , {
                period: '2016'
                , iphone: 250
                , ipad: 150
                , itouch: 200
            }]
        , xkey: 'period'
        , ykeys: ['iphone', 'ipad']
        , labels: ['Nike', 'Yeezy']
        , pointSize: 0
        , fillOpacity: 0
        , pointStrokeColors: ['#f62d51', '#7460ee', '#009efb']
        , behaveLikeLine: true
        , gridLineColor: '#f6f6f6'
        , lineWidth: 1
        , hideHover: 'auto'
        , lineColors: ['#009efb', '#7460ee', '#009efb']
        , resize: true
    });

});
// sparkline
var sparklineLogin = function () {
    $('#sales1').sparkline([1, 4, 5, 4, 5, 6, 6, 7, 5, 7, 5, 4, 3], {
        type: 'line',
        width: '100%',
        height: '75',
        lineColor: '#00bfbf',
        fillColor: '#ecfaf8',
        spotColor: undefined,
        minSpotColor: undefined,
        maxSpotColor: undefined,
        highlightSpotColor: undefined,
        highlightLineColor: '#494646',
        spotRadius: 0
    });

    $('#sales2').sparkline([6, 10, 9, 11, 9, 10, 12], {
        type: 'bar',
        height: '130',
        barWidth: '4',
        width: '100%',
        resize: true,
        barSpacing: '8',
        barColor: '#25a6f7'
    });

};
var sparkResize;

$(window).resize(function (e) {
    clearTimeout(sparkResize);
    sparkResize = setTimeout(sparklineLogin, 500);
});
sparklineLogin();
