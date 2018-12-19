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
    <title>访问受限 - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="<%=path %>/resources/images/cloud.png" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/public.css" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/toolbar.css" />
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/vue.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/timer.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/public.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/toolbar.js"></script>

	<style type="text/css">
		div.content {
			width: 100%;
			text-align: center;
			margin-bottom: 70px;
		}
		span.content {
			font-family: "微软雅黑", "华文细黑";
			font-size: 24px;
			font-weight: 600;
			color: #FF0000;
		}
	</style>

</head>
<body>
	<div class="topbar"> 
		<div class="topbarinner">
			<div>
				<img class="topbarimg" src="<%=path%>/resources/images/cloud.svg">
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
					<img class="navigation" src="<%=path%>/resources/images/home.svg">
					<span class="navigation">&nbsp;个人主页</span>
					<div class="navigationPointer" id="personalHome"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="<%=path%>/resources/images/container.svg">
					<span class="navigation">&nbsp;容器管理</span>
					<div class="navigationPointer" id="containerManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="<%=path%>/resources/images/account.svg">
					<span class="navigation">&nbsp;账号管理</span>
					<div class="navigationPointer" id="accountManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="<%=path%>/resources/images/security.svg">
					<span class="navigation">&nbsp;安全中心</span>
					<div class="navigationPointer" id="securityCenter"></div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="content">
		<span class="content">当前账户没有权限访问此容器</span>
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
	
</body>
</html>