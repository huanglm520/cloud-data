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
    <title>添加容器字段 - Cloud-Data 数据一体化管理平台</title>
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
		div.c_name {
			width: 100%;
			text-align: center;
		}
		span.c_name {
			font-family: "微软雅黑","华文细黑";
			font-size: 24px;
			font-weight: 600;
			color: #7B7C78;
		}
		div.data {
			width: 400px;
			margin: auto;
			margin-top: 30px;
			border-bottom: 1px solid #797979;
			padding-bottom: 5px; 
		}
		span.data {
			font-family: "微软雅黑","华文细黑";
			font-size: 20px;
			font-weight: 600;
			color: #7B7C78;
		}
		input.data, select.data {
			font-family: "微软雅黑","华文细黑";
			font-size: 17px;
			color: #7B7C78;
			width: 280px;
			text-align: center;
			text-align-last: center;
			border: none;
			outline: none;
			background-color: rgba(0,0,0,0);
		}
		select.data, option {
			text-align-last: center;
		}
		button.submit {
			width: 200px;
			height: 35px;
			border: none;
			outline: none;
			background-color: #1296DB;
			font-family: "微软雅黑", "华文细黑";
			font-size: 13px;
			color: #FFFFFF; 
			cursor: pointer;
			border-radius: 5px;
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
		<div class="c_name">
			<span class="c_name">容器：<%=request.getAttribute(SecurityKey.CONTAINER_NAME.key) %>&nbsp;添加字段</span>
		</div>
		<div class="data">
			<span class="data">字段名称：</span><input type="text" class="data" id="fieldname" spellcheck="false" />
		</div>
		<div class="data">
			<span class="data">字段类型：</span>
			<select class="data" id="fieldtype"> 
				<option value="1">BIT</option>
				<option value="2">INT</option>
				<option value="3">BIGINT</option>
				<option value="4">FLOAT</option>
				<option value="5">DOUBLE</option>
				<option value="6">DECIMAL</option>
				<option value="7">CHAR</option>
				<option value="8" selected="selected">VARCHAR</option>
				<option value="9">LONGTEXT</option>
			</select>
		</div>
		<div class="data" id="len">
			<span class="data">字段长度：</span><input type="text" class="data" id="fieldlen" spellcheck="false" value="255" />
		</div>
		<div class="data">
			<span class="data">是否允许空：</span>
			<select class="data" id="allownull" style="width: 250px;">
				<option value="0">NO</option>
				<option value="1" selected="selected">YES</option>
			</select>
		</div>
		<div class="data">
			<span class="data">字段约束：</span>
			<select class="data" id="fieldkey">
				<option value="0">PRI</option>
				<option value="1">URI</option>
				<option value="2" selected="selected">NOT KEY</option>
			</select>
		</div>
		<div class="data">
			<span class="data">字段默认值：</span><input type="text" class="data" id="fielddefault" spellcheck="false" />
		</div>
		<div class="data" style="border: none; text-align: center; height: 20px"></div>
		<div class="data" style="border: none; text-align: center;">
			<button class="submit" id="submit" onmouseover="$(this).animate({'background-color':'#46B4EE'}, 200);" onmouseout="$(this).animate({'background-color':'#1296DB'}, 200);">确认添加</button>
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
		// 由字段类型确定字段长度是否显示
		$("#fieldtype").click(function () {
			var value = $("#fieldtype").val();
			if (value == 7 || value == 8) {
				$("div#len").css({"display": "block"});
				$("#fieldlen").val("255");
			} else {
				$("div#len").css({"display": "none"});
			}
		});
	</script>
	
</body>
</html>