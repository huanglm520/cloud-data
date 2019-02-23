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
    <title>管理容器 - Cloud-Data 数据一体化管理平台</title>
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
			width: 100%;
			height: auto;
			margin-top: 20px;
		}
		div.db {
			width: 600px;
			height: 60px;
			outline: none;
			border: none;
			border-radius: 5px;
			background-color: #1296DB;
			margin: auto;
			margin-top: 30px;
		}
		div.image, img.image {
			width: 45px;
			height: 45px;
		}
		div.image {
			float: left;
			margin-top: 7px;
			margin-left: 10px;
		}
		div.override {
			width: 600px;
			height: 60px;
			background-color: rgba(255,255,255,0);
			position: absolute;
			z-index: 2;
			cursor: pointer;
		}
		div.cname {
			margin-top: 18px;
			margin-left: 60px;
			width: 320px;
			text-align: center;
		}
		div.cstatus {
			margin-top: -24px; 
			margin-left: 380px;
			width: 120px;
			text-align: center; 
		}
		div.cprivilege {
			margin-top: -25px;
			margin-left: 480px;
			width: 120px;
			text-align: center; 
		}
		span.cname, span.cstatus, span.cprivilege {
			font-family: "微软雅黑", "华文细黑";
			font-size: 19px;
			color: #FFFFFF;
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
	
	<div class="content"  id="content">
	 	<div class="db" v-for="site in json">
			<div class="image">
				<img class="image" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQ0ODYyNTU4NTUzIiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjIxNTAiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNMTY4LjIyODU3MSA4ODguNTM5NDI5YTQyLjkzNDg1NyA0Mi45MzQ4NTcgMCAwIDAgNDMuNDQ2ODU4LTQzLjQ0Njg1OCA0Mi45MzQ4NTcgNDIuOTM0ODU3IDAgMCAwLTQzLjM3MzcxNS00My4zNzM3MTQgNDIuOTM0ODU3IDQyLjkzNDg1NyAwIDAgMC00My40NDY4NTcgNDMuMzczNzE0YzAgMjQuMzU2NTcxIDE5LjA5MDI4NiA0My40NDY4NTcgNDMuNDQ2ODU3IDQzLjQ0Njg1OHogbS0xMi41ODA1NzEtNDMuNDQ2ODU4YTEzLjE2NTcxNCAxMy4xNjU3MTQgMCAwIDEgMTIuNjUzNzE0LTEyLjU4MDU3MSAxMy4xNjU3MTQgMTMuMTY1NzE0IDAgMCAxIDEyLjU4MDU3MiAxMi41ODA1NzEgMTMuMTY1NzE0IDEzLjE2NTcxNCAwIDAgMS0xMi41ODA1NzIgMTIuNjUzNzE1IDEzLjE2NTcxNCAxMy4xNjU3MTQgMCAwIDEtMTIuNjUzNzE0LTEyLjY1MzcxNXogbTEyLjY1MzcxNC02OTUuODgxMTQyYTQyLjkzNDg1NyA0Mi45MzQ4NTcgMCAwIDAtNDMuNDQ2ODU3IDQzLjM3MzcxNGMwIDI0LjI4MzQyOSAxOS4wOTAyODYgNDMuMzczNzE0IDQzLjQ0Njg1NyA0My4zNzM3MTRhNDIuOTM0ODU3IDQyLjkzNDg1NyAwIDAgMCA0My4zNzM3MTUtNDMuMzczNzE0IDQyLjkzNDg1NyA0Mi45MzQ4NTcgMCAwIDAtNDMuMzczNzE1LTQzLjM3MzcxNHogbTEyLjU4MDU3MiA0My4zNzM3MTRhMTMuMTY1NzE0IDEzLjE2NTcxNCAwIDAgMS0xMi41ODA1NzIgMTIuNTgwNTcxIDEzLjE2NTcxNCAxMy4xNjU3MTQgMCAwIDEtMTIuNjUzNzE0LTEyLjU4MDU3MSAxMy4xNjU3MTQgMTMuMTY1NzE0IDAgMCAxIDEyLjY1MzcxNC0xMi41ODA1NzIgMTMuMTY1NzE0IDEzLjE2NTcxNCAwIDAgMSAxMi41ODA1NzIgMTIuNTgwNTcyek0xNjguMzAxNzE0IDQ3MC4zMDg1NzFhNDIuOTM0ODU3IDQyLjkzNDg1NyAwIDAgMC00My40NDY4NTcgNDMuMzczNzE1YzAgMjQuMjgzNDI5IDE5LjA5MDI4NiA0My4zNzM3MTQgNDMuNDQ2ODU3IDQzLjM3MzcxNGE0Mi45MzQ4NTcgNDIuOTM0ODU3IDAgMCAwIDQzLjM3MzcxNS00My4zNzM3MTQgNDIuOTM0ODU3IDQyLjkzNDg1NyAwIDAgMC00My4zNzM3MTUtNDMuMzczNzE1eiBtMTIuNTgwNTcyIDQzLjM3MzcxNWExMy4xNjU3MTQgMTMuMTY1NzE0IDAgMCAxLTEyLjU4MDU3MiAxMi41ODA1NzEgMTMuMTY1NzE0IDEzLjE2NTcxNCAwIDAgMS0xMi42NTM3MTQtMTIuNTgwNTcxIDEzLjE2NTcxNCAxMy4xNjU3MTQgMCAwIDEgMTIuNjUzNzE0LTEyLjY1MzcxNSAxMy4xNjU3MTQgMTMuMTY1NzE0IDAgMCAxIDEyLjU4MDU3MiAxMi42NTM3MTV6IiBwLWlkPSIyMTUxIiBmaWxsPSIjZmZmZmZmIj48L3BhdGg+PHBhdGggZD0iTTk0My4zOTY1NzEgMS4xNzAyODZoLTg2My4wODU3MTRjLTQzLjg4NTcxNCAwLTc5LjcyNTcxNCAzNS43NjY4NTctNzkuNzI1NzE0IDc5LjcyNTcxNHY4NjIuOTM5NDI5YzAgNDMuOTU4ODU3IDM1Ljg0IDc5LjcyNTcxNCA3OS43MjU3MTQgNzkuNzI1NzE0aDg2Mi45Mzk0MjljNDMuOTU4ODU3IDAgNzkuNzI1NzE0LTM1Ljc2Njg1NyA3OS43MjU3MTQtNzkuNzI1NzE0VjgwLjg5NmE3OS43MjU3MTQgNzkuNzI1NzE0IDAgMCAwLTc5LjU3OTQyOS03OS43MjU3MTR6TTU3LjQ5MDI4NiA2ODkuNzM3MTQzSDk2Ni4yMTcxNDN2MjM5LjY4OTE0M2E0MC41OTQyODYgNDAuNTk0Mjg2IDAgMCAxLTQwLjUyMTE0MyA0MC41OTQyODVIOTguMDExNDI5YTQwLjU5NDI4NiA0MC41OTQyODYgMCAwIDEtNDAuNTk0Mjg2LTQwLjU5NDI4NVY2ODkuODEwMjg2eiBtMC02MC4yNjk3MTRWMzc1LjY2MTcxNEg5NjYuMjE3MTQzdjI1NC4wMjUxNDNINTcuNDkwMjg2di0wLjE0NjI4NnpNOTY2LjIxNzE0MyAzMTUuMzkySDU3LjQ5MDI4NlY5MS4xMzZjMC0yMC4wNDExNDMgMTYuMjM3NzE0LTM2LjI3ODg1NyAzNi4yNzg4NTctMzYuMjc4ODU3aDgzMS45MjY4NTdjMjIuMzgxNzE0IDAgNDAuNTIxMTQzIDE4LjIxMjU3MSA0MC41MjExNDMgNDAuNTk0Mjg2djIxOS45NDA1NzF6IiBwLWlkPSIyMTUyIiBmaWxsPSIjZmZmZmZmIj48L3BhdGg+PC9zdmc+" />
			</div>
			<div style="position: absolute;z-index: 1">
				<div class="cname">
					<span class="cname">{{ site.name }}</span>
				</div>
				<div class="cstatus">
					<span class="cstatus">{{ site.state }}</span> 
				</div>
				<div class="cprivilege">
					<span class="cprivilege">{{ site.privileges }}</span>
				</div>
			</div>
			<div class="override" onmouseover='$(this).animate({"background-color": "rgba(255,255,255,0.3)"}, 200);' onmouseout='$(this).animate({"background-color": "rgba(255,255,255,0)"}, 200);' @click='window.location.href="<%=path %>/container/manager/main?cid="+site.id'></div>
		</div>
	</div>
	
	<div class="bottombar" style="margin-top: 50px;">
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