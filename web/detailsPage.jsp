<%@page import="org.codehaus.jackson.JsonGenerator"%>
<%@page import="java.io.Writer"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URL"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="ershad.Model"%>
<%@page import="ershad.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isErrorPage="true"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style_details.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/animate.css" rel="stylesheet" type="text/css"/>
        <title>جزئیات</title>
        <style>
            body{
                background: url(image/back.jpg);
            }
            .showMenu{
                display: block;
                width:230px;
                transition-duration: 500ms;
                transition-property: all;
            }
            .hideMenu{
                width:0px;
                transition-duration: 500ms;
                transition-property: all;
            }
        </style>
    </head>
    <%@include  file="Info.jsp" %>
    <%@include file="Loading.jsp" %>
    <%       
        List<ershad.Entry> model = (List<ershad.Entry>) session.getAttribute("model");
        ObjectMapper mapper = new ObjectMapper();
        
        String parameter = request.getParameter("id");
        boolean conf = false;
        String q = "";
        if (request.getParameter("conf") != null) {
            if (request.getParameter("conf").equals("1")) {
                conf = true;
            }
        }
        String identity = "";
        ershad.Entry i = new Entry();
        if (parameter != null) {
            int id = Integer.valueOf(parameter);
            if (id >= 1 && id <= 25) {
                ObjectMapper map = new ObjectMapper();
                try {
                    if (model == null || model.size() == 0) {
                        response.sendRedirect("Error.jsp");
                    }
                    int lo = 0;
                    int hi = model.size() - 1;

                    while (lo <= hi) {
                        int mid = lo + (hi - lo) / 2;
                        if (id < model.get(mid).getID()) {
                            hi = mid - 1;
                        } else if (id > model.get(mid).getID()) {
                            lo = mid + 1;
                        } else {
                            i = model.get(mid);
                            String[] str = model.get(0).getDcIdentifier().split(":");
                            identity = str[1];
                            break;
                        }
                    }
                } catch (NullPointerException nullPointer) {
                    response.sendRedirect("/scopusApi/Error404.jsp");
                }
            }
        } else {
            response.sendRedirect("/scopusApi/Error.jsp");
        }
    %>
    <body>
        <div class="container-fluid">
            <div id="baseMenu" style="position: fixed;top: 10px;right: 0px;background: #3F51B5;width:50px;text-align: center;border-bottom-left-radius: 10px;border-top-left-radius: 10px;color: #fff;">
                <i class="fa fa-2x fa-navicon" aria-hidden="true" style="margin: 0px;line-height: 40px;position: static"></i>
            </div>
            <div class="row" >
                <div id="menu"  class="header hidden-sm hidden-xs hideMenu" >
                    <div style="margin-right:10px;line-height:40px;" id="toggle">بازگشت <span class="fa fa-2x fa-chevron-right"></span></div>
                    <a href="/scopusApi/index.jsp">خانه <span class="fa fa-2x fa-home"></span></a>
                    <a href="/scopusApi/search.jsp">جستجو<span class="fa fa-2x fa-search"></span></a>
                    <a href="/scopusApi/compare.jsp">مقایسه کشورها  <span class="fa fa-2x fa-globe"></span></a>
                    <a href="/scopusApi/NewArticle.jsp">مقالات داغ <span class="fa fa-star"></span><span class="fa fa-2x fa-star"></span><span class="fa  fa-star"></span></a>
                    <a href="/scopusApi/Confrance.jsp">کنفرانس ها <span class="fa fa-2x fa-group"></span></a>
                    <a href="/scopusApi/Date.jsp">بررسی انتشار مقالات <span class="fa fa-2x fa-file"></span></a>
                    <a href="#">درباره ی ما <span class="fa fa-2x fa-info-circle"></span></a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10 col-md-offset-0 col-lg-10 col-xs-10 col-sm-10">

                    <h3  style="padding:20px;"class="title"><%
                        if (!conf) {
                            out.write("جزئیات بیشتر مقاله با شناسه");
                        } else {
                            out.write("جزئیات بیشتر کنفرانس  با شناسه");
                        }
                        %> 
                        <%= identity%>
                        <div style="font-size: 15px;position: absolute;top:10px;left:50px;border-radius: 100%;text-align: center;background: red;width:auto;height:auto;border:2px solid red;z-index: 9999;">
                            <p style="padding:10px;">
                                <%= i.getSubtype()%>
                            </p>
                        </div>
                    </h3>
                    <div class="p1">
                        <div id="header" style="font-size: 16px;">
                            <h4>عنوان</h4> 
                        </div>
                        <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                        <div id="body"> 
                            <%= i.getDcTitle()%>
                        </div>
                        <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                        <div id="footer">
                            <a href="<%= i.getLink().get(2).getHref()%>">
                                <div style="background: #F44336;" class="circle">مرجع</div>
                            </a>
                        </div>
                    </div>
                    <div class="row animated fadeInUp">
                        <div id="panel-side" class="col-md-12 col-sm-12 col-lg-12">
                            <div class="col-md-3 col-lg-3">
                                <div class="p1">
                                    <div  class="circle hidden-xs">1</div>
                                    <div id="header">
                                        <p dir="ltr">شناسه Scoupuse</p> 
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body">
                                        <%= i.getDcIdentifier()%>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-id-badge fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">
                                <div class="p1">
                                    <div align="center" class="circle hidden-xs">2</div>
                                    <div id="header">
                                        نویسنده مقاله
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body"> 
                                        <%= i.getDcCreator()%>
                                        <% q += "AUTHOR-NAME(" + i.getDcCreator() + ")";
                                            if (i.getDcCreator() != null) {
                                                q = q.replaceAll(" ", ",");
                                            }
                                        %>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-user-o fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">

                                <div class="p1">
                                    <div align="center" class="circle hidden-xs">3</div>
                                    <div id="header">
                                        رنج تعداد صفحات
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body"> 
                                        <%
                                            try {
                                                String[] str = i.getPrismPageRange().split("-");
                                                out.write(str[1] + "از " + str[0] + " تا");
                                            } catch (NullPointerException ex) {
                                                out.write("مشخص نشده");
                                            }
                                        %>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-file fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">

                                <div class="p1">
                                    <div align="center" class="circle hidden-xs">4</div>
                                    <div id="header">
                                        تعداد سایتیشن مقاله
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body"> 
                                        <%
                                            if (i.getCitedbyCount().equals("0")) {
                                                out.write("هیچ سایتیشنی ندارد");
                                            } else {
                                                out.write(i.getCitedbyCount());
                                            }
                                        %>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-group fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">

                                <div class="p1">
                                    <div align="center" class="circle hidden-xs">5</div>
                                    <div id="header">
                                        منتشر شده در
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body"> 
                                        <%= i.getPrismPublicationName()%>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-address-card-o fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">

                                <div class="p1">
                                    <div  class="circle hidden-xs">6</div>
                                    <div id="header">
                                        موسسه 
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body"> 
                                        <%= i.getAffiliation().get(0).getAffilname()%>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-university fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">
                                <div class="p1">
                                    <div class="circle hidden-xs hidden-sm">4</div>
                                    <div id="header">
                                        تاریخ انتشار
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body"> 
                                        <%= i.getPrismCoverDate()%>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-calendar fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">
                                <div class="p1">
                                    <div  class="circle hidden-xs">7</div>
                                    <div id="header">
                                        شناسه الکترونیکی
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body"> <%= i.getEid()%>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-id-card-o fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                            <div style="margin:auto" class="col-md-3 col-lg-3">
                                <div class="p1">
                                    <div  class="circle hidden-xs">8</div>
                                    <div id="header">
                                        از کشور
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body"> <%= i.getAffiliation().get(0).getAffiliationCountry()%>
                                        <% if (i.getAffiliation().get(0).getAffiliationCountry() != null) {
                                                q += "AFFILCOUNTRY(" + i.getAffiliation().get(0).getAffiliationCountry() + ")";
                                            }%>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-flag fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">
                                <div class="p1">
                                    <div  class="circle hidden-xs">9</div>
                                    <div id="header">
                                        از شهر
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="body"> <%= i.getAffiliation().get(0).getAffiliationCity()%>
                                        <%
                                            if (i.getAffiliation().get(0).getAffiliationCity() != null)
                                                q += "AFFILCITY(" + i.getAffiliation().get(0).getAffiliationCity() + ")";%>
                                    </div>
                                    <hr style="box-shadow: 0px 4px 6px 0px rgba(0, 0, 0,0.4);">
                                    <div id="footer">
                                        <i class="fa fa-map-o fa-2x"></i>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%
            q = q.replaceAll(" ", "%20");
        %>
        <div align="center" id="subMenu" class="bottomMenu" style="right:30px;color:#fff;display: none;">
            <a href="<%= "/scopusApi/search.jsp?detailsPage=1&q=" + q%>" style="display: inline-block">
                <div  class="fa fa-2x fa-file-pdf-o circle" aria-hidden="true" style="margin: 0px;display: block;line-height: 40px;position: static"></div>
            </a>
            <p style="display: block;">مقالات نویسنده</p>
           
            <a href="<%= "/scopusApi/search.jsp?detailsPage=1&q=" + q%>" style="display: inline-block">
                <i class="fa fa-2x fa-group circle" aria-hidden="true" style="margin: 0px;display: block;line-height: 40px;position: static"></i>
            </a>
            <p>کنفرانس های نویسنده</p>
        </div>
        <div id="menu" class="bottomCircle">
            <i class="fa fa-plus fa-3x" aria-hidden="true"></i>
        </div>
        <script src="js/jq.js" type="text/javascript"></script>
        <script>

            $(document).ready(function () {
                $("#subMenu").css("color", "#fff");
                var state = 1;
                var hideMenu = 1;
                $('.bottomCircle').click(function () {
                    state *= -1;
                    if (state === -1)
                    {
                        if (hideMenu === 1)
                        {
                            $("#subMenu").css("color", "#000");
                        } else
                        {
                            $("#subMenu").css("color", "#fff");
                        }
                        $('.bottomCircle').addClass('hoverCircle');
                        $('#subMenu').fadeIn(500);
                    } else
                    {
                        $('.bottomCircle').removeClass('hoverCircle');
                        $('#subMenu').fadeOut(500);
                    }
                });

                $("#toggle").click(function () {
                    hideMenu = -1;
                    $("#menu").removeClass("showMenu");
                    $("#menu").addClass('hideMenu');
                });
                $("#baseMenu").click(function () {
                    hideMenu = 1;
                    $("#menu").addClass("showMenu");
                    $("#menu").removeClass("hideMenu");
                });
                $("a").click(function () {
                    $(".dialogload").css("display", "block");
                });
            });

        </script>
        
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>