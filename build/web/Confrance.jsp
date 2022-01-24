<%@page import="ershad.Navigation"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URL"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="ershad.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <style>
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
            body{
                background: url(image/confrance.jpg);
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
        <script src="js/jq.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $("tr:even").addClass("bounceInLeft");
                $("tr:odd").addClass("bounceInRight");

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
        <title>کنفرانس ها</title>
    </head>
    <body>
        <%@include  file="header.jsp" %>
        <br>
        <br>
        <div class="animated bounceInDown" style="margin:10px;text-align:center;opacity: 0.7;">
            <form method="POST" action="Confrance.jsp">
                <div class="box">
                    <i class="fa fa-group fa-2x"></i>
                    <p>نام کنفرانس</p>
                    <input name="txtConfranceName" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-support fa-2x"></i>
                    <p>اسپانسر کنفرانس</p>
                    <input name="txtSponser" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-map-marker fa-2x"></i>
                    <p>محل کنفرانس</p>
                    <input name="txtLocation" type="text" />
                </div>
                <br>
                <a>
                    <button class="btn-form" id="btnSearch" type="submit">جستجو</button>
                </a>
                <button class="btn-form" id="btnClear" type="reset">پاک کن</button>
            </form>
        </div>
        <%@include file="Info.jsp" %>
        <%            boolean p = false;
            if (request.getParameter("pagin") != null) {
                p = true;
            } else {
                p = false;
            }
            if (request.getMethod().equals("POST") || p) {
                if (!p) {
                    String location = request.getParameter("txtLocation");
                    String sponcer = request.getParameter("txtSponser");
                    String name = request.getParameter("txtConfranceName");
                    if (!location.isEmpty()) {
                        location = location.replaceAll(" ", "%20");
                        query += "CONFLOC(" + location + ")";
                    }
                    if (!name.isEmpty()) {
                        name = name.replaceAll(" ", "%20");
                        query += "CONFNAME(" + name + ")";
                    }
                    if (!sponcer.isEmpty()) {
                        sponcer = sponcer.replaceAll(" ", "%20");
                        query += "CONFSPONSORS(" + sponcer + ")";
                    }
                }
                query += "&count=25";
                String url;
                if (p) {
                    query = request.getQueryString();
                }
                ObjectMapper mapper = new ObjectMapper();
                if (p) {
                    url = baseUrl + query;
                } else {
                    url = baseUrl + "query=" + query + token + json;
                }
                Model model = null;
                model = mapper.readValue(new URL(url), Model.class);
                List<ershad.Entry> entry = model.getSearchResults().getEntry();
                if (session.isNew()) {
                    session.setAttribute("model", entry);
                } else {
                    session.putValue("model", entry);
                }
        %>
        <table class="tbl" style="margin:10px auto;width:90%;">
            <thead style="border-radius: 10px">
                <tr>
                    <th>جزئیات</th>
                    <th>ارائه دهنده</th>
                    <th>عنوان ارائه</th>
                    <th>تاریخ ارائه</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (ershad.Entry item : entry) {
                %>
                <tr class="animated">
                    <td><a href="<%= "/scopusApi/detailsPage.jsp?id=" + item.getID() + "&conf=1"%>"><button class="circle" name="btn">جزئیات</button></a></td>
                    <td><%= item.getDcCreator()%></td>
                    <td><% try {
                            if (item.getDcTitle().length() > 70) {
                                String tmp = item.getDcTitle().substring(0, 70) + " ...";
                                out.write(tmp);
                            } else {
                                out.write(item.getDcTitle());
                            }

                        } catch (NullPointerException ex) {
                            out.write("مشخص نشده");
                        }%>
                    </td>
                    <td><%= item.getPrismCoverDate().replaceAll("-", "/")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%
            int t = Integer.valueOf(model.getSearchResults().getOpensearchTotalResults()) / Integer.parseInt(model.getSearchResults().getOpensearchItemsPerPage());
            int currentPage = Integer.parseInt(model.getSearchResults().getOpensearchStartIndex()) / Integer.parseInt(model.getSearchResults().getOpensearchItemsPerPage());
        %>
        <div id="table-pagin" align="center">
            <br/>

            <%
                currentPage = currentPage + 1;
                Navigation nav = new Navigation();
                for (int index = 0; index < model.getSearchResults().getLink().size(); index++) {
                    if (model.getSearchResults().getLink().get(index).getRef().equals("next")) {
                        nav.SetNextUrl(model.getSearchResults().getLink().get(index).getHref());
                    }
                    if (model.getSearchResults().getLink().get(index).getRef().equals("last")) {
                        nav.SetLastUrl(model.getSearchResults().getLink().get(index).getHref());
                    }
                    if (model.getSearchResults().getLink().get(index).getRef().equals("first")) {
                        nav.SetFirstUrl(model.getSearchResults().getLink().get(index).getHref());
                    }
                    if (model.getSearchResults().getLink().get(index).getRef().equals("prev")) {
                        nav.SetPreUrl(model.getSearchResults().getLink().get(index).getHref());
                    }
                }
            %>
            <h3 style="color:#000;"><%= t + "صفحه ی  " + currentPage + " از"%></h3>
            <div  id="er" align="center">
                <span class="sqr">
                    <%
                        if (nav.GetNextUrl().isEmpty()) {
                    %>
                    <a style="color:#fff;pointer-events: none;" href="<%= nav.GetNextUrl()%>">بعدی</a>
                    <%
                    } else {
                    %>
                    <a style="color:#fff;" href="<%= nav.GetNextUrl()%>">بعدی</a>
                    <%}%>
                </span>
                <span class="sqr">
                    <%
                        if (nav.GetFirstUrl().isEmpty()) {
                    %>
                    <a style="color:#fff;pointer-events: none;" href="<%= nav.GetFirstUrl()%>">صفحه ی اول</a>
                    <%
                    } else {
                    %>
                    <a style="color:#fff;" href="<%= nav.GetFirstUrl()%>">صفحه ی اول</a>
                    <%}%>
                </span>
                <span class="sqr">
                    <%
                        if (nav.GetLastUrl().isEmpty()) {
                    %>
                    <a style="color:#fff;pointer-events: none;" href="<%= nav.GetLastUrl()%>">صفحه ی آخر</a>
                    <%
                    } else {
                    %>
                    <a style="color:#fff;" href="<%= nav.GetLastUrl()%>">صفحه ی آخر</a>
                    <%}%>
                </span>
                <span class="sqr">
                    <%
                        if (nav.GetPreUrl().isEmpty()) {
                    %>
                    <a style="color:#fff; pointer-events: none; " href="<%= nav.GetPreUrl()%>">قبلی</a>
                    <%} else {
                    %>
                    <a style="color:#fff; " href="<%= nav.GetPreUrl()%>">قبلی</a>
                    <%}%>
                </span>
            </div>
        </div>
        <br>
        <%}%>
    </body>
</html>
