$(document).ready(function() {
	$("#logout").click(function () {
		$.post(GetPath() + "/passport/logout/", function() {
			window.location.href = GetPath() + "/passport/login"
		});
	});
});
