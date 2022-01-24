<%@page import="java.text.DecimalFormat"%>
<%@page import="java.net.URL"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="ershad.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            *:focus{
                outline: none;
            }
            select{
                font-family: er;
                color:#000;
                width:200px;
                height:40px;
                border-radius: 5px;
                font-size: medium;
            }
            img{
                border-radius: 10px;
            }
            body{
                background: url(image/back.jpg);
            }
        </style>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jq.js" type="text/javascript"></script>
        <title>مقایسه کشورها</title>
    </head>
    <body>
        <style>
            body{
                font-family: er;
                color:#000;
            }
        </style>
        <%@include file="header.jsp" %>
        <br />
        <br />
        <form style="text-align: center;direction: rtl;" method="POST" action="compare.jsp">
            <div style="box-shadow: 0px 10px 20px 0px gray;" class="box" >
                <div class="fa fa-2x fa-map-marker"></div>
                <p>کشور اول</p>
                <select name="c1">
                    <option value="">کشور مورد نظر را انتخاب کنید</option>
                    <option value="Iran">ایران</option>
                    <option value="Spain">اسپانیا</option>
                    <option value="Sweden">سوئد</option>
                    <option value="France">فرانسه</option>
                    <option value="Germany">آلمان</option>
                    <option value="Russia">روسیه</option>
                    <option value="Canada">کانادا</option>
                </select>
            </div>
            <div style="box-shadow: 0px 10px 20px 0px gray;" class="box" >
                <div class="fa fa-2x fa-map-marker"></div>
                <p>کشور دوم</p>
                <select name="c2">
                    <option value="">کشور مورد نظر را انتخاب کنید</option>
                    <option value="Iran">ایران</option>
                    <option value="Spain">اسپانیا</option>
                    <option value="Sweden">سوئد</option>
                    <option value="France">فرانسه</option>
                    <option value="Germany">آلمان</option>
                    <option value="Russia">روسیه</option>
                    <option value="Canada">کانادا</option>
                </select>
            </div>
            <div>
                <button type="submit" id="btnCompare" class="circle" style="background : #4CAF50;color:#fff;">مقایسه</button>
            </div>
            <div style="margin:20px auto;border: 5px solid #eee;border-top: 5px solid #4CAF50;display: none;" class="loader"></div>
        </form>
        <%@include  file="Info.jsp" %>
        <%
            String c1 = request.getParameter("c1");
            String c2 = request.getParameter("c2");
            if (request.getMethod() == "POST") {
                if (c1.isEmpty() || c2.isEmpty()) {

                } else {
                    String name1 = null;
                    String name2 = null;

                    String img1 = "";
                    String img2 = "";

                    String Color1 = "";
                    String Color2 = "";
                    
                    Model m1 = null;
                    Model m2 = null;
                    
                    ObjectMapper map = new ObjectMapper();
                    query = "AFFILCOUNTRY(" + c1 + ")";
                    m1 = map.readValue(new URL(baseUrl + "query=" + query + token + json), Model.class);
                    String count1 = m1.getSearchResults().getOpensearchTotalResults();
                    query = "AFFILCOUNTRY(" + c2 + ")";
                    m2 = map.readValue(new URL(baseUrl + "query=" + query + token + json), Model.class);
                    String count2 = m2.getSearchResults().getOpensearchTotalResults();

                    if (Integer.valueOf(count1) > Integer.valueOf(count2)) {
                        Color1 = "#004D40";
                        Color2 = "#F44336";

                    } else if (Integer.valueOf(count1) < Integer.valueOf(count2)) {
                        Color2 = "#004D40";
                        Color1 = "#F44336";

                    } else if (Integer.valueOf(count1) == Integer.valueOf(count2)) {
                        Color1 = Color2 = "orange";
                    }
                    DecimalFormat df = new DecimalFormat("###,###,###");
                    count1 = df.format(Integer.parseInt(String.valueOf(count1)));
                    count2 = df.format(Integer.parseInt(String.valueOf(count2)));
                    
                    if (c1.equals("Iran")) {
                        name1 = "ایران";
                        img1 = "image/ir.png";
                    }else if (c1.equals("Germany")) {
                        name1 = "آلمان";
                        img1 = "image/ge.png";
                    }
                    else if (c1.equals("Sweden")) {
                        name1 = "سوئد";
                        img1 = "image/se.png";
                    }
                    else if (c1.equals("France")) {
                        name1 = "فرانسه";
                        img1 = "image/fr.png";
                    }
                    else if (c1.equals("Russia")) {
                        name1 = "روسیه";
                        img1 = "image/ru.png";
                    }
                    else if (c1.equals("Spain")) {
                        name1 = "اسپانیا";
                        img1 = "image/es.png";
                    }
                    else if (c1.equals("Canada")) {
                        name1 = "کانادا";
                        img1 = "image/ca.png";
                    }
                    if (c2.equals("Iran")) {
                        name2 = "ایران";
                        img2 = "image/ir.png";
                    }
                    else if (c2.equals("Germany")) {
                        name2 = "آلمان";
                        img2 = "image/ge.png";
                    }
                    else if (c2.equals("Sweden")) {
                        name2 = "سوئد";
                        img2 = "image/se.png";
                    }
                    else if (c2.equals("France")) {
                        name2 = "فرانسه";
                        img2 = "image/fr.png";
                    }
                    else if (c2.equals("Russia")) {
                        name2 = "روسیه";
                        img2 = "image/ru.png";
                    }
                    else if (c2.equals("Spain")) {
                        name2 = "اسپانیا";
                        img2 = "image/es.png";
                    }
                    else if (c2.equals("Canada")) {
                        name2 = "کانادا";
                        img2 = "image/ca.png";
                    }
        %>
        <div id="result" class="animated bounceInRight" style="text-align: center">
            <div class="box" style="width:300px;direction: rtl;background:<%= Color2%>;box-shadow: 0px 10px 20px 0px gray;">
                <div 
                    style="position: relative;
                    top:0px;
                    left:0px;
                    border-radius: 100%;
                    width:60px;
                    height: 60px;
                    border:2px solid #fff;
                    box-shadow: 0px 6px 10px 0px gray;
                    ">
                    <img src="<%= img2%>" style="width:45px;padding-top: 18px;">
                </div>
                <h2><%= name2%></h2>
                <hr>
                <h2><%= count2%></h2>
            </div>
            <div class="box" style="width:300px;direction: rtl;background: <%= Color1%>;box-shadow: 0px 10px 20px 0px gray;">
                <div 
                    style="position: relative;
                    top:0px;             
                    left:0px;
                    border-radius: 100%;
                    width:60px;
                    height: 60px;
                    border:2px solid #fff;
                    box-shadow: 0px 6px 10px 0px gray;
                    ">
                    <img src="<%= img1%>" style="width:45px;padding-top: 18px;">
                </div>
                <h2><%= name1%></h2>
                <hr>
                <h2><%= count1%></h2>
            </div>

        </div>
        <%
                }
            }
        %>
        <script>
            $(document).ready(function () {
                $('a').click(function () {
                    $(".dialogload").css("display", "block");
                });
                $('#btnCompare').click(function () {
                    $(".dialogload").css("display", "block");
                });
            });
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
