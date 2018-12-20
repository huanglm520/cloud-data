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
    <title>容器详细信息 - Cloud-Data 数据一体化管理平台</title>
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
		div.db_info, div.db_field, div.db_privilege {
			width: 1000px;
			margin: auto;
			margin-top: 30px;
		}
		div.db_info_title, div.db_field_title, div.db_privilege_title {
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
			width: 500px;
			margin: auto;
			margin-top: 20px;
		}
		table.tb_info, td.tb_info, div.tb_info_time, table.tb_field, td.tb_field, table.tb_privilege, td.tb_privilege { 
			border: 1px solid #767976;
		}
		table.tb_info, table.tb_field, table.tb_privilege {
			border-collapse: collapse;  
			border-spacing: 0;  
		}
		tr.tb_info, tr.tb_field, div.tb_info_time, tr.tb_privilege {
			height: 40px;
		}
		td.tb_info {
		}
		span.tb_info, span.tb_field, span.tb_privilege {
			font-family: "微软雅黑", "华文细黑";
			font-weight: 600;
			font-size: 18px;
			color: #767976;
		}
		div.tb_info_time {
			width: auto;
			text-align: center;
		}
		div.tb_field {
			width: 1000px;
			margin: auto;
			margin-top: 20px;
			text-align: center;
		}
		td.tb_field {
			width: 140px; 
		}
		td.tb_privilege {
			width: 120px;
		}
		div.tb_privilege {
			width: 1000px;
			margin: auto;
			margin-top: 20px;
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
	
	<div class="navigation" style="margin-bottom: 0px">
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
						<td class="tb_info"><span class="tb_info">容器ID</span></td>
						<td class="tb_info"><span class="tb_info">{{ site.id }}</span></td>
						<td class="tb_info"><span class="tb_info">容器状态</span></td>
						<td class="tb_info"><span class="tb_info">{{ site.state }}</span></td>
					</tr>
					<tr class="tb_info">
						<td class="tb_info"><span class="tb_info">容器名称</span></td>
						<td class="tb_info"><span class="tb_info">{{ site.name }}</span></td>
						<td class="tb_info"><span class="tb_info">API名称</span></td>
						<td class="tb_info"><span class="tb_info">{{ site.api }}</span></td>
					</tr>
					<tr class="tb_info">
						<td class="tb_info"><span class="tb_info">字段数</span></td>
						<td class="tb_info"><span class="tb_info">{{ site.field }}</span></td>
						<td class="tb_info"><span class="tb_info">数据量</span></td>
						<td class="tb_info"><span class="tb_info">{{ site.data }}</span></td>
					</tr>
				</table>
				<div class="tb_info_time">
					<div style="margin-top: 8px;">
						<span class="tb_info">创建时间：{{ GetMyDate(site.buildtime) }}</span>
					</div>
				</div>
			</div>
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
		$("div.db_title").width($("div.db_image").width()+$("span.db_name").width()+50);
	</script>
	
	<script type="text/javascript">
		new Vue({
			el: "#content",
			data: {
				name: <%=request.getAttribute(SecurityKey.CONTAINER_NAME.key)%>,
				info: <%=request.getAttribute(SecurityKey.CONTAINER_MANAGER_INFO.key)%>,
			}
		});
	</script>
	
</body>
</html>