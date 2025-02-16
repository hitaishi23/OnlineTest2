<%@ page import="com.online.jdbc.dao.ExamsDao"%>
<%@ page import="com.online.jdbc.dto.ExamsDto"%>
<%@ page import="com.online.jdbc.exception.DBException"%>
<%@ page errorPage="error.jsp"%>

<jsp:useBean id="exams" class="com.online.jdbc.dto.ExamsDto"
	scope="request" />
<jsp:setProperty property="*" name="exams" />

<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="message" value="updated" scope="request" />

<%
	ExamsDao eDao = new ExamsDao();
	if (eDao.updateExams((ExamsDto) request.getAttribute("exams"))) {
%>

<jsp:forward page="success.jsp" />
<%
	} else {
%>
<jsp:forward page="failure.jsp" />
<%
	} //else
%>

