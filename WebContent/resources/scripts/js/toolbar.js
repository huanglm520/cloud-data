$(document).ready(function() {
	// 绑定导航按钮动画
	$("#personalHome").mouseover(function() {
		$("#personalHome").animate({"background-color": "rgba(255,255,255,0.4)"}, 200);
	});
	$("#personalHome").mouseout(function() {
		$("#personalHome").animate({"background-color": "rgba(0,0,0,0)"}, 200);
	});

	$("#containerManager").mouseover(function() {
		$("#containerManager").animate({"background-color": "rgba(255,255,255,0.4)"}, 200);
	});
	$("#containerManager").mouseout(function() {
		$("#containerManager").animate({"background-color": "rgba(0,0,0,0)"}, 200);
	});

	$("#accountManager").mouseover(function() {
		$("#accountManager").animate({"background-color": "rgba(255,255,255,0.4)"}, 200);
	});
	$("#accountManager").mouseout(function() {
		$("#accountManager").animate({"background-color": "rgba(0,0,0,0)"}, 200);
	});

	$("#securityCenter").mouseover(function() {
		$("#securityCenter").animate({"background-color": "rgba(255,255,255,0.4)"}, 200);
	});
	$("#securityCenter").mouseout(function() {
		$("#securityCenter").animate({"background-color": "rgba(0,0,0,0)"}, 200);
	});

	//绑定跳转动作
	$("#personalHome").click(function() {
		window.location.href = GetPath() + "/home";
	});
	$("#containerManager").click(function() {
		window.location.href = GetPath() + "/container";
	});
	$("#accountManager").click(function() {
		window.location.href = GetPath() + "/account";
	});
	$("#securityCenter").click(function() {
		window.location.href = GetPath() + "/security";
	});
});