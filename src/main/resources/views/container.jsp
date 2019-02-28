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
    <title>容器管理 - Cloud-Data 数据一体化服务平台</title>
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
				<img class="image" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTUxMDEyNDQ4NzEzIiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjI0MzEiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNNDYyLjM1MTUxNDY3IDExNC44MTIxMjE2YTQ0Ni44MzYzNjM3MyA0NDYuODM2MzYzNzMgMCAxIDAgNDQ2LjgzNjM2MzczIDQ0Ni44MzYzNjM3M2gtNDQ2LjgzNjM2MzczVjExNC44MTIxMjE2eiBtOTkuMjk2OTcwNjYtOTkuMjk2OTY5NmE0NDYuODM2MzYzNzMgNDQ2LjgzNjM2MzczIDAgMCAxIDQ0Ni44MzYzNjI2NyA0NDYuODM2MzYyNjdoLTQ0Ni44MzYzNjI2N1YxNS41MTUxNTJ6IiBwLWlkPSIyNDMyIiBmaWxsPSIjZmZmZmZmIj48L3BhdGg+PC9zdmc+" />
			</div>
			<div class="text">
				<span class="text">数据管理</span>
			</div>
			<!-- 覆盖层 -->
			<div class="override" id="export"></div>
		</div> </td>
		
		<td> <div class="outer rightContent">
			<div class="image">
				<img class="image" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTUxMDEyNDY1MDk1IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjI2MTAiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNMzgyLjMwMjE2NCAzNDcuOTY5OTc1QzM3My4zOTU0NTYgMzQ3Ljk2OTk3NSAzNjYuMjA1NzAzIDM1NS4xODEyMDIgMzY2LjIwNTcwMyAzNjQuMDY2NDVMMzY2LjIwNTcwMyA5NTMuNTYxNjczQzM2Ni4yMDU3MDMgOTYyLjQ0NjkyMSAzNzMuMzk1NDU2IDk2OS42NTgwNzUgMzgyLjMwMjE2NCA5NjkuNjU4MDc1IDM5MS4xNjU5NDUgOTY5LjY1ODA3NSAzOTguMzk4NjI1IDk2Mi40NDY5MjEgMzk4LjM5ODYyNSA5NTMuNTYxNjczTDM5OC4zOTg2MjUgMzY0LjA2NjQ1QzM5OC4zOTg2MjUgMzU1LjE4MTIwMiAzOTEuMTY1OTQ1IDM0Ny45Njk5NzUgMzgyLjMwMjE2NCAzNDcuOTY5OTc1TDM4Mi4zMDIxNjQgMzQ3Ljk2OTk3NVpNODkuMjM5MzE4IDU5Mi4yMDY5MjFDODAuMzU0MDcgNTkyLjIwNjkyMSA3My4xNDI4NTcgNTk5LjQxODA3NSA3My4xNDI4NTcgNjA4LjMwMzMyM0w3My4xNDI4NTcgOTUzLjU2MTY3M0M3My4xNDI4NTcgOTYyLjQ0NjkyMSA4MC4zNTQwNyA5NjkuNjU4MDc1IDg5LjIzOTMxOCA5NjkuNjU4MDc1IDk4LjEyNDU1OSA5NjkuNjU4MDc1IDEwNS4zMzU3NzEgOTYyLjQ0NjkyMSAxMDUuMzM1NzcxIDk1My41NjE2NzNMMTA1LjMzNTc3MSA2MDguMzAzMzIzQzEwNS4zMzU3NzEgNTk5LjQxODA3NSA5OC4xMjQ1NTkgNTkyLjIwNjkyMSA4OS4yMzkzMTggNTkyLjIwNjkyMUw4OS4yMzkzMTggNTkyLjIwNjkyMVpNOTY4LjM4NDkzNiAzOTIuMjY3NDFDOTU5LjQ5OTY5NiAzOTIuMjY3NDEgOTUyLjMwOTk0MyAzOTkuNDc4NjM4IDk1Mi4zMDk5NDMgNDA4LjM2Mzg4Nkw5NTIuMzA5OTQzIDk1My41NjE2NzNDOTUyLjMwOTk0MyA5NjIuNDQ2OTIxIDk1OS40OTk2OTYgOTY5LjY1ODA3NSA5NjguMzg0OTM2IDk2OS42NTgwNzUgOTc3LjI3MDE4NCA5NjkuNjU4MDc1IDk4NC41MDI4NTcgOTYyLjQ0NjkyMSA5ODQuNTAyODU3IDk1My41NjE2NzNMOTg0LjUwMjg1NyA0MDguMzYzODg2Qzk4NC41MDI4NTcgMzk5LjQ3ODYzOCA5NzcuMjcwMTg0IDM5Mi4yNjc0MSA5NjguMzg0OTM2IDM5Mi4yNjc0MUw5NjguMzg0OTM2IDM5Mi4yNjc0MVpNOTYzLjQ0ODY5MyAyMDkuODE4ODQzQzk3Mi4zMzM5NDEgMjA5LjcxMTU0MyA5NzkuNDgwNzY2IDIwMi40MzU5NSA5NzkuMzk0OTE4IDE5My41NTA3MDJMOTc4LjE5MzA1IDg5LjA1MjUyNkM5NzguMTUwMTIyIDg0LjU4ODM5OCA5NzYuMjE4NTUxIDgwLjMzODk0NCA5NzIuOTEzNDA4IDc3LjMxMjgwNSA5NjkuNjA4MjcyIDc0LjMwODE2OSA5NjUuMjUxNDk2IDcyLjg0ODc1IDk2MC43MjMwMjQgNzMuMTkyMTU1TDg1Ni41ODk2NyA4Mi4wMTI5NjVDODQ3LjcyNTg5IDgyLjc2NDE0MiA4NDEuMTU4NTMyIDkwLjUzMzM3NiA4NDEuODg4MjQxIDk5LjM5NzE5MyA4NDIuNjM5NDExIDEwOC4yNjA5MzcgODUwLjU1ODg2NiAxMTQuNjM1MTE4IDg1OS4yOTM4NzkgMTE0LjA5ODYxNUw5MjIuNTg1MTU0IDEwOC43MzMxNDcgNjc1LjUzNjcxMyAzODAuNjk4ODQzIDM5Mi44MTg1MiAxMDMuNzMyNTE3QzM4Ni42ODA0IDk3LjcyMzE3MyAzNzYuOTU4MTQyIDk3LjU1MTQzMyAzNzAuNjY5Nzg3IDEwMy4zNDYxNzZMNzguODk0NjU4IDM3MC4yMDQwMTRDNzIuMzI3MzAzIDM3Ni4yMTMzNTggNzEuODc2NjAyIDM4Ni4zODYyODYgNzcuODg1OTQ1IDM5Mi45NTM2MzcgODMuODk1Mjg5IDM5OS41MjA5ODcgOTQuMDY4MjUzIDM5OS45NTAyNjMgMTAwLjYxNDE0NCAzOTMuOTYyMzVMMzgxLjE2NDY4MyAxMzcuMzg0ODE0IDY2NC45NTU5NyA0MTUuMzgxMzU4QzY2Ny45NjA2NDIgNDE4LjM0MzEzMSA2NzIuMDE2OTU1IDQxOS45NzQyMTcgNjc2LjIyMzQ5NSA0MTkuOTc0MjE3TDY3Ni42OTU2NTQgNDE5Ljk3NDIxN0M2ODEuMDUyNDMxIDQxOS44NDU0ODYgNjg1LjE5NDU4NCA0MTcuOTM1MzYgNjg4LjEzNDg2OCA0MTQuNzE2MDVMOTQ2LjQ3MjI5NCAxMzAuMzQ1MzI2IDk0Ny4xODA1MzcgMTkzLjkxNTUzOEM5NDcuMjg3ODUyIDIwMi43MzY0MjEgOTU0LjQ1NjEzNyAyMDkuODE4ODQzIDk2My4yOTg0NTggMjA5LjgxODg0M0w5NjMuNDQ4NjkzIDIwOS44MTg4NDMgOTYzLjQ0ODY5MyAyMDkuODE4ODQzWk02NzUuMzQzNTUgNTkxLjU4NDQ3NUM2NjYuNDU4MzA5IDU5MS41ODQ0NzUgNjU5LjI0NzA5NyA1OTguNzk1NzAzIDY1OS4yNDcwOTcgNjA3LjY4MDk1MUw2NTkuMjQ3MDk3IDk1My41NjE2NzNDNjU5LjI0NzA5NyA5NjIuNDQ2OTIxIDY2Ni40NTgzMDkgOTY5LjY1ODA3NSA2NzUuMzQzNTUgOTY5LjY1ODA3NSA2ODQuMjI4Nzk4IDk2OS42NTgwNzUgNjkxLjQ0MDAxMSA5NjIuNDQ2OTIxIDY5MS40NDAwMTEgOTUzLjU2MTY3M0w2OTEuNDQwMDExIDYwNy42ODA5NTFDNjkxLjQ0MDAxMSA1OTguNzk1NzAzIDY4NC4yMjg3OTggNTkxLjU4NDQ3NSA2NzUuMzQzNTUgNTkxLjU4NDQ3NUw2NzUuMzQzNTUgNTkxLjU4NDQ3NVoiIHAtaWQ9IjI2MTEiIGZpbGw9IiNmZmZmZmYiPjwvcGF0aD48L3N2Zz4=" />
			</div>
			<div class="text">
				<span class="text">数据统计</span> 
			</div>
			<!-- 覆盖层 -->
			<div class="override" id="import"></div>
		</div> </td> </tr> </table>
	</div>
	
	<div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=application.getAttribute(AttributeKey.PAGE_TIME.key) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
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
			window.location.href = "<%=path%>/container/transmission";
		});
		$("#import").click(function () {
			window.location.href = "<%=path%>/container/statistics";
		});
	</script>
	
</body>
</html>