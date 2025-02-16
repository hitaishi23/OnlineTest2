<%@page import="com.online.jdbc.dto.ExamsDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.online.jdbc.dao.ExamsDao"%>
<%@page import="com.online.jdbc.dao.StudentDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	StudentDao sdao = new StudentDao();
	String sname = sdao.studentLogin(request.getParameter("studid"),
			request.getParameter("password"));
	if (sname != null) {
	   session.setAttribute("sname", sname);
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	height: 100vh;
	display: flex;
	padding: 100px 50px;
}

form {
	display: inline-block;
}

.container {
	padding: 100px;
	margin: 0 auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 1);
	overflow: scroll;
}

h2,h3 {
	margin-bottom: 20px;
	font-size: 32px;
	font-weight: bold;
}
h3{
	margin-bottom: 60px;
}

.exam-container {
	display: flex;
	gap: 20px;
	font-size: 24px;
	font-weight: bold;
	border-bottom: 2px solid #aaa;
	padding: 10px;
}
.btn{
	padding: 8px 16px;
	border: none;
	color: #fff;
	background-color: #555;
	font-size: 20px;
	font-weight: 600;
	border-radius: 12px;
}
</style>
</head>
<body>

	<div class='container'>
		<h2>
			Welcome,
			<%=sname%></h2>
		<h3>Active Exams</h3>
		<%
			ArrayList<ExamsDto> list = new ExamsDao().selectAllExams();
				pageContext.setAttribute("list", list);
		%>
		<c:forEach items="${list}" var="e" varStatus="status">

			<div class='exam-container'>
				<span class='sno'>${status.count}</span> <span class='exam-topic'>${e.topic}</span>
				<form action="startexam.jsp" class='form-box'>
					<input type="hidden" name="examid" value="${e.examid}" /> <input
						type="submit" value="Start" class='btn' />
				</form>
			</div>

		</c:forEach>
	</div>
	<%
		} else {
	%>
	<h1>Login Failed: Invalid User or password</h1>
	<%
		}
	%>
</body>
</html>







