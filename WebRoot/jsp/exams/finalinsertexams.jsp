<%@ page import="com.online.jdbc.dao.ExamsDao"%>
<%@ page import="com.online.jdbc.dto.ExamsDto"%>
<%@ page import="com.online.jdbc.exception.DBException"%>
<%@ page errorPage="error.jsp"%>
<jsp:useBean id="exams" class="com.online.jdbc.dto.ExamsDto"
	scope="request" />
<jsp:setProperty property="*" name="exams" />
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="message" value="inserted" scope="request" />
 
<%
	ExamsDao eDao = new ExamsDao();
 	
	if (eDao.insertExams((ExamsDto) request.getAttribute("exams"))) {
	   pageContext.setAttribute("examid",request.getParameter("examid"),4);
	   pageContext.setAttribute("topic",request.getParameter("topic"),4);
%> 

<jsp:include page="/jsp/questions/addquestion.jsp" /> 
<%
	} else {
%>
<jsp:include page="failure.jsp" />
<%
	} //else
%>

