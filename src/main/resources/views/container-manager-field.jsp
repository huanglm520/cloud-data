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
    <title>字段管理 - Cloud-Data 数据一体化管理平台</title>
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
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/cf.js"></script>

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
			width: 900px; 
			margin: auto;
			margin-top: 20px;
		}
		table.p_list {
			width: 900px;
			border-collapse: collapse;  
			border-spacing: 0;  
		}
		tr.p_list {
			height: 35px;
		}
		table.p_list, td.p_list_1, td.p_list_2, td.p_list_3, td.p_list_4, td.p_list_5, td.p_list_6, td.p_list_7 { 
			border: 1px solid #767976;
		}
		td.p_list_1, td.p_list_2, td.p_list_3, td.p_list_4, td.p_list_5, td.p_list_6, td.p_list_7 {
			font-family: "微软雅黑", "华文细黑";
			font-size: 17px;
			font-weight: 600;
			color: #717572;
		}
		td.p_list_1 {
			width: 80px;
		}
		td.p_list_2 {
			width: 180px;
		}
		td.p_list_3 {
			width: 180px;
		}
		td.p_list_4 {
			width: 80px; 
		}
		td.p_list_5 {
			width: 80px;
		}
		td.p_list_6 {
			width: 180px; 
		}
		td.p_list_7 {
			width: 110px;
		}
		button.add {
			width: 100%;
			height: 45px;
			border: none;
			outline: none;
			background-color: #1296DB;
			font-family: "微软雅黑", "华文细黑";
			font-size: 20px;
			font-weight: 600;
			color: #FFFFFF;
			cursor: pointer;
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
			<span class="title">容器：{{ name }}&nbsp;上的字段列表</span>
		</div>
		<div class="p_list">
			<table class="p_list">
				<tr class="p_list">
					<td class="p_list_1">字段ID</td>
					<td class="p_list_2">字段名称</td>
					<td class="p_list_3">字段类型</td>
					<td class="p_list_4">允许空</td>
					<td class="p_list_5">字段约束</td>
					<td class="p_list_6">默认值</td>
					<td class="p_list_7">操作</td>
				</tr>
			</table>
			<table class="p_list">
				<tr class="p_list" v-for="site in json">
					<td class="p_list_1">{{ site.id }}</td>
					<td class="p_list_2">{{ site.name }}</td>
					<td class="p_list_3">{{ FieldDecode.decodeType(site.type) }}</td>
					<td class="p_list_4">{{ FieldDecode.decodeIsNull(site.isnull) }}</td>
					<td class="p_list_5">{{ FieldDecode.decodeKey(site.key) }}</td>
					<td class="p_list_6">{{ site.defaultdata }}</td>
					<td class="p_list_7"><span style="color: #1296DB; cursor: pointer;" @click="window.location.href='<%=path %>/container/manager/field/modify?fid='+site.id+'&cid='+id">修改</span>/<span style="color: #FF0000; cursor: pointer;" @click="window.location.href='<%=path %>/container/manager/field/delete?fid='+site.id+'&cid='+id">删除</span></td>
				</tr>
			</table>
			<button class="add"  onmouseover="$(this).animate({'background-color':'#46B4EE'}, 200);" onmouseout="$(this).animate({'background-color':'#1296DB'}, 200);" @click='window.location.href="/cloud-data/container/manager/field/add?cid="+id'>+添加容器字段</button>
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
	</script>
	
	<script type="text/javascript">
		new Vue({
			el: "#content",
			data: {
				name: "<%=request.getAttribute(SecurityKey.CONTAINER_NAME.key) %>",
				json: <%=request.getAttribute(SecurityKey.FIELD_LIST.key) %>
			}
		});
	</script>
	
</body>
</html>