<%@page import="cn.net.sunrise.su.enums.SecurityKey"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.net.sunrise.su.enums.AttributeKey"%>
<%@page import="cn.net.sunrise.su.beans.passport.UserBean"%>
<%@ page pageEncoding="UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<%
	UserBean usb = (UserBean)session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
%>
<%
	boolean success = request.getAttribute(SecurityKey.QUERY_SUCCESS.key)!=null;
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
    <title>登录记录查询 - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/schedule.css" />
    <link rel="stylesheet" href="https://at.alicdn.com/t/font_234130_nem7eskcrkpdgqfr.css" />
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
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/schedule.js"></script>

	<style type="text/css">
		div.content {
			width: 700px; 
			margin: auto;
			margin-bottom: 50px;
			margin-top: -40px;
		}
		div.contentTitleText {
			width: 100%;
			text-align: center;
		}
		span.contentTitleText {
			font-family: "微软雅黑", "华文细黑";
			font-size: 24px;
			font-weight: 600;
			color: #6B6F6C;
		}
		div.contentHintText {
			width: 550px;
			margin-top: 30px;
			margin-left: 75px;
		}
		span.contentHintText {
			font-family: "微软雅黑", "华文细黑";
			font-size: 20px;
			font-weight: 600;
			color: #6B6F6C;
		}
		button.dateSelect, button.submit {
			width: 100px;
			height: 30px;
			font-family: "微软雅黑", "华文细黑";
			border: none;
			outline: none;
			border-radius: 5px;
			background-color: #1296DB;
			color: #FFFFFF;
			cursor: pointer;
		}
		button.submit {
			margin-left: 50px;
		}
		
		div.contentLoginRecord {
			width: 100%;
			border-radius: 5px;
			margin-top: 50px;
			text-align: center;
		}
		div.loginRecordTitle {
			width: 100%;
			margin-bottom: 15px;
		}
		span.loginRecordTitle {
			font-family: "微软雅黑", "华文细黑";
			font-size: 20px;
			font-weight: 600;
		}
		table.contentLoginRecord {
			width: 100%;
			border: 1px solid #797979;
		}
		tr.contentLoginRecord {
			height: 40px;
		}
		span.loginRecordText {
			font-family: "微软雅黑", "华文细黑";
			font-size: 16px;
		}
		
		div#startTime, div#endTime {
			left: 50%;
			margin-left: -180px;
			top: 50%;
			margin-top: -200px;
			position: absolute;
			z-index: 3;
			background-color: #FFFFFF;
			display: none;
		}
		
		div.quarantine {
			width: 100%;
			height: 100%;
			background-color: rgba(142,145,147,0.4);
			position: absolute;
			z-index: 2;
			display: none;
		}
	</style>

</head>
<body>
	<!-- 引入日历插件 -->
	<div id='startTime' class="boxshaw schedule-box"></div>
	<div id='endTime' class="boxshaw schedule-box"></div>
	
	<!-- 添加屏幕隔离层 -->
	<div class="quarantine" id="quarantine"></div>
	
	<!-- 引入弹出层 -->
	<div id="pop" title="时间不正确"></div>

	<div class="topbar"> 
		<div class="topbarinner">
			<div>
				<img class="topbarimg" src="https://huanglm520.github.io/cloud-data.static.io/images/cloud.svg">
			</div>
			<div class="topbarspan">
				<span class="topbarspan">Cloud-Data&nbsp;数据一体化管理平台</span>
			</div>
			<div class="timer">
				<span class="timer" id="timer">正在获取服务器时间</span>
			</div>
			<div class="user">
				<span class="user">欢迎你，<%=usb.getLast_name()+usb.getFirst_name() %>&nbsp;/&nbsp;<a href="javascript:void(0);"><span class="user" style="color:#FF0000" id="logout">退出登录</span></a></span>
			</div>
		</div>
	</div>
	
	<div class="navigation">
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
	
	<div class="content">
		<div class="contentTitleText">
			<span class="contentTitleText">登录记录查询</span>
		</div>
		<div class="contentHintText">
			<span class="contentHintText">请选择日期区间：</span>
			<button class="dateSelect" id="startButton">起始日期</button>
			<span class="contentHintText">--</span>
			<button class="dateSelect" id="endButton">结束日期</button>
			<button class="submit" id="submit">查询</button>
		</div>
		
		<div class="contentLoginRecord" id="loginRecord">
			<div class="loginRecordTitle">
				<span class="loginRecordTitle" id="loginRecordTitle">请选择日期区间查询记录</span>
			</div>
			<table class="contentLoginRecord">
				<tr class="contentLoginRecord">
					<td style="width: 100px"><span class="loginRecordText">登录ID</span></td>
					<td style="width: 150px"><span class="loginRecordText">IP地址</span></td>
					<td style="width: 200px"><span class="loginRecordText">登录时间</span></td>
					<td style="width: 200px"><span class="loginRecordText">登录地点</span></td> 
				</tr>
			</table>
			<table class="contentLoginRecord" v-if="notEmpty">
				<tr class="contentLoginRecord" v-for="site in json">
					<td style="width: 100px"><span class="loginRecordText">{{ site.id }}</span></td>
					<td style="width: 150px"><span class="loginRecordText">{{ site.address }}</span></td>
					<td style="width: 200px"><span class="loginRecordText">{{ GetMyDate(site.time) }}</span></td>
					<td style="width: 200px"><span class="loginRecordText">{{ site.position }}</span></td>
				</tr>
			</table>
		</div>
		
	</div>
	
	<div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=application.getAttribute(AttributeKey.PAGE_TIME.key) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
	    </div>
	    <div class="cr_two">
	    	<table>
	    		<tr>
	    			<td style="width: 130px;"><a target="_blank" href="<%=path %>/help/about-us"><span class="linker">关于 Cloud-Data</span></a></td>
	    			<td style="width: 90px;"><a target="_blank" href="<%=path %>/help/feedback"><span class="linker">问题反馈</span></a></td>
	    			<td style="width: 90px;"><a target="_blank" href="<%=path %>/help/about-use"><span class="linker">使用帮助</span></a></td>
	    			<td style="width: 90px;"><a target="_blank" href="<%=path %>/download/driver"><span class="linker">驱动下载</span></a></td>
	    		</tr>
	    	</table>
	    </div>
	</div>
	
	<% if (success) { %>
	<%     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
	<script type="text/javascript">
		$(document).ready(function () {
			var s = "<%=sdf.format(new Date((Long)request.getAttribute(SecurityKey.LOGIN_RECORD_START_TIME.key)))%>";
			var e = "<%=sdf.format(new Date((Long)request.getAttribute(SecurityKey.LOGIN_RECORD_END_TIME.key)))%>";
			$("#startButton").text(s);
			$("#endButton").text(e);
			$("#loginRecordTitle").text("以下是"+s+"--"+e+"的登录记录");
		});
	</script>
	<% } %>
	
	<script type="text/javascript">
		var startTime = new Schedule({
			el: '#startTime',
			clickCb: function (y,m,d) {
				if (m < 10) { m = '0'+m; }
				if (d < 10) { d = '0'+d; }
				$("#startButton").text(y+'-'+m+'-'+d);
				// 隐藏日历插件
				$("#startTime").css("display", "none");
				// 隐藏隔离层
				$("#quarantine").css("display", "none");
				// 修改标记
				startTimeFlag = true;
			}
		});
		
		var endTime = new Schedule({
			el: "#endTime",
			clickCb: function (y,m,d) {
				if (m < 10) { m = '0'+m; }
				if (d < 10) { d = '0'+d; }
				$("#endButton").text(y+'-'+m+'-'+d);
				// 隐藏日历插件
				$("#endTime").css("display", "none");
				// 隐藏隔离层
				$("#quarantine").css("display", "none");
				// 修改标记
				endTimeFlag = true;
			}
		});
	</script>
	
	<script type="text/javascript">
		// 绑定日期选择事件
		$("#startButton").click(function() {
			// 放置隔离层
			$("#quarantine").css("display", "block");
			// 放置日历插件
			$("#startTime").css("display", "block");
		});
		
		$("#endButton").click(function() {
			// 放置隔离层
			$("#quarantine").css("display", "block");
			// 放置日历插件
			$("#endTime").css("display", "block");
		});
	</script>
	
	<script type="text/javascript">
		// 绑定提交按钮查询事件
		$("#submit").click(function () {
			if ($("#startButton").text() === '起始日期') {
				$("#quarantine").css("display", "block");
				$("#pop").empty();
				$("#pop").dialog({
					height: 200,
					width: 300,
					model: true,
					draggable: false,
					buttons: {
						"确定": function() {
							$(this).dialog("close");
							$("#quarantine").css("display", "none");
						}
					},
					open: function(event, ui) {
						$(".ui-dialog-titlebar-close", $(this).parent()).hide();
					}
				});
				$("#pop").append("请选择起始日期");
				return;
			}
			if ($("#endButton").text() === '结束日期') {
				$("#quarantine").css("display", "block");
				$("#pop").empty();
				$("#pop").dialog({
					height: 200,
					width: 300,
					model: true,
					draggable: false,
					buttons: {
						"确定": function() {
							$(this).dialog("close");
							$("#quarantine").css("display", "none");
						}
					},
					open: function(event, ui) {
						$(".ui-dialog-titlebar-close", $(this).parent()).hide();
					}
				});
				$("#pop").append("请选择结束日期");
				return;
			}
			var s = new Date($("#startButton").text()+" 00:00:00").getTime();
			var e = new Date($("#endButton").text()+" 23:59:59").getTime();
			if (s >= e) {
				$("#quarantine").css("display", "block");
				$("#pop").empty();
				$("#pop").dialog({
					height: 200,
					width: 300,
					model: true,
					draggable: false,
					buttons: {
						"确定": function() {
							$(this).dialog("close");
							$("#quarantine").css("display", "none");
						}
					},
					open: function(event, ui) {
						$(".ui-dialog-titlebar-close", $(this).parent()).hide();
					}
				});
				$("#pop").append("结束日期必须大于起始日期");
				return;
			}
			window.location.href = "<%=path%>/security/login-record?s=" + s + "&e=" +  (e+999)
		});
	</script>
	<% if (success) { %>
	<script type="text/javascript">
		new Vue({
			el: "#loginRecord",
			data: {
				notEmpty: true,
				json: <%=request.getAttribute(SecurityKey.SECURITY_LOGIN_RECORD.key)%>
			}
		});
	</script>
	<% } else { %>
	<script type="text/javascript">
		new Vue({
			el:"#loginRecord",
			data: {
				notEmpty: false,
				json : null
			}
		});
	</script>
	<% } %>
	
	<script type="text/javascript">
		// 绑定按钮动画
		$("#submit").mouseover(function() {
			$("#submit").animate({"background-color": "#71C0E9"}, 200);
		});
		$("#submit").mouseout(function () {
			$("#submit").animate({"background-color": "#1296DB"}, 200);
		});
		
		$("#startButton").mouseover(function() {
			$("#startButton").animate({"background-color": "#71C0E9"}, 200);
		});
		$("#startButton").mouseout(function () {
			$("#startButton").animate({"background-color": "#1296DB"}, 200);
		});
		
		$("#endButton").mouseover(function() {
			$("#endButton").animate({"background-color": "#71C0E9"}, 200);
		});
		$("#endButton").mouseout(function () {
			$("#endButton").animate({"background-color": "#1296DB"}, 200);
		});
	</script>
	
</body>
</html>