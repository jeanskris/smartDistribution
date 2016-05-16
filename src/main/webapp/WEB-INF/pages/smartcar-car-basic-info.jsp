<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.smartcar.model.response.CarBasicInfoJson" %>
<%--
  Created by IntelliJ IDEA.
  User: ZJDX
  Date: 2016/4/18
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Smart Car</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- Le styles -->


  <script type="text/javascript" src="assets/js/jquery.js"></script>

  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/loader-style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.css">


  <link href="assets/js/footable/css/footable.core.css?v=2-0-1" rel="stylesheet" type="text/css">
  <link href="assets/js/footable/css/footable.standalone.css" rel="stylesheet" type="text/css">
  <link href="assets/js/footable/css/footable-demos.css" rel="stylesheet" type="text/css">

  <link rel="stylesheet" href="assets/js/dataTable/lib/jquery.dataTables/css/DT_bootstrap.css">
  <link rel="stylesheet" href="assets/js/dataTable/css/datatables.responsive.css">







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
      <li><a href="#" title="Sample page 1">Information</a>
      </li>
      <li><i class="fa fa-lg fa-angle-right"></i>
      </li>
      <li><a href="#" title="Sample page 1">car basic</a>
      </li>
      <li class="pull-right">
        <div class="input-group input-widget">
          <input id="inputSearchPlace" style="border-radius:15px" type="text" placeholder="Search..." class="form-control">
        </div>
      </li>
    </ul>

    <!-- END OF BREADCRUMB -->

    <!--========================================================================-->
    <!--信息表格-->
    <div class="content-wrap">
      <div class="row">


        <div class="col-sm-12">

          <div class="nest" id="FootableClose">
            <div class="title-alt">
              <h6>
                车基本信息列表</h6>
              <div class="titleClose">
                <a class="gone" href="#FootableClose">
                  <span class="entypo-cancel"></span>
                </a>
              </div>
              <div class="titleToggle">
                <a class="nav-toggle-alt" href="#Footable">
                  <span class="entypo-up-open"></span>
                </a>
              </div>

            </div>

            <div class="body-nest" id="Footable">

              <p class="lead well">信息概述：</p>
              <div class="body-nest" id="Filtering">

                <div class="row" style="margin-bottom:10px;">
                  <div class="col-sm-4">
                    <input class="form-control" id="filter" placeholder="Search..." type="text">
                  </div>
                  <div class="col-sm-2">
                    <select class="filter-status form-control">
                      <option value="active">Active
                      <option value="disabled">Disabled
                      <option value="suspended">Suspended
                    </select>
                  </div>
                  <div class="col-sm-6">

                    <a href="#clear" style="margin-left:10px;" class="pull-right btn btn-info clear-filter" title="clear filter">clear</a>

                  </div>
                </div>
              <table  id="footable-res2" class="table-striped footable-res footable metro-blue demo" data-filter="#filter" data-filter-text-only="true" data-page-size="6">
                <thead>
                <tr>
                  <th>
                    car_id
                  </th>
                  <th>
                    baterry_id
                  </th>
                  <th>
                    Vin
                  </th>
                  <th>
                    release_date
                  </th>
                  <th>
                    liscence_date
                  </th>
                  <th>
                    total_miles
                  </th>
                  <th>
                    current location
                  </th>
                  <th>
                    charge_times
                  </th>
                  <th>
                    power
                  </th>
                  <th>
                    status
                  </th>
                </tr>
                </thead>
                <tbody>
                <%--show all information of cars--%>
                <c:forEach var="carBasicInfoJson" items="${listCarBasicInfo}" varStatus="state">
                  <tr>
                    <td>${carBasicInfoJson.getCarId()}</td>
                    <td>${carBasicInfoJson.getBaterryId()} </td>
                    <td>${carBasicInfoJson.getVin()} </td>
                    <td>${carBasicInfoJson.getReleaseDate()} </td>
                    <td>${carBasicInfoJson.getLiscenceDate()} </td>
                    <td>${carBasicInfoJson.getTotalMiles()} </td>
                    <td>${carBasicInfoJson.getCurrentLocation()}</td>
                    <td>${carBasicInfoJson.getChargeTimes()} </td>
                    <td>${carBasicInfoJson.getPower()}</td>
                    <td>${carBasicInfoJson.getStatus()} </td>
                  </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <td colspan="12">
                    <div class="pagination pagination-centered"></div>
                  </td>
                </tr>
                </tfoot>
              </table>

            </div>

          </div>

          </div>
        </div>

      </div>
    </div>

   <%-- <div class="content-wrap">
      <div class="row">
        <div class="col-sm-12">
          <div class="nest" id="FilteringClose">
            <div class="title-alt">
              <h6>
                Footable Filtering</h6>
              <div class="titleClose">
                <a class="gone" href="#FilteringClose">
                  <span class="entypo-cancel"></span>
                </a>
              </div>
              <div class="titleToggle">
                <a class="nav-toggle-alt" href="#Filtering">
                  <span class="entypo-up-open"></span>
                </a>
              </div>

            </div>

            <div class="body-nest" id="Filtering">

              <div class="row" style="margin-bottom:10px;">
                <div class="col-sm-4">
                  <input class="form-control" id="filter" placeholder="Search..." type="text">
                </div>
                <div class="col-sm-2">
                  <select class="filter-status form-control">
                    <option value="active">Active
                    <option value="disabled">Disabled
                    <option value="suspended">Suspended
                  </select>
                </div>
                <div class="col-sm-6">

                  <a href="#clear" style="margin-left:10px;" class="pull-right btn btn-info clear-filter" title="clear filter">clear</a>
                  <a href="#api" class="pull-right btn btn-info filter-api" title="Filter using the Filter API">filter API</a>



                </div>

              </div>

              <table id="footable-res2" class="demo" data-filter="#filter" data-filter-text-only="true">
                <thead>
                <tr>
                  <th data-toggle="true">
                    First Name
                  </th>
                  <th>
                    Last Name
                  </th>
                  <th data-hide="phone,tablet">
                    Job Title
                  </th>
                  <th data-hide="phone,tablet">
                    DOB
                  </th>
                  <th data-hide="phone">
                    Status
                  </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>Isidra</td>
                  <td><a href="#">Boudreaux</a>
                  </td>
                  <td>Traffic Court Referee</td>
                  <td data-value="78025368997">22 Jun 1972</td>
                  <td data-value="1">
                    <span class="status-metro status-active" title="Active">Active</span>
                  </td>
                </tr>
                <tr>
                  <td>Shona</td>
                  <td>Woldt</td>
                  <td><a href="#">Airline Transport Pilot</a>
                  </td>
                  <td data-value="370961043292">3 Oct 1981</td>
                  <td data-value="2">
                    <span class="status-metro status-disabled" title="Disabled">Disabled</span>
                  </td>
                </tr>
                <tr>
                  <td>Granville</td>
                  <td>Leonardo</td>
                  <td>Business Services Sales Representative</td>
                  <td data-value="-22133780420">19 Apr 1969</td>
                  <td data-value="3">
                    <span class="status-metro status-suspended" title="Suspended">Suspended</span>
                  </td>
                </tr>
                <tr>
                  <td>Easer</td>
                  <td>Dragoo</td>
                  <td>Drywall Stripper</td>
                  <td data-value="250833505574">13 Dec 1977</td>
                  <td data-value="1">
                    <span class="status-metro status-active" title="Active">Active</span>
                  </td>
                </tr>
                <tr>
                  <td>Maple</td>
                  <td>Halladay</td>
                  <td>Aviation Tactical Readiness Officer</td>
                  <td data-value="694116650726">30 Dec 1991</td>
                  <td data-value="3">
                    <span class="status-metro status-suspended" title="Suspended">Suspended</span>
                  </td>
                </tr>
                <tr>
                  <td>Maxine</td>
                  <td><a href="#">Woldt</a>
                  </td>
                  <td><a href="#">Business Services Sales Representative</a>
                  </td>
                  <td data-value="561440464855">17 Oct 1987</td>
                  <td data-value="2">
                    <span class="status-metro status-disabled" title="Disabled">Disabled</span>
                  </td>
                </tr>
                <tr>
                  <td>Lorraine</td>
                  <td>Mcgaughy</td>
                  <td>Hemodialysis Technician</td>
                  <td data-value="437400551390">11 Nov 1983</td>
                  <td data-value="2">
                    <span class="status-metro status-disabled" title="Disabled">Disabled</span>
                  </td>
                </tr>
                <tr>
                  <td>Lizzee</td>
                  <td><a href="#">Goodlow</a>
                  </td>
                  <td>Technical Services Librarian</td>
                  <td data-value="-257733999319">1 Nov 1961</td>
                  <td data-value="3">
                    <span class="status-metro status-suspended" title="Suspended">Suspended</span>
                  </td>
                </tr>
                <tr>
                  <td>Judi</td>
                  <td>Badgett</td>
                  <td>Electrical Lineworker</td>
                  <td data-value="362134712000">23 Jun 1981</td>
                  <td data-value="1">
                    <span class="status-metro status-active" title="Active">Active</span>
                  </td>
                </tr>
                <tr>
                  <td>Lauri</td>
                  <td>Hyland</td>
                  <td>Blackjack Supervisor</td>
                  <td data-value="500874333932">15 Nov 1985</td>
                  <td data-value="3">
                    <span class="status-metro status-suspended" title="Suspended">Suspended</span>
                  </td>
                </tr>
                </tbody>
              </table>

            </div>

          </div>


        </div>

      </div>
    </div>--%>

    <!-- /END OF CONTENT -->
    <!--========================================================================-->

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



<!-- MAIN EFFECT -->
<script type="text/javascript" src="assets/js/preloader.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>








<!-- /MAIN EFFECT -->
<!-- GAGE -->
<script type="text/javascript" src="assets/js/toggle_close.js"></script>
<script src="assets/js/footable/js/footable.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.sort.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.filter.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.paginate.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.paginate.js?v=2-0-1" type="text/javascript"></script>





<script type="text/javascript">
  $(function() {
    $('.footable-res').footable();
  });
</script>
<script type="text/javascript">
  $(function() {
    $('#footable-res2').footable().bind('footable_filtering', function(e) {
      var selected = $('.filter-status').find(':selected').text();
      if (selected && selected.length > 0) {
        e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
        e.clear = !e.filter;
      }
    });

    $('.clear-filter').click(function(e) {
      e.preventDefault();
      $('.filter-status').val('');
      $('table.demo').trigger('footable_clear_filter');
    });

    $('.filter-status').change(function(e) {
      e.preventDefault();
      $('table.demo').trigger('footable_filter', {
        filter: $('#filter').val()
      });
    });

    $('.filter-api').click(function(e) {
      e.preventDefault();

      //get the footable filter object
      var footableFilter = $('table').data('footable-filter');

      alert('about to filter table by "tech"');
      //filter by 'tech'
      footableFilter.filter('tech');

      //clear the filter
      if (confirm('clear filter now?')) {
        footableFilter.clearFilter();
      }
    });
  });
</script>

</body>

</html>
