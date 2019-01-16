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
    <title>安全中心 - Cloud-Data 数据一体化管理平台</title>
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
			width: 700px;
			margin: auto;
			margin-bottom: 50px;
		}
		div.contentChangeMail, div.contentChangePassword {
			width: 240px;
			height: 100px;
			border-radius: 5px;
			background-color: #1296DB;
			margin-left: 60px;
			position: relative;
		}
		div.contentChangePassword {
			margin-left: 400px;
			margin-top: -110px;
		}
		div.mailImage, img.mailImage, div.passImage, img.passImage {
			width: 70px;
			height: 70px;
			margin-left: 10px;
			margin-top: 10px;
		}
		div.mailText, div.passText {
			margin-left: 110px;
			margin-top: -40px; 
		}
		span.mailText, span.passText {
			font-family: "微软雅黑", "华文细黑";
			font-size: 24px;
			font-weight: 600;
			color: #FFFFFF;
		}
		div.mailPointer, div.passPointer {
			width: 240px;
			height: 100px;
			position: absolute;
			z-index: 1;
			cursor: pointer;
			background-color: rgba(255,255,255,0.0);
			margin-top: -61px;
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

	<!-- 添加弹出层 -->
	<div id="pop"></div>

	<!-- 添加屏幕隔离层 -->
	<div class="quarantine" id="quarantine"></div>

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
		<div class="contentChangeMail">
			<div class="mailImage">
				<img class="mailImage" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTM5ODUxMzQwNDE0IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjIwMDgiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjU2IiBoZWlnaHQ9IjI1NiI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNMjA0LjggODQyLjY0OTZhMTA4LjggMTA4LjggMCAwIDEtMTA4LjgtMTA4LjhWMjkwLjE1MDRjMC02MC4xMDg4IDQ4LjY5MTItMTA4LjggMTA4LjgtMTA4LjhoNjE0LjRjNjAuMTA4OCAwIDEwOC44IDQ4LjY5MTIgMTA4LjggMTA4Ljh2NDQzLjY5OTJBMTA4LjggMTA4LjggMCAwIDEgODE5LjIgODQyLjY0OTZIMjA0Ljh6IG0wLTY0aDYxNC40YTQ0LjggNDQuOCAwIDAgMCA0NC44LTQ0LjhWMjkwLjE1MDRBNDQuOCA0NC44IDAgMCAwIDgxOS4yIDI0NS4zNTA0SDIwNC44YTQ0LjggNDQuOCAwIDAgMC00NC44IDQ0Ljh2NDQzLjY5OTJjMCAyNC43ODA4IDIwLjA3MDQgNDQuOCA0NC44IDQ0Ljh6IiBmaWxsPSIjZmZmZmZmIiBwLWlkPSIyMDA5Ij48L3BhdGg+PHBhdGggZD0iTTEzOS41NzEyIDM4Ny4xNzQ0YTMyIDMyIDAgMSAxIDI4LjA1NzYtNTcuNTQ4OGwzMzUuOTc0NCAxNjMuOTkzNmM1LjI3MzYgMi41NiAxMS41MiAyLjU2IDE2Ljc5MzYgMGwzMzUuOTc0NC0xNjMuOTkzNmEzMiAzMiAwIDEgMSAyOC4wNTc2IDU3LjU0ODhsLTMzNS45MjMyIDE2My45NDI0Yy0yMy4wNCAxMS4yNjQtNDkuOTcxMiAxMS4yNjQtNzMuMDExMiAwTDEzOS41NzEyIDM4Ny4xNzQ0eiIgZmlsbD0iI2ZmZmZmZiIgcC1pZD0iMjAxMCI+PC9wYXRoPjwvc3ZnPg==" />
			</div>
			<div class="mailText">
				<span class="mailText">修改邮箱</span>
			</div>
			<div class="mailPointer" id="changeMail"></div>
		</div>
		<div class="contentChangePassword">
			<div class="passImage">
				<img class="passImage" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTM5ODUxODE2NDg2IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjUgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjI4MTMiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjU2LjI1IiBoZWlnaHQ9IjI1NiI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNNzA0LjEyOCAwYy0xNzYuNzM2IDAtMzIwIDE0My4yOTYtMzIwIDMyMCAwIDQxLjEyIDguNjA4IDgwLjAzMiAyMi44MTYgMTE2LjEyOGwtMzg4Ljc2OCAzODguNzM2Yy0xMS4yMzIgMTEuMjY0LTE4LjE3NiAyMS45NTItMTguMTc2IDM5LjEzNmwwIDk2YzAgMzQuMjQgMjkuNzI4IDY0IDY0IDY0bDk2IDBjMTcuMTUyIDAgMjgtNi44OCAzOS4yMzItMTguMDQ4bDQ1LjkyLTQ1Ljk1MiA3NC45NzYgMGMzNS4zMjggMCA2NC0yOC42NzIgNjQtNjRsMC02NCA2NCAwYzM1LjMyOCAwIDY0LTI4LjY3MiA2NC02NGwwLTc1LjAwOCA3NS44MDgtNzUuODcyYzM2LjEyOCAxNC4yNCA3NS4wMDggMjIuODggMTE2LjE5MiAyMi44OCAxNzYuNjcyIDAgMzIwLTE0My4yOTYgMzIwLTMyMHMtMTQzLjMyOC0zMjAtMzIwLTMyMHpNNzA0LjEyOCA1NzZjLTQ3LjM2IDAtOTEuMjY0LTEzLjc2LTEyOS4zMTItMzYuMjI0bC0xMS4wMDggMTAuOTc2LTk2Ljk2IDk2Ljk5MmMtMTIgMTItMTguNzUyIDI4LjI1Ni0xOC43NTIgNDUuMjQ4bDAgNzUuMDA4LTY0IDBjLTM1LjMyOCAwLTY0IDI4LjY0LTY0IDY0bDAgNjQtNzQuOTQ0IDBjLTE2Ljk2IDAtMzMuMjQ4IDYuNzUyLTQ1LjI0OCAxOC43NTJsLTQ1LjM3NiA0NS4zNzYtOTAuNDMyLTAuMTI4LTAuMDk2LTkxLjIgMzczLjI4LTM3Mi42MDhjMCAwIDAgMC4wMzIgMC4wMzIgMC4wNjRsNDcuMDA4LTQ3LjAwOGMtMjIuNDY0LTM4LjA0OC0zNi4yMjQtODEuOTItMzYuMjI0LTEyOS4yOCAwLTE0MS4zNzYgMTE0LjY1Ni0yNTYgMjU2LTI1NnMyNTYgMTE0LjYyNCAyNTYgMjU2LTExNC41OTIgMjU2LjAzMi0yNTUuOTY4IDI1Ni4wMzJ6TTg5MC4yNCAyNjMuNjQ4Yy0zNS44NzItNDkuOTg0LTc5LjU1Mi05My42LTEyOS43Ni0xMjkuNzI4LTguMTYtNS45Mi0xOC43Mi03LjM5Mi0yOC4yMjQtNC4wNjQtNDQuNDQ4IDE1LjY0OC03NC44OCA0Ni4wNDgtOTAuNDMyIDkwLjQ5Ni0xLjE4NCAzLjMyOC0xLjc2IDYuNzg0LTEuNzYgMTAuMjA4IDAgNi4zNjggMS45ODQgMTIuNjcyIDUuODI0IDE4LjAxNiAzNiA1MC4wNDggNzkuNjE2IDkzLjY5NiAxMjkuNjk2IDEyOS42OTYgOC4xOTIgNS44ODggMTguNjg4IDcuMzkyIDI4LjE5MiA0LjA5NiA0NC41MTItMTUuNTUyIDc0Ljk0NC00Ni4wMTYgOTAuNTYtOTAuNDk2IDEuMTg0LTMuMzI4IDEuNzYtNi43ODQgMS43Ni0xMC4yMDgtMC4wMzItNi4zNjgtMi4wNDgtMTIuNjcyLTUuODU2LTE4LjAxNnpNNzk0LjI0IDM1Mi4zMmMtNDcuMjk2LTM0LjAxNi04OC40OC03NS4yLTEyMi4yNC0xMjEuMzc2IDEyLjM4NC0zNS4yOTYgMzUuNTUyLTU4LjQ2NCA2OS44MjQtNzEuMDcyIDQ3LjMyOCAzNC4wOCA4OC40NDggNzUuMTY4IDEyMi4xMTIgMTIxLjk1Mi0xMi41MTIgMzUuMDQtMzUuNjE2IDU4LjA4LTY5LjY5NiA3MC40OTZ6IiBwLWlkPSIyODE0IiBmaWxsPSIjZmZmZmZmIj48L3BhdGg+PC9zdmc+" />
			</div>
			<div class="passText">
				<span class="passText">修改密码</span>
			</div>
			<div class="passPointer" id="changePassword"></div>
		</div>
		<div class="contentLoginRecord" id="loginRecord">
			<div class="loginRecordTitle">
				<span class="loginRecordTitle">最近&nbsp;10&nbsp;条登录记录</span><a href="<%=path%>/security/login-record"><span class="loginRecordTitle" style="margin-left: 30px;color: #1296DB">查看更多</span></a>
			</div>
			<table class="contentLoginRecord">
				<tr class="contentLoginRecord">
					<td style="width: 100px"><span class="loginRecordText">登录ID</span></td>
					<td style="width: 150px"><span class="loginRecordText">IP地址</span></td>
					<td style="width: 200px"><span class="loginRecordText">登录时间</span></td>
					<td style="width: 200px"><span class="loginRecordText">登录地点</span></td> 
				</tr>
			</table>
			<table class="contentLoginRecord">
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
	
	<script type="text/javascript">
		$("#changeMail").mouseover(function() {
			$("#changeMail").animate({"background-color": "rgba(255,255,255,0.4)"}, 200);
		});
		$("#changeMail").mouseout(function () {
			$("#changeMail").animate({"background-color": "rgba(255,255,255,0.0)"}, 200);
		});
		
		$("#changePassword").mouseover(function() {
			$("#changePassword").animate({"background-color": "rgba(255,255,255,0.4)"}, 200);
		});
		$("#changePassword").mouseout(function () {
			$("#changePassword").animate({"background-color": "rgba(255,255,255,0.0)"}, 200);
		});
	</script>
	
	<script>
		new Vue({
			el:"#loginRecord",
			data: {
				json : <%=request.getAttribute(SecurityKey.SECURITY_LOGIN_RECORD.key)%>
			}
		});
	</script>
	
	<script type="text/javascript">
		
		$("#changeMail").click(function () {
			// 发起请求
    		$.ajax({
    			url: "<%=path %>/security/change-mail/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
    			dataType: "json",
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				$("#quarantine").css("display", "block");
					$("#pop").empty();
					$("#pop").append("连接到服务器时出现问题");
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
							}
						},
						open: function(event, ui) {
							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
							$("#ui-id-1").text("错误");
						}
					});
    			},
    			success: function(data, textStatus) {
    				if (data.code == Code["OK"]) {
    					$("#quarantine").css("display", "block");
    					$("#pop").append("<iframe id='srcs' frameborder='0' scrolling='no' style='width:335px;height:140px' src='<%=path%>/security/change-mail/step1'><\/iframe>"); 
    					$("#pop").dialog({
    						height: $("#srcs").outerHeight()+142,
    						width: $("#srcs").outerWidth()+32,
    						model: true,
    						draggable: false,
    						buttons: {
    							"关闭": function() {
    								$(this).dialog("close");
    								$("#quarantine").css("display", "none");
    								$("#pop").empty();
    								$("#ui-id-1").empty();
    							}
    						},
    						open: function(event, ui) {
    							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
    							$("#ui-id-1").text("更改账号邮箱");
    						}
    					});
    				} else {
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
    								$("#pop").empty();
    								$("#ui-id-1").empty();
    								window.location.reload();
    							}
    						},
    						open: function(event, ui) {
    							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
    							$("#ui-id-1").text("错误");
    						}
    					});
    					if (data.code == Code["NOT_LOGIN"]) {
    						$("#pop").append("身份已过期，请重新登录");
    					} else {
    						$("#pop").append("服务端未知错误");
    					}
    				}
    			}
    		});
		});
	</script>
	
	<script type="text/javascript">
		
		$("#changePassword").click(function () {
			// 发起请求
    		$.ajax({
    			url: "<%=path %>/security/change-password/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
    			dataType: "json",
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				$("#quarantine").css("display", "block");
					$("#pop").empty();
					$("#pop").append("连接到服务器时出现问题");
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
							}
						},
						open: function(event, ui) {
							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
							$("#ui-id-1").text("错误");
						}
					});
    			},
    			success: function(data, textStatus) {
    				if (data.code == Code["OK"]) {
    					$("#quarantine").css("display", "block");
    					$("#pop").append("<iframe id='srcs' frameborder='0' scrolling='no' style='width:360px;height:200px' src='<%=path%>/security/change-password/step1'><\/iframe>"); 
    					$("#pop").dialog({
    						height: $("#srcs").outerHeight()+142,
    						width: $("#srcs").outerWidth()+32,
    						model: true,
    						draggable: false,
    						buttons: {
    							"关闭": function() {
    								$(this).dialog("close");
    								$("#quarantine").css("display", "none");
    								$("#pop").empty();
    								$("#ui-id-1").empty();
    							}
    						},
    						open: function(event, ui) {
    							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
    							$("#ui-id-1").text("更改账号密码");
    						}
    					});
    				} else {
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
    								$("#pop").empty();
    								$("#ui-id-1").empty();
    								window.location.reload();
    							}
    						},
    						open: function(event, ui) {
    							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
    							$("#ui-id-1").text("错误");
    						}
    					});
    					if (data.code == Code["NOT_LOGIN"]) {
    						$("#pop").append("身份已过期，请重新登录");
    					} else {
    						$("#pop").append("服务端未知错误");
    					}
    				}
    			}
    		});
		});
	</script>
	
</body>
</html>