/**
 * banner_script.js
 */

function isImage(filename) {
	var extName = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
	if (extName == "JPG" || extName == "GIF" || extName == "PNG") {
		return true;
	}
	return false;
}


function dateString(timestamp) {
	var v = new Date(timestamp);
	var year = v.getFullYear();
	var month = v.getMonth() + 1;
	var date = v.getDate();
	var hour = v.getHours();
	var minute = v.getMinutes();
	var second = v.getSeconds();
	var strDate = year + "-" + make2digits(month) + "-" + make2digits(date) + " " + make2digits(hour) + ":" + make2digits(minute) + ":" + make2digits(second);
	return strDate;
}

function make2digits(num) {
	return (num < 10) ? "0" + num : num;
}