<%@page import="java.util.Base64"%>
<%@page import="cn.net.sunrise.su.enums.AttributeKey"%>
<%@page import="cn.net.sunrise.su.beans.passport.UserBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page pageEncoding="UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<%
	UserBean usb = (UserBean) session.getAttribute(AttributeKey.REGISTER_ACCOUNT.key);
%>
<% String first_name = null; %>
<% String last_name = null; %>
<% String company = null; %>
<% String mail = null; %>
<% 
   if (usb == null) {}
   else {
	   // 注册期间不会编译用户信息
	   first_name = usb.getFirst_name();
	   last_name = usb.getLast_name();
	   company = usb.getCompany();
	   mail = usb.getAccount();
   }
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
    <title>注册用户(第1/4步) - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/passport.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/register.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/check.js"></script>

</head>
<body>
	<div class="topbar">
		<div class="topbarinner">
			<div>
			</div>
			<div class="topbarspan">
				<span class="topbarspan">Cloud-Data&nbsp;数据一体化管理平台</span>
			</div>
			<div class="timer">
				<span class="timer" id="timer">正在获取服务器时间</span>
			</div>
			<div class="user">
				<span class="user">注册用户(第1/4步)</span>
			</div>
		</div>
	</div>
    <div class="passport">
    	<!-- 绘制进度条 -->
    	<div class="progress">
    		<a href="<%=path%>/passport/register/step1"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">1</span>
    			</div>
    		</div></a>
    		<div class="p_line unused"></div>
    		<a href="<%=path%>/passport/register/step2"><div class="p_number unused">
    			<div class="p_number_inner">
    				<span class="p_number">2</span>
    			</div>
    		</div></a>
    		<div class="p_line unused"></div>
    		<a href="<%=path%>/passport/register/step3"><div class="p_number unused">
    			<div class="p_number_inner">
    				<span class="p_number">3</span>
    			</div>
    		</div></a>
    		<div class="p_line unused"></div>
    		<a href="<%=path%>/passport/register/step4"><div class="p_number unused">
    			<div class="p_number_inner">
    				<span class="p_number">4</span>
    			</div>
    		</div></a>
    	</div>
    	
    	<div class="info">
    	
    		<div style="width: 400px; margin-top: 20px; text-align: center;" id="error">
    			<span class="error" v-show="isFailed"></span>
    		</div>
    		
    		<div class="hint" style="width: 150px;">
    			<span class="hint">姓氏</span>
    		</div>
    		<div class="inner" style="width: 150px;">
    			<input class="inner" style="width: 145px;" type="text" id="last_name" value="<%=last_name==null ? "" : last_name %>" />
    		</div>
    		<div class="hint" style="width: 150px; margin-top: -58px; margin-left: 215px;">
    			<span class="hint">名字</span>
    		</div>
    		<div class="inner" style="width: 150px; margin-left: 215px;">
    			<input class="inner" style="width: 150px;" type="text" id="first_name" value="<%=first_name==null ? "" : first_name %>" />
    		</div> 
    	
    		<div class="hint">
    			<span class="hint">邮箱</span>
    		</div>
    		<div class="inner">
    			<input class="inner" type="text" id="mail" value="<%=mail==null ? "" : mail %>" />
    		</div>
    		<div class="hint">
    			<span class="hint">公司</span>
    		</div>
    		<div class="inner">
    			<input class="inner" type="text" id="company" value="<%=company==null ? "" : company %>" />
    		</div>

    		<div class="line">
    			<hr />
    		</div>
    		
    		<div class="submit">
    			<button class="submit" id="submit">下一步</button>
    		</div>
    		
    		<!-- 绘制底部链接 -->
    		<div class="bottom">
    			<div class="b_left">
    				<span class="bottom" style="color: #ADB0AD">返回上一步</span>
    			</div>
    			<div class="b_right">
    				<a href="<%=path %>/passport/login"><span class="bottom">已有账号</span></a>
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
    
    <!-- 建立vue对象，用于控制页面错误信息 -->
    <script type="text/javascript">
    	var $error = new Vue({
    		el: "#error",
    		data: {
    			isFailed: false
    		}
    	});
    </script>
    
    <script type="text/javascript">
	    $(document).ready(function() {
			// 对鼠标事件进行监听
			$("#submit").mouseover(function() {
				// 鼠标划过事件
				$("#submit").animate({"background-color": "#40A0E2"}, 200);
			});
			$("#submit").mouseout(function() {
				// 鼠标划出事件
				$("#submit").animate({"background-color": "#0070D2"}, 200);
			});
			
			// 绑定回车提交事件
			document.onkeydown = function() {
				if (event.keyCode == 13) {
					submit();
				}
			}
		});
    </script>
    
    <!-- 建立按钮的启用与禁用方法 -->
    <script type="text/javascript">
   		function disable() {
   			$("#submit").attr("disabled", "true");
   			$("#submit").css({"background-color": "#8B8F93", "cursor": "not-allowed"});
   			$("#submit").text("正在提交...");
   		}
   		function enable() {
   			$("#submit").removeAttr("disabled");
   			$("#submit").css({"background-color": "#0070D2", "cursor": "pointer"});
   			$("#submit").text("下一步");
    	}
    </script>
    
    <!-- 绑定提交事件 -->
    <script type="text/javascript">
    	
    	$("#submit").click(function() {
    		submit();
    	});
    
    	function submit() {
    		
    		// 重置错误信息
    		$error.isFailed = false;
    		$(".error").empty();
    		
    		// 检查各数据是否正确
    		var $last_name = $("#last_name").val();
    		if (!(lastNameCheck.test($last_name))) {
    			$(".error").text("姓氏只能使用字母或者汉字，并且不能超过32个字符，不可为空");
    			$error.isFailed = true;
    			return;
    		}
    		
    		var $first_name = $("#first_name").val();
    		if (!(firstNameCheck.test($first_name))) {
    			$(".error").text("名字只能使用字母或数字，并且不能超过32个字符，不可为空");
    			$error.isFailed = true;
    			return;
    		}
    		
    		var $mail = $("#mail").val();
    		if (!(accountCheck.test($mail))) {
    			$(".error").text("邮箱格式不规范，邮箱只能使用数字、字母和下划线，且不能为空");
    			$error.isFailed = true;
    			return;
    		}
    		
    		var $company = $("#company").val();
    		if (!(companyCheck.test($company))) {
    			$(".error").text("公司名称格式不规范，公司名称最长为64个字符，不可为空");
    			$error.isFailed = true;
    			return;
    		}
    		
    		// 进行ajax
    		disable();
    		
    		$.ajax({
    			url: "<%=path %>/passport/register/step1/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
    			data: {"mail":$mail, "first_name":$first_name, "last_name":$last_name, "company":$company},
    			dataType: "json",
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				$(".error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
					$error.isFailed = true;
					enable();
    			},
    			success: function(data, textStatus) {
    				if (data.code == Code["OK"]) {
    					window.location.href = "<%=path%>/passport/register/step2";
    				} else {
    					if (data.code == Code["ACCOUNT_NOT_ACCEPT"]) {
	    					$(".error").text("邮箱格式不规范，邮箱只能使用数字、字母和下划线，且不能为空");
	    					$error.isFailed = true;
	    				} else if (data.code == Code["ACCOUNT_ALREADY_EXISTS"]) {
	    					$(".error").text("该邮箱已被注册，请更换其他邮箱");
	    					$error.isFailed = true;
	    				} else if (data.code == Code["FIRST_NAME_NOT_ACCEPT"]) {
	    					$(".error").text("名字只能使用字母或数字，并且不能超过32个字符，不可为空");
	    					$error.isFailed = true;
	    				} else if (data.code == Code["LAST_NAME_NOT_ACCEPT"]) {
	    					$(".error").text("姓氏只能使用字母或者汉字，并且不能超过32个字符，不可为空");
	    					$error.isFailed = true;
	    				} else if (data.code == Code["COMPANY_NOT_ACCEPT"]) {
	    					$(".error").text("公司名称格式不规范，公司名称最长为64个字符，不可为空");
	    					$error.isFailed = true;
	    				} else if (data.code == Code["SERVER_ERROR"]) {
	    					$(".error").text("服务端发生未知错误，请稍后重试");
	    					$error.isFailed = true;
	    				}
    				}
    				enable();
    			}
    		});
    	}
    </script>
    
</body>
</html>