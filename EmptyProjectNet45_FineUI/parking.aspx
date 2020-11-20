<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parking.aspx.cs" Inherits="EmptyProjectNet45_FineUI.parking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:100%;height:500px;}
		p{margin-left:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=hHcZKHf0ybG2NSIU4t1ss5FtZFP8QYus"></script>
	<title>圆形区域搜索</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="allmap"></div>
    </form>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");            // 创建Map实例
	var mPoint = new BMap.Point(114.34122001,30.51508413);  
	map.enableScrollWheelZoom();
	map.centerAndZoom(mPoint,15);

	var circle = new BMap.Circle(mPoint,1000,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
    map.addOverlay(circle);
    var local =  new BMap.LocalSearch(map, {renderOptions: {map: map, autoViewport: false}});  
    local.searchNearby('学校',mPoint,1000);
</script>
