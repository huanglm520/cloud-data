<%@page import="cn.net.sunrise.su.enums.SecurityKey"%>
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
    <title>管理容器 - Cloud-Data 数据一体化服务平台</title>
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
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/color.js"></script>

	<style type="text/css">
		div.selectBarBack {
			width: 100%;
			height: 45px;
			background-color: #FFFFFF;
		}
		div.selectBar {
			width: 800px;
			height: 100%;
			margin: auto;
		}
		span.status, span.privilege, span.search {
			font-family: "微软雅黑", "华文细黑";
			font-size: 16px;
			color: #646D65; 
		}
		select.status, select.privilege, input.search {
			height: 25px;
			outline: none;
			font-family: "微软雅黑", "华文细黑";
			font-size: 13px;
			color: #646D65; 
			padding-left: 5px;
			padding-right: 5px;
		}
		select.status, select.privilege {
			width: 110px;
			cursor: pointer;
		}
		input.search {
			width: 240px;
		}
		input.submit {
			width: 100px;
			height: 29px; 
			font-family: "微软雅黑", "华文细黑";
			font-size: 13px;
			color: #FFFFFF;
			outline: none;
			border: none;
			background-color: #1296DB;
			cursor: pointer;
		}
		div.content {
			width: 720px;
			height: auto;
			margin: auto;
			margin-top: 0px;
		}
		div.dbOuter {
			width: 100%;
		}
		div.db {
			width: 150px;
			height: 150px;
			margin-left: 15px;
			margin-right: 15px;
			margin-top: 30px;
			background-color: rgba(18,150,219,0.07);
			float: left;
		}
		div.image, img.image {
			width: 80px;
			height: 80px;
		}
		div.image {
			width: 100%;
			text-align: center;
			float: left; 
		}
		div.override {
			background-color: rgba(0,0,0,0);
			width: 150px;
			height: 150px;
			cursor: pointer;
			position: absolute;
			z-index: 999;
			margin-top: -162px;
		}
		div.cname {
			font-family: "微软雅黑", "华文细黑";
			font-size: 17px;
			font-weight: 600;
			color: #6B6C6D;
			text-align: center;
			margin-top: 8px; 
			float: left;
			width: 100%;
		}
		td.cprivilege, td.cstatus {
			font-family: "微软雅黑", "华文细黑";
			font-size: 14px;
			font-weight: 400;
			color: #6B6C6D;
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
	
	<div class="navigation" style="margin-bottom: 0px">
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
	
	<div class="selectBarBack">
		<form action="" method="get">
			<div class="selectBar">
				<table style="float: left; margin-top: 5px;"> <tr style="">
				<td style="">
					<span class="status">状态：</span>
					<select class="status" name="status" id="status">
						<option value="all">所有状态</option>
						<option value="running">运行中</option>
						<option value="stoping">已停用</option>
						<option value="modifying">修改中</option>
						<option value="creating">创建中</option>
					</select>
				</td>
				
				<td style="">
					<span class="privilege">权限：</span>
					<select class="privilege" name="privilege" id="privilege">
						<option value="all">ALL</option>
						<option value="owner">OWNER</option>
						<option value="admin">ADMIN</option>
						<option value="guest">GUEST</option>
					</select>
				</td>
				
				<td style="">
					<span class="search">容器名称：</span>
					<input type="text" class="search" name="container_keyword" id="container_keyword" placeholder="输入容器名称进行搜索，支持模糊查询" />
				</td>
				
				<td style="">
					<input type="submit" class="submit" id="submit" value="查询" /> 
				</td>
				</tr> </table>
			</div>
		</form>
	</div>
	
	<div class="content" id="content">
		<div class="db" v-for="site in json">
			<div class="image">
				<img class="image" v-bind:src="GetStatusColor(site.status)" />
			</div>
			<div class="cname">{{ site.name }}</div> 
			<table style="width: 100%">
				<tr style="height: 50px">
					<td class="cprivilege" style="text-align: left;padding-left: 5px;">{{ site.privileges }}</td>
					<td class="cstatus" style="text-align: right;padding-right: 5px;">{{ site.state }}</td>
				</tr>
			</table>
			<div class="override" @click='window.location.href="/cloud-data/container/manager/main?cid="+site.id'></div>
		</div>
	</div>
	
	<div class="bottombar" style="margin-top: 50px;float: left;">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=application.getAttribute(AttributeKey.PAGE_TIME.key) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
	    </div>
	    
	</div>
	
	<script type="text/javascript">
		// 解析查询参数，设置选项默认值
		var search = window.location.search;
		if (search.indexOf("?") != -1) {
			search = search.substr(1);
			var keys = new Array();
			var params = search.split("&");
			for (var i=0; i<params.length; i++) {
				var p = params[i].split("=");
				keys[p[0]] = p[1];
			}
			$("#status").val(/^all|running|stoping|modifying|creating$/.test(keys["status"]) ? keys["status"] : "all");
			$("#privilege").val(/^all|owner|admin|guest$/.test(keys["privilege"]) ? keys["privilege"] : "all");
			$("#container_keyword").val(keys["container_keyword"]);
		}
	</script>
	
	<script type="text/javascript">
		// 绑定按钮动画
		$("#submit").mouseover(function() {
			$("#submit").animate({"background-color": "#71C0E9"}, 200);
		});
		$("#submit").mouseout(function () {
			$("#submit").animate({"background-color": "#1296DB"}, 200);
		});
		
		function ame(obj) {
			$(obj).mouseover(function() {
				$(obj).animate({"background-color": "rgba(255,255,255,0.3)"}, 200);
			});
			$(obj).mouseout(function() {
				$(obj).animate({"background-color": "rgba(255,255,255,0)"}, 200);
			});
		}
	</script>
	
	<script type="text/javascript">
		new Vue({
			el: "#content",
			data: {
				json: <%=request.getAttribute(SecurityKey.SECURITY_CONTAINER_LIST.key)%>
			}
		});
	</script>
	
</body>
</html>