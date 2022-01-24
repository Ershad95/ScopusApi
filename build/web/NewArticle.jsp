<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URL"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="ershad.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/radioButton.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" type="image/png" href='image/article.png' />
        <script src="js/jq.js"></script>
        <title>مقالات داغ</title>
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
                transition-property: all;
                transition-duration: 500ms;
                border-radius: 10px;
                filter:grayscale(100%);
            }

            td>img,.header>span>a>img{
                filter:grayscale(0%);
            }
            img:hover{
                filter:grayscale(0%);
                transform: scale(1.1,1.1);
            }
            .tbl>tbody>tr{
                transition-duration: 500ms;
                transition-property: all;
            }
            .tbl>tbody>tr:hover{
                color:#fff;
                background: rgba(32,77,116,1);
                transform: scale(1.1,1.1);
                border-radius: 10px;
            }
            .tbl>thead>tr{
                background: rgba(244,67,54,0.7);
            }
            .tbl>tbody>tr>td
            {
                color:rgba(255,255,255,1);
            }
            .tbl>tbody>tr>td>img{
                opacity: .7; 
            }
            .tbl>tbody>tr:nth-child(2n){
                background: rgba(33,150,243,0.7);
            }
            .tbl>tbody>tr:nth-child(2n+1){
                background: rgba(63,81,181,0.7);
            }

            .tbl>tbody>tr:nth-child(2n):hover{
                background: rgba(33,150,243,0.9);
            }
            .tbl>tbody>tr:nth-child(2n+1):hover{
                background: rgba(63,81,181,0.9);
            }
            div>a>img:hover{
                border-bottom: 2px solid #fff;
            }
        </style>
        <script>
            $(document).ready(function () {
                $(window).scroll(function () {
                    var sticky = $('.sticky'),
                            scroll = $(window).scrollTop();
                    if (scroll >= 25) {
                        $("#btnTop").show();
                        sticky.addClass('fixed');
                    } else {
                        sticky.removeClass('fixed');
                        $("#btnTop").hide();
                    }
                    $("#btnTop").click(function () {
                        document.body.scrollTop = 0; // For Chrome, Safari and Opera 
                        document.documentElement.scrollTop = 0; // For IE and Firefox 
                    });
                });
                $('a').click(function () {
                    $(".dialogload").css("display", "block");
                });
            });
        </script>
    </head>
    <body>
        <%@include  file="header.jsp"%>
        <%@include  file="Info.jsp" %>
        <br />
        <br />
        <div>
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
            <table id="tbl" style="margin:10px auto;width:90%;" class="tbl animated fadeInUp">
                <thead>
                    <tr>
                        <th>جزئیات</th>
                        <th>تعداد صفحات</th>
                        <th>موسسه</th>
                        <th>نام ایجاد کننده</th>
                        <th>عنوان مقاله</th>
                        <th>کشور</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        query = "AFFILCOUNTRY(Iran)";
                        String tmp = request.getParameter("c");
                        if (request.getParameter("c") != null) {
                            tmp = tmp.replaceAll(" ", "%20");
                            query = "AFFILCOUNTRY(" + tmp + ")";
                        } else {
                            tmp = "Iran";
                        }
                        Model model= new Model();
                        String url = baseUrl + "query=" + query + token + json;
                        ObjectMapper map = new ObjectMapper();
                        model = map.readValue(new URL(url), Model.class);
                        tmp = tmp.replaceAll("%20", "_");
                        List<ershad.Entry> e = model.getSearchResults().getEntry();
                        if(session.isNew())
                            session.setAttribute("model", e);
                        else
                            session.putValue("model", e);
                        int len = 35;
                        for (ershad.Entry item : e) {
                            int x = item.getDcTitle().length();
                            len = x / 2;
                            if (len >= 60) {
                                len = 40;
                            }
                    %>
                    <tr>
                        <td><a href="<%= "/scopusApi/detailsPage.jsp?id=" + item.getID()%>"><button class="circle" name="btn">جزئیات</button></a></td>
                        <td><%
                            try {
                                String[] str = item.getPrismPageRange().split("-");
                                out.write(str[1] + "از " + str[0] + " تا");
                            } catch (NullPointerException ex) {
                                out.write("مشخص نشده");
                            }
                            %></td>
                        <td><%= item.getAffiliation().get(0).getAffilname()%></td>
                        <td><%= item.getDcCreator()%></td>
                        <td><%= item.getDcTitle().substring(0, len) + "..."%></td>
                        <td> 
                            <img src="flag/<%=tmp + ".png"%>" style="width:50px;border:2px solid #fff;padding: 5px;" />
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <style>
            body{
                background: url("uni/<%= tmp + ".jpg"%>");
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }
            #<%= tmp%>{
                filter:grayscale(0%);
                pointer-events: none;
            }
        </style>
        <%@include  file="footer.jsp"%>
    </body>
</html>
