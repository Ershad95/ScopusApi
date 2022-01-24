<%@page import="ershad.DateItem"%>
<%@page import="ershad.Model"%>
<%@page import="java.net.URL"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/jq.js" type="text/javascript"></script>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>بررسی مقالات</title>
        <style>
            img{
                border-radius: 10px;
                filter:grayscale(100%);
            }
            img:hover{
                transform: scale(1.1,1.1);
                transition-duration: 500ms;
            }
            body
            {
                background: url(image/back.jpg)
            }
            div>a>img{
                border:3px solid white;
                padding:3px;
            }
        </style>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <%@include file="Info.jsp" %>
        <div style="margin:0 auto;text-align: center;">
            <a href="?c=Germany">
                <img id="Germany" src="flag/Germany.png"  style="width:130px;margin:20px;"/>
            </a>
            <a href="?c=Iran">
                <img id="Iran" src="flag/Iran.png" style="width:130px;margin:20px;"/>
            </a>
            <a href="?c=Sweden">
                <img id="Sweden" src="flag/Sweden.png" style="width:130px;margin:20px;"/>
            </a>
            <a href="?c=United%20Kingdom">
                <img id="United_Kingdom" src="flag/United_Kingdom.png" style="width:130px;margin:20px;"/>
            </a>
            <a href="?c=Spain">
                <img id="Spain"  src="flag/Spain.png" style="width:130px;margin:20px;"/>
            </a>
        </div>

        <div align="center"  style="width:90%;height: 500px;color:#000;margin:10px auto;border-radius: 10px;">
            <canvas id="chart"></canvas>
        </div>
        <%            query = "AFFILCOUNTRY(Iran)";
            String tmp = request.getParameter("c");
            if (request.getParameter("c") != null) {
                tmp = tmp.replaceAll(" ", "%20");
                query = "AFFILCOUNTRY(" + tmp + ")";
            } else {
                tmp = "Iran";
            }

            DateItem[] items = new DateItem[10];
            int year = 1999;
            for (int index = 0; index < items.length; index++) {
                items[index] = new DateItem("http://api.elsevier.com/content/search/scopus?query=" + query + "&apiKey=a1e36891226b10bb028be191604f3f3a&httpAccept=application/json&Date=" + year);
                items[index].start();
                year += 2;
            }%>


        <% Thread.sleep(15000);%>
        <%@include file="footer.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
        <script src="js/zoomChartJs.js" type="text/javascript"></script>
        <script>
            var p1 = <%= items[0].getResult()%>
            var p2 = <%= items[1].getResult()%>
            var p3 = <%= items[2].getResult()%>
            var p4 = <%= items[3].getResult()%>
            var p5 = <%= items[4].getResult()%>
            var p6 = <%= items[5].getResult()%>
            var p7 = <%= items[6].getResult()%>
            var p8 = <%= items[7].getResult()%>
            var p9 = <%= items[8].getResult()%>
            var p10 =<%= items[9].getResult()%>
            var ctx = document.getElementById("chart").getContext('2d');
            $('a').click(function () {
                $(".dialogload").css("display", "block");
            });
            var mixedChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    datasets: [{
                            label: 'تعداد مقالات در سال',
                            data: [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10],
                            backgroundColor: [
                                '#FF5252',
                                '#64FFDA',
                                '#2196F3',
                                '#FF5722',
                                '#00E676',
                                '#BA68C8',
                                '#EC407A',
                                '#2196F3',
                                '#64FFDA',
                                '#C6FF00'
                            ],
                            borderColor: [
                                'rgba(0,0,0,1)',
                                'rgba(0, 0, 0, 1)',
                                'rgba(0, 0, 0, 1)',
                                'rgba(0, 0, 0, 1)',
                                'rgba(0, 0, 0, 1)',
                                'rgba(0, 0, 0, 1)',
                                'rgba(0,0,0,1)',
                                'rgba(0, 0, 0, 1)',
                                'rgba(0, 0, 0, 1)',
                                'rgba(0, 0, 0, 1)',
                                'rgba(0, 0, 0, 1)',
                                'rgba(0, 0, 0, 1)'
                            ],
                            borderWidth: 2
                        }, {
                            label: 'نمودار خطی',
                            data: [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10],
                            borderColor: [
                                'rgba(255,255,255,1)'
                            ],
                            type: 'line'
                        }],
                    labels: ['1999', '2001', '2003', '2005', '2007', '2009', '2011', '2013', '2015', '2017']
                },
                options: {
                    tooltips: {
                        mode: 'nearest'
                    },
                    pan: {
                        enabled: true,
                        mode: 'xy'
                    },
                    zoom: {
                        enabled: true,
                        mode: 'xy'
                    },
                    responsiveAnimationDuration: 1,
                    responsive: true,
                    maintainAspectRatio: false,
                    layout: {
                        padding: {
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10
                        }
                    },
                    scales: {
                        yAxes: [{
                                gridLines: {
                                    color: "rgba(255, 255, 255, 0.7)",
                                    zeroLineColor: "rgba(255, 255, 255, 1)",
                                    zeroLineWidth: 3
                                },
                                ticks: {
                                    beginAtZero: true,
                                    fontColor: 'white',
                                    fontSize: 20,
                                    fontFamily: 'er'
                                }
                            }],
                        xAxes: [{
                                gridLines: {
                                    zeroLineColor: "rgba(255, 255, 255, 1)",
                                    zeroLineWidth: 3
                                },
                                ticks: {
                                    fontColor: 'white',
                                    fontSize: 20,
                                    fontFamily: 'er'
                                }}]
                    }
                }
            });
        </script>
        <style>
            <%
                tmp = tmp.replaceAll("%20", "_");
            %>
            #<%= tmp%>{
                border : 5px solid #C6FF00;
                filter:grayscale(0%);
                pointer-events: none;
            }
        </style>
    </body>
</html>
