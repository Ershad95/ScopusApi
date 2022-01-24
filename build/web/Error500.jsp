<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setStatus(500);%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>خطا!!!</title>
        <style>

            body{
                color:#000;
            }
        </style>
    </head>
    <body style="text-align: center;">
        <nav style="background:#f44336;width:100%;height: 40px;">
            <h4 style="padding:10px;color: #fff;text-align: end">خطا در برقراری ارتباط</h4>
        </nav>
        <img alt="Error" style="margin-top: 20px;" src="image/error.png" />
        <h1>متأسفیم مشکلی در ارتباط با سرور وجود دارد</h1>
        <h1>!!!دوباره امتحان کنید</h1>
        <hr>
        <ul dir="rtl" style="text-align: right;">
            <li>دردسترس نبودن اطلاعات</li>
            <li>متصل نبودن به اینترنت</li>
            <li>اینترنت کم سرعت و ناپایدار</li>
        </ul>
        <a href="index.jsp"><button class="circle" style="background: #f44336;width:90px;height: 90px;color: #fff;border-color:#f44336">بارگزاری مجدد</button></a>
    </body>
</html>
