<%@page import="cn.net.sunrise.su.enums.SecurityKey"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.net.sunrise.su.enums.AttributeKey"%>
<%@page import="cn.net.sunrise.su.beans.UserBean"%>
<%@ page pageEncoding="UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<%
	UserBean usb = (UserBean)session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
%>
<!DOCTYPE html>
<html lang="cn">
<script type="text/javascript">
	function GetPath() {
		return "<%=path%>";
	}
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>容器基本信息 - Cloud-Data 数据一体化服务平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/jquery-ui.min.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/check.js"></script>
	<style type="text/css">
		div.content {
			width: 100%;
			margin-top: 30px;
			margin-bottom: 50px;
		}
		div.db_title {
			height: 60px;
			margin: auto;
		}
		div.db_image, img.db_image {
			width: 60px;
			height: 60px;
		}
		div.db_name {
			text-align: center;
			margin-left: 60px;
			margin-top: -45px; 
		}
		span.db_name {
			font-family: "Consolas";
			font-weight: 600;
			font-size: 30px;
			color: #6F726F;
		}
		div.db_info {
			width: 1000px;
			margin: auto;
			margin-top: 30px;
		}
		div.db_info_title {
			width: 100%;
			text-align: center;
		}
		span.text_title {
			font-family: "微软雅黑", "华文细黑";
			font-weight: 600;
			font-size: 20px;
			color: #767976;
		}
		div.tb_info {
			width: 700px;
			margin: auto;
			margin-top: 20px;
		}
		table.tb_info, td.tb_info_l, td.tb_info_r, div.tb_info_time {  
			border: 1px solid #767976;
		}
		table.tb_info {
			border-collapse: collapse;  
			border-spacing: 0;  
		}
		tr.tb_info, div.tb_info_time {
			height: 40px;
		}
		td.tb_info_l {
			width: 100px;
		}
		td.tb_info_r {
			width: 250px;
		}
		span.tb_info {
			font-family: "微软雅黑", "华文细黑";
			font-weight: 600;
			font-size: 18px;
			color: #767976;
		}
		div.tb_info_time {
			width: auto;
			text-align: center;
		}
		div.status_button, div.delete_button, div.imtern_button {
			width: 500px;
			margin: auto;
			margin-top: 30px;
		}
		button.operator {
			width: 174.5px;
			height: 40px;
			border: none;
			outline: none;
			font-family: "微软雅黑", "华文细黑";
			font-size: 13px;
			color: #FFFFFF;
			cursor: pointer;
		}
		button.modify {
			background-color: #1460A6;
		}
		button.run {
 			background-color: #1AB821;
 			margin-left: 20px;
		}
		button.stop {
			background-color: #D1301F; 
			margin-left: 20px;
		}
		button.delete {
			width: 100%;
			height: 40px;
			border: none;
			outline: none;
			font-family: "微软雅黑", "华文细黑";
			font-size: 15px;
			color: #FFFFFF;
			background-color: #FF0000;
			cursor: pointer;
		}
		button.imtern {
			width: 232px;
			height: 40px;
			border: none;
			outline: none;
			font-family: "微软雅黑", "华文细黑";
			font-size: 15px;
			color: #FFFFFF;
			background-color: #1296DB;
			cursor: pointer;
		}
		div.quarantine {
			width: 100%;
			height: 100%;
			background-color: rgba(142,145,147,0.4);
			position: absolute;
			z-index: 2;
			display: none;
		}
		div.pop, div.errorPop {
			width: 300px;
			height: 0px;
			background-color: #FFFFFF;
			position: absolute;
			z-index: 3;
			left: 50%;
			top: 50%;
			margin-left: -150px;
			margin-top: -110px;
			border-radius: 5px;
			display: none;
		}
		button#run, button#modify, button#stop{
			width: 80px;
			height: 35px;
			font-size: 13px; 
		}
		button#modify {
			color: #1460A6;
		}
		button#run {
			color: #1AB821;
		}
		button#stop {
			color: #D1301F;
		}
		button.closeButton {
			width: 60px;
			height: 30px;
			font-size: 13px;
		}
		div.errorPop {
			height: 150px;
		}
	</style>

</head>
<body>

	<!-- 添加隔离层 -->
	<div class="quarantine" id="quarantine"></div>
	<!-- 添加弹出层 -->
	<div id="pop" class="pop">
		<div style="height: 30px; border-bottom: 1px solid #BDBDBD; padding-top: 5px; padding-left: 5px">
			<span style="font-family: '微软雅黑'; font-size: 17px; font-weight: 300; color: #797979">修改容器状态</span>
		</div>
		<div style="text-align: center; margin-top: 40px; margin-bottom: 40px;">
			<button id="run">运行中</button>
			<button id="modify">修改中</button>
			<button id="stop">已停用</button>
		</div>
		<div style="padding-top:8px; padding-right: 10px; height: 40px; border-top: 1px solid #BDBDBD; text-align: right;">
			<button id="closePop" class="closeButton">关闭</button>
		</div>
	</div>
	<!-- 添加错误弹出层 -->
	<div class="errorPop" id="errorPop">
		<div style="height: 30px; border-bottom: 1px solid #BDBDBD; padding-top: 5px; padding-left: 5px">
			<span id="errorTitle" style="font-family: '微软雅黑'; font-size: 17px; font-weight: 300; color: #797979"></span>
		</div>
		<div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
			<span id="errorContent" style="font-size: 15px; color: #797979; font-weight: 300"></span>
		</div>
		<div style="padding-top:8px; padding-right: 10px; height: 40px; border-top: 1px solid #BDBDBD; text-align: right;">
			<button id="closeErrorPop" class="closeButton">关闭</button> 
		</div>
	</div>
	
	<script type="text/javascript">
		$("#closePop").button().click(function () {
			$("#pop").animate({"height": "0px"}, 150, function() {
				$("#pop").css({"display": "none"});
				$("#quarantine").css({"display": "none"});
			});
		});
		$("#closeErrorPop").button().click(function () {
			$("#errorPop").animate({"height": "0px"}, 150, function() {
				$("#errorPop").css({"display": "none"});
				$("#quarantine").css({"display": "none"});
			});
		});
	</script>
	
	<div class="topbar"> 
		<div class="topbarinner">
			<div>
				<img class="topbarimg" src="https://huanglm520.github.io/cloud-data.static.io/images/cloud.svg">
			</div>
			<div class="topbarspan">
				<span class="topbarspan">Cloud-Data&nbsp;数据一体化服务平台</span>
			</div>
			<div class="timer">
				<span class="timer" id="timer">正在获取服务器时间</span>
			</div>
			<div class="user">
				<span class="user">欢迎你，<%=usb.getLast_name()+usb.getFirst_name() %>&nbsp;/&nbsp;<a href="javascript:void(0);"><span class="user" style="color:#FF0000" id="logout">退出登录</span></a></span>
			</div>
		</div>
	</div>
	
	<div class="navigation" style="margin-bottom: 0px">
		<table class="navigation">
			<tr class="navigation">
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io/images/home.svg">
					<span class="navigation">&nbsp;个人主页</span>
					<div class="navigationPointer" id="personalHome"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io/images/container.svg">
					<span class="navigation">&nbsp;容器管理</span>
					<div class="navigationPointer" id="containerManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io/images/account.svg">
					<span class="navigation">&nbsp;账号管理</span>
					<div class="navigationPointer" id="accountManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io/images/security.svg">
					<span class="navigation">&nbsp;安全中心</span>
					<div class="navigationPointer" id="securityCenter"></div>
				</td>
			</tr>
		</table>
	</div>
	<div class="content" id="content">
		<div class="db_title">
			<div class="db_image">
				<img class="db_image" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQ1MTIwMjA0OTUzIiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjI0NzkiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNMTE3IDYwOC40djE3OC41YzEuNSA5My43IDE1NS43IDE2OS41IDM5NSAxNjkuNXMzOTMuNC03NS44IDM5NS0xNjkuNVY2MDguNEgxMTd6IiBmaWxsPSIjMUI5QkRCIiBwLWlkPSIyNDgwIj48L3BhdGg+PHBhdGggZD0iTTkwNyA2MDcuN2MwIDk5LjQtMTU0LjggMTgwLTM5NSAxODBzLTM5NS04MC42LTM5NS0xODAgMTU0LjgtMTgwIDM5NS0xODAgMzk1IDgwLjUgMzk1IDE4MHoiIGZpbGw9IiNGRkZGRkYiIHAtaWQ9IjI0ODEiPjwvcGF0aD48cGF0aCBkPSJNMTE3IDQyOC40djE1OC41YzEuNSA5My43IDE1NS43IDE3OS41IDM5NSAxNzkuNXMzOTMuNC04NS44IDM5NS0xNzkuNVY0MjguNEgxMTd6IiBmaWxsPSIjMUI5QkRCIiBwLWlkPSIyNDgyIj48L3BhdGg+PHBhdGggZD0iTTkwNyA0MjcuN2MwIDk5LjQtMTU0LjggMTgwLTM5NSAxODBzLTM5NS04MC42LTM5NS0xODAgMTU0LjgtMTgwIDM5NS0xODAgMzk1IDgwLjUgMzk1IDE4MHoiIGZpbGw9IiNGRkZGRkYiIHAtaWQ9IjI0ODMiPjwvcGF0aD48cGF0aCBkPSJNMTE3IDI0OC40djE1OC41YzEuNSA5My43IDE1NS43IDE3OS41IDM5NSAxNzkuNXMzOTMuNC04NS44IDM5NS0xNzkuNVYyNDguNEgxMTd6IiBmaWxsPSIjMUI5QkRCIiBwLWlkPSIyNDg0Ij48L3BhdGg+PHBhdGggZD0iTTkwNyAyNDcuN2MwIDk5LjQtMTU0LjggMTgwLTM5NSAxODBzLTM5NS04MC42LTM5NS0xODAgMTU0LjgtMTgwIDM5NS0xODAgMzk1IDgwLjUgMzk1IDE4MHoiIGZpbGw9IiMzRUQ2RkYiIHAtaWQ9IjI0ODUiPjwvcGF0aD48L3N2Zz4=" />
			</div>
			<div class="db_name">
				<span class="db_name">{{ name }}</span>
			</div>
		</div>
		<div class="db_info">
			<div class="db_info_title">
				<span class="text_title">容器基本信息</span>
			</div>
			<div class="tb_info" v-for="site in info">
				<table class="tb_info">
					<tr class="tb_info">
						<td class="tb_info_l"><span class="tb_info">容器ID</span></td>
						<td class="tb_info_r"><span class="tb_info">{{ site.id }}</span></td>
						<td class="tb_info_l"><span class="tb_info">容器状态</span></td>
						<td class="tb_info_r"><span class="tb_info">{{ site.state }}</span></td>
					</tr>
					<tr class="tb_info">
						<td class="tb_info_l"><span class="tb_info">容器名称</span></td>
						<td class="tb_info_r"><span class="tb_info">{{ site.name }}</span></td>
						<td class="tb_info_l"><span class="tb_info">API名称</span></td>
						<td class="tb_info_r"><span class="tb_info">{{ site.api }}</span></td>
					</tr>
					<tr class="tb_info">
						<td class="tb_info_l"><span class="tb_info">字段数</span></td>
						<td class="tb_info_r"><span class="tb_info">{{ site.field }}</span></td>
						<td class="tb_info_l"><span class="tb_info">数据量</span></td>
						<td class="tb_info_r"><span class="tb_info">{{ site.data }}</span></td>
					</tr>
				</table>
				<div class="tb_info_time">
					<div style="margin-top: 8px;">
						<span class="tb_info">创建时间：{{ GetMyDate(site.buildtime) }}</span>
					</div>
				</div>
				<div class="tb_info_time" style="font-size: 0px">
					<button class="operator" style="background-color: #1F9E3E" onmouseover="$(this).animate({'background-color':'#2BC04F'}, 200);" onmouseout="$(this).animate({'background-color':'#1F9E3E'}, 200);" onclick="viewStatus()">修改容器状态</button>
					<button class="operator" style="background-color: #1296DB" onmouseover="$(this).animate({'background-color':'#1CA6EE'}, 200);" onmouseout="$(this).animate({'background-color':'#1296DB'}, 200);" @click='window.location.href="<%=path%>/container/manager/field?cid="+site.id'>修改容器结构</button>
					<button class="operator" style="background-color: #7266BB" onmouseover="$(this).animate({'background-color':'#8779DC'}, 200);" onmouseout="$(this).animate({'background-color':'#7266BB'}, 200);" @click='window.location.href="<%=path%>/container/manager/privilege?cid="+site.id'>修改容器权限</button>
					<button class="operator" style="background-color: #ED2D05" onmouseover="$(this).animate({'background-color':'#F26A4E'}, 200);" onmouseout="$(this).animate({'background-color':'#ED2D05'}, 200);" @click='window.location.href="<%=path %>/container/manager/delete?cid="+site.id'>删除容器</button>
				</div>
			</div>
		</div>
		<!-- <div class="status_button">
			<button class="operator modify" id="modify" onmouseover="$(this).animate({'background-color':'#3E87CA'}, 200);" onmouseout="$(this).animate({'background-color':'#1460A6'}, 200);">修改此容器</button>
			<button class="operator run" id="run" onmouseover="$(this).animate({'background-color':'#31D738'}, 200);" onmouseout="$(this).animate({'background-color':'#1AB821'}, 200);">运行此容器</button>
			<button class="operator stop" id="stop" onmouseover="$(this).animate({'background-color':'#E75A4B'}, 200);" onmouseout="$(this).animate({'background-color':'#D1301F'}, 200);">停用此容器</button>
		</div>
		<div class="imtern_button" v-for="site in info">
			<button class="imtern"  onmouseover="$(this).animate({'background-color':'#46B4EE'}, 200);" onmouseout="$(this).animate({'background-color':'#1296DB'}, 200);" @click='window.location.href="<%=path%>/container/manager/field?cid="+site.id'>修改此容器结构</button>
			<button class="imtern" style="margin-left: 30px;"  onmouseover="$(this).animate({'background-color':'#46B4EE'}, 200);" onmouseout="$(this).animate({'background-color':'#1296DB'}, 200);" @click='window.location.href="<%=path%>/container/manager/privilege?cid="+site.id'>管理此容器权限</button>
		</div>
		<div class="delete_button" v-for="site in info">
			<button class="delete" onmouseover="$(this).animate({'background-color':'#F45454'}, 200);" onmouseout="$(this).animate({'background-color':'#FF0000'}, 200);" @click='window.location.href="<%=path %>/container/manager/delete?cid="+site.id'>删除此容器</button>
		</div> --> 
	</div>
	<div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=new SimpleDateFormat("yyyy").format(new Date()) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
	    </div>
	    
	</div>
	
	<script type="text/javascript">
		$("div.db_title").width($("div.db_image").width()+$("span.db_name").width()+50);
	</script>
	
	<script type="text/javascript">
		function viewStatus() {
			$("#quarantine").css({"display": "block"});
			$("#pop").css({"display": "block"}).animate({"height": "200px"}, 150);
		}
	</script>
	
	<script type="text/javascript">
		new Vue({
			el: "#content",
			data: {
				name: <%=request.getAttribute(SecurityKey.CONTAINER_NAME.key)%>,
				info: <%=request.getAttribute(SecurityKey.CONTAINER_MANAGER_INFO.key)%>
			}
		});
	</script>
	
	<script type="text/javascript">
		var param = window.location.search;
		var id = -1;
		if (param.indexOf("?") != -1) {
			var arr = param.substr(1).split("&");
			for (var i=0; i<arr.length; i++) { 
				var t = arr[i].split("=");
				if (t[0] == "cid") {
					id = t[1];
				}
			}
		}
		
		/**********************************************************************************
		 **********************************************************************************
		 **********************************************************************************/
		// 绑定修改操作
		$("#modify").button().click(function() {
			$.ajax({
				url: "<%=path%>/container/manager/change-status/",
				type: "POST",
				timeout: 5000,
				async: true,
				data: {"status":"modify", "cid":id},
				dataType: "json",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#pop").animate({"height": "0px"}, 150, function() {
						$("#pop").css({"display": "none"});
						$("#errorTitle").text("错误");
						$("#errorContent").text('').append("<span style='color: #FF0000'>连接到服务器时出现错误</span>");
						$("#errorPop").css({"display":"block"}).animate({"height":"150px"}, 150);
					});
				},
				success: function(data, textStatus) {
					$("#pop").animate({"height": "0px"}, 150, function() {
						$("#pop").css({"display": "none"});
						$("#errorTitle").text("请求已完成");
						if (data.code == Code["OK"]) {
							$("#errorContent").text('').append("容器状态已变更为：<span style='color: #1460A6'>修改中</span>");
						} else if (data.code == Code["NO_PRIVILEGE"]) {
							$("#errorContent").text('').append("<span style='color: #FF0000'>当前账户没有权限访问该容器</span>");
						} else if (data.code == Code["NOT_LOGIN"]) {
							$("#errorContent").text('').append("<span style='color: #FF0000'>身份已过期，请重新登录</span>");
						} else if (data.code == Code["ERROR_STATUS"]) {
							$("#errorContent").text('').append("<span style='color: #FF0000'>非法状态参数</span>");
						} else {
							$("#errorContent").text('').append("<span style='color: #FF0000'>服务器端未知错误</span>");
						}
						$("#errorPop").css({"display":"block"}).animate({"height":"150px"}, 150);
						$("#closeErrorPop").click(function () {
							if (data.code == Code["NOT_LOGIN"] || data.code == Code["OK"]) {
								window.location.reload();
							}
							$("#errorPop").animate({"height": "0px"}, 150, function() {
								$("#errorPop").css({"display": "none"});
								$("#quarantine").css({"display": "none"});
							});
							// 将按钮函数修改为原函数
							$("#closeErrorPop").click(function () {
								$("#errorPop").animate({"height": "0px"}, 150, function() {
									$("#errorPop").css({"display": "none"});
									$("#quarantine").css({"display": "none"});
								});
							});
						});
					});
					/*$("#quarantine").css({"display": "block"});
					$("#pop").empty();
					if (data.code == Code["OK"]) {
						$("#pop").append("容器状态已变更为：修改中");
					} else if (data.code == Code["NO_PRIVILEGE"]) {
						$("#pop").append("当前账户没有权限访问该容器");
					} else if (data.code == Code["NOT_LOGIN"]) {
						$("#pop").append("身份已过期，请重新登录");
					} else if (data.code == Code["ERROR_STATUS"]) {
						$("#pop").append("非法状态参数");
					} else {
						$("#pop").append("服务器端未知错误");
					}
					$("#pop").dialog({
						height: 200,
						width: 300,
						model: true,
						draggable: false,
						buttons: {
							"确定": function() {
								$(this).dialog("close");
								$("#quarantine").css("display", "none");
								$("#pop").empty();
								$("#ui-id-1").empty();
								if (data.code == Code["NOT_LOGIN"] || data.code == Code["OK"]) {
									window.location.reload();
								}
							}
						},
						open: function(event, ui) {
							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
							$("#ui-id-1").text(data.code == Code["OK"] ? "请求已完成" : "请求失败");
						}
					});*/
				}
			});
		});
		// End
		/******************************************************************************
		 ******************************************************************************
		 ******************************************************************************/
		 
		/******************************************************************************
		 ******************************************************************************
		 ******************************************************************************/
		// 绑定运行操作
		$("#run").button().click(function() {
			$.ajax({
				url: "<%=path%>/container/manager/change-status/",
				type: "POST",
				timeout: 5000,
				async: true,
				data: {"status":"running", "cid":id},
				dataType: "json",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#pop").animate({"height": "0px"}, 150, function() {
						$("#pop").css({"display": "none"});
						$("#errorTitle").text("错误");
						$("#errorContent").text('').append("<span style='color: #FF0000'>连接到服务器时出现错误</span>");
						$("#errorPop").css({"display":"block"}).animate({"height":"150px"}, 150);
					});
				},
				success: function(data, textStatus) {
					$("#pop").animate({"height": "0px"}, 150, function() {
						$("#pop").css({"display": "none"});
						$("#errorTitle").text("请求已完成");
						if (data.code == Code["OK"]) {
							$("#errorContent").text('').append("容器状态已变更为：<span style='color: #1AB821'>运行中</span>");
						} else if (data.code == Code["NO_PRIVILEGE"]) {
							$("#errorContent").text('').append("<span style='color: #FF0000'>当前账户没有权限访问该容器</span>");
						} else if (data.code == Code["NOT_LOGIN"]) {
							$("#errorContent").text('').append("<span style='color: #FF0000'>身份已过期，请重新登录</span>");
						} else if (data.code == Code["ERROR_STATUS"]) {
							$("#errorContent").text('').append("<span style='color: #FF0000'>非法状态参数</span>");
						} else {
							$("#errorContent").text('').append("<span style='color: #FF0000'>服务器端未知错误</span>");
						}
						$("#errorPop").css({"display":"block"}).animate({"height":"150px"}, 150);
						$("#closeErrorPop").click(function () {
							if (data.code == Code["NOT_LOGIN"] || data.code == Code["OK"]) {
								window.location.reload();
							}
							$("#errorPop").animate({"height": "0px"}, 150, function() {
								$("#errorPop").css({"display": "none"});
								$("#quarantine").css({"display": "none"});
							});
							// 将按钮函数修改为原函数
							$("#closeErrorPop").click(function () {
								$("#errorPop").animate({"height": "0px"}, 150, function() {
									$("#errorPop").css({"display": "none"});
									$("#quarantine").css({"display": "none"});
								});
							});
						});
					});
					/*$("#quarantine").css({"display": "block"});
					$("#pop").empty();
					if (data.code == Code["OK"]) {
						$("#pop").append("容器状态已变更为：运行中");
					} else if (data.code == Code["NO_PRIVILEGE"]) {
						$("#pop").append("当前账户没有权限访问该容器");
					} else if (data.code == Code["NOT_LOGIN"]) {
						$("#pop").append("身份已过期，请重新登录");
					} else if (data.code == Code["ERROR_STATUS"]) {
						$("#pop").append("非法状态参数");
					} else {
						$("#pop").append("服务器端未知错误");
					}
					$("#pop").dialog({
						height: 200,
						width: 300,
						model: true,
						draggable: false,
						buttons: {
							"确定": function() {
								$(this).dialog("close");
								$("#quarantine").css("display", "none");
								$("#pop").empty();
								$("#ui-id-1").empty();
								if (data.code == Code["NOT_LOGIN"] || data.code == Code["OK"]) {
									window.location.reload();
								}
							}
						},
						open: function(event, ui) {
							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
							$("#ui-id-1").text(data.code == Code["OK"] ? "请求已完成" : "请求失败");
						}
					});*/
				}
			});
		});
		// End
		/********************************************************************************
		 ********************************************************************************
		 ********************************************************************************/
		
		/********************************************************************************
		 ********************************************************************************
		 ********************************************************************************/
		// 绑定停止操作
		$("#stop").button().click(function() {
			$.ajax({
				url: "<%=path%>/container/manager/change-status/",
				type: "POST",
				timeout: 5000,
				async: true,
				data: {"status":"stop", "cid":id},
				dataType: "json",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#pop").animate({"height": "0px"}, 150, function() {
						$("#pop").css({"display": "none"});
						$("#errorTitle").text("错误");
						$("#errorContent").text('').append("<span style='color: #FF0000'>连接到服务器时出现错误</span>");
						$("#errorPop").css({"display":"block"}).animate({"height":"150px"}, 150);
					});
				},
				success: function(data, textStatus) {
					$("#pop").animate({"height": "0px"}, 150, function() {
						$("#pop").css({"display": "none"});
						$("#errorTitle").text("请求已完成");
						if (data.code == Code["OK"]) {
							$("#errorContent").text('').append("容器状态已变更为：<span style='color: #D1301F'>已停用</span>");
						} else if (data.code == Code["NO_PRIVILEGE"]) {
							$("#errorContent").text('').append("<span style='color: #FF0000'>当前账户没有权限访问该容器</span>");
						} else if (data.code == Code["NOT_LOGIN"]) {
							$("#errorContent").text('').append("<span style='color: #FF0000'>身份已过期，请重新登录</span>");
						} else if (data.code == Code["ERROR_STATUS"]) {
							$("#errorContent").text('').append("<span style='color: #FF0000'>非法状态参数</span>");
						} else {
							$("#errorContent").text('').append("<span style='color: #FF0000'>服务器端未知错误</span>");
						}
						$("#errorPop").css({"display":"block"}).animate({"height":"150px"}, 150);
						$("#closeErrorPop").click(function () {
							if (data.code == Code["NOT_LOGIN"] || data.code == Code["OK"]) {
								window.location.reload();
							}
							$("#errorPop").animate({"height": "0px"}, 150, function() {
								$("#errorPop").css({"display": "none"});
								$("#quarantine").css({"display": "none"});
							});
							// 将按钮函数修改为原函数
							$("#closeErrorPop").click(function () {
								$("#errorPop").animate({"height": "0px"}, 150, function() {
									$("#errorPop").css({"display": "none"});
									$("#quarantine").css({"display": "none"});
								});
							});
						});
					});
					/*$("#quarantine").css({"display": "block"});
					$("#pop").empty();
					if (data.code == Code["OK"]) {
						$("#pop").append("容器状态已变更为：已停止");
					} else if (data.code == Code["NO_PRIVILEGE"]) {
						$("#pop").append("当前账户没有权限访问该容器");
					} else if (data.code == Code["NOT_LOGIN"]) {
						$("#pop").append("身份已过期，请重新登录");
					} else if (data.code == Code["ERROR_STATUS"]) {
						$("#pop").append("非法状态参数");
					} else {
						$("#pop").append("服务器端未知错误");
					}
					$("#pop").dialog({
						height: 200,
						width: 300,
						model: true,
						draggable: false,
						buttons: {
							"确定": function() {
								$(this).dialog("close");
								$("#quarantine").css("display", "none");
								$("#pop").empty();
								$("#ui-id-1").empty();
								if (data.code == Code["NOT_LOGIN"] || data.code == Code["OK"]) {
									window.location.reload();
								}
							}
						},
						open: function(event, ui) {
							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
							$("#ui-id-1").text(data.code == Code["OK"] ? "请求已完成" : "请求失败");
						}
					});*/
				}
			});
		});
		// End
		/**************************************************************************************
		 **************************************************************************************
		 **************************************************************************************/
	</script>
</body>
</html>