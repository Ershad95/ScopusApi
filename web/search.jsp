<%@page import="ershad.Navigation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URL"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="ershad.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/radioButton.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/jq.js"></script>
        <script src="js/paging.js" type="text/javascript"></script>
        <style>

            body
            {
                background: url(image/back.jpg);
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
                        document.body.scrollTop = 0;
                        document.documentElement.scrollTop = 0;
                    });
                });
                $("#lstSelect").click(function () {
                    $("#table-pagin").show();
                    $("div.list-box").show();
                    $("table.tbl").hide();
                });
                $("#close-Error").click(function () {
                    $("#Error").hide();
                });
                $("#tblSelect").click(function () {

                    $("div.list-box").hide();
                    $("table.tbl").show();
                    $("#table-pagin").show();
                });
                $("#closeModal").click(function ()
                {
                    $(".dialog").hide();
                });
                $("#openDialog").click(function ()
                {
                    $(".modal-er").addClass('bounceIn');
                    $(".dialog").css('display', 'block');
                });
                $("#btnSearch").click(function () {
                    var txt = $("input[type=text]");
                    var count = 0;
                    for (var index = 0; index <= txt.length; index++)
                    {
                        if (txt.eq(index).val() === "")
                            ++count;
                    }
                    if (count === 9)
                    {
                        $("#Error").css("display", "block");
                    } else {
                        $(".dialogload").css("display", "block");
                    }
                });
                $("#btnClear").click(function () {
                    var txt = $("input[type=text]");
                    for (var index = 0; index <= txt.length; index++)
                    {
                        txt.eq(index).val("");
                    }
                });
                $('a').click(function () {
                    $(".dialogload").css("display", "block");
                });
            });
        </script>
    </head>
    <body style="color:#000;">
        <%@include file="header.jsp" %> 

        <%            boolean pagin = false;
            String q = "";
            boolean detailsPage = false;
            String p = request.getParameter("pagin");
            if (p != null) {
                if (p.equals("1")) {
                    pagin = true;
                }
            }
            String p1 = request.getParameter("detailsPage");
            if (p1 != null) {
                if (p1.equals("1")) {
                    detailsPage = true;
                    q = request.getParameter("q");
                }
            }
        %>
        <div style="display:inline-block;" dir="rtl" class="animated fadeInUp">
            <form class="frm" method="POST" action="search.jsp">
                <div  class="box">
                    <i class="fa fa-address-card fa-2x"></i>
                    <p>موضوع مقاله</p>
                    <input name="article" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-calendar fa-2x"></i>
                    <p>تاریخ انتشار مقاله</p>
                    <input name="date" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-flag fa-2x"></i>
                    <p>از کدام کشور</p>
                    <input name="country" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-map-marker fa-2x"></i>
                    <p>از کدام شهر</p>
                    <input name="city" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-files-o fa-2x"></i>
                    <p>تعداد مقالات در هر صفحه</p>
                    <input name="count" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-university fa-2x"></i>
                    <p>از کدام دانشگاه</p>
                    <input name="university" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-user-circle-o fa-2x"></i>
                    <p>نام نویسنده</p>
                    <input name="author" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-archive fa-2x"></i>
                    <p>عنوان مقاله</p>
                    <input name="title" type="text" />
                </div>
                <div class="box">
                    <i class="fa fa-file fa-2x"></i>
                    <p>رنج تعداد صفحات</p>
                    <input name="page" type="text" />
                </div>
                <div class="box">
                    <p>اطلاعات در چه قالبی نمایش داده شود؟</p>

                    <input dir="rtl"  style="color:#fff;" value="radio2" type="radio" id="tblSelect" name="radio-group">
                    <label dir="rtl"  style="color:#fff;"  for="tblSelect">نمایش در جدول</label>
                    <br>
                    <input dir="rtl" style="color:#fff;" checked value="radio1" type="radio" id="lstSelect" name="radio-group">
                    <label dir="rtl" style="color:#fff;"  for="lstSelect">نمایش در لیست</label>
                </div>
                <div style="text-align: center;">
                    <button type="reset" class="btn-form"  id="btnClear">پاک کن
                        <i class="fa fa-close"></i>
                    </button>
                    <button  type="submit" class="btn-form" id="btnSearch">جستجو
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </form>

        </div>
        <%@include  file="Info.jsp" %>
        <%            if (request.getMethod().equals("POST") || pagin || detailsPage) {
                if ((pagin == false) && (detailsPage == false)) {
                    String article = request.getParameter("article").trim();
                    String country = request.getParameter("country").trim();
                    String count = request.getParameter("count").trim();
                    String uni = request.getParameter("university").trim();
                    String author = request.getParameter("author").trim();
                    String city = request.getParameter("city").trim();
                    String date = request.getParameter("date").trim();
                    String title = request.getParameter("title").trim();
                    String Page = request.getParameter("page").trim();
                    if (!country.isEmpty()) {
                        country = country.replaceAll(" ", "%20");
                        query += "AFFILCOUNTRY(" + country + ")";
                    }
                    if (!article.isEmpty()) {
                        article = article.replaceAll(" ", "%20");
                        query += "KEY(" + article + ")";
                    }
                    if (!uni.isEmpty()) {
                        uni = uni.replaceAll(" ", "%20");
                        query += "AFFILORG(" + uni + ")";
                    }
                    if (!author.isEmpty()) {
                        author = author.replaceAll(" ", ",");
                        query += "AUTHOR-NAME(" + author + ")";
                    }
                    if (!city.isEmpty()) {
                        city = city.replaceAll(" ", "%20");
                        query += "AFFILCITY(" + city + ")";
                    }
                    if (!title.isEmpty()) {
                        title = title.replaceAll(" ", "%20");
                        query += "TITLE(" + title + ")";
                    }

                    if (!Page.isEmpty()) {
                        query += "PAGES(" + Page + ")";
                    }
                    if (!date.isEmpty()) {
                        date = date.replaceAll(" ", "%20");
                        query += "&date=" + date + "";
                    }
                    if (!count.isEmpty()) {
                        query += "&count=" + count;
                    } else {
                        count = "10";
                        query += "&count=" + count;
                    }
                }
                Model model = null;
                int t = 0;
                String url = "";
                List<ershad.Entry> e = null;
                if (!pagin) {
                    if (!detailsPage) {
                        url = baseUrl + "query=" + base_query + query + token + json;
                    } else {
                        url = baseUrl + "query=" + base_query + q + token + json;
                    }
                } else {
                    url = baseUrl + request.getQueryString();
                }
                url = url.replaceAll(" ", "%20");
                ObjectMapper map = new ObjectMapper();
                model = map.readValue(new URL(url), Model.class);
                e = model.getSearchResults().getEntry();
                if (session.isNew()) {
                    session.setAttribute("model", e);
                } else {
                    session.putValue("model", e);
                }

                t = Integer.valueOf(model.getSearchResults().getOpensearchTotalResults()) / Integer.parseInt(model.getSearchResults().getOpensearchItemsPerPage());
        %>
        <div id="divDialog" class="dialog">
            <div class="modal-er animated bounceIn">
                <div style="width: 100%;padding:0px;"><p style="color:#000;padding: 10px;border-top-left-radius: 3px;border-top-right-radius: 5px;">اطلاعات جستجو شده</p></div>
                <div style="padding-right:10px;">
                    <hr style="box-shadow: 0px 4px 6px 0px gray;margin-left: 10px;">
                    <h4>تعداد کل :  <%= model.getSearchResults().getOpensearchTotalResults()%></h4>
                    <h4>تعداد مقالات در هر صفحه:  <%= model.getSearchResults().getOpensearchItemsPerPage()%></h4>
                    <%
                        int currentPage = Integer.parseInt(model.getSearchResults().getOpensearchStartIndex()) / Integer.parseInt(model.getSearchResults().getOpensearchItemsPerPage());
                    %>
                    <h4>صفحه ی فعلی : <%= currentPage + 1%></h4>
                    <h4>تعداد کل صفحات : <%= t%></h4>
                    <button id="closeModal" class="circle" style="color:#fff;background: #F44336;width:50px;height: 50px;">بستن</button>
                </div>
            </div>
        </div>     
        <table id="tbl" style="margin:0 0 10px 0;display: none;" class="tbl">
            <thead>
                <tr>
                    <th>جزئیات</th>
                    <th>تعداد صفحات</th>
                    <th>موسسه</th>
                    <th>تاریخ انشار</th>
                    <th>نام ایجاد کننده</th>
                    <th>عنوان مقاله</th>
                </tr>
            </thead>
            <%
                int len = 0;
                for (ershad.Entry item : e) {
                    int x = item.getDcTitle().length();
                    if (x > 100) {
                        len = 100;
                    } else {
                        len = x;
                    }
            %>
            <tr data-aos="fade-right">
                <%
                    if (pagin) {
                        query = request.getQueryString();
                    }
                %>
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
                <td><%= item.getPrismCoverDate().replace("-", "/")%></td>
                <td><%= item.getDcCreator()%></td>
                <td><%= item.getDcTitle().substring(0, len) + "..."%></td>
            </tr>
            <div class="list-box" data-aos="fade-right">
                <h3><%= item.getDcTitle()%></h3>
                <p><%= item.getDcCreator()%></p>
                <a href="<%= "/scopusApi/detailsPage.jsp?id=" + item.getID()%>"><button class="circle"  name="btn">جزئیات</button></a>
            </div>
            <%
                }
            %>
        </table>

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
                    <a style="color:#fff;pointer-events: none;opacity: 0.7;" href="<%= nav.GetNextUrl()%>">بعدی</a>
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
                    <a style="color:#fff;pointer-events: none;opacity: 0.7;" href="<%= nav.GetFirstUrl()%>">صفحه ی اول</a>
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
                    <a style="color:#fff;pointer-events: none;opacity: 0.7;" href="<%= nav.GetLastUrl()%>">صفحه ی آخر</a>
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
                    <a style="color:#fff; pointer-events: none;opacity: 0.7; " href="<%= nav.GetPreUrl()%>">قبلی</a>
                    <%} else {
                    %>
                    <a style="color:#fff; " href="<%= nav.GetPreUrl()%>">قبلی</a>
                    <%}%>
                </span>
            </div>
        </div>
        <br />
        <%}%>
        <%@include file="footer.jsp" %>
    </body>
</html>
