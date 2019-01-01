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
    <title>容器权限管理 - Cloud-Data 数据一体化管理平台</title>
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
			width: 100%;
			margin-bottom: 70px;
		}
		div.title {
			width: 100%;
			text-align: center;
		}
		span.title { 
			font-family: "微软雅黑", "华文细黑";
			font-size: 24px;
			font-weight: 600;
			color: #777C78; 
		}
		div.p_list {
			width: 700px;
			margin: auto;
			margin-top: 20px;
		}
		table.p_list {
			width: 720px;
			border-collapse: collapse;  
			border-spacing: 0;  
		}
		tr.p_list {
			height: 35px;
		}
		table.p_list, td.p_list_1, td.p_list_2, td.p_list_3, td.p_list_4 { 
			border: 1px solid #767976;
		}
		td.p_list_1, td.p_list_2, td.p_list_3, td.p_list_4 {
			font-family: "微软雅黑", "华文细黑";
			font-size: 18px;
			font-weight: 600;
			color: #717572;
		}
		td.p_list_1 {
			width: 100px;
		}
		td.p_list_2 {
			width: 350px;
		}
		td.p_list_3 {
			width: 100px;
		}
		td.p_list_4 {
			width: 150px;
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
	
	<div class="content" id="content">
		<div class="title">
			<span class="title">容器：{{ name }}&nbsp;上的权限列表</span>
		</div>
		<div class="p_list">
			<table class="p_list">
				<tr class="p_list">
					<td class="p_list_1">权限ID</td>
					<td class="p_list_2">用户账户</td>
					<td class="p_list_3">拥有权限</td>
					<td class="p_list_4">操作</td> 
				</tr>
			</table>
			<table class="p_list">
				<tr class="p_list" v-for="site in json">
					<td class="p_list_1">{{ site.id }}</td>
					<td class="p_list_2" ><span style="cursor:pointer;color:#1296DB" @click='window.open("<%=path %>/account/view?uid="+site.uid)'>{{ site.account }}</span></td>
					<td class="p_list_3">{{ site.privileges }}</td>
					<td class="p_list_4">修改/删除</td> 
				</tr>
			</table>
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
		new Vue({
			el: "#content",
			data: {
				id: <%=request.getAttribute(SecurityKey.CONTAINER_ID.key) %>,
				name: "<%=request.getAttribute(SecurityKey.CONTAINER_NAME.key) %>",
				json: <%=request.getAttribute(SecurityKey.CONTAINER_MANAGER_PRIVILEGE.key) %>
			}
		});
	</script>
	
</body>
</html>