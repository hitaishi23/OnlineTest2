<!DOCTYPE html>
<%@page import="com.online.jdbc.dao.ExamsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.online.jdbc.dto.ExamsDto"%>
<%@page errorPage="error.jsp"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
</head>
<body>
	<%
		ArrayList<ExamsDto> list = new ExamsDao().selectAllExams();
		pageContext.setAttribute("list", list, 2);
	%>
	<h1>Select Exam Title</h1>
	<form action="finalupdateexams.jsp">
		<select name="examid">
			<c:forEach items="${list}" var="e">
				<option value="${e.examid}" selected>${e.topic}</option>
			</c:forEach>
	   </select> Select current topic
			<br />
		<br />

		 <input type='text' name='topic' /> Enter New Topic<br /></br> <input
			type='submit' value='Update Test' />
	</form>
</body>
</html>
