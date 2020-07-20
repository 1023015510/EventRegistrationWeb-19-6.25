<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeFile="ViewData.aspx.cs" Inherits="EventRegistrationWeb.ViewData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #mapbox #map {
            width: 665px;
            height: 680px;
            border: 1px solid #C1C1C1;
        }

        .style1 {
            width: 43px;
        }

        .style2 {
            width: 209px;
        }

        .style3 {
            width: 196px;
        }

        #Text1 {
            width: 90px;
        }

        .style4 {
            width: 652px;
        }

        .style5 {
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        function openwin1() { window.open("Registration.aspx") }
        function openwin2() {
            var browserName = navigator.appName;
            if (browserName == "Netscape") {
                location.replace("about:blank");
            } else {
                window.close();
            }
        }
    </script>

    <script type="text/javascript">

        var map, markerOld, marker, markerStart, markerEnd, markerStartOld = null, markerEndOld = null;
        var pointStart, pointEnd, driving, drivingOld, polyline, polylineOld;
        var currentLat, currentLon, point, currentOriLat, currentOriLatDeg, currentOriLatScore, currentOriLon, currentOriLonDeg, currentOriLonScore;
        var currentEndLat, currentEndLatDeg, currentEndLatScore, currentEndLon, currentEndLonDeg, currentEndLogScore;
        var oldOriLon = null, oldOriLat = null, oldEndLat = null, oldEndLon = null;
        var myIconL, myIconR, searchRoute, searchRouteOld = null, myIcolStart, myIconEnd;
        var bFocuse = 1;
        function initialize() {
            map = new BMap.Map("map"); // 创建地图实例
            map.centerAndZoom(new BMap.Point(121.491, 31.233), 11);

            ////
            map.addControl(new BMap.NavigationControl()); // 添加平移缩放控件【国、省、市】
            map.addControl(new BMap.ScaleControl());     // 添加比例尺控件
            map.addControl(new BMap.OverviewMapControl()); //添加缩略地图控件
            map.enableScrollWheelZoom();//启用滚轮放大缩小  
            //map.enableContinuousZoom(); // 开启连续缩放效果  
            map.addControl(new BMap.MapTypeControl()); //添加地图类型控件【地图、卫星、三维】  
            myIconL = new BMap.Icon("res/L.png", new BMap.Size(72, 72)); //更改图标var driving = null;
            myIconR = new BMap.Icon("res/R.png", new BMap.Size(72, 72));
            myIconStart = new BMap.Icon("res/Start.bmp", new BMap.Size(72, 72));
            myIconEnd = new BMap.Icon("res/End.bmp", new BMap.Size(72, 72));
            /*var pointStart = new BMap.Point(114.912129, 22.512642); //(113.92983, 22.509397); // 创建点坐标   地址 蛇口沃尔玛
            var pointEnd = new BMap.Point(114.712129, 22.512642); //
            //driving = new BMap.DrivingRoute(map, {renderOptions: {map: map}}); //{ renderOptions: { map: map, panel: "r-result", autoViewport: false} });
      
            var driving = new BMap.DrivingRoute(map, { renderOptions: { map: map, autoViewport: true },
                onPolylinesSet: function (routes) {
                    searchRoute = routes[0].getPolyline(); //导航路线  12.19-16:00
                    //map.addOverlay(searchRoute);
                    map.removeOverlay(searchRoute);
                },
                onMarkersSet: function (routes) {
                    //map.removeOverlay(routes[0].marker); //删除起点
                    //map.removeOverlay(routes[1].marker); //删除终点
                }
            });
            driving.search(pointStart, pointEnd);*/
            ////
            updateMap();
            setInterval(updateMap, 3000);
            setInterval(updaateSignle, 100);
        }

        function loadScript() {
            var script = document.createElement("script");
            script.src = src = "http://api.map.baidu.com/api?v=1.3&callback=initialize"; //此为v1.4版本及以前版本的引用方式  
            document.body.appendChild(script);
        }

        function updaateSignle() {

            //添加监听标注事情 19-1.4
            marker.addEventListener("click", function () {
                //alert("监听标注事情11");

            });

            //添加地图缩放监听事情
            map.addEventListener("zoomend", function () {
                //alert("地图缩放事情");
                bFocuse = 0;
            });

            //添加鼠标单击监听事件
            map.addEventListener("click", function () {
                //alert("鼠标单击事情");
                bFocuse = 1;
            });

            //添加监听鼠标平移事情(鼠标拖动地图监听事情)
            map.addEventListener("dragend", function () {
                //alert("鼠标平移事情");
                bFocuse = 0;
            });

            //添加监听鼠标双击事情  dblclick
            map.addEventListener("dblclick", function () {
                //alert("鼠标双击事情");
                bFocuse = 0;
            });
            /////

        }
        function updateMap() {

            ////DDDD 1
            //var pointStart = new BMap.Point(114.912129,22.512642); //(113.92983, 22.509397); // 创建点坐标   地址 蛇口沃尔玛
            //var pointEnd = new BMap.Point(114.712129,22.512642);// (113.942129, 22.522642); //地址 海岸城
            //map.centerAndZoom(pointStart, 15);
            //addMarker(pointStart, "蛇口沃尔玛", "地址：工业大道和东滨路交汇处<br/>电话：(0755)26816711");        // 创建标注1  
            //addMarker(pointEnd, "海岸城购物中心", "地址：文心五路33号海岸城东座212号<br/>电话：(0755)86125888");        // 创建标注2  
            //map.SetC
            //开始测距		
            //var polyline = new BMap.Polyline([pointStart, pointEnd], { strokeColor: "orange", strokeWeight: 6, strokeOpacity: 0.5 });  //定义折线
            //map.addOverlay(polyline);     //添加折线到地图上

            //var driving = null;

            //driving = new BMap.DrivingRoute(map, { renderOptions: { map: map, panel: "r-result", autoViewport: true} });

            //driving.search(pointStart, pointEnd);

            ////DDDD 2

            currentLat = document.getElementById("lbLatitude").innerText;
            currentLon = document.getElementById("lbLongitude").innerText;
            //currentOriLon = document.getElementById("lbOriLongitude").innerText;
            //currentOriLat = document.getElementById("lbOriLatitude").innerText;
            currentOriLonDeg = document.getElementById("lbOriLongitudeDeg").innerText;
            currentOriLonScore = document.getElementById("lbOriLongitudeScore").innerText;
            currentOriLatDeg = document.getElementById("lbOriLatitudeDeg").innerText;
            currentOriLatScore = document.getElementById("lbOriLatitudeScore").innerText;
            currentOriLon = currentOriLonDeg + "." + currentOriLonScore;
            currentOriLat = currentOriLatDeg + "." + currentOriLatScore;
            //alert(currentOriLon + "," + currentOriLat);
            //currentEndLon = document.getElementById("lbEndLongitude").innerText;
            //currentEndLat = document.getElementById("lbEndLatitude").innerText;
            currentEndLonDeg = document.getElementById("lbEndLongitudeDeg").innerText;
            currentEndLonScore = document.getElementById("lbEndLongitudeScore").innerText;
            currentEndLatDeg = document.getElementById("lbEndLatitudeDeg").innerText;
            currentEndLatScore = document.getElementById("lbEndLatitudeScore").innerText;
            currentEndLon = currentEndLonDeg + "." + currentEndLonScore;
            currentEndLat = currentEndLatDeg + "." + currentEndLatScore;

            if (oldOriLon == null) {

                pointStart = new BMap.Point(currentOriLon, currentOriLat);
                pointEnd = new BMap.Point(currentEndLon, currentEndLat);
                markerStart = new BMap.Marker(pointStart, { icon: myIconStart });
                markerEnd = new BMap.Marker(pointEnd, { icon: myIconEnd });
                map.addOverlay(markerStart);
                map.addOverlay(markerEnd);
            }

            point = new BMap.Point(currentLon, currentLat); // 创建点坐标
            if (bFocuse) {
                map.centerAndZoom(point, 12); // 初始化地图
            }
            if (oldOriLon != null) {
                if (currentLon > oldOriLon) {
                    marker = new BMap.Marker(point, { icon: myIconR });
                }
                else {
                    marker = new BMap.Marker(point, { icon: myIconL });
                }

                if ((oldOriLon != currentOriLon) || (oldOriLat != currentOriLat) || (oldEndLon != currentEndLon) || (oldEndLat != currentEndLat)) {

                    if (markerStartOld != null) {
                        map.removeOverlay(markerStartOld);
                        map.removeOverlay(markerEndOld);
                        markerStartOld.dispose();
                        markerEndOld.dispose();
                    }
                    pointStart = new BMap.Point(currentOriLon, currentOriLat);
                    pointEnd = new BMap.Point(currentEndLon, currentEndLat);
                    markerStart = new BMap.Marker(pointStart, { icon: myIconStart });
                    markerEnd = new BMap.Marker(pointEnd, { icon: myIconEnd });
                    map.addOverlay(markerStart);
                    map.addOverlay(markerEnd);

                    /*pointStart = new BMap.Point(currentOriLon, currentOriLat);
                    pointEnd = new BMap.Point(currentEndLon, currentEndLat);
                    driving = new BMap.DrivingRoute(map, { renderOptions: { map: map, autoViewport: true },
                    onPolylinesSet: function (routes) {
                    searchRoute = routes[0].getPolyline(); //导航路线  12.19-16:00
                    map.removeOverlay(searchRoute);
                    //searchRoute.dispose();
                    },
                    onMarkersSet: function (routes) {
                    //map.removeOverlay(routes[0].marker); //删除起点
                    //map.removeOverlay(routes[1].marker); //删除终点
                    map.addOverlay(routes[0].marker);
                    map.addOverlay(routes[1].marker);
                    }
                    });
    
                    if (drivingOld != null) {
                    map.removeOverlay(drivingOld);
                    drivingOld.dispose();
                    }
                    driving.search(pointStart, pointEnd);*/
                }

                //添加两GPS坐标之间直线  19-1.3
                polyline = new BMap.Polyline([
                    new BMap.Point(currentLon, currentLat), //起始点的经纬度
                    new BMap.Point(currentEndLon, currentEndLat)//终止点的经纬度
                ], {
                    strokeColor: "red", //设置颜色 
                    strokeWeight: 5, //宽度
                    strokeOpacity: 0.7
                }); //透明度

                if (polylineOld != null) {
                    map.removeOverlay(polylineOld); //删除旧连线
                    polylineOld.dispose();          //释放旧线内存资源
                }
                map.addOverlay(polyline); //添加折线到地图上

                //
                if (markerOld != null) {
                    map.removeOverlay(markerOld); //删除旧标志
                    markerOld.dispose(); //释放旧标志所占内存资源
                }
                map.addOverlay(marker); // 将标注添加到地图
                marker.setAnimation(BMAP_ANIMATION_BOUNCE); // 跳动的动画
            }
            markerStartOld = markerStart;
            markerEndOld = markerEnd;
            drivingOld = driving;
            searchRouteOld = searchRoute;
            markerOld = marker;
            polylineOld = polyline;
            oldOriLat = currentOriLat;
            oldOriLon = currentOriLon;
            oldEndLat = currentEndLat;
            oldEndLon = currentEndLon;
        }

        //网页加载完毕时会触发一个onload事件 ,所以我们可以利用onload事件来加载这个函数。Onload事件与window对象相关联。如： 
        //window.onload = loadScript; //
        window.onload = function () {
            loadScript();
            //updateMap();
            //setInterval(updateMap, 4000);
        }

    </script>
    <%-- <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ui7X2CSu3ITjojARL4tILi5W1i9gkDVS"></script>--%>

    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="1340px" style="height: 70" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5F5F5">
                <tr>
                    <td>
                        <img src="img/3.png" width="500" height="80" alt="" /></td>

                    <td width="302px" height="70">

                        <table width="302px" bgcolor="#F5F5F5" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="151px" height="31"><a id="A1" href="Registration.aspx" runat="server">
                                    <img src="img/returnLogin.jpg" width="94px" height="31" /></a> </td>
                                <td width="151px" height="31"><a onclick="openwin2()">
                                    <img src="img/23.jpg" width="94px" height="31" alt="" /></a></td>
                            </tr>
                        </table>
                    </td>

                </tr>
            </table>
            <%--船舶能耗系统， 标题栏--%>
            <%--1111 --%>

            <table width="1340px" style="height: 70" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <img src="img/12.jpg" width="1340px" height="39" alt="" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="img/10.jpg" width="1340px" height="16" alt="" />
                    </td>
                </tr>
                <%--添加地图--%>
                <tr>
                    <td>
                        <table width="1340px" style="height: 700" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="1340px" height="700">
                                    <div id="mapbox">
                                        <table style="margin-left: 5px; margin-right: 10px;">
                                            <tr>
                                                <td width="1340px">
                                                    <table style="margin: 0 5px; font-size: medium;">
                                                        <tr>
                                                            <td width="435px"><strong>作业实时监视</strong></td>
                                                            <%--<td width="225px"><input type="text" id="searchtext" /> <input type="button" value="搜索" id="searchbt" onclick="serachlocal()"/></td><%--<td  width="70px">位置监视</td>--%>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="1340px" height="3">
                                                    <img src="img/8.jpg" width="665px" height="3" style="padding-left: 4px" alt="" /></td>
                                            </tr>
                                            <tr>
                                                <td width="670px" height="680">
                                                    <table style="margin-top: 13px">
                                                        <tr>
                                                            <td>
                                                                <div id="map">
                                                                    <%--<iframe id="markPage" style="width: 665px;height: 680px;" frameborder=0 src="https://apis.map.qq.com/tools/geolocation?key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77&referer=myapp&effect=zoom"></iframe>--%>
                                                                    <img src="img/25.jpg" width="665px" height="680px" alt="" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                                <%--第二列   船舶状态参数 属性 开始 --%>
                                <td class="style4">
                                    <table width="295px" height="770" bgcolor="#FAFAFA" style="padding: 15px; border: 1px solid #F0F0F0;">
                                        <tr>
                                            <td height="23"><strong>&nbsp;船舶状态参数</strong></td>
                                        </tr>
                                        <tr>
                                            <td height="3">
                                                <img src="img/21.jpg" width="260px" height="3" /></td>
                                        </tr>
                                        <tr>
                                            <td height="210">
                                                <table>
                                                    <tr>
                                                        <td width="75px">
                                                            <img src="img/5.jpg" width="45px" height="45px" /></td>
                                                        <td>
                                                            <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server" AsyncPostBackTimeout="0"></asp:ScriptManager>
                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                                                                <ContentTemplate>
                                                                    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick">
                                                                    </asp:Timer>

                                                                    <table height="190" width="180px" style="font-size: small">

                                                                        <tr>
                                                                            <td>左机转速(rpm)<span style="float: right; width: 70px;"><asp:Label ID="lbLeftMachineSpeed" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none">
                                                                            <td class="style5">建议转速2(rpm)<span style="float: right; width: 70px;"><asp:Label ID="lblSuggestSpeed2" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>右机转速(rpm)<span style="float: right; width: 70px;"><asp:Label ID="lbRightMachineSpeed" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none">
                                                                            <td>建议纵倾角(o)<span style="float: right; width: 70px;"><asp:Label ID="lblSuggestdPitch" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none">
                                                                            <td>实际纵倾角(o)<span style="float: right; width: 70px;"><asp:Label ID="lblRealdPitch" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>航行速度(km/h)<span style="float: right; width: 70px;"><asp:Label ID="lbSailingSpeed" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>左推进功率(kw)<span style="float: right; width: 70px;"><asp:Label ID="lbLeftPushPower" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>右推进功率(kw)<span style="float: right; width: 70px;"><asp:Label ID="lbRightPushPower" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>累计距离(km)<span style="float: right; width: 70px;"><asp:Label ID="lbTotalDis" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>

                                                                    </table>
                                                                </ContentTemplate>

                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <%--第2列   船舶状态参数 属性 结束--%>
                                        <%--第2列 能效参数属性 --%>

                                        <tr>
                                            <td height="23"><strong>&nbsp;能效参数</strong></td>
                                        </tr>
                                        <tr>
                                            <td height="3">
                                                <img src="img/21.jpg" width="260px" height="3" /></td>
                                        </tr>
                                        <tr>
                                            <td height="295">
                                                <table>
                                                    <tr>
                                                        <td class="style1">
                                                            <img src="img/6.jpg" width="45px" height="45px" /></td>
                                                        <td class="style2">
                                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                <ContentTemplate>
                                                                    <table height="280" width="210px" style="font-size: small;">

                                                                        <tr>
                                                                            <td class="style3">全船瞬时油耗(Kg/h)<span style="float: right; width: 70px;"><asp:Label ID="lbFastOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">全船累计油耗(Kg)<span style="float: right; width: 70px;"><asp:Label ID="lbTotalOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none">
                                                                            <td class="style3">左推瞬时油耗(Kg/h)<span style="float: right; width: 70px;"><asp:Label ID="lbLeftFastOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none">
                                                                            <td class="style3">左推累计油耗(Kg)<span style="float: right; width: 70px;"><asp:Label ID="lbLeftTotalOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none">
                                                                            <td class="style3">右推瞬时油耗(Kg/h)<span style="float: right; width: 70px;"><asp:Label ID="lbRightFastOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none">
                                                                            <td class="style3">右推累计油耗(Kg)<span style="float: right; width: 70px;"><asp:Label ID="lbRightTotalOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">其它瞬时油耗(Kg/h)<span style="float: right; width: 70px;"><asp:Label ID="lbOtherFastOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">其它累计油耗(Kg)<span style="float: right; width: 70px;"><asp:Label ID="lbOtherTotalOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG1瞬时油耗(Kg/h)<span style="float: right; width: 70px;"><asp:Label ID="lbDG1FastOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG1累计油耗(Kg)<span style="float: right; width: 70px;"><asp:Label ID="lbDG1TotalOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG2瞬时油耗(Kg/h)<span style="float: right; width: 70px;"><asp:Label ID="lbDG2FastOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG2累计油耗(Kg)<span style="float: right; width: 70px;"><asp:Label ID="lbDG2TotalOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG3瞬时油耗(Kg/h)<span style="float: right; width: 70px;"><asp:Label ID="lbDG3FastOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG3累计油耗(Kg)<span style="float: right; width: 70px;"><asp:Label ID="lbDG3TotalOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG4瞬时油耗(Kg/h)<span style="float: right; width: 70px;"><asp:Label ID="lbDG4FastOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG4累计油耗(Kg)<span style="float: right; width: 70px;"><asp:Label ID="lbDG4TotalOil" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">左推瞬时耗电量(Kw/h)<span style="float: right; width: 70px;"><asp:Label ID="lbLeftFastElect" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">左推总耗电量(Kw/h)<span style="float: right; width: 70px;"><asp:Label ID="lbLeftTotalElect" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">右推瞬时耗电量(Kw/h)<span style="float: right; width: 70px;"><asp:Label ID="lbRightFastElect" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">右推总耗电量(Kw/h)<span style="float: right; width: 70px;"><asp:Label ID="lbRightTotalElect" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">其它瞬时耗电量(Kw/h)<span style="float: right; width: 70px;"><asp:Label ID="lbOtherFastElect" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">其它总耗电量(Kw/h)<span style="float: right; width: 70px;"><asp:Label ID="lbOtherTotalElect" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">EEOI<span style="float: right; width: 70px;"><asp:Label ID="lbEEOI" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>

                                                                    </table>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <%--第2列 能效参数属性 结束 --%>
                                    </table>
                                </td>

                                <%-- 第三列电能耗 属性 开始 --%>

                                <td class="style4">
                                    <table width="100px" height="770" bgcolor="#FAFAFA" style="padding: 15px; border: 1px solid #F0F0F0;">
                                        <tr>
                                            <td height="23"><strong>&nbsp;电效参数</strong></td>
                                        </tr>
                                        <tr>
                                            <td height="3">
                                                <img src="img/21.jpg" width="270px" height="3" /></td>
                                        </tr>
                                        <tr>
                                            <td height="210">
                                                <table>
                                                    <tr>
                                                        <%-- <td width="75px"><img src="img/5.jpg" width="45px" height="45px" /></td> --%>
                                                        <td>
                                                            <%--<asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager> --%>
                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                                <ContentTemplate>
                                                                    <table height="190" width="230px" style="font-size: small">

                                                                        <tr>
                                                                            <td class="style3">DG1运行时间(h)<span style="float: right; width: 70px;"><asp:Label ID="lbDG1TotalTime" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG1电压(V)<span style="float: right; width: 70px;"><asp:Label ID="lbDG1Voltage" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG1电流(A)<span style="float: right; width: 70px;"><asp:Label ID="lbDG1Current" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG1功率(KW)<span style="float: right; width: 70px;"><asp:Label ID="lbDG1Power" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG2运行时间(h)<span style="float: right; width: 70px;"><asp:Label ID="lbDG2TotalTime" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG2电压(V)<span style="float: right; width: 70px;"><asp:Label ID="lbDG2Voltage" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG2电流(A)<span style="float: right; width: 70px;"><asp:Label ID="lbDG2Current" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG2功率(KW)<span style="float: right; width: 70px;"><asp:Label ID="lbDG2Power" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG3运行时间(h)<span style="float: right; width: 70px;"><asp:Label ID="lbDG3TotalTime" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG3电压(V)<span style="float: right; width: 70px;"><asp:Label ID="lbDG3Voltage" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG3电流(A)<span style="float: right; width: 70px;"><asp:Label ID="lbDG3Current" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG2功率(KW)<span style="float: right; width: 70px;"><asp:Label ID="lbDG3Power" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG4运行时间(h)<span style="float: right; width: 70px;"><asp:Label ID="lbDG4TotalTime" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG4电压(V)<span style="float: right; width: 70px;"><asp:Label ID="lbDG4Voltage" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG4电流(A)<span style="float: right; width: 70px;"><asp:Label ID="lbDG4Current" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG4功率(KW)<span style="float: right; width: 70px;"><asp:Label ID="lbDG4Power" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td class="style3">左舷直流母排电压(V)<span style="float: right; width: 70px;"><asp:Label ID="lbMAVoltage" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">右舷直流母排电压(V)<span style="float: right; width: 70px;"><asp:Label ID="lbMBVoltage" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">1#电容荷电状态<span style="float: right; width: 70px;"><asp:Label ID="lbNO1CapacitiveState" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">1#电容电压(V)<span style="float: right; width: 70px;"><asp:Label ID="lbNO1Voltage" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">2#电容荷电状态<span style="float: right; width: 70px;"><asp:Label ID="lbNO2CapacitiveState" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">2#电容电压(V)<span style="float: right; width: 70px;"><asp:Label ID="lbNO2Voltage" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td class="style3">左机建议转速(rpm)<span style="float: right; width: 70px;"><asp:Label ID="lbLeftMachAdviceSpeed" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">右机建议转速(rpm)<span style="float: right; width: 70px;"><asp:Label ID="lbRMachAdviceSpeed" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">建议运行发电机数量<span style="float: right; width: 70px;"><asp:Label ID="lbAdviceCounts" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG1建议输出功率(Kw)<span style="float: right; width: 70px;"><asp:Label ID="lbAdviceDG1Power" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG2建议输出功率(Kw)<span style="float: right; width: 70px;"><asp:Label ID="lbAdviceDG2Power" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG3建议输出功率(Kw)<span style="float: right; width: 70px;"><asp:Label ID="lbAdviceDG3Power" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style3">DG4建议输出功率(Kw)<span style="float: right; width: 70px;"><asp:Label ID="lbAdviceDG4Power" runat="server" Text="Label"></asp:Label></span>
                                                                            </td>
                                                                        </tr>

                                                                    </table>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <%-- 输出建议输出值变量 结束标志  --%>
                                    </table>
                                </td>
                                <%-- 第三列电能耗属性 结束标志 --%>
                            </tr>
                            <%-- 第1行所有列属性标志结束 --%>
                        </table>

                        <%-- 航行工况属性开始 --%>
                        <table width="1340px" height="204" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="font-size: medium; padding-left: 15px; height: 33px"><strong>航行工况</strong></td>
                            </tr>
                            <tr>
                                <td height="3" style="padding-left: 12px">
                                    <img src="img/15.jpg" width="759px" height="3" />
                                </td>
                            </tr>

                            <tr>
                                <td height="100">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <table height="80" style="line-height: 30px; font-size: small;">
                                                <tr>
                                                    <td width="82px" align="right">
                                                        <img src="img/16.jpg" width="45px" height="45px" /></td>
                                                    <td width="180px">
                                                        <table>
                                                            <tr>
                                                                <td>经度：<span style="float: right; width: 70px;"><asp:Label ID="lbLongitude" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>纬度：<span style="float: right; width: 70px;"><asp:Label ID="lbLatitude" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbOriLatitude" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbOriLongitude" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>

                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbOriLatitudeDeg" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbOriLatitudeScore" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>

                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbOriLongitudeDeg" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbOriLongitudeScore" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>

                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbEndLongitudeDeg" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbEndLongitudeScore" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>


                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbEndLatitudeDeg" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbEndLatitudeScore" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>

                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbEndLatitude" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td><span style="float: right; width: 70px;">
                                                                    <asp:Label ID="lbEndLongitude" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                    <td width="50px">
                                                        <img src="img/17.jpg" width="45px" height="45px" /></td>
                                                    <td width="180px">
                                                        <table>
                                                            <tr>
                                                                <td>风速(m/s)：<span style="float: right; width: 70px;"><asp:Label ID="lbWindSpeed" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>风向(度)：<span style="float: right; width: 70px;"><asp:Label ID="lbWindDegrees" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <%-- <td width="50px"><img src="img/18.jpg" width="45px" height="45px" /></td>
 <td width="200px">
  <table><tr><td>航向(度)：<span style="float: right; width: 70px;"><asp:Label ID="lbCourseDegress" runat="server" Text="Label"></asp:Label></span>
 </td></tr>
 <tr><td>艏向(度)：<span style="float: right; width: 70px;"><asp:Label ID="lbHeadingDegress" runat="server" Text="Label"></asp:Label></span>
 </td></tr>
 </table></td> --%>

                                                    <td width="50px">
                                                        <img src="img/19.jpg" width="45px" height="45px" /></td>
                                                    <%--<td width="190px">   --%>
                                                    <td width="180px">
                                                        <table>
                                                            <tr>
                                                                <td>水深(m)：<span style="float: right; width: 70px;"><asp:Label ID="lbWaterDepth" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>流速(m/s)：<span style="float: right; width: 70px;"><asp:Label ID="lbvelocitySpeed" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>

                                                    <td width="50px">
                                                        <img src="img/18.jpg" width="45px" height="45px" /></td>
                                                    <td width="200px">
                                                        <table>
                                                            <tr>
                                                                <td>船舶吃水(m)：<span style="float: right; width: 70px;"><asp:Label ID="lbDraft" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>总载客量：<span style="float: right; width: 70px;"><asp:Label ID="lbTotalPeople" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="200px">
                                                        <table>
                                                            <tr>
                                                                <td>燃油类型：<span style="float: right; width: 70px;"><asp:Label ID="lbFuelType" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>密度(Kg/m3)：<span style="float: right; width: 70px;"><asp:Label ID="lbDensity" runat="server" Text="Label"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>

                                            <%--测试开台--%>







                                            <%-- 
 <tr>
 <td width="180px">
 <table><tr><td>经度1：<span style="float: right; width: 70px;"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span>
 </td></tr>
 <tr><td>纬度2：<span style="float: right; width: 70px;"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></span>
 </td></tr>
 </table>
 </td>
 </tr>--%>
                                            <%--测试结束--%>

                                            <div style="display: none;">
                                                <asp:Label ID="lblLongitudeLocal" runat="server"></asp:Label>
                                                <asp:Label ID="lblLatitudeLocal" runat="server"></asp:Label>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td height="50"></td>
                            </tr>

                        </table>

                        <%-- 航行工况属性结束--%>

                        <%--航行工部1111开始 --%>

                        <table width="1340px" height="204" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="font-size: small" height="40" align="center">Copyrigh.t @2018 武汉南华工业工程设备股份有限公司 版权所有工程设备股份有限公司 版权所有</td>
                            </tr>
                        </table>
                        <%--航行工部1111结束 --%>

                        <%--  body 结束体--%>
        </div>
    </form>
</body>

<%--调用百度地图API
<script type="text/JavaScript">
    
   // var map;
    //var point;
   // try{
    //map = new BMap.Map("map"); // 创建地图实例 
    point = new BMap.Point(116.404, 39.915); // 创建点坐标   
    map.centerAndZoom(point, 12); // 初始化地图，
    map.enableScrollWheelZoom(); //滚轮缩放事件     

    map.addControl(new BMap.NavigationControl());// 添加平移缩放控件
    map.addControl(new BMap.ScaleControl());     // 添加比例尺控件
    map.addControl(new BMap.OverviewMapControl());//添加缩略地图控件
    map.enableScrollWheelZoom(); ////启用滚轮放大缩小   
    map.enableContinuousZoom(); // 开启连续缩放效果   
    var marker = new BMap.Marker(point); // 创建标注
    var markerOld = marker;
    map.addOverlay(marker); // 将标注添加到地图中
    map.addControl(new BMap.MapTypeControl());      //添加地图类型控件  
    marker.setAnimation(BMAP_ANIMATION_BOUNCE); // 跳动的动画

    //
    var currentLat,currentLon ;

    function updateMap() 
    {
        currentLat = document.getElementById("lbLatitude").innerText;
        currentLon = document.getElementById("lbLongitude").innerText;  
        point = new BMap.Point(currentLon, currentLat); // 创建点坐标 
        map.centerAndZoom(point, 12); // 初始化地图，
      
        marker = new BMap.Marker(point);
      
        map.addOverlay(marker); // 将标注添加到地图
        marker.setAnimation(BMAP_ANIMATION_BOUNCE); // 跳动的动画
        map.removeOverlay(markerOld);
        markerOld = marker;
    }
    //  }
   //catch(Exception e)
    {
         
    }
   
    //setTimeout(updateMap, 3000)
    setInterval(updateMap, 4000);

    function serachlocal() {
        var local = new BMap.LocalSearch(map, {
            renderOptions: {
                map: map,
                panel: "results", //结果容器id  
                autoViewport: true,   //自动结果标注  
                selectFirstResult: true   //指定到第一个目标 
            },
            pageCapacity: 8
        });
        local.search(document.getElementById("searchtext").value);
        //      document.getElementById('Label31').innerHTML = document.getElementById("searchtext").value; 
    }
  
</script> --%>
</html>
