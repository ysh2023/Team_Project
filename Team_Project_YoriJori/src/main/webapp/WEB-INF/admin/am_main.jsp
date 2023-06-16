<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Sales <span>| Today</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                      <h6>145</h6>
                      <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Revenue <span>| This Month</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                    <div class="ps-3">
                      <h6>$3,264</h6>
                      <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card customers-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Customers <span>| This Year</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>1244</h6>
                      <span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">decrease</span>

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->

            <!-- Reports -->
            <div class="col-12">
              <div class="card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Reports <span>/Today</span></h5>

                  <!-- Line Chart -->
                  <div id="reportsChart" style="min-height: 365px;"><div id="apexchartsigeviswgl" class="apexcharts-canvas apexchartsigeviswgl apexcharts-theme-light" style="width: 661px; height: 350px;"><svg id="SvgjsSvg1001" width="661" height="350" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg apexcharts-zoomable hovering-zoom" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><foreignObject x="0" y="0" width="661" height="350"><div class="apexcharts-legend apexcharts-align-center apx-legend-position-bottom" xmlns="http://www.w3.org/1999/xhtml" style="inset: auto 0px 1px; position: absolute; max-height: 175px;"><div class="apexcharts-legend-series" rel="1" seriesname="Sales" data:collapsed="false" style="margin: 2px 5px;"><span class="apexcharts-legend-marker" rel="1" data:collapsed="false" style="background: rgb(65, 84, 241) !important; color: rgb(65, 84, 241); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span class="apexcharts-legend-text" rel="1" i="0" data:default-text="Sales" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Sales</span></div><div class="apexcharts-legend-series" rel="2" seriesname="Revenue" data:collapsed="false" style="margin: 2px 5px;"><span class="apexcharts-legend-marker" rel="2" data:collapsed="false" style="background: rgb(46, 202, 106) !important; color: rgb(46, 202, 106); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span class="apexcharts-legend-text" rel="2" i="1" data:default-text="Revenue" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Revenue</span></div><div class="apexcharts-legend-series" rel="3" seriesname="Customers" data:collapsed="false" style="margin: 2px 5px;"><span class="apexcharts-legend-marker" rel="3" data:collapsed="false" style="background: rgb(255, 119, 29) !important; color: rgb(255, 119, 29); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span class="apexcharts-legend-text" rel="3" i="2" data:default-text="Customers" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Customers</span></div></div><style type="text/css">	
    	
      .apexcharts-legend {	
        display: flex;	
        overflow: auto;	
        padding: 0 10px;	
      }	
      .apexcharts-legend.apx-legend-position-bottom, .apexcharts-legend.apx-legend-position-top {	
        flex-wrap: wrap	
      }	
      .apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left {	
        flex-direction: column;	
        bottom: 0;	
      }	
      .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-left, .apexcharts-legend.apx-legend-position-top.apexcharts-align-left, .apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left {	
        justify-content: flex-start;	
      }	
      .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-center, .apexcharts-legend.apx-legend-position-top.apexcharts-align-center {	
        justify-content: center;  	
      }	
      .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-right, .apexcharts-legend.apx-legend-position-top.apexcharts-align-right {	
        justify-content: flex-end;	
      }	
      .apexcharts-legend-series {	
        cursor: pointer;	
        line-height: normal;	
      }	
      .apexcharts-legend.apx-legend-position-bottom .apexcharts-legend-series, .apexcharts-legend.apx-legend-position-top .apexcharts-legend-series{	
        display: flex;	
        align-items: center;	
      }	
      .apexcharts-legend-text {	
        position: relative;	
        font-size: 14px;	
      }	
      .apexcharts-legend-text *, .apexcharts-legend-marker * {	
        pointer-events: none;	
      }	
      .apexcharts-legend-marker {	
        position: relative;	
        display: inline-block;	
        cursor: pointer;	
        margin-right: 3px;	
        border-style: solid;
      }	
      	
      .apexcharts-legend.apexcharts-align-right .apexcharts-legend-series, .apexcharts-legend.apexcharts-align-left .apexcharts-legend-series{	
        display: inline-block;	
      }	
      .apexcharts-legend-series.apexcharts-no-click {	
        cursor: auto;	
      }	
      .apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series {	
        display: none !important;	
      }	
      .apexcharts-inactive-legend {	
        opacity: 0.45;	
      }</style></foreignObject><rect id="SvgjsRect1007" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG1126" class="apexcharts-yaxis" rel="0" transform="translate(15.359375, 0)"><g id="SvgjsG1127" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1129" font-family="Helvetica, Arial, sans-serif" x="20" y="31.5" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1130">100</tspan><title>100</title></text><text id="SvgjsText1132" font-family="Helvetica, Arial, sans-serif" x="20" y="85.66" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1133">80</tspan><title>80</title></text><text id="SvgjsText1135" font-family="Helvetica, Arial, sans-serif" x="20" y="139.82" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1136">60</tspan><title>60</title></text><text id="SvgjsText1138" font-family="Helvetica, Arial, sans-serif" x="20" y="193.98" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1139">40</tspan><title>40</title></text><text id="SvgjsText1141" font-family="Helvetica, Arial, sans-serif" x="20" y="248.14" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1142">20</tspan><title>20</title></text><text id="SvgjsText1144" font-family="Helvetica, Arial, sans-serif" x="20" y="302.3" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1145">0</tspan><title>0</title></text></g></g><g id="SvgjsG1003" class="apexcharts-inner apexcharts-graphical" transform="translate(45.359375, 30)"><defs id="SvgjsDefs1002"><clipPath id="gridRectMaskigeviswgl"><rect id="SvgjsRect1012" width="611.640625" height="272.8" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskigeviswgl"></clipPath><clipPath id="nonForecastMaskigeviswgl"></clipPath><clipPath id="gridRectMarkerMaskigeviswgl"><rect id="SvgjsRect1013" width="653.640625" height="318.8" x="-24" y="-24" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><linearGradient id="SvgjsLinearGradient1031" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop1032" stop-opacity="0.3" stop-color="rgba(65,84,241,0.3)" offset="0"></stop><stop id="SvgjsStop1033" stop-opacity="0.4" stop-color="rgba(255,255,255,0.4)" offset="0.9"></stop><stop id="SvgjsStop1034" stop-opacity="0.4" stop-color="rgba(255,255,255,0.4)" offset="1"></stop></linearGradient><linearGradient id="SvgjsLinearGradient1053" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop1054" stop-opacity="0.3" stop-color="rgba(46,202,106,0.3)" offset="0"></stop><stop id="SvgjsStop1055" stop-opacity="0.4" stop-color="rgba(255,255,255,0.4)" offset="0.9"></stop><stop id="SvgjsStop1056" stop-opacity="0.4" stop-color="rgba(255,255,255,0.4)" offset="1"></stop></linearGradient><linearGradient id="SvgjsLinearGradient1075" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop1076" stop-opacity="0.3" stop-color="rgba(255,119,29,0.3)" offset="0"></stop><stop id="SvgjsStop1077" stop-opacity="0.4" stop-color="rgba(255,255,255,0.4)" offset="0.9"></stop><stop id="SvgjsStop1078" stop-opacity="0.4" stop-color="rgba(255,255,255,0.4)" offset="1"></stop></linearGradient></defs><line id="SvgjsLine1008" x1="232.4387019230769" y1="0" x2="232.4387019230769" y2="270.8" stroke="#b6b6b6" stroke-dasharray="3" stroke-linecap="butt" class="apexcharts-xcrosshairs" x="232.4387019230769" y="0" width="1" height="270.8" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><line id="SvgjsLine1085" x1="0" y1="271.8" x2="0" y2="277.8" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1086" x1="93.17548076923077" y1="271.8" x2="93.17548076923077" y2="277.8" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1087" x1="186.35096153846155" y1="271.8" x2="186.35096153846155" y2="277.8" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1088" x1="279.5264423076923" y1="271.8" x2="279.5264423076923" y2="277.8" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1089" x1="372.7019230769231" y1="271.8" x2="372.7019230769231" y2="277.8" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1090" x1="465.87740384615387" y1="271.8" x2="465.87740384615387" y2="277.8" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1091" x1="559.0528846153846" y1="271.8" x2="559.0528846153846" y2="277.8" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><g id="SvgjsG1081" class="apexcharts-grid"><g id="SvgjsG1082" class="apexcharts-gridlines-horizontal"><line id="SvgjsLine1093" x1="0" y1="54.160000000000004" x2="605.640625" y2="54.160000000000004" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1094" x1="0" y1="108.32000000000001" x2="605.640625" y2="108.32000000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1095" x1="0" y1="162.48000000000002" x2="605.640625" y2="162.48000000000002" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1096" x1="0" y1="216.64000000000001" x2="605.640625" y2="216.64000000000001" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line></g><g id="SvgjsG1083" class="apexcharts-gridlines-vertical"></g><line id="SvgjsLine1099" x1="0" y1="270.8" x2="605.640625" y2="270.8" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1098" x1="0" y1="1" x2="0" y2="270.8" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line></g><g id="SvgjsG1014" class="apexcharts-area-series apexcharts-plot-series"><g id="SvgjsG1015" class="apexcharts-series" seriesName="Sales" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath1035" d="M0 270.8L0 186.852C48.917127403846145 186.852 90.84609375 162.48000000000002 139.76322115384613 162.48000000000002C172.3746394230769 162.48000000000002 200.32728365384614 194.976 232.9387019230769 194.976C265.55012019230765 194.976 293.5027644230769 132.692 326.1141826923077 132.692C358.7256009615384 132.692 386.67824519230766 157.064 419.2896634615384 157.064C451.9010817307692 157.064 479.85372596153843 48.744 512.4651442307692 48.744C545.0765624999999 48.744 573.0292067307693 119.15199999999999 605.640625 119.15199999999999C605.640625 119.15199999999999 605.640625 119.15199999999999 605.640625 270.8M605.640625 119.15199999999999C605.640625 119.15199999999999 605.640625 119.15199999999999 605.640625 119.15199999999999 " fill="url(#SvgjsLinearGradient1031)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMaskigeviswgl)" pathTo="M 0 270.8 L 0 186.852C 48.917127403846145 186.852 90.84609375 162.48000000000002 139.76322115384613 162.48000000000002C 172.3746394230769 162.48000000000002 200.32728365384614 194.976 232.9387019230769 194.976C 265.55012019230765 194.976 293.5027644230769 132.692 326.1141826923077 132.692C 358.7256009615384 132.692 386.67824519230766 157.064 419.2896634615384 157.064C 451.9010817307692 157.064 479.85372596153843 48.744 512.4651442307692 48.744C 545.0765624999999 48.744 573.0292067307693 119.15199999999999 605.640625 119.15199999999999C 605.640625 119.15199999999999 605.640625 119.15199999999999 605.640625 270.8M 605.640625 119.15199999999999z" pathFrom="M -1 270.8 L -1 270.8 L 139.76322115384613 270.8 L 232.9387019230769 270.8 L 326.1141826923077 270.8 L 419.2896634615384 270.8 L 512.4651442307692 270.8 L 605.640625 270.8"></path><path id="SvgjsPath1036" d="M0 186.852C48.917127403846145 186.852 90.84609375 162.48000000000002 139.76322115384613 162.48000000000002C172.3746394230769 162.48000000000002 200.32728365384614 194.976 232.9387019230769 194.976C265.55012019230765 194.976 293.5027644230769 132.692 326.1141826923077 132.692C358.7256009615384 132.692 386.67824519230766 157.064 419.2896634615384 157.064C451.9010817307692 157.064 479.85372596153843 48.744 512.4651442307692 48.744C545.0765624999999 48.744 573.0292067307693 119.15199999999999 605.640625 119.15199999999999C605.640625 119.15199999999999 605.640625 119.15199999999999 605.640625 119.15199999999999 " fill="none" fill-opacity="1" stroke="#4154f1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMaskigeviswgl)" pathTo="M 0 186.852C 48.917127403846145 186.852 90.84609375 162.48000000000002 139.76322115384613 162.48000000000002C 172.3746394230769 162.48000000000002 200.32728365384614 194.976 232.9387019230769 194.976C 265.55012019230765 194.976 293.5027644230769 132.692 326.1141826923077 132.692C 358.7256009615384 132.692 386.67824519230766 157.064 419.2896634615384 157.064C 451.9010817307692 157.064 479.85372596153843 48.744 512.4651442307692 48.744C 545.0765624999999 48.744 573.0292067307693 119.15199999999999 605.640625 119.15199999999999" pathFrom="M -1 270.8 L -1 270.8 L 139.76322115384613 270.8 L 232.9387019230769 270.8 L 326.1141826923077 270.8 L 419.2896634615384 270.8 L 512.4651442307692 270.8 L 605.640625 270.8" fill-rule="evenodd"></path><g id="SvgjsG1016" class="apexcharts-series-markers-wrap" data:realIndex="0"><g id="SvgjsG1018" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1019" r="4" cx="0" cy="186.852" class="apexcharts-marker no-pointer-events wzauioueg" stroke="#ffffff" fill="#4154f1" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="0" j="0" index="0" default-marker-size="4"></circle><circle id="SvgjsCircle1020" r="4" cx="139.76322115384613" cy="162.48000000000002" class="apexcharts-marker no-pointer-events whskmjnt9j" stroke="#ffffff" fill="#4154f1" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="1" j="1" index="0" default-marker-size="4"></circle></g><g id="SvgjsG1021" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1022" r="4" cx="232.9387019230769" cy="194.976" class="apexcharts-marker no-pointer-events w9gyscbsq" stroke="#ffffff" fill="#4154f1" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="2" j="2" index="0" default-marker-size="4"></circle></g><g id="SvgjsG1023" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1024" r="4" cx="326.1141826923077" cy="132.692" class="apexcharts-marker no-pointer-events w9ejni8z9" stroke="#ffffff" fill="#4154f1" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="3" j="3" index="0" default-marker-size="4"></circle></g><g id="SvgjsG1025" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1026" r="4" cx="419.2896634615384" cy="157.064" class="apexcharts-marker no-pointer-events wral4trou" stroke="#ffffff" fill="#4154f1" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="4" j="4" index="0" default-marker-size="4"></circle></g><g id="SvgjsG1027" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1028" r="4" cx="512.4651442307692" cy="48.744" class="apexcharts-marker no-pointer-events wuxr5uslv" stroke="#ffffff" fill="#4154f1" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="5" j="5" index="0" default-marker-size="4"></circle></g><g id="SvgjsG1029" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1030" r="4" cx="605.640625" cy="119.15199999999999" class="apexcharts-marker no-pointer-events w76c11qun" stroke="#ffffff" fill="#4154f1" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="6" j="6" index="0" default-marker-size="4"></circle></g></g></g><g id="SvgjsG1037" class="apexcharts-series" seriesName="Revenue" data:longestSeries="true" rel="2" data:realIndex="1"><path id="SvgjsPath1057" d="M0 270.8L0 241.012C48.917127403846145 241.012 90.84609375 184.144 139.76322115384613 184.144C172.3746394230769 184.144 200.32728365384614 148.94 232.9387019230769 148.94C265.55012019230765 148.94 293.5027644230769 184.144 326.1141826923077 184.144C358.7256009615384 184.144 386.67824519230766 178.728 419.2896634615384 178.728C451.9010817307692 178.728 479.85372596153843 129.984 512.4651442307692 129.984C545.0765624999999 129.984 573.0292067307693 159.772 605.640625 159.772C605.640625 159.772 605.640625 159.772 605.640625 270.8M605.640625 159.772C605.640625 159.772 605.640625 159.772 605.640625 159.772 " fill="url(#SvgjsLinearGradient1053)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-area" index="1" clip-path="url(#gridRectMaskigeviswgl)" pathTo="M 0 270.8 L 0 241.012C 48.917127403846145 241.012 90.84609375 184.144 139.76322115384613 184.144C 172.3746394230769 184.144 200.32728365384614 148.94 232.9387019230769 148.94C 265.55012019230765 148.94 293.5027644230769 184.144 326.1141826923077 184.144C 358.7256009615384 184.144 386.67824519230766 178.728 419.2896634615384 178.728C 451.9010817307692 178.728 479.85372596153843 129.984 512.4651442307692 129.984C 545.0765624999999 129.984 573.0292067307693 159.772 605.640625 159.772C 605.640625 159.772 605.640625 159.772 605.640625 270.8M 605.640625 159.772z" pathFrom="M -1 270.8 L -1 270.8 L 139.76322115384613 270.8 L 232.9387019230769 270.8 L 326.1141826923077 270.8 L 419.2896634615384 270.8 L 512.4651442307692 270.8 L 605.640625 270.8"></path><path id="SvgjsPath1058" d="M0 241.012C48.917127403846145 241.012 90.84609375 184.144 139.76322115384613 184.144C172.3746394230769 184.144 200.32728365384614 148.94 232.9387019230769 148.94C265.55012019230765 148.94 293.5027644230769 184.144 326.1141826923077 184.144C358.7256009615384 184.144 386.67824519230766 178.728 419.2896634615384 178.728C451.9010817307692 178.728 479.85372596153843 129.984 512.4651442307692 129.984C545.0765624999999 129.984 573.0292067307693 159.772 605.640625 159.772C605.640625 159.772 605.640625 159.772 605.640625 159.772 " fill="none" fill-opacity="1" stroke="#2eca6a" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-area" index="1" clip-path="url(#gridRectMaskigeviswgl)" pathTo="M 0 241.012C 48.917127403846145 241.012 90.84609375 184.144 139.76322115384613 184.144C 172.3746394230769 184.144 200.32728365384614 148.94 232.9387019230769 148.94C 265.55012019230765 148.94 293.5027644230769 184.144 326.1141826923077 184.144C 358.7256009615384 184.144 386.67824519230766 178.728 419.2896634615384 178.728C 451.9010817307692 178.728 479.85372596153843 129.984 512.4651442307692 129.984C 545.0765624999999 129.984 573.0292067307693 159.772 605.640625 159.772" pathFrom="M -1 270.8 L -1 270.8 L 139.76322115384613 270.8 L 232.9387019230769 270.8 L 326.1141826923077 270.8 L 419.2896634615384 270.8 L 512.4651442307692 270.8 L 605.640625 270.8" fill-rule="evenodd"></path><g id="SvgjsG1038" class="apexcharts-series-markers-wrap" data:realIndex="1"><g id="SvgjsG1040" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1041" r="4" cx="0" cy="241.012" class="apexcharts-marker no-pointer-events wxvk5hdfc" stroke="#ffffff" fill="#2eca6a" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="0" j="0" index="1" default-marker-size="4"></circle><circle id="SvgjsCircle1042" r="4" cx="139.76322115384613" cy="184.144" class="apexcharts-marker no-pointer-events wz2v7c201j" stroke="#ffffff" fill="#2eca6a" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="1" j="1" index="1" default-marker-size="4"></circle></g><g id="SvgjsG1043" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1044" r="4" cx="232.9387019230769" cy="148.94" class="apexcharts-marker no-pointer-events wvgkwxjfj" stroke="#ffffff" fill="#2eca6a" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="2" j="2" index="1" default-marker-size="4"></circle></g><g id="SvgjsG1045" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1046" r="4" cx="326.1141826923077" cy="184.144" class="apexcharts-marker no-pointer-events w09rs6cg3" stroke="#ffffff" fill="#2eca6a" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="3" j="3" index="1" default-marker-size="4"></circle></g><g id="SvgjsG1047" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1048" r="4" cx="419.2896634615384" cy="178.728" class="apexcharts-marker no-pointer-events w52wx21mpf" stroke="#ffffff" fill="#2eca6a" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="4" j="4" index="1" default-marker-size="4"></circle></g><g id="SvgjsG1049" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1050" r="4" cx="512.4651442307692" cy="129.984" class="apexcharts-marker no-pointer-events wu6demnu7j" stroke="#ffffff" fill="#2eca6a" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="5" j="5" index="1" default-marker-size="4"></circle></g><g id="SvgjsG1051" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1052" r="4" cx="605.640625" cy="159.772" class="apexcharts-marker no-pointer-events wf7gbamts" stroke="#ffffff" fill="#2eca6a" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="6" j="6" index="1" default-marker-size="4"></circle></g></g></g><g id="SvgjsG1059" class="apexcharts-series" seriesName="Customers" data:longestSeries="true" rel="3" data:realIndex="2"><path id="SvgjsPath1079" d="M0 270.8L0 230.18C48.917127403846145 230.18 90.84609375 241.012 139.76322115384613 241.012C172.3746394230769 241.012 200.32728365384614 184.144 232.9387019230769 184.144C265.55012019230765 184.144 293.5027644230769 222.056 326.1141826923077 222.056C358.7256009615384 222.056 386.67824519230766 246.428 419.2896634615384 246.428C451.9010817307692 246.428 479.85372596153843 205.808 512.4651442307692 205.808C545.0765624999999 205.808 573.0292067307693 241.012 605.640625 241.012C605.640625 241.012 605.640625 241.012 605.640625 270.8M605.640625 241.012C605.640625 241.012 605.640625 241.012 605.640625 241.012 " fill="url(#SvgjsLinearGradient1075)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-area" index="2" clip-path="url(#gridRectMaskigeviswgl)" pathTo="M 0 270.8 L 0 230.18C 48.917127403846145 230.18 90.84609375 241.012 139.76322115384613 241.012C 172.3746394230769 241.012 200.32728365384614 184.144 232.9387019230769 184.144C 265.55012019230765 184.144 293.5027644230769 222.056 326.1141826923077 222.056C 358.7256009615384 222.056 386.67824519230766 246.428 419.2896634615384 246.428C 451.9010817307692 246.428 479.85372596153843 205.808 512.4651442307692 205.808C 545.0765624999999 205.808 573.0292067307693 241.012 605.640625 241.012C 605.640625 241.012 605.640625 241.012 605.640625 270.8M 605.640625 241.012z" pathFrom="M -1 270.8 L -1 270.8 L 139.76322115384613 270.8 L 232.9387019230769 270.8 L 326.1141826923077 270.8 L 419.2896634615384 270.8 L 512.4651442307692 270.8 L 605.640625 270.8"></path><path id="SvgjsPath1080" d="M0 230.18C48.917127403846145 230.18 90.84609375 241.012 139.76322115384613 241.012C172.3746394230769 241.012 200.32728365384614 184.144 232.9387019230769 184.144C265.55012019230765 184.144 293.5027644230769 222.056 326.1141826923077 222.056C358.7256009615384 222.056 386.67824519230766 246.428 419.2896634615384 246.428C451.9010817307692 246.428 479.85372596153843 205.808 512.4651442307692 205.808C545.0765624999999 205.808 573.0292067307693 241.012 605.640625 241.012C605.640625 241.012 605.640625 241.012 605.640625 241.012 " fill="none" fill-opacity="1" stroke="#ff771d" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-area" index="2" clip-path="url(#gridRectMaskigeviswgl)" pathTo="M 0 230.18C 48.917127403846145 230.18 90.84609375 241.012 139.76322115384613 241.012C 172.3746394230769 241.012 200.32728365384614 184.144 232.9387019230769 184.144C 265.55012019230765 184.144 293.5027644230769 222.056 326.1141826923077 222.056C 358.7256009615384 222.056 386.67824519230766 246.428 419.2896634615384 246.428C 451.9010817307692 246.428 479.85372596153843 205.808 512.4651442307692 205.808C 545.0765624999999 205.808 573.0292067307693 241.012 605.640625 241.012" pathFrom="M -1 270.8 L -1 270.8 L 139.76322115384613 270.8 L 232.9387019230769 270.8 L 326.1141826923077 270.8 L 419.2896634615384 270.8 L 512.4651442307692 270.8 L 605.640625 270.8" fill-rule="evenodd"></path><g id="SvgjsG1060" class="apexcharts-series-markers-wrap" data:realIndex="2"><g id="SvgjsG1062" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1063" r="4" cx="0" cy="230.18" class="apexcharts-marker no-pointer-events wbotaotk1k" stroke="#ffffff" fill="#ff771d" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="0" j="0" index="2" default-marker-size="4"></circle><circle id="SvgjsCircle1064" r="4" cx="139.76322115384613" cy="241.012" class="apexcharts-marker no-pointer-events wh7nu46c5" stroke="#ffffff" fill="#ff771d" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="1" j="1" index="2" default-marker-size="4"></circle></g><g id="SvgjsG1065" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1066" r="4" cx="232.9387019230769" cy="184.144" class="apexcharts-marker no-pointer-events wsgctmj6x" stroke="#ffffff" fill="#ff771d" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="2" j="2" index="2" default-marker-size="4"></circle></g><g id="SvgjsG1067" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1068" r="4" cx="326.1141826923077" cy="222.056" class="apexcharts-marker no-pointer-events wzsan2xpg" stroke="#ffffff" fill="#ff771d" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="3" j="3" index="2" default-marker-size="4"></circle></g><g id="SvgjsG1069" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1070" r="4" cx="419.2896634615384" cy="246.428" class="apexcharts-marker no-pointer-events wsur7lxyvh" stroke="#ffffff" fill="#ff771d" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="4" j="4" index="2" default-marker-size="4"></circle></g><g id="SvgjsG1071" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1072" r="4" cx="512.4651442307692" cy="205.808" class="apexcharts-marker no-pointer-events weezti4qz" stroke="#ffffff" fill="#ff771d" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="5" j="5" index="2" default-marker-size="4"></circle></g><g id="SvgjsG1073" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMaskigeviswgl)"><circle id="SvgjsCircle1074" r="4" cx="605.640625" cy="241.012" class="apexcharts-marker no-pointer-events whfki12kg" stroke="#ffffff" fill="#ff771d" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" rel="6" j="6" index="2" default-marker-size="4"></circle></g></g></g><g id="SvgjsG1017" class="apexcharts-datalabels" data:realIndex="0"></g><g id="SvgjsG1039" class="apexcharts-datalabels" data:realIndex="1"></g><g id="SvgjsG1061" class="apexcharts-datalabels" data:realIndex="2"></g></g><g id="SvgjsG1084" class="apexcharts-grid-borders"><line id="SvgjsLine1092" x1="0" y1="0" x2="605.640625" y2="0" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1097" x1="0" y1="270.8" x2="605.640625" y2="270.8" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1125" x1="0" y1="271.8" x2="605.640625" y2="271.8" stroke="#e0e0e0" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt"></line></g><line id="SvgjsLine1100" x1="0" y1="0" x2="605.640625" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1101" x1="0" y1="0" x2="605.640625" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1102" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1103" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"><text id="SvgjsText1105" font-family="Helvetica, Arial, sans-serif" x="0" y="299.8" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1106">00:00</tspan><title>00:00</title></text><text id="SvgjsText1108" font-family="Helvetica, Arial, sans-serif" x="93.17548076923077" y="299.8" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1109">01:00</tspan><title>01:00</title></text><text id="SvgjsText1111" font-family="Helvetica, Arial, sans-serif" x="186.35096153846155" y="299.8" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1112">02:00</tspan><title>02:00</title></text><text id="SvgjsText1114" font-family="Helvetica, Arial, sans-serif" x="279.5264423076923" y="299.8" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1115">03:00</tspan><title>03:00</title></text><text id="SvgjsText1117" font-family="Helvetica, Arial, sans-serif" x="372.7019230769231" y="299.8" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1118">04:00</tspan><title>04:00</title></text><text id="SvgjsText1120" font-family="Helvetica, Arial, sans-serif" x="465.87740384615387" y="299.8" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1121">05:00</tspan><title>05:00</title></text><text id="SvgjsText1123" font-family="Helvetica, Arial, sans-serif" x="559.0528846153846" y="299.8" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1124">06:00</tspan><title>06:00</title></text></g></g><g id="SvgjsG1146" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1147" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1148" class="apexcharts-point-annotations"></g><rect id="SvgjsRect1149" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-zoom-rect"></rect><rect id="SvgjsRect1150" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-selection-rect"></rect></g></svg><div class="apexcharts-tooltip apexcharts-theme-light" style="left: 293.298px; top: 189.144px;"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">19/09/18 02:30</div><div class="apexcharts-tooltip-series-group apexcharts-active" style="order: 1; display: flex;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(65, 84, 241);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">Sales: </span><span class="apexcharts-tooltip-text-y-value">28</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group apexcharts-active" style="order: 2; display: flex;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(46, 202, 106);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">Revenue: </span><span class="apexcharts-tooltip-text-y-value">45</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group apexcharts-active" style="order: 3; display: flex;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(255, 119, 29);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">Customers: </span><span class="apexcharts-tooltip-text-y-value">32</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light" style="left: 226.759px; top: 302.8px;"><div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px; min-width: 73.4062px;">19/09/18 02:30</div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div></div>

                  <script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: 'Sales',
                          data: [31, 40, 28, 51, 42, 82, 56],
                        }, {
                          name: 'Revenue',
                          data: [11, 32, 45, 32, 34, 52, 41]
                        }, {
                          name: 'Customers',
                          data: [15, 11, 32, 18, 9, 24, 11]
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          type: 'datetime',
                          categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
                        },
                        tooltip: {
                          x: {
                            format: 'dd/MM/yy HH:mm'
                          },
                        }
                      }).render();
                    });
                  </script>
                  <!-- End Line Chart -->

                </div>

              </div>
            </div><!-- End Reports -->

            <!-- Recent Sales -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Recent Sales <span>| Today</span></h5>

                  <div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns"><div class="datatable-top">
    <div class="datatable-dropdown">
            <label>
                <select class="datatable-selector"><option value="5">5</option><option value="10" selected="">10</option><option value="15">15</option><option value="20">20</option><option value="25">25</option></select> entries per page
            </label>
        </div>
    <div class="datatable-search">
            <input class="datatable-input" placeholder="Search..." type="search" title="Search within table">
        </div>
</div>
<div class="datatable-container"><table class="table table-borderless datatable datatable-table"><thead><tr><th data-sortable="true" style="width: 10.909090909090908%;"><a href="#" class="datatable-sorter">#</a></th><th data-sortable="true" style="width: 23.939393939393938%;"><a href="#" class="datatable-sorter">Customer</a></th><th data-sortable="true" style="width: 40.15151515151515%;"><a href="#" class="datatable-sorter">Product</a></th><th data-sortable="true" style="width: 9.848484848484848%;"><a href="#" class="datatable-sorter">Price</a></th><th data-sortable="true" style="width: 15.151515151515152%;"><a href="#" class="datatable-sorter">Status</a></th></tr></thead><tbody><tr data-index="0"><td><a href="#">#2457</a></td><td>Brandon Jacob</td><td><a href="#" class="text-primary">At praesentium minu</a></td><td>$64</td><td><span class="badge bg-success">Approved</span></td></tr><tr data-index="1"><td><a href="#">#2147</a></td><td>Bridie Kessler</td><td><a href="#" class="text-primary">Blanditiis dolor omnis similique</a></td><td>$47</td><td><span class="badge bg-warning">Pending</span></td></tr><tr data-index="2"><td><a href="#">#2049</a></td><td>Ashleigh Langosh</td><td><a href="#" class="text-primary">At recusandae consectetur</a></td><td>$147</td><td><span class="badge bg-success">Approved</span></td></tr><tr data-index="3"><td><a href="#">#2644</a></td><td>Angus Grady</td><td><a href="#" class="text-primar">Ut voluptatem id earum et</a></td><td>$67</td><td><span class="badge bg-danger">Rejected</span></td></tr><tr data-index="4"><td><a href="#">#2644</a></td><td>Raheem Lehner</td><td><a href="#" class="text-primary">Sunt similique distinctio</a></td><td>$165</td><td><span class="badge bg-success">Approved</span></td></tr></tbody></table></div>
<div class="datatable-bottom">
    <div class="datatable-info">Showing 1 to 5 of 5 entries</div>
    <nav class="datatable-pagination"><ul class="datatable-pagination-list"></ul></nav>
</div></div>

                </div>

              </div>
            </div><!-- End Recent Sales -->

            <!-- Top Selling -->
            <div class="col-12">
              <div class="card top-selling overflow-auto">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body pb-0">
                  <h5 class="card-title">Top Selling <span>| Today</span></h5>

                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th scope="col">Preview</th>
                        <th scope="col">Product</th>
                        <th scope="col">Price</th>
                        <th scope="col">Sold</th>
                        <th scope="col">Revenue</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"><a href="#"><img src="assets/img/product-1.jpg" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">Ut inventore ipsa voluptas nulla</a></td>
                        <td>$64</td>
                        <td class="fw-bold">124</td>
                        <td>$5,828</td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#"><img src="assets/img/product-2.jpg" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">Exercitationem similique doloremque</a></td>
                        <td>$46</td>
                        <td class="fw-bold">98</td>
                        <td>$4,508</td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#"><img src="assets/img/product-3.jpg" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">Doloribus nisi exercitationem</a></td>
                        <td>$59</td>
                        <td class="fw-bold">74</td>
                        <td>$4,366</td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#"><img src="assets/img/product-4.jpg" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">Officiis quaerat sint rerum error</a></td>
                        <td>$32</td>
                        <td class="fw-bold">63</td>
                        <td>$2,016</td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#"><img src="assets/img/product-5.jpg" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">Sit unde debitis delectus repellendus</a></td>
                        <td>$79</td>
                        <td class="fw-bold">41</td>
                        <td>$3,239</td>
                      </tr>
                    </tbody>
                  </table>

                </div>

              </div>
            </div><!-- End Top Selling -->

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

          <!-- Recent Activity -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body">
              <h5 class="card-title">Recent Activity <span>| Today</span></h5>

              <div class="activity">

                <div class="activity-item d-flex">
                  <div class="activite-label">32 min</div>
                  <i class="bi bi-circle-fill activity-badge text-success align-self-start"></i>
                  <div class="activity-content">
                    Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo officiis</a> beatae
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">56 min</div>
                  <i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>
                  <div class="activity-content">
                    Voluptatem blanditiis blanditiis eveniet
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 hrs</div>
                  <i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>
                  <div class="activity-content">
                    Voluptates corrupti molestias voluptatem
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">1 day</div>
                  <i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>
                  <div class="activity-content">
                    Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati voluptatem</a> tempore
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 days</div>
                  <i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>
                  <div class="activity-content">
                    Est sit eum reiciendis exercitationem
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">4 weeks</div>
                  <i class="bi bi-circle-fill activity-badge text-muted align-self-start"></i>
                  <div class="activity-content">
                    Dicta dolorem harum nulla eius. Ut quidem quidem sit quas
                  </div>
                </div><!-- End activity item-->

              </div>

            </div>
          </div><!-- End Recent Activity -->

          <!-- Budget Report -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body pb-0">
              <h5 class="card-title">Budget Report <span>| This Month</span></h5>

              <div id="budgetChart" style="min-height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);" class="echart" _echarts_instance_="ec_1686890875002"><div style="position: relative; width: 298px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="596" height="800" style="position: absolute; left: 0px; top: 0px; width: 298px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                    legend: {
                      data: ['Allocated Budget', 'Actual Spending']
                    },
                    radar: {
                      // shape: 'circle',
                      indicator: [{
                          name: 'Sales',
                          max: 6500
                        },
                        {
                          name: 'Administration',
                          max: 16000
                        },
                        {
                          name: 'Information Technology',
                          max: 30000
                        },
                        {
                          name: 'Customer Support',
                          max: 38000
                        },
                        {
                          name: 'Development',
                          max: 52000
                        },
                        {
                          name: 'Marketing',
                          max: 25000
                        }
                      ]
                    },
                    series: [{
                      name: 'Budget vs spending',
                      type: 'radar',
                      data: [{
                          value: [4200, 3000, 20000, 35000, 50000, 18000],
                          name: 'Allocated Budget'
                        },
                        {
                          value: [5000, 14000, 28000, 26000, 42000, 21000],
                          name: 'Actual Spending'
                        }
                      ]
                    }]
                  });
                });
              </script>

            </div>
          </div><!-- End Budget Report -->

          <!-- Website Traffic -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body pb-0">
              <h5 class="card-title">Website Traffic <span>| Today</span></h5>

              <div id="trafficChart" style="min-height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); position: relative;" class="echart" _echarts_instance_="ec_1686890875003"><div style="position: relative; width: 298px; height: 400px; padding: 0px; margin: 0px; border-width: 0px;"><canvas data-zr-dom-id="zr_0" width="596" height="800" style="position: absolute; left: 0px; top: 0px; width: 298px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div class=""></div></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: 1048,
                          name: 'Search Engine'
                        },
                        {
                          value: 735,
                          name: 'Direct'
                        },
                        {
                          value: 580,
                          name: 'Email'
                        },
                        {
                          value: 484,
                          name: 'Union Ads'
                        },
                        {
                          value: 300,
                          name: 'Video Ads'
                        }
                      ]
                    }]
                  });
                });
              </script>

            </div>
          </div><!-- End Website Traffic -->

          <!-- News & Updates Traffic -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body pb-0">
              <h5 class="card-title">News &amp; Updates <span>| Today</span></h5>

              <div class="news">
                <div class="post-item clearfix">
                  <img src="assets/img/news-1.jpg" alt="">
                  <h4><a href="#">Nihil blanditiis at in nihil autem</a></h4>
                  <p>Sit recusandae non aspernatur laboriosam. Quia enim eligendi sed ut harum...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/news-2.jpg" alt="">
                  <h4><a href="#">Quidem autem et impedit</a></h4>
                  <p>Illo nemo neque maiores vitae officiis cum eum turos elan dries werona nande...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/news-3.jpg" alt="">
                  <h4><a href="#">Id quia et et ut maxime similique occaecati ut</a></h4>
                  <p>Fugiat voluptas vero eaque accusantium eos. Consequuntur sed ipsam et totam...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/news-4.jpg" alt="">
                  <h4><a href="#">Laborum corporis quo dara net para</a></h4>
                  <p>Qui enim quia optio. Eligendi aut asperiores enim repellendusvel rerum cuder...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/news-5.jpg" alt="">
                  <h4><a href="#">Et dolores corrupti quae illo quod dolor</a></h4>
                  <p>Odit ut eveniet modi reiciendis. Atque cupiditate libero beatae dignissimos eius...</p>
                </div>

              </div><!-- End sidebar recent posts-->

            </div>
          </div><!-- End News & Updates -->

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main>


 <%@include file= "./../common/admin_footer.jsp" %>