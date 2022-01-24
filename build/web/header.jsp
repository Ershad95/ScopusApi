<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<%@ page isErrorPage="true"%>
<style>
    .goog-te-combo{
        outline: none;
        padding : 10px;
        width:200px;
        height:40px;
        color:#fff;
        background: #204d74;
    }
    .goog-te-combo:nth-child(2n+1){
        display: none;
    }
    .goog-te-gadget:nth-child(2n){
        display: none;
    }
    .goog-te-gadget{
        color:#204d74;
    }
    .goog-logo-link{
        display: none;
    }

</style>
<div dir="auto" class="header sticky">
    <a href="http://www.scopus.com/">
        <h1 style="display: inline">
            اسکاپوس<span class="fa fa-globe"></span>
        </h1>
    </a>
    <a name="home" href="/scopusApi/index.jsp">خانه<span class="fa fa-home"></span></a>
    <a href="/scopusApi/search.jsp">  جستجو در مقالات<span class="fa fa-search"></span></a>
    <a href="/scopusApi/NewArticle.jsp">مقالات داغ<span class="fa fa-star"> </span><span class="fa fa-2x fa-star"> </span><span class="fa  fa-star"> </span></a>
    <a href="/scopusApi/compare.jsp">مقایسه کشورها <span class="fa fa-flag"></span></a>
    <a href="/scopusApi/Date.jsp">بررسی انتشار مقالات <span class="fa fa-chain"></span></a>
    <a href="/scopusApi/Confrance.jsp">کنفرانس ها <span class="fa  fa-microphone"></span></a>
    <span style="cursor: pointer;color:#fff;" id="about">درباره ما </span>
    <span style="float: left;">
        
    </span>
</div>
<div id="Error" class="dialog" style="display: none;" >
                    <div class="modal-er animated bounceInRight" style="background: #1E88E5;color:#fff;">
                        <div style="padding-right:10px;padding-left: 10px;">
                            <div style="padding:10px">درباره ما</div>
                            <hr style="">
                            <h4>پروژه درس مباحث ویژه</h4>
                            <h4>نام استاد : جناب آقای بهرام کلهر</h4>
                            <h4>برنامه نویس و طراح : ارشاد رئوفی</h4>
                            <button id="closeAbout" class="circle" style="color:#F44336;background: #fff;width:40px;height: 40px;padding:0px;">بستن</button>
                        </div>
                    </div>
</div>
<script>
    $(document).ready(function(){
       $("#about").click(function(){
           $("#Error").css("display","block");
       }); 
       $("#closeAbout").click(function(){
           $("#Error").css("display","none");
       });
    });
</script>
<%@include  file="Loading.jsp" %>