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
    <title>账号管理 - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://static.sunrise-su.net.cn/cloud-data/images/cloud.png" />
    <link rel="stylesheet" href="https://static.sunrise-su.net.cn/cloud-data/scripts/css/public.css" />
    <link rel="stylesheet" href="https://static.sunrise-su.net.cn/cloud-data/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://static.sunrise-su.net.cn/jquery-ui.min.css" />
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/vue.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/check.js"></script>

	<style type="text/css">
		div.content {
			border: 3px solid #8C948C;
			width: 600px;
			height: 400px;
			margin: auto;
			margin-bottom: 60px;
			border-radius: 10px;
		}
		div.portait, img.portait {
			width: 150px;
			height: 150px; 
		}
		div.portait {
			margin-top: 60px;
			margin-left: 15px;
			float: left;
		}
		div.userinfo {
			width: 400px;
			margin-left: 180px;
			margin-top: 30px;
		}
		div.data {
			width: 100%;
			height: 35px;
			margin-top: 25px;
			float: left;
			border-bottom: 2px solid #8C948C;
		}
		div.data_t {
			text-align: right;
			width: 90px;
			margin-top: 5px;
		}
		span.data_t {
			font-family: "微软雅黑", "华文细黑";
			font-size: 16px;
			color: #8C948C;
		}
		div.data_i {
			margin-left: 90px; 
			margin-top: -23px;
		}
		input.data_id, input.data_ie {
			font-family: "微软雅黑", "华文细黑";
			font-size: 16px;
			color: #8C948C;
			cursor: text;
			padding-left: 5px;
			padding-right: 5px;
			width: 230px;
			height: 25px;
			border: none;
			outline: none;
		}
		input.data_id {
			background-color: rgba(0,0,0,0);
		}
		input.data_ie {
			background-color: #FFFFFF;
		}
		div.operator, img.operator {
			width: 25px;
			height: 25px;
			margin-left: 185px; 
			margin-top: -15px; 
		}
		img.operator {
			cursor: pointer;
		}
		div.error {
			width: 100%;
			text-align: center;
			margin-top: 260px;
			height: 25px;
		}
		span.error {
			font-family: "微软雅黑", "华文细黑";
			font-size: 14px;
			color: #FF0000;
		}
		div.hint {
			width: 100%;
			text-align: center;
			margin-top: 50px;
		}
		span.hint {
			font-family: "Consolas";
			font-size: 34px;
			font-weight: 600;
			color: #8C948C;
		}
		input.lastname_ie, input.firstname_ie {
			padding-left: 5px;
			padding-right: 5px;
		}
		input.lastname_ie {
			width: 60px;
		}
		input.firstname_ie {
			width: 150px;
		}
	</style>

</head>
<body>
	<div class="topbar"> 
		<div class="topbarinner">
			<div>
				<img class="topbarimg" src="https://static.sunrise-su.net.cn/cloud-data/images/cloud.svg">
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
					<img class="navigation" src="https://static.sunrise-su.net.cn/cloud-data/images/home.svg">
					<span class="navigation">&nbsp;个人主页</span>
					<div class="navigationPointer" id="personalHome"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://static.sunrise-su.net.cn/cloud-data/images/container.svg">
					<span class="navigation">&nbsp;容器管理</span>
					<div class="navigationPointer" id="containerManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://static.sunrise-su.net.cn/cloud-data/images/account.svg">
					<span class="navigation">&nbsp;账号管理</span>
					<div class="navigationPointer" id="accountManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://static.sunrise-su.net.cn/cloud-data/images/security.svg">
					<span class="navigation">&nbsp;安全中心</span>
					<div class="navigationPointer" id="securityCenter"></div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="content">
		<div class="portait">
			<img class="portait" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQyNDU4MDg1MDk3IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjQ2NzgiIGRhdGEtc3BtLWFuY2hvci1pZD0iYTMxM3guNzc4MTA2OS4wLmk0IiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgd2lkdGg9IjI1NiIgaGVpZ2h0PSIyNTYiPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PC9zdHlsZT48L2RlZnM+PHBhdGggZD0iTTM2MC41NDI1NjkgMTAyMy45NDMxNjhhMjc0LjMyODMzOCAyNzQuMzI4MzM4IDAgMCAxIDIxNS45NjE4MTYtMjY2Ljc2OTY3NSAzOC4yNDc5NzQgMzguMjQ3OTc0IDAgMCAwIDE4Ljc1NDU3OC0zNi45OTc2NjljLTYzLjkzNjA2NC0yOC40MTYwMjgtOTAuOTMxMjkxLTExMi4zMDAxNDQtOTAuOTMxMjkxLTE5MC4wNDYzOTggMC0xMDMuMzc3NTExIDYxLjYwNTk1LTE4OC44NTI5MjUgMTU5LjY0MTI0OC0xODguODUyOTI1czE1OS42NDEyNDggODUuMjQ4MDg1IDE1OS42NDEyNDggMTg4Ljg1MjkyNWMwIDc3Ljg1OTkxOC0yNy4yMjI1NTUgMTYxLjk3MTM2Mi05MS4zMjkxMTYgMTkwLjE2MDA2MmEzNi40ODYxOCAzNi40ODYxOCAwIDAgMCAyMC40NTk1NDEgMzYuODg0MDA1IDI3MS43NzA4OTYgMjcxLjc3MDg5NiAwIDAgMSAyMTQuNTQxMDE0IDI2Ni43Njk2NzVIMzYwLjU0MjU2OXpNNjYzLjg1NTI1NiAyODQuNjE0OTQxQzU2NS44MTk5NTggMjg0LjYxNDk0MSA0NDkuMDg2OTEzIDM0Ni42NzU1NDcgNDQ5LjA4NjkxMyA1MzAuMzU2NzU0YzAgNzcuNzQ2MjU0LTAuNTExNDg5IDE2MS43NDQwMzQgNjMuNDI0NTc2IDE5MC4wNDYzOTgtMi4zMzAxMTQgMTcuMDQ5NjE3LTIuNzI3OTM5IDE5LjMyMjg5OS0xNC4wOTQzNTEgMTkuMzIyOWEyOTEuNzE4OTQ4IDI5MS43MTg5NDggMCAwIDAtMTkzLjIyODk5MyAyODQuMTYwMjg0aC0xOTMuMjI4OTkzYTU2LjAzNjQwOCA1Ni4wMzY0MDggMCAwIDEtNTUuMTI3MDk1LTU2LjgzMjA1N1Y1Ni44MzIwNTdhNTYuMDM2NDA4IDU2LjAzNjQwOCAwIDAgMSA1NS4xMjcwOTUtNTYuODMyMDU3aDY2MS44MDkzMDJhNTYuMDM2NDA4IDU2LjAzNjQwOCAwIDAgMSA1NS4xMjcwOTUgNTYuODMyMDU3djMwNS4zNTg2NDFBMjA2LjE4NjcwMiAyMDYuMTg2NzAyIDAgMCAwIDY2My44NTUyNTYgMjg0LjYxNDk0MXpNMTk1LjEwNDQ1MSA0NTUuMTExMTExSDMzMi45NzkwMjFhMjguNDE2MDI4IDI4LjQxNjAyOCAwIDAgMCAwLTU2LjgzMjA1N0gxOTUuMTA0NDUxYTI4LjQxNjAyOCAyOC40MTYwMjggMCAwIDAgMCA1Ni44MzIwNTd6IG0wLTExMy42NjQxMTRoMTkzLjIyODk5M2EyOC40MTYwMjggMjguNDE2MDI4IDAgMCAwIDAtNTYuODMyMDU2aC0xOTMuMjI4OTkzYTI4LjQxNjAyOCAyOC40MTYwMjggMCAwIDAgMCA1Ni44MzIwNTZ6IG0zMDMuMzEyNjg3LTE3MC40OTYxN0gxOTUuMTA0NDUxYTI4LjQxNjAyOCAyOC40MTYwMjggMCAwIDAgMCA1Ni44MzIwNTdoMzAzLjMxMjY4N2EyOC41ODY1MjUgMjguNTg2NTI1IDAgMCAwIDAtNTcuMTczMDQ5eiIgZmlsbD0iIzhDOTQ4QyIgcC1pZD0iNDY3OSI+PC9wYXRoPjwvc3ZnPg==">
		</div>
		<div class="userinfo">
			<div class="data" style="margin-top: -10px">
				<div class="data_t">
					<span class="data_t">注册邮箱：</span>
				</div>
				<div class="data_i">
					<input class="data_id" id="account" type="text" value="<%=usb.getAccount() %>" disabled="disabled" />
				</div>
			<!-- 	<div class="operator">
					<img class="operator" id="account_o" />
				</div> -->
			</div>
			<div class="data">
				<div class="data_t">
					<span class="data_t">用户姓名：</span>
				</div>
				<div class="data_i" id="name_ie" style="display: none;">
					<input class="data_ie lastname_ie" id="lastname" type="text" value="<%=usb.getLast_name() %>" />
					<input class="data_ie firstname_ie" id="firstname" type="text" value="<%=usb.getFirst_name() %>" />
				</div>
				<div class="data_i" id="name_id">
					<input class="data_id" type="text" id="name_full" value="<%=usb.getLast_name()+usb.getFirst_name() %>" />
				</div>
				<div class="operator">
					<img class="operator" id="name_o" title="修改姓名" />
				</div>
			</div>
			<div class="data">
				<div class="data_t">
					<span class="data_t">所属公司：</span>
				</div>
				<div class="data_i">
					<input class="data_id" id="company" type="text" value="<%=usb.getCompany() %>" disabled="disabled" />
				</div>
				<div class="operator">
					<img class="operator" id="company_o" title="修改公司" />
				</div>
			</div>
			<div class="data">
				<div class="data_t">
					<span class="data_t">注册时间：</span>
				</div>
				<div class="data_i">
					<input class="data_id" id="regtime" type="text" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(usb.getRegtime())) %>" disabled="disabled" />
				</div>
			<!-- 	<div class="operator">
					<img class="operator" id="account_o" />
				</div> -->
			</div>
			
		</div>
		<div class="error">
			<span class="error" id="error"></span>
		</div>
		<div class="hint">
			<span class="hint">CLOUD-DATA&nbsp;USER&nbsp;CARD</span>
		</div>
	</div>
	
	<div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=new SimpleDateFormat("yyyy").format(new Date()) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
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
		var $img_change = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQyNDY3MTQ1NDU2IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjIwNzAiIGRhdGEtc3BtLWFuY2hvci1pZD0iYTMxM3guNzc4MTA2OS4wLmk4IiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgd2lkdGg9IjI1NiIgaGVpZ2h0PSIyNTYiPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PC9zdHlsZT48L2RlZnM+PHBhdGggZD0iTTkzMi45ODEgNjQ0LjUzOGMtMTYuMzc5IDAtMzUuMjkgMTMuNDAxLTM1LjI5IDI5Ljc4djEyMC4xNjVjMCA1Ny4wMzAtNDYuMDExIDEwMy4xODktMTAyLjU5NCAxMDMuMTg5aC01NjkuMTA2Yy01Ni43MzIgMC0xMDIuNTk0LTQ2LjE1OS0xMDIuNTk0LTEwMy4xODl2LTU2Ny45MTRjMC01Ny4wMzAgNDUuODYyLTEwMy4xODkgMTAyLjU5NC0xMDMuMTg5aDI1Mi4wOTFjMTYuMzc5IDAgMjkuNjMyIDEuNDg5IDI5LjYzMi0xNC44OXMtMTMuMjUyLTQ0LjY3LTI5LjYzMi00NC42N2gtMjk1Ljg3Yy02NS4zNjggMC0xMTguMzc3IDUzLjMwNy0xMTguMzc3IDExOS4xMjJ2NjU1LjE3MWMwIDY1LjgxNSA1My4wMDkgMTE5LjEyMiAxMTguMzc3IDExOS4xMjJoNjU2LjY2YzY1LjM2OCAwIDExOC4zNzctNTMuMzA3IDExOC4zNzctMTE5LjEyMnYtMTYzLjc5M2MwLjAwMS0xNi4zNzktNy44OTEtMjkuNzgtMjQuMjctMjkuNzh6TTI0Ny43MzEgNzQyLjk2M2MtNC43NjUgMzIuNDYgMTcuNDIyIDU0LjIgNDkuNTg0IDQ4LjI0NWwxODguODA4LTM0LjA5OS0yMDkuMjA4LTIxMC41NDktMjkuMTg1IDE5Ni40MDN6TTYzOS42NDMgMjgwLjAyNGMyMy4yMjktMjMuMzc3IDYwLjYwMy0yMy4zNzcgODMuODMyIDBsNDEuODQyIDQxLjk5YzIzLjA4MCAyMy4zNzcgMjMuMDgwIDYxLjA1MCAwIDg0LjI3OGwtMTg4LjM2MyAxODkuNTU0Yy0yMy4wODAgMjMuMjI5LTYwLjYwMyAyMy4yMjktODMuNjgzIDBsLTQxLjg0Mi00Mi4xNGMtMjMuMDgwLTIzLjIyOS0yMy4wODAtNjAuOTAxIDAtODQuMjc4bDE4OC4yMTQtMTg5LjQwNXpNNTM1LjExMyA3MjIuMjY0bDM1NS43MjgtMzU4LjExLTIwOS4yMDgtMjEwLjU0OC0zNTUuNzI4IDM1Ny45NjIgMjA5LjIwOCAyMTAuNjk3ek05MzUuODA5IDMwNC41OTRjMzQuNjk0LTM0Ljg0NCAyNC40Mi04MS4xNTItMTAuMjc0LTExNS45OTVsLTgzLjY4My04NC4yNzljLTM0LjY5NC0zNC44NDQtOTAuODMxLTM0Ljg0NC0xMjUuNTI1IDBsMjA5LjIwOCAyMTAuNTQ4IDEwLjI3NC0xMC4yNzR6IiBwLWlkPSIyMDcxIiBmaWxsPSIjOEM5NDhDIiBkYXRhLXNwbS1hbmNob3ItaWQ9ImEzMTN4Ljc3ODEwNjkuMC5pNyIgY2xhc3M9IiI+PC9wYXRoPjwvc3ZnPg==";
		var $img_save = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQyNDY3MjU4OTM5IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjI4ODQiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjU2IiBoZWlnaHQ9IjI1NiI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNMTAxMy4zIDIyMy4ybC0xNDguNy0xNDguNWMtNi44LTYuOC0xNi0xMC44LTI2LjItMTAuOC03LjQgMC0zMi45IDAtNzAuMyAwTDI1NiA2My45Yy04My43IDAtMTQ1IDAtMTU0LjMgMGwtMSAwYy0yMC40IDAtMzYuNyAxNi4zLTM2LjcgMzYuN2wwIDg4NS42IDAgMC44YzAgMjAuNCAxNi4zIDM2LjkgMzYuNyAzNi45bDExNy45IDAgMC44IDAgNjQ4LjMgMCAxIDAgMC44IDBMOTg2IDEwMjMuOWwxLjEgMGMyMC43IDAgMzYuOS0xNi41IDM2LjktMzYuOWwwLTczNi42IDAtMC41QzEwMjQgMjQwLjIgMTAyMC45IDIzMSAxMDEzLjMgMjIzLjJ6TTcwNCAxMjhsMCAyNTZMMzIwIDM4NGwwLTI1Nkw3MDQgMTI4ek0zMjAgOTYwbDAtMzIwIDQ0OCAwIDAgMzIwTDMyMCA5NjB6TTk2MCA5NjBsLTkwLjYgMC0wLjggMC0xIDBMODMyIDk2MCA4MzIgNjIzLjJjMC0yNi44LTIxLjEtNDcuMy00Ny4yLTQ3LjNMMzAzLjIgNTc1LjljLTI1LjkgMC00Ny4yIDIwLjQtNDcuMiA0Ny4zbDAgMzM2LjctMzYuNyAwLTAuOCAwTDEyOCA5NTkuOWwwLTgzMiAxMjggMEwyNTYgNDAwLjdjMCAyNi44IDIxLjQgNDcuMyA0Ny4yIDQ3LjNsNDE3LjUgMGMyNi4yIDAgNDcuMi0yMC40IDQ3LjItNDcuM2wwLTI3Mi43IDU5LjMgMEw5NjAgMjYwLjQgOTYwIDk2MHoiIHAtaWQ9IjI4ODUiIGZpbGw9IiM4Qzk0OEMiPjwvcGF0aD48cGF0aCBkPSJNNjcyIDcwNCA0MTYgNzA0Yy0xNy43IDAtMzIgMTQuMy0zMiAzMnMxNC4zIDMyIDMyIDMybDI1NiAwYzE3LjcgMCAzMi0xNC4zIDMyLTMyUzY4OS43IDcwNCA2NzIgNzA0eiIgcC1pZD0iMjg4NiIgZmlsbD0iIzhDOTQ4QyI+PC9wYXRoPjxwYXRoIGQ9Ik02NzIgODMyIDQxNiA4MzJjLTE3LjcgMC0zMiAxNC4zLTMyIDMyczE0LjMgMzIgMzIgMzJsMjU2IDBjMTcuNyAwIDMyLTE0LjMgMzItMzJTNjg5LjcgODMyIDY3MiA4MzJ6IiBwLWlkPSIyODg3IiBmaWxsPSIjOEM5NDhDIj48L3BhdGg+PC9zdmc+";
		
		// 添加操作标记
		var $flag_change = 0;
		var $flag_save = 1;
		var $arr_flag = new Array();
		$arr_flag["name"] = $flag_change;
		$arr_flag["company"] = $flag_change;
		
		$("#name_o").attr("src", $img_change);
		$("#company_o").attr("src", $img_change);
	</script>
	
	<script type="text/javascript">
		// name事件
		$("#name_o").click(function () {
			if ($arr_flag["name"] === $flag_change) {
				$arr_flag["name"] = $flag_save;
				$("#name_o").attr("src", $img_save);
				$("#name_o").attr("title", "保存姓名");
				$("#name_ie").css("display", "block");
				$("#name_id").css("display", "none");
			} else if ($arr_flag["name"] === $flag_save) {
				
				var $firstname = $("#firstname").val();
				if (!(firstNameCheck.test($firstname))) {
	    			$("#error").text("名字只能使用字母或汉字，并且不能超过32个字符，不可为空");
	    			return;
	    		}
				var $lastname = $("#lastname").val();
				if (!(lastNameCheck.test($lastname))) {
	    			$("#error").text("姓氏只能使用字母或汉字，并且不能超过32个字符，不可为空");
	    			return;
	    		}
				
				$.ajax({
	    			url: "<%=path%>/account/change-name/", // Write request url
	    			type: "POST",
	    			timeout: 5000,
	    			async: true,
	    			data: {"first_name":$firstname, "last_name":$lastname},
	    			dataType: "json",
	    			error: function(XMLHttpRequest, textStatus, errorThrown) {
	    				$("#error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
	    			},
	    			success: function(data, textStatus) {
	    				if (data.code == Code["OK"]) {
	    					$("#name_full").val($lastname+$firstname);
	    					
	    					$arr_flag["name"] = $flag_change;
	    					$("#name_o").attr("src", $img_change);
	    					$("#name_o").attr("title", "修改姓名");
	    					$("#name_ie").css("display", "none");
	    					$("#name_id").css("display", "block");
	    				} else {
	    					if (data.code == Code["FIRST_NAME_NOT_ACCEPT"]) {
	    						$("#error").text("名字只能使用字母或数字，并且不能超过32个字符，不可为空");
	    					} else if (data.code == Code["LAST_NAME_NOT_ACCEPT"]) {
	    						$("#error").text("姓氏只能使用字母或汉字，并且不能超过32个字符，不可为空");
	    					} else if (data.code == Code["NOT_LOGIN"]) {
	    						$("#error").text("身份已过期，请重新登录");
	    					} else if (data.code == Code["SERVER_ERROR"]) {
	    						$("#error").text("服务端发生未知错误，请稍后重试");
	    					}
	    				}
	    			}
	    		});
				
				
			}
		});
	</script>
	
	<script type="text/javascript">
		// company事件
		$("#company_o").click(function() {
			if ($arr_flag["company"] === $flag_change) {
				$arr_flag["company"] = $flag_save;
				$("#company_o").attr("src", $img_save);
				$("#company_o").attr("title", "保存公司");
				$("#company").attr("class", "data_ie");
				$("#company").removeAttr("disabled");
			} else if ($arr_flag["company"] === $flag_save) {
				var $company = $("#company").val();
				if (!(companyCheck.test($company))) {
	    			$("#error").text("公司名称格式不规范，公司名称最长为64个字符，不可为空");
	    			return;
	    		}
				$.ajax({
	    			url: "<%=path%>/account/change-company/", // Write request url
	    			type: "POST",
	    			timeout: 5000,
	    			async: true,
	    			data: {"company":$company},
	    			dataType: "json",
	    			error: function(XMLHttpRequest, textStatus, errorThrown) {
	    				$("#error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
	    			},
	    			success: function(data, textStatus) {
	    				if (data.code == Code["OK"]) {
	    					$("#company").val($company);
	    					$arr_flag["company"] = $flag_change;
	    					$("#company_o").attr("src", $img_change);
	    					$("#company_o").attr("title", "修改公司");
	    					$("#company").attr("class", "data_id");
	    					$("#company").attr("disabled", "disabled");
	    				} else {
	    					if (data.code == Code["COMPANY_NOT_ACCEPT"]) {
	    						$("#error").text("公司名称格式不规范，公司名称最长为64个字符，不可为空");
	    					} else if (data.code == Code["NOT_LOGIN"]) {
	    						$("#error").text("身份已过期，请重新登录");
	    					} else if (data.code == Code["SERVER_ERROR"]) {
	    						$("#error").text("服务端发生未知错误，请稍后重试");
	    					}
	    				}
	    			}
	    		});
			}
		});
	</script>
	
</body>
</html>