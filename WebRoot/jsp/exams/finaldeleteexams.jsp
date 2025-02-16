<%@page import="com.online.jdbc.dao.ExamsDao"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" %>
  <c:set var="message" value = "deleted" scope="request"/>
<%
   ExamsDao eDao = new ExamsDao();
   if(eDao.deleteExams(request.getParameter("examid"))){ %>
    
      <jsp:forward page="success.jsp"/><%
   }else{%>
     <jsp:forward page="failure.jsp"/>
     <% 
   }
   %>
      