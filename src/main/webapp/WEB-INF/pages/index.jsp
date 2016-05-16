<%@ page import="com.smartcar.model.CarBasic" %>
<%--
  Created by IntelliJ IDEA.
  User: ZJDX
  Date: 2016/4/17
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Samrt Car</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- Le styles -->



  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/loader-style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.css">

  <link rel="stylesheet" type="text/css" href="assets/js/progress-bar/number-pb.css">
  <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
  <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
  <script src="http://webapi.amap.com/maps?v=1.3&key=84cbc3afd091e42ee9a5aeabe4a6659b"></script>
  <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>

  <style type="text/css">
    canvas#canvas4 {
      position: relative;
      top: 20px;
    }
  </style>


  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <!-- Fav and touch icons -->
  <link rel="shortcut icon" href="assets/ico/minus.png">
</head>

<body>
<!-- Preloader -->
<div id="preloader">
  <div id="status">&nbsp;</div>
</div>
<!-- TOP NAVBAR -->
<nav role="navigation" class="navbar navbar-static-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" class="navbar-toggle" type="button">
        <span class="entypo-menu"></span>
      </button>
      <button class="navbar-toggle toggle-menu-mobile toggle-left" type="button">
        <span class="entypo-list-add"></span>
      </button>




      <div id="logo-mobile" class="visible-xs">
        <h1>WEB管理<span>v1.2</span></h1>
      </div>

    </div>


    <!-- Collect the nav links, forms, and other content for toggling -->
    <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">

        <li>

          <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i style="font-size:19px;" class="icon-warning tooltitle"></i><div class="noft-red">5</div></a>
          <ul style="margin: 12px 0 0 0;" role="menu" class="dropdown-menu dropdown-wrap">
            <li>
              <a href="#">
                <span style="background:#DF2135" class="noft-icon maki-bus"></span><i>1号车故障</i>  <b>01B</b>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <span style="background:#AB6DB0" class="noft-icon maki-ferry"></span><i>2号车电池故障</i>  <b>9:00 AM</b>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <span style="background:#FFA200" class="noft-icon maki-aboveground-rail"></span><i>3号车雷达故障</i>  <b>09 Min</b>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <span style="background:#86C440" class="noft-icon maki-bus"></span><i>4号车···</i>  <b>08:30 AM</b>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#">
                <span style="background:#0DB8DF" class="noft-icon maki-bus"></span><i>5号车···</i>  <b>08:30 AM</b>
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <div>查看所有故障</div>
            </li>
          </ul>
        </li>
        <li><a href="#"><i data-toggle="tooltip" data-placement="bottom" title="Help" style="font-size:20px;" class="icon-help tooltitle"></i></a>
        </li>

      </ul>
      <div id="nt-title-container" class="navbar-left running-text visible-lg">
        <ul class="date-top">
          <li class="entypo-calendar" style="margin-right:5px"></li>
          <li id="Date"></li>


        </ul>
        <!--***clock***-->
        <ul id="digital-clock" class="digital">
          <li class="entypo-clock" style="margin-right:5px"></li>
          <li class="hour"></li>
          <li>:</li>
          <li class="min"></li>
          <li>:</li>
          <li class="sec"></li>
          <li class="meridiem"></li>
        </ul>
        <ul id="nt-title">
          <li><i class="wi-day-lightning"></i>&#160;&#160;Berlin&#160;
            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
          </li>
          <li><i class="wi-day-lightning"></i>&#160;&#160;Yogyakarta&#160;
            <b>85</b><i class="wi-fahrenheit"></i>&#160;; Tonight- 72 °F (22.2 °C)
          </li>

          <li><i class="wi-day-lightning"></i>&#160;&#160;Sttugart&#160;
            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
          </li>

          <li><i class="wi-day-lightning"></i>&#160;&#160;Muchen&#160;
            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
          </li>

          <li><i class="wi-day-lightning"></i>&#160;&#160;Frankurt&#160;
            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
          </li>

        </ul>
      </div>
      <!--//***User & Setting***-->
      <ul style="margin-right:0;" class="nav navbar-nav navbar-right">
        <li>
          <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <img alt="" class="admin-pic img-circle" src="http://api.randomuser.me/portraits/thumb/men/10.jpg">Hi, 文琴 <b class="caret"></b>
          </a>
          <ul style="margin-top:14px;" role="menu" class="dropdown-setting dropdown-menu">
            <li>
              <a href="#">
                <span class="entypo-user"></span>&#160;&#160;My Profile</a>
            </li>
            <li>
              <a href="#">
                <span class="entypo-vcard"></span>&#160;&#160;Account Setting</a>
            </li>
            <li>
              <a href="#">
                <span class="entypo-lifebuoy"></span>&#160;&#160;Help</a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="http://themeforest.net/item/apricot-navigation-admin-dashboard-template/7664475?WT.ac=category_item&WT.z_author=themesmile">
                <span class="entypo-basket"></span>&#160;&#160; Purchase</a>
            </li>
          </ul>
        </li>
        <li>
          <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <span class="icon-gear"></span>&#160;&#160;设置</a>
          <ul role="menu" class="dropdown-setting dropdown-menu">

            <li class="theme-bg">
              <div id="button-bg"></div>
              <div id="button-bg2"></div>
              <div id="button-bg3"></div>
              <div id="button-bg5"></div>
              <div id="button-bg6"></div>
              <div id="button-bg7"></div>
              <div id="button-bg8"></div>
              <div id="button-bg9"></div>
              <div id="button-bg10"></div>
              <div id="button-bg11"></div>
              <div id="button-bg12"></div>
              <div id="button-bg13"></div>
            </li>
          </ul>
        </li>
        <li class="hidden-xs">
          <a class="toggle-left" href="#">
            <span style="font-size:20px;" class="entypo-list-add"></span>
          </a>
        </li>
      </ul>

    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container-fluid -->
</nav>

<!-- /END OF TOP NAVBAR -->

<!-- SIDE MENU -->
<div id="skin-select">
  <div id="logo">
    <h1 ><a href="index.html" style="color: white">SmartCar</a><span>v1.0</span></h1>
  </div>

  <a id="toggle">
    <span class="entypo-menu"></span>
  </a>
  <div class="dark">
    <form action="#">
                <span>
                    <input type="text" name="search" value="" class="search rounded id_search" placeholder="Search Menu..." autofocus="">
                </span>
    </form>
  </div>

  <div class="search-hover">
    <form id="demo-2">
      <input type="search" placeholder="Search Menu..." class="id_search">
    </form>
  </div>




  <div class="skin-part">
    <div id="tree-wrap">
      <div class="side-bar">
        <ul class="topnav menu-left-nest">
          <li>
            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

              <span class="widget-menu"></span>
              <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

            </a>
          </li>

          <li>
            <a class="tooltip-tip ajax-load" href="smartcar-car-basic-info.html" title="Blog App">
              <i class="icon-document-edit"></i>
              <span>车基本信息</span>

            </a>
          </li>
          <li>
            <a class="tooltip-tip ajax-load" href="smartcar-battery-basic-info.html" title="Social">
              <i class="icon-graph-bar"></i>
              <span>查看电池数据</span>

            </a>
          </li>
          <li>
            <a class="tooltip-tip ajax-load" href="smartcar-sensor-info.html" title="Media">
              <i class="icon-window"></i>
              <span>查看传感器信息</span>

            </a>
          </li>
          <li>
            <a class="tooltip-tip ajax-load" href="smartcar-runstate-info.html" title="Media">
              <i class="icon-media-loop"></i>
              <span>查看运行状态</span>

            </a>
          </li>
        </ul>

        <ul class="topnav menu-left-nest">
          <li>
            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

              <span class="design-kit"></span>
              <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

            </a>
          </li>

          <li>
            <a class="tooltip-tip ajax-load" href="smartcar-car-control.html" title="Dashboard">
              <i class="icon-window"></i>
              <span>车辆遥控</span>
            </a>
            <ul>
              <li>
                <a class="tooltip-tip2 ajax-load" href="blog-list.html" title="Blog List"><i class="entypo-doc-text"></i><span>添加车辆</span></a>
              </li>
              <li>
                <a class="tooltip-tip2 ajax-load" href="blog-detail.html" title="Blog Detail"><i class="entypo-newspaper"></i><span>维护车辆</span></a>
              </li>
            </ul>
          </li>
          <li>
            <a class="tooltip-tip ajax-load" href="smartcar-car-maintaince.html" title="Mail">
              <i class="icon-mail"></i>
              <span>车辆维护</span>
            </a>
          </li>

          <li>
            <a class="tooltip-tip ajax-load" href="smartcar-server-maintaince.html" title="Icons">
              <i class="icon-preview"></i>
              <span>服务器维护</span>

            </a>
          </li>

        </ul>

        <ul id="menu-showhide" class="topnav menu-left-nest">
          <li>
            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

              <span class="component"></span>
              <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

            </a>
          </li>
          <li>
            <a class="tooltip-tip ajax-load" href="map.html" title="Map">
              <i class="icon-location"></i>
              <span>Map</span>

            </a>
          </li>
        </ul>


        <div class="side-dash">

          <h3>
            <span>Visitors</span>
          </h3>
          <div id="g1" style="height:180px" class="gauge"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- END OF SIDE MENU -->



<!--  PAPER WRAP -->
<div class="wrap-fluid">
  <div class="container-fluid paper-wrap bevel tlbr">
    <!-- CONTENT -->
    <!-- BREADCRUMB -->
    <ul id="breadcrumb">
      <li>
        <span class="entypo-home"></span>
      </li>
      <li><i class="fa fa-lg fa-angle-right"></i>
      </li>
      <li><a href="#" title="Sample page 1">Home</a>
      </li>
      <li><i class="fa fa-lg fa-angle-right"></i>
      </li>
      <li><a href="#" title="Sample page 1">Map</a>
      </li>
      <li class="pull-right">
        <div id = 'searchCarDiv' class="input-group input-widget">

          <p>Search car by id:<input id="searchPlaceID" name="searchPlace"/></p>


        </div>
      </li>
    </ul>

    <!-- END OF BREADCRUMB -->

    <!--map-->
    <div id="paper-middle">
      <div id="mapContainer"></div>
    </div>

    <!--info-->
    <div class="content-wrap">
      <div class="row">
        <div class="col-lg-3">
          <div class="profit" id="profitClose">
            <div class="headline ">
              <h3>
                                    <span >
                                        <i class="maki-ferry"></i>&#160;&#160;充电次数</span>
              </h3>
              <div class="titleClose">
                <a href="#profitClose" class="gone">
                  <span class="entypo-cancel"></span>
                </a>
              </div>
            </div>

            <div class="value">
                                <span class="pull-left"><i class="entypo-clock clock-position"></i>
                                </span>
              <div id="getting-started">
                <span id="chargeTimes"></span>
                <span class="start-min">/次</span>
              </div>


            </div>

            <div class="progress-tinny">
              <div style="width: 50%" class="bar"></div>
            </div>
            <div class="profit-line">
              <i class="fa fa-caret-up fa-lg"></i>&#160;&#160; 运行状态 ：正常</div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="revenue" id="revenueClose">
            <div class="headline ">

              <h3>
                                    <span>
                                        <i class="maki-aboveground-rail"></i>&#160;&#160;运行里程&速度</span>
              </h3>

              <div class="titleClose">
                <a href="#revenueClose" class="gone">
                  <span class="entypo-cancel"></span>
                </a>
              </div>
            </div>
            <div class="value">
             <%-- <span class="pull-left"><i class="entypo-gauge gauge-position"></i></span>
              <p id="speedNow" class="start-min">0/km</p>--%><%--<i class="pull-right">/Km</i>--%>
               <span class="pull-left"><i class="fa fa-plane fa-2x"></i></span>
               <p id="speedNow">12</p><%--<span class="start-min PULL-RIGHT">/KM</span>--%>
            </div>

            <div class="progress-tinny">
              <div style="width: 25%" class="bar"></div>
            </div>
            <div class="profit-line">
              <i class="fa fa-caret-down fa-lg"></i>&#160;&#160;速度 : 20 km/Hour</div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="order" id="orderClose">
            <div class="headline ">
              <h3>
                                    <span>
                                        <i class="maki-cemetery"></i>&#160;&#160;电池信息</span>
              </h3>
              <div class="titleClose">
                <a href="#orderClose" class="gone">
                  <span class="entypo-cancel"></span>
                </a>
              </div>
            </div>
            <div class="value">
              <span class="pull-left"><i class="fa fa-plane fa-2x"></i></span>
              <p id="battery">12</p>
            </div>

            <div class="progress-tinny">
              <div style="width: 10%" class="bar"></div>
            </div>
            <div class="profit-line">
              <i class="fa fa-caret-down fa-lg"></i>&#160;&#160;剩余续航 : 20KM </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class=" member" id="memberClose">
            <div class="headline ">
              <h3>
                                    <span>
                                        <i class="fa fa-truck"></i>
                                        &#160;&#160;载重详情
                                    </span>
              </h3>
              <div class="titleClose">
                <a href="#memberClose" class="gone">
                  <span class="entypo-cancel"></span>
                </a>
              </div>
            </div>
            <div class="value">
                                <span><i class="maki-warehouse"></i>
                                </span>45<b>Kg</b>

            </div>
            <div class="progress-tinny">
              <div style="width: 50%" class="bar"></div>
            </div>
            <div class="profit-line">
              <span class="entypo-down-circled"></span>&#160;还可承重 ：15kg</div>
          </div>
        </div>
      </div>
    </div>
    <!--折线图-->
    <div id="chart" class="content-wrap" >
      <div class="row">
        <div class="col-lg-6">
          <div class="chart-wrap">
            <!--  <div class="chart-dash">-->
            <!-- <div id="sparkline"></div> -->
            <div id="placeholder" style="width:100%;height:200px;"></div>
          </div>

        </div>
      </div>

    </div>
    <!-- /END OF CONTENT -->



    <!-- FOOTER -->
    <div class="footer-space"></div>
    <div id="footer">
      <div class="devider-footer-left"></div>
      <div class="time">
        <p id="spanDate">
        <p id="clock">
      </div>
      <div class="copyright">Make with Love
        <span class="entypo-heart"></span>Collect from <a href="http://www.cssmoban.com/" title="SmartCar" target="_blank">SmartCar</a> All Rights Reserved</div>
      <div class="devider-footer"></div>


    </div>
    <!-- / END OF FOOTER -->


  </div>
</div>
</div>
<!--  END OF PAPER WRAP -->



<!-- END OF RIGHT SLIDER CONTENT-->
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script src="assets/js/progress-bar/src/jquery.velocity.min.js"></script>
<script src="assets/js/progress-bar/number-pb.js"></script>
<script src="assets/js/progress-bar/progress-app.js"></script>



<!-- MAIN EFFECT -->
<script type="text/javascript" src="assets/js/preloader.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>




<!-- GAGE -->


<script type="text/javascript" src="assets/js/chart/jquery.flot.js"></script>
<script type="text/javascript" src="assets/js/chart/jquery.flot.resize.js"></script>
<script type="text/javascript" src="assets/js/chart/realTime.js"></script>
<script type="text/javascript" src="assets/js/speed/canvasgauge-coustom.js"></script>
<script type="text/javascript" src="assets/js/countdown/jquery.countdown.js"></script>

<!--self-defined-->
<script type="text/javascript" src="assets/js/index.js"></script>




</body>

</html>
