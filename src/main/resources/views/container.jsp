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
    <title>容器管理 - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
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
			margin-bottom: 70px;
		}
		div.outer {
			width: 280px;
			height: 100px;
			background-color: #1296DB;
			border-radius: 5px;
		}
		div.image, img.image {
			width: 64px;
			height: 64px;
		}
		div.image {
			margin-top: 18px;
			margin-left: 20px;
			float: left;
		}
		div.text {
			width: 150px;
			margin-left: 100px;
			margin-top: -53px;
			float: left;
		}
		span.text {
			font-family: "微软雅黑", "华文细黑";
			font-size: 26px;
			color: #FFFFFF;
		}
		div.override {
			width: 280px;
			height: 100px;
			position: absolute;
			z-index: 1;
			cursor: pointer;
			background-color: rgba(255,255,255,0);
		}
		div.leftContent {
			
		}
		div.rightContent {
			margin-left: 130px;
		}
		tr.buttons {
			height: 170px;
		}
	</style>

</head>
<body>
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
		<table> <tr class="buttons"> <td> 
		<div class="outer leftContent">
			<div class="image">
				<img class="image" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQ0MTkwNzA2MjE3IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjgwNzgiIGRhdGEtc3BtLWFuY2hvci1pZD0iYTMxM3guNzc4MTA2OS4wLmk2IiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgd2lkdGg9IjI1NiIgaGVpZ2h0PSIyNTYiPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PC9zdHlsZT48L2RlZnM+PHBhdGggZD0iTTg3My43NTM5NzQgMTQ5Ljk2MTM4NEE1MTEuNzE1MzU4IDUxMS43MTUzNTggMCAxIDAgMTQ5LjY3Njc0MiA4NzQuMDM4NjE2IDUxMS43MTUzNTggNTExLjcxNTM1OCAwIDAgMCA4NzMuNzUzOTc0IDE0OS45NjEzODR6TTgzMS41Mzc0NTcgODI4LjYyMzg3OGE0NDcuNzUwOTM5IDQ0Ny43NTA5MzkgMCAxIDEtNjMzLjI0Nzc1Ni02MzMuMjQ3NzU2IDQ0Ny43NTA5MzkgNDQ3Ljc1MDkzOSAwIDAgMSA2MzMuMjQ3NzU2IDYzMy4yNDc3NTZ6IiBmaWxsPSIjRkZGRkZGIiBwLWlkPSI4MDc5Ij48L3BhdGg+PHBhdGggZD0iTTc2Ny41NzMwMzcgNDgwLjAxNzc5SDU0My42OTc1NjhWMjU2LjE0MjMyMWEzMS45ODIyMSAzMS45ODIyMSAwIDAgMC02My45NjQ0MiAwdjIyMy44NzU0NjlIMjU1Ljg1NzY3OWEzMS45ODIyMSAzMS45ODIyMSAwIDAgMCAwIDYzLjk2NDQyaDIyMy44NzU0NjlWNzY3Ljg1NzY3OWEzMS45ODIyMSAzMS45ODIyMSAwIDAgMCA2My45NjQ0MiAwVjU0My45ODIyMUg3NjcuNTczMDM3YTMxLjk4MjIxIDMxLjk4MjIxIDAgMCAwIDAtNjMuOTY0NDJ6IiBmaWxsPSIjRkZGRkZGIiBwLWlkPSI4MDgwIj48L3BhdGg+PC9zdmc+" />
			</div>
			<div class="text">
				<span class="text">新建容器</span>
			</div>
			<!-- 覆盖层 -->
			<div class="override" id="add"></div>
		</div> </td>
		
		<td> <div class="outer rightContent">
			<div class="image">
				<img class="image" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQ0MTkwNzYyNjkwIiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9Ijk1OTgiIGRhdGEtc3BtLWFuY2hvci1pZD0iYTMxM3guNzc4MTA2OS4wLmkxMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHdpZHRoPSIyNTYiIGhlaWdodD0iMjU2Ij48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwvc3R5bGU+PC9kZWZzPjxwYXRoIGQ9Ik04ODEuMjc3IDUxMmMwLTQ0Ljg0NSAxOS44NjEtODUuMTY3IDUxLjQ3MS0xMTMuMDY0IDE0LjY5NC0xMi45NjcgMTguNC0zNC4zODMgOC40ODMtNTEuMjg2bC03MC41NjgtMTIwLjI5MmMtOS42ODYtMTYuNTExLTI5LjQ5Ni0yMy45ODktNDcuNzU2LTE4LjI0Mi0xNS4xNDggNC43NjgtMzEuMzA3IDcuMzQ0LTQ4LjA4NCA3LjM0NC03NS4wNzEgMC0xMzcuNzg4LTUxLjU3OS0xNTIuOTAyLTEyMC4zNzRDNjE3LjgwNSA3Ny4zNDMgNjAxLjE4OCA2NCA1ODEuOTk4IDY0SDQ0Mi4wMDRjLTE5LjE5IDAtMzUuODA3IDEzLjM0My0zOS45MjUgMzIuMDg2LTE1LjExNCA2OC43OTUtNzcuODMxIDEyMC4zNzQtMTUyLjkwNCAxMjAuMzc0LTE2Ljc3NSAwLTMyLjkzMi0yLjU3Ni00OC4wNzktNy4zNDQtMTguMjU5LTUuNzQ3LTM4LjA2OSAxLjczLTQ3Ljc1NiAxOC4yNDFMODIuNzY3IDM0Ny42NDljLTkuOTE3IDE2LjkwMy02LjIxMSAzOC4zMiA4LjQ4MyA1MS4yODggMzEuNjExIDI3Ljg5NyA1MS40NyA2OC4yMTggNTEuNDcgMTEzLjA2MyAwIDQ0Ljg0NC0xOS44NTkgODUuMTY2LTUxLjQ3IDExMy4wNjMtMTQuNjk0IDEyLjk2OC0xOC40IDM0LjM4NC04LjQ4MyA1MS4yODhsNzAuNTcxIDEyMC4yOTJjOS42ODYgMTYuNTExIDI5LjQ5NyAyMy45ODggNDcuNzU2IDE4LjI0MSAxNS4xNDctNC43NjggMzEuMzA0LTcuMzQ0IDQ4LjA3OS03LjM0NCA3NS4wNzUgMCAxMzcuNzkxIDUxLjU3OCAxNTIuOTA1IDEyMC4zNzRDNDA2LjE5NSA5NDYuNjU3IDQyMi44MTMgOTYwIDQ0Mi4wMDMgOTYwSDU4MmMxOS4xOSAwIDM1LjgwOC0xMy4zNDMgMzkuOTI1LTMyLjA4NiAxNS4xMTMtNjguNzk2IDc3LjgyOS0xMjAuMzc0IDE1Mi45MDItMTIwLjM3NCAxNi43NzYgMCAzMi45MzMgMi41NzYgNDguMDgxIDcuMzQ0IDE4LjI2IDUuNzQ4IDM4LjA3LTEuNzMgNDcuNzU2LTE4LjI0MWw3MC41NjktMTIwLjI5MWM5LjkxNy0xNi45MDQgNi4yMTEtMzguMzIxLTguNDg0LTUxLjI4OS0zMS42MTEtMjcuODk4LTUxLjQ3Mi02OC4yMi01MS40NzItMTEzLjA2M3pNODI0LjM3IDc0OS4wNzVhMjI0LjY0OCAyMjQuNjQ4IDAgMCAwLTQ5LjU0My01LjUzNWMtMjkuNTIzIDAtNTguMjExIDUuNjU3LTg1LjI2NiAxNi44MTQtMjYuMjA0IDEwLjgwNi00OS43NSAyNi4yODgtNjkuOTg0IDQ2LjAxNS0yMC4zNDcgMTkuODM4LTM2LjM0NCA0Mi45OS00Ny41NDcgNjguODE1QTIxNC4zMTQgMjE0LjMxNCAwIDAgMCA1NjQuMjUxIDg5Nkg0NTkuNzVhMjEzLjk4NyAyMTMuOTg3IDAgMCAwLTcuNzc5LTIwLjgxNmMtMTEuMjAzLTI1LjgyNS0yNy4yLTQ4Ljk3OC00Ny41NDctNjguODE1LTIwLjIzNC0xOS43MjgtNDMuNzgtMzUuMjA5LTY5Ljk4NC00Ni4wMTUtMjcuMDU2LTExLjE1Ny01NS43NDQtMTYuODE0LTg1LjI2Ny0xNi44MTRhMjI0LjYzIDIyNC42MyAwIDAgMC00OS41NDEgNS41MzVsLTUyLjM0MS04OS4yMThhMjE3LjM1MSAyMTcuMzUxIDAgMCAwIDI4LjQwOC0zNy4wN0EyMTMuMzk1IDIxMy4zOTUgMCAwIDAgMjA2LjcyIDUxMmEyMTMuNDA3IDIxMy40MDcgMCAwIDAtMzEuMDItMTEwLjc4OCAyMTcuMzkgMjE3LjM5IDAgMCAwLTI4LjQwOC0zNy4wN2w1Mi4zNDEtODkuMjE4YTIyNC42ODMgMjI0LjY4MyAwIDAgMCA0OS41NDEgNS41MzVjMjkuNTIzIDAgNTguMjExLTUuNjU3IDg1LjI2Ny0xNi44MTQgMjYuMjA0LTEwLjgwNiA0OS43NS0yNi4yODcgNjkuOTg0LTQ2LjAxNSAyMC4zNDctMTkuODM4IDM2LjM0NC00Mi45OSA0Ny41NDctNjguODE1YTIxNC4yNDggMjE0LjI0OCAwIDAgMCA3Ljc3OS0yMC44MTZoMTA0LjVhMjEzLjg3MyAyMTMuODczIDAgMCAwIDcuNzc5IDIwLjgxNWMxMS4yMDMgMjUuODI0IDI3LjIgNDguOTc3IDQ3LjU0NyA2OC44MTUgMjAuMjM0IDE5LjcyOCA0My43OCAzNS4yMDkgNjkuOTgzIDQ2LjAxNiAyNy4wNTYgMTEuMTU3IDU1Ljc0MyAxNi44MTQgODUuMjY2IDE2LjgxNGEyMjQuNjUgMjI0LjY1IDAgMCAwIDQ5LjU0NC01LjUzNWw1Mi4zMzggODkuMjE3QTIxNy4zNDQgMjE3LjM0NCAwIDAgMCA4NDguMyA0MDEuMjFhMjEzLjM5NiAyMTMuMzk2IDAgMCAwLTMxLjAyMiAxMTAuNzg5QTIxMy4zOSAyMTMuMzkgMCAwIDAgODQ4LjMgNjIyLjc4NmEyMTcuMjc0IDIxNy4yNzQgMCAwIDAgMjguNDA5IDM3LjA3MWwtNTIuMzM5IDg5LjIxOHoiIHAtaWQ9Ijk1OTkiIGZpbGw9IiNGRkZGRkYiPjwvcGF0aD48cGF0aCBkPSJNNTEyIDMyMGMtMTA2LjAzOSAwLTE5MiA4NS45NjEtMTkyIDE5MnM4NS45NjEgMTkyIDE5MiAxOTIgMTkyLTg1Ljk2MSAxOTItMTkyLTg1Ljk2MS0xOTItMTkyLTE5MnogbTkwLjUxIDI4Mi41MUM1NzguMzM0IDYyNi42ODYgNTQ2LjE5IDY0MCA1MTIgNjQwcy02Ni4zMzQtMTMuMzE0LTkwLjUxLTM3LjQ5QzM5Ny4zMTQgNTc4LjMzMyAzODQgNTQ2LjE5IDM4NCA1MTJzMTMuMzE0LTY2LjMzNCAzNy40OS05MC41MUM0NDUuNjY2IDM5Ny4zMTQgNDc3LjgxIDM4NCA1MTIgMzg0czY2LjMzNCAxMy4zMTQgOTAuNTEgMzcuNDlDNjI2LjY4NiA0NDUuNjY2IDY0MCA0NzcuODEgNjQwIDUxMnMtMTMuMzE0IDY2LjMzMy0zNy40OSA5MC41MXoiIHAtaWQ9Ijk2MDAiIGZpbGw9IiNGRkZGRkYiPjwvcGF0aD48L3N2Zz4=" />
			</div>
			<div class="text">
				<span class="text">管理容器</span>
			</div>
			<!-- 覆盖层 -->
			<div class="override" id="manager"></div>
		</div> </td> </tr>
		
		<tr class="buttons"> <td> <div class="outer leftContent">
			<div class="image">
				<img class="image" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQ0MTkwODA2MDc1IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjExNjQ5IiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgd2lkdGg9IjI1NiIgaGVpZ2h0PSIyNTYiPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PC9zdHlsZT48L2RlZnM+PHBhdGggZD0iTTEwMDAuNzI3MjczIDM3NC42OTA5MDljLTEzLjk2MzYzNiAwLTIzLjI3MjcyNyA5LjMwOTA5MS0yMy4yNzI3MjggMjMuMjcyNzI3VjkwNy42MzYzNjRjMCAzOS41NjM2MzYtMzAuMjU0NTQ1IDY5LjgxODE4Mi02OS44MTgxODEgNjkuODE4MTgxSDExNi4zNjM2MzZjLTM5LjU2MzYzNiAwLTY5LjgxODE4Mi0zMC4yNTQ1NDUtNjkuODE4MTgxLTY5LjgxODE4MVYxNjIuOTA5MDkxYzAtMzkuNTYzNjM2IDMwLjI1NDU0NS02OS44MTgxODIgNjkuODE4MTgxLTY5LjgxODE4MmgzMTguODM2MzY0YzEzLjk2MzYzNiAwIDIzLjI3MjcyNy05LjMwOTA5MSAyMy4yNzI3MjctMjMuMjcyNzI3cy05LjMwOTA5MS0yMy4yNzI3MjctMjMuMjcyNzI3LTIzLjI3MjcyN0gxMTYuMzYzNjM2QzUxLjIgNDYuNTQ1NDU1IDAgMTAwLjA3MjcyNyAwIDE2Mi45MDkwOTF2NzQ0LjcyNzI3M2MwIDY1LjE2MzYzNiA1MS4yIDExNi4zNjM2MzYgMTE2LjM2MzYzNiAxMTYuMzYzNjM2aDc5MS4yNzI3MjhjNjUuMTYzNjM2IDAgMTE2LjM2MzYzNi01MS4yIDExNi4zNjM2MzYtMTE2LjM2MzYzNlYzOTcuOTYzNjM2YzAtMTMuOTYzNjM2LTExLjYzNjM2NC0yMy4yNzI3MjctMjMuMjcyNzI3LTIzLjI3MjcyN3pNNjY1LjYgMTc5LjJsLTI1LjYgNi45ODE4MThjLTY5LjgxODE4MiAyMC45NDU0NTUtMTMyLjY1NDU0NSA0MS44OTA5MDktMTg2LjE4MTgxOCA5MC43NjM2MzctNzIuMTQ1NDU1IDY5LjgxODE4Mi0xMTQuMDM2MzY0IDE5NS40OTA5MDktMTExLjcwOTA5MSAzMzUuMTI3MjcydjgzLjc4MTgxOGMwIDExLjYzNjM2NCA5LjMwOTA5MSAyMC45NDU0NTUgMjAuOTQ1NDU0IDIzLjI3MjcyOCAxMS42MzYzNjQgMi4zMjcyNzMgMjMuMjcyNzI3LTYuOTgxODE4IDI1LjYtMTguNjE4MTgybDEzLjk2MzYzNy01NS44NTQ1NDZjMzIuNTgxODE4LTEyNS42NzI3MjcgMTAwLjA3MjcyNy0yMTYuNDM2MzY0IDE3OS4yLTI0Mi4wMzYzNjMgMzAuMjU0NTQ1LTkuMzA5MDkxIDc0LjQ3MjcyNy0yMC45NDU0NTUgMTA3LjA1NDU0NS0yMy4yNzI3MjdsMjMuMjcyNzI4LTIuMzI3MjczYzQuNjU0NTQ1IDAgMTEuNjM2MzY0IDIuMzI3MjczIDEzLjk2MzYzNiA5LjMwOTA5MWwzMC4yNTQ1NDUgMTA0LjcyNzI3MmM0LjY1NDU0NSAxMy45NjM2MzYgMTMuOTYzNjM2IDIzLjI3MjcyNyAyNy45MjcyNzMgMjMuMjcyNzI4IDEzLjk2MzYzNiAyLjMyNzI3MyAyNS42LTQuNjU0NTQ1IDMyLjU4MTgxOC0xNi4yOTA5MDlsMjAyLjQ3MjcyOC0zMDIuNTQ1NDU1YzQuNjU0NTQ1LTYuOTgxODE4IDQuNjU0NTQ1LTE2LjI5MDkwOSAyLjMyNzI3Mi0yNS42LTIuMzI3MjczLTkuMzA5MDkxLTkuMzA5MDkxLTE2LjI5MDkwOS0xOC42MTgxODItMjAuOTQ1NDU0TDY3NC45MDkwOTEgNC42NTQ1NDVjLTExLjYzNjM2NC02Ljk4MTgxOC0yNS42LTQuNjU0NTQ1LTM3LjIzNjM2NCAyLjMyNzI3My0xMS42MzYzNjQgOS4zMDkwOTEtMTMuOTYzNjM2IDIzLjI3MjcyNy0xMS42MzYzNjMgMzQuOTA5MDkxbDM5LjU2MzYzNiAxMzcuMzA5MDkxeiBtNDYuNTQ1NDU1IDBsLTM0LjkwOTA5MS0xMjMuMzQ1NDU1IDI5My4yMzYzNjMgMTI4TDc5MS4yNzI3MjcgNDQ5LjE2MzYzNmwtMjcuOTI3MjcyLTk3Ljc0NTQ1NGMtNC42NTQ1NDUtMTYuMjkwOTA5LTIwLjk0NTQ1NS0yNS42LTM3LjIzNjM2NC0yMy4yNzI3MjdsLTQxLjg5MDkwOSA2Ljk4MTgxOGMtMzQuOTA5MDkxIDIuMzI3MjczLTg2LjEwOTA5MSAxNi4yOTA5MDktMTE2LjM2MzYzNyAyNS42LTcyLjE0NTQ1NSAyMy4yNzI3MjctMTMyLjY1NDU0NSA4Ni4xMDkwOTEtMTc0LjU0NTQ1NCAxNzYuODcyNzI3IDExLjYzNjM2NC05My4wOTA5MDkgNDQuMjE4MTgyLTE3NC41NDU0NTUgOTUuNDE4MTgyLTIyMy40MTgxODIgNDQuMjE4MTgyLTQxLjg5MDkwOSAxMDAuMDcyNzI3LTYyLjgzNjM2NCAxNjUuMjM2MzYzLTgxLjQ1NDU0NWwzNy4yMzYzNjQtMTEuNjM2MzY0YzE2LjI5MDkwOS00LjY1NDU0NSAyNy45MjcyNzMtMjMuMjcyNzI3IDIwLjk0NTQ1NS00MS44OTA5MDl6IiBmaWxsPSIjRkZGRkZGIiBwLWlkPSIxMTY1MCIgZGF0YS1zcG0tYW5jaG9yLWlkPSJhMzEzeC43NzgxMDY5LjAuaTE1IiBjbGFzcz0ic2VsZWN0ZWQiPjwvcGF0aD48L3N2Zz4=" />
			</div>
			<div class="text">
				<span class="text" style="font-size:24px">数据导出记录</span>
			</div>
			<!-- 覆盖层 -->
			<div class="override" id="export"></div>
		</div> </td>
		
		<td> <div class="outer rightContent">
			<div class="image">
				<img class="image" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQ0MTkwODM2Nzk2IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjEyNDYzIiBkYXRhLXNwbS1hbmNob3ItaWQ9ImEzMTN4Ljc3ODEwNjkuMC5pMTgiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjU2IiBoZWlnaHQ9IjI1NiI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNOTA3LjIzNjc2NyAxOS4wNjA4MTJINTg2LjIxNDUyNmMtMTMuOTU3NDg5IDAtMjMuMjYyNDgxIDkuMzA0OTkyLTIzLjI2MjQ4MSAyMy4yNjI0ODFzOS4zMDQ5OTIgMjMuMjYyNDgxIDIzLjI2MjQ4MSAyMy4yNjI0ODFIOTA3LjIzNjc2N2MzOS41NDYyMTggMCA2OS43ODc0NDQgMzIuNTY3NDc0IDY5Ljc4NzQ0NCA2OS43ODc0NDRWOTA3LjY4NzU5NGMwIDM5LjU0NjIxOC0zMC4yNDEyMjYgNjkuNzg3NDQ0LTY5Ljc4NzQ0NCA2OS43ODc0NDRIMTE2LjMxMjQwNmMtMzkuNTQ2MjE4IDAtNjkuNzg3NDQ0LTMyLjU2NzQ3NC02OS43ODc0NDQtNjkuNzg3NDQ0VjM3Mi42NTA1MjZjMC0xMy45NTc0ODktOS4zMDQ5OTItMjMuMjYyNDgxLTIzLjI2MjQ4MS0yMy4yNjI0ODFzLTIzLjI2MjQ4MSA5LjMwNDk5Mi0yMy4yNjI0ODEgMjMuMjYyNDgxdjUzNS4wMzcwNjhjMCA2NS4xMzQ5NDcgNTEuMTc3NDU5IDExNi4zMTI0MDYgMTE2LjMxMjQwNiAxMTYuMzEyNDA2aDc5MC45MjQzNjFjNjUuMTM0OTQ3IDAgMTE2LjMxMjQwNi01My41MDM3MDcgMTE2LjMxMjQwNi0xMTYuMzEyNDA2VjEzNS4zNzMyMThjMC02Mi44MDg2OTktNTMuNTAzNzA3LTExNi4zMTI0MDYtMTE2LjMxMjQwNi0xMTYuMzEyNDA2ek0xMjAuOTY0OTAyIDQ0LjY0OTU0MUwxNzQuNDY4NjA5IDcwLjIzODI3MWMxMTYuMzEyNDA2IDYwLjQ4MjQ1MSAxOTAuNzUyMzQ2IDE0Ni41NTM2MzIgMTk3LjczMTA5IDIzMC4yOTg1NjMgMi4zMjYyNDggMzAuMjQxMjI2IDIuMzI2MjQ4IDc5LjA5MjQzNiAwIDEwOS4zMzM2NjJsLTIuMzI2MjQ4IDIzLjI2MjQ4MWMwIDYuOTc4NzQ0LTQuNjUyNDk2IDExLjYzMTI0MS0xMS42MzEyNCAxMS42MzEyNDFsLTEwNy4wMDc0MTQgNi45Nzg3NDRjLTEzLjk1NzQ4OSAwLTI1LjU4ODcyOSA5LjMwNDk5Mi0zMC4yNDEyMjYgMjMuMjYyNDgyLTQuNjUyNDk2IDEzLjk1NzQ4OSAwIDI3LjkxNDk3NyA2Ljk3ODc0NSAzNC44OTM3MjFsMjQ4LjkwODU0OSAyNjUuMTkyMjg2YzYuOTc4NzQ0IDYuOTc4NzQ0IDE2LjI4MzczNyA5LjMwNDk5MiAyNS41ODg3MjkgOS4zMDQ5OTMgOS4zMDQ5OTIgMCAxNi4yODM3MzctNC42NTI0OTYgMjUuNTg4NzI5LTEzLjk1NzQ4OWwyMTQuMDE0ODI4LTI5MC43ODEwMTVjOS4zMDQ5OTItOS4zMDQ5OTIgMTEuNjMxMjQxLTI1LjU4ODcyOSA0LjY1MjQ5Ni0zNy4yMTk5N3MtMTguNjA5OTg1LTIwLjkzNjIzMy0zMi41Njc0NzQtMTguNjA5OTg1bC0xNDEuOTAxMTM1IDkuMzA0OTkyLTIuMzI2MjQ4LTI1LjU4ODcyOWMtNC42NTI0OTYtNzQuNDM5OTQtMTEuNjMxMjQxLTEzOS41NzQ4ODctNDguODUxMjExLTIwMC4wNTczMzhDNDY3LjU3NTg3MiAxMTYuNzYzMjMzIDM1NS45MTU5NjIgNDYuOTc1Nzg5IDIxOC42NjczMjMgMTkuMDYwODEyTDEzNy4yNDg2MzkgMC40NTA4MjdjLTExLjYzMTI0MS0yLjMyNjI0OC0yMy4yNjI0ODEgNC42NTI0OTYtMjcuOTE0OTc3IDEzLjk1NzQ4OS00LjY1MjQ5NiAxMS42MzEyNDEgMi4zMjYyNDggMjUuNTg4NzI5IDExLjYzMTI0IDMwLjI0MTIyNXogbTM2MC41Njg0NTkgMTgzLjc3MzYwMmMzMi41Njc0NzQgNTMuNTAzNzA3IDM3LjIxOTk3IDExMS42NTk5MSA0MS44NzI0NjYgMTc5LjEyMTEwNWwyLjMyNjI0OCAzOS41NDYyMThjMCAxOC42MDk5ODUgMTYuMjgzNzM3IDMyLjU2NzQ3NCAzNC44OTM3MjIgMzIuNTY3NDc0bDEyNy45NDM2NDctNi45Nzg3NDUtMTkwLjc1MjM0NiAyNTguMjEzNTQyLTIxOC42NjczMjQtMjMyLjYyNDgxMiAxMDIuMzU0OTE4LTYuOTc4NzQ1YzE2LjI4MzczNyAwIDMwLjI0MTIyNi0xMy45NTc0ODkgMzIuNTY3NDczLTMyLjU2NzQ3M2wyLjMyNjI0OS00MS44NzI0NjdjNC42NTI0OTYtMzQuODkzNzIyIDQuNjUyNDk2LTg2LjA3MTE4IDAtMTE4LjYzODY1NC02Ljk3ODc0NC03NC40Mzk5NC01NS44Mjk5NTUtMTQ4Ljg3OTg4LTEzMi41OTYxNDMtMjA5LjM2MjMzMSA4OC4zOTc0MjkgMjcuOTE0OTc3IDE2Mi44MzczNjggNzkuMDkyNDM2IDE5Ny43MzEwOSAxMzkuNTc0ODg4eiIgZmlsbD0iI0ZGRkZGRiIgcC1pZD0iMTI0NjQiPjwvcGF0aD48L3N2Zz4=" />
			</div>
			<div class="text">
				<span class="text" style="font-size:24px">数据导入记录</span> 
			</div>
			<!-- 覆盖层 -->
			<div class="override" id="import"></div>
		</div> </td> </tr> </table>
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
		// 绑定按钮动画事件
		$("#add").mouseover(function () {
			$("#add").animate({"background-color":"rgba(255,255,255,0.4)"}, 200);
		});
		$("#add").mouseout(function () {
			$("#add").animate({"background-color":"rgba(255,255,255,0)"}, 200);
		});
		
		$("#manager").mouseover(function () {
			$("#manager").animate({"background-color":"rgba(255,255,255,0.4)"}, 200);
		});
		$("#manager").mouseout(function () {
			$("#manager").animate({"background-color":"rgba(255,255,255,0)"}, 200);
		});
		
		$("#export").mouseover(function () {
			$("#export").animate({"background-color":"rgba(255,255,255,0.4)"}, 200);
		});
		$("#export").mouseout(function () {
			$("#export").animate({"background-color":"rgba(255,255,255,0)"}, 200);
		});
		
		$("#import").mouseover(function () {
			$("#import").animate({"background-color":"rgba(255,255,255,0.4)"}, 200);
		});
		$("#import").mouseout(function () {
			$("#import").animate({"background-color":"rgba(255,255,255,0)"}, 200);
		});
	</script>
	
	<script type="text/javascript">
		// 跳转事件
		$("#add").click(function () {
			window.location.href = "<%=path%>/container/add";
		});
		$("#manager").click(function () {
			window.location.href = "<%=path%>/container/manager";
		});
		$("#export").click(function () {
			window.location.href = "<%=path%>/container/export";
		});
		$("#import").click(function () {
			window.location.href = "<%=path%>/container/import";
		});
	</script>
	
</body>
</html>