<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax.jsp</title>
<script type="text/javascript" src="resources/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function get_() {
		$.ajax({
			url : "ajax_result", //연결하고자하는 경로
			type : "GET", // "DELETE"로 바꾸면 컨트롤러에서 GetMapping을 DeleteMapping으로 바꾸면 된다.
			success : function(data) { // data는 컨트롤러에서 리턴해서 들어오는 값이다.
				$("#result").text(data)
				console.log("성공")
				showUsers(data);
			},
			error : function() {
				console.log("실패")
			}
		});
	}
	function showUsers(list) {
		let html = "<table border='1'>";
		html += "<tr><th>아이디</th><th>나이</th></tr>";
		$.each(list, function(index, item) {
			html += "<tr>";
			html += "<td style='cursor:pointer;' onclick='user(\"" + item.name + "\")'>" + item.name + "</td>"
			html += "<td>" + item.age + "</td>"
			html += "</tr>";
		})
		html += "</table>"
		$("#showUsers").html(html);
	}

	function user(userName) {
		console.log("클릭 이름 :'" + userName + "'")
		$.ajax({
			url : "user/" + userName,
			type : "GET",
			success : function(data) {
				$("#result").text(data)
				console.log("성공")
			},
			error : function() {
				console.log("실패")
			}
		});
	}

	function post_() {
		$.ajax({
			url : "ajax_result",
			type : "POST",
			success : function(data) {
				$("#result").text(data)
				console.log("성공")
			},
			error : function() {
				console.log("실패")
			}
		});
	}

	function put_() {
		$.ajax({
			url : "ajax_result",
			type : "PUT",
			success : function(data) {
				$("#result").text(data)
				console.log("성공")
			},
			error : function() {
				console.log("실패")
			}
		});
	}

	function del_() {
		$.ajax({
			url : "ajax_result",
			type : "DELETE",
			success : function(data) {
				$("#result").text(data)
				console.log("성공")
			},
			error : function() {
				console.log("실패")
			}
		});
	}
</script>
</head>
<body>
	<h1>1</h1>
	<h1>2</h1>
	<h1>3</h1>
	<h1>4</h1>
	<h1>5</h1>
	<h1>6</h1>
	<h1>7</h1>
	<h1>8</h1>
	<h1>9</h1>
	<button type="button" onclick="get_()">get클릭</button>
	<button type="button" onclick="post_()">post클릭</button>
	<button type="button" onclick="put_()">put클릭</button>
	<button type="button" onclick="del_()">del클릭</button>
	<hr>
	<label id="result">0</label>
	<div id="showUsers" />
</body>
</html>