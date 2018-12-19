/*
 * 利用ajax异步请求时间
 * 同时使用interval动态刷新
 */
$.ajax({
	url: GetPath()+"/api/current-time/",
	type: "POST",
	timeout: 5000,
	async: true,
	dataType: "json",
	error: function(XMLHttpRequest, textStatus, errorThrown) {
		$("#timer").text("\u65E0\u6CD5\u8054\u7CFB\u65F6\u95F4\u670D\u52A1\u5668");
	},
	success: function(data, textStatus) {
		var year = Math.floor(data.year);
		var month = Math.floor(data.month);
		var day = Math.floor(data.day);
		var hour = Math.floor(data.hour);
		var minute = Math.floor(data.minute);
		var second = Math.floor(data.second);
		
		var str = year + "-";
		str += (month < 10) ? ("0" + month) : month;
		str += '-';
		str += (day < 10) ? ("0" + day) : day;
		str += " ";
		str += (hour < 10) ? ("0" + hour) : hour;
		str += ":";
		str += (minute < 10) ? ("0" + minute) : minute;
		str += ':';
		str += (second < 10) ? ("0" + second) : second;
		$("#timer").text(str);
		
		setInterval(function() {
			
			second++;
			if (second >= 60) {
				minute++;
				second = 0;
			}
			if (minute >= 60) {
				hour++;
				minute = 0;
			}
			if (hour >= 24) {
				day++;
				hour = 0;
			}
			if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12) {
				if (day > 31) {
					month++;
					day = 1;
				}
			} else if (month == 2) {
				if (year%4==0 && year%100!=0 || year%400==0) {
					if (day > 29) {
						month++;
						day = 1;
					} else if (day > 28) {
						month++;
						day = 1;
					}
				}
			} else {
				if (day > 30) {
					month++;
					day = 1;
				}
			}
			if (month > 12) {
				year++;
				month = 1;
			}
			
			var str = year + "-";
			str += (month < 10) ? ("0" + month) : month;
			str += '-';
			str += (day < 10) ? ("0" + day) : day;
			str += " ";
			str += (hour < 10) ? ("0" + hour) : hour;
			str += ":";
			str += (minute < 10) ? ("0" + minute) : minute;
			str += ':';
			str += (second < 10) ? ("0" + second) : second;
			$("#timer").text(str);
		}, 1000);
	}
});

function GetMyDate(timer) {
	var oDate = new Date(timer),
	oYear = oDate.getFullYear(),
	oMonth = oDate.getMonth()+1,
	oDay = oDate.getDate(),
	oHour = oDate.getHours(),
	oMin = oDate.getMinutes(),
	oSen = oDate.getSeconds(),
	oTime = oYear +'-'+ addZero(oMonth) +'-'+ addZero(oDay) +' '+ addZero(oHour) +':'+ addZero(oMin) +':'+addZero(oSen);
	return oTime;
}

//补零操作
function addZero(num){
	if(parseInt(num) < 10){
		num = '0'+num;
	}
	return num;
}