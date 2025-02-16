<%@ page import="com.online.jdbc.dao.StudentDao"%>
<%@ page import="com.online.jdbc.dto.StudentDto"%>
<%@ page import="com.online.jdbc.exception.DBException"%>
<%@ page errorPage="error.jsp"%>
<jsp:useBean id="student" class="com.online.jdbc.dto.StudentDto"
	scope="request" />
<jsp:setProperty property="*" name="student" />

<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="message" value="inserted" scope="request" />

<%
	StudentDao sDao = new StudentDao();
	if (sDao.insertStudent((StudentDto) request.getAttribute("student"))) {
%>

<jsp:forward page="success.jsp" />
<%
	} else {
%>
<jsp:forward page="failure.jsp" />
<%
	} //else
%>

