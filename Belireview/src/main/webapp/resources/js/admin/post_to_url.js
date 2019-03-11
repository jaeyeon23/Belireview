/**
 * 
 */

function post_to_url(path, params, method) {
	method = method || "post"; // 전송 방식 기본값을 POST로

	var form = document.createElement("form");
	form.setAttribute("method", method);
	form.setAttribute("action", path);

	//히든으로 값을 주입시킨다.
	for ( var key in params) {
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", key);
		hiddenField.setAttribute("value", params[key]);

		form.appendChild(hiddenField);
	}

	document.body.appendChild(form);
	form.submit();
}