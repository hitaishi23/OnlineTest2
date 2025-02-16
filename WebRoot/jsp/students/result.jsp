<%@page import="com.online.jdbc.dto.QuestionsDto"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  int correct=0,wrong=0,total=0;
  ArrayList<QuestionsDto> qlist = (ArrayList<QuestionsDto>)session.getAttribute("qlist");
  total = qlist.size();
  
  for(QuestionsDto q:qlist){
     if(q.isAttempt()){
        if(q.isCorrect())
           correct++;
        else
           wrong++;
     }
  }
%>
<form action="studentlogout.jsp">
  <input type='submit' value='LOGOUT'/>
</form>

<h1>Test submitted successfully, check your result</h1>
<h2>Total: <%= total%></h2>
<h2>Correct: <%= correct%></h2>
<h2>Wrong: <%= wrong%></h2>
<h2>Unattemptted: <%= total - (correct+wrong) %></h2>





