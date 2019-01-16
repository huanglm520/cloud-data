<%@page import="cn.net.sunrise.su.beans.passport.UserBean"%>
<%@page import="cn.net.sunrise.su.enums.AttributeKey"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page pageEncoding="UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
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
    <title>用户已登录 - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/passport.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/check.js"></script>
    
    <style type="text/css">
    	div.la, div.la_1, div.la_2, div.la_3 {
    		width: 100%;
    	}
    	div.la_1, div.la_2 {
    		text-align: center;
    	}
    	div.la_2 {
    		margin-top: 10px;
    	}
    	div.la_3 {
    		margin-top: 35px;
    	}
    	span.las_1, span.las_2 {
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 16px;
    	}
    	span.las_1 {
    		color: #1296DB;
    	}
    	span.las_2 {
    		color: #FF0000;
    	}
    	button.lab_1, button.lab_2 {
    		width: 100px;
    		height: 30px;
    		border: none;
    		outline: none;
    		border-radius: 5px;
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 14px;
    		color: #FFFFFF;
    		cursor: pointer;
    		margin-left: 66px;
    	}
    	button.lab_1 {
    		background-color: #0070D2;
    	}
    	button.lab_2 {
    		background-color: #FF0000;
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
				<span class="user">用户已登录</span>
			</div>
		</div>
	</div>
    <div class="passport" style="background-color: rgba(0,0,0,0)">
    	<div class="info" style="box-shadow: 0 0 100px #9FA89F;">
    	
    		<div style="width: 400px; margin-top: 20px; text-align: center;" id="error">
    			<span class="error" v-show="isFailed"></span>
    		</div>
    		
    		<div class="la">
    			<div class="la_1">
    				<span class="las_1">您当前已经使用以下账号登录</span>
    			</div>
    			<div class="la_2">
    				<span class="las_2"><%=((UserBean)session.getAttribute(AttributeKey.SESSION_ACCOUNT.key)).getAccount()%></span>
    			</div>
    			<div class="la_3">
    				<button class="lab_1" id="home">转到个人主页</button>
    				<button class="lab_2" id="logout">注销登录</button>
    			</div>
    		</div>
    		
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
	    $(document).ready(function() {
			// 对鼠标事件进行监听
			$("#home").mouseover(function() {
				// 鼠标划过事件
				$("#home").animate({"background-color": "#40A0E2"}, 200);
			});
			$("#home").mouseout(function() {
				// 鼠标划出事件
				$("#home").animate({"background-color": "#0070D2"}, 200);
			});
			
			$("#logout").mouseover(function() {
				// 鼠标划过事件
				$("#logout").animate({"background-color": "#FF6062"}, 200);
			});
			$("#logout").mouseout(function() {
				// 鼠标划出事件
				$("#logout").animate({"background-color": "#FF0000"}, 200);
			});
			
		});
    </script>
    
    <!-- 绑定按钮事件 -->
    <script type="text/javascript">
    	$("#home").click(function() {
    		window.location.href = "<%=path %>/home";
    	});
    	$("#logout").click(function() {
    		$.post("<%=path %>/passport/logout", function() {
    			window.location.reload();
    		});
    	});
    </script>

</body>
</html>