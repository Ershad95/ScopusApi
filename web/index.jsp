<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <title>صفحه اصلی</title>
        <!-- Insert to your webpage before the </head> -->
        <script src="sliderengine/jquery.js"></script>
        <script src="sliderengine/amazingslider.js"></script>
        <link rel="stylesheet" type="text/css" href="sliderengine/amazingslider-1.css">
        <script src="sliderengine/initslider-1.js"></script>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/radioButton.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <style>
            body{
                background: url(image/back.jpg);
            }
        </style>
        <%@include file="header.jsp" %>

        <br />
        <br />
        
        <div id="amazingslider-wrapper-1" style="display:block;position:relative;max-width:900px;margin:20px auto 30px;">
            <div id="amazingslider-1" style="display:block;position:relative;margin:0 auto;">
                <ul class="amazingslider-slides" style="display:none;">
                    <li><img src="images/ir.png" alt="بیش از 400,000 مقاله"  title="بیش از 400,000 مقاله" />
                    </li>
                    <li><img src="images/ca.png" alt="بیش از 1,900,000 مقاله"  title="بیش از 1,900,000 مقاله" />
                    </li>
                    <li><img src="images/es.png" alt="بیش از 1,000,000 مقاله"  title="بیش از 1,000,000 مقاله" />
                    </li>
                    <li><img src="images/fr.png" alt="بیش از 1,000,000 مقاله"  title="بیش از 1,000,000 مقاله" />
                    </li>
                    <li><img src="images/ge.png" alt="بیش از 3,300,000 مقاله"  title="بیش از 3,300,000 مقاله" />
                    </li>
                    <li><img src="images/ru.png" alt="بیش از 190,000 مقاله"  title="بیش از 190,000 مقاله" />
                    </li>
                    <li><img src="images/se.png" alt="بیش از 750,000 مقاله"  title="بیش از 750,000 مقاله" />
                    </li>
                </ul>
                <ul class="amazingslider-thumbnails" style="display:none;">
                    <li><img src="images/ir-tn.png" alt="بیش از 400,000 مقاله" title="بیش از 400,000 مقاله" /></li>
                    <li><img src="images/ca-tn.png" alt="بیش از 1,900,000 مقاله" title="بیش از 1,900,000 مقاله" /></li>
                    <li><img src="images/es-tn.png" alt="بیش از 1,000,000 مقاله" title="بیش از 1,000,000 مقاله" /></li>
                    <li><img src="images/fr-tn.png" alt="بیش از 1,000,000 مقاله" title="بیش از 1,000,000 مقاله" /></li>
                    <li><img src="images/ge-tn.png" alt="بیش از 3,300,000 مقاله" title="بیش از 3,300,000 مقاله" /></li>
                    <li><img src="images/ru-tn.png" alt="بیش از 190,000 مقاله" title="بیش از 190,000 مقاله" /></li>
                    <li><img src="images/se-tn.png" alt="بیش از 750,000 مقاله" title="بیش از 750,000 مقاله" /></li>
                </ul>
            </div>
        </div>
        <div style="text-align: center;">
            <div class="box" style="width:250px;direction: rtl">
                <h3>جستجو در مقالات</h3>
                <p dir="rtl">می توانید بدون محدودیت در تمام مقالات موجود جستجو کنید</p>
                <hr>
                <span class="fa fa-2x fa-search"></span>
            </div>
            <div class="box" style="width:250px;direction: rtl;background: #4cae4c">
                <h3>مقایسه کشورها</h3>
                <p dir="rtl">به راحتی می توانید تعداد مقالات کشور ها را مقایسه کنید</p>
                <hr>
                <span class="fa fa-2x fa-flag"></span>
            </div>
            <div class="box" style="width:250px;direction: rtl;background: #F44336">
                <h3>جزئیات مقالات همرا با خلاصه</h3>
                <p dir="rtl">بعد از پیدا کردن مقاله مورد نظر می توانید جزئیات کاملی از مقاله را مشاهده کنید</p>
                <hr>
                <span class="fa fa-2x fa-files-o"></span>
            </div>
            <div class="box" style="width:250px;direction: rtl;background: darkcyan">
                <h3>اتصال آنلاین به اسکاپوس</h3>
                <p dir="rtl">اطلاعات مقالات در هر لحظه و در هر مکان در اختیار شما</p>
                <hr>
                <span class="fa fa-2x fa-globe"></span>
            </div>
            
        </div>
        <style>
             body[class="goog-te-banner"]{
        display: none;
    }
        </style>
        <%@include file="footer.jsp" %>
        <script>
            $(document).ready(function () {
                $('a').click(function () {
                    $(".dialogload").css("display", "block");
                });
            });
        </script>
    </body>
</html>
