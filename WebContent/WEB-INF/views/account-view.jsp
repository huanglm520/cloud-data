<%@page import="cn.net.sunrise.su.enums.SecurityKey"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.net.sunrise.su.enums.AttributeKey"%>
<%@page import="cn.net.sunrise.su.beans.passport.UserBean"%>
<%@ page pageEncoding="UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<%
	UserBean usb = (UserBean)session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
	UserBean u   = (UserBean)request.getAttribute(SecurityKey.VIEW_USER.key);
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
    <title>查看用户 - Cloud-Data 数据一体化管理平台</title>
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
				<img class="topbarimg" src="https://huanglm520.github.io/cloud-data.static.io//images/cloud.svg">
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
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io//images/home.svg">
					<span class="navigation">&nbsp;个人主页</span>
					<div class="navigationPointer" id="personalHome"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io//images/container.svg">
					<span class="navigation">&nbsp;容器管理</span>
					<div class="navigationPointer" id="containerManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io//images/account.svg">
					<span class="navigation">&nbsp;账号管理</span>
					<div class="navigationPointer" id="accountManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io//images/security.svg">
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
					<input class="data_id" id="account" type="text" value="<%=u.getAccount() %>" disabled="disabled" />
				</div>
			<!-- 	<div class="operator">
					<img class="operator" id="account_o" />
				</div> -->
			</div>
			<div class="data">
				<div class="data_t">
					<span class="data_t">用户姓名：</span>
				</div>
				<div class="data_i" id="name_id">
					<input class="data_id" type="text" id="name_full" value="<%=u.getLast_name()+u.getFirst_name() %>" disabled="disabled" />
				</div>
			</div>
			<div class="data">
				<div class="data_t">
					<span class="data_t">所属公司：</span>
				</div>
				<div class="data_i">
					<input class="data_id" id="company" type="text" value="<%=u.getCompany() %>" disabled="disabled" />
				</div>
			</div>
			<div class="data">
				<div class="data_t">
					<span class="data_t">注册时间：</span>
				</div>
				<div class="data_i">
					<input class="data_id" id="regtime" type="text" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(u.getRegtime())) %>" disabled="disabled" />
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
</body>
</html>