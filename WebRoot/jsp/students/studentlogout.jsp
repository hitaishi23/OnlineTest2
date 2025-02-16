<%
  if(session!=null){
	  session.invalidate();
	  %>
	<h1><i>Logout successfully!</i></h1>
  <%} 
  else{%>
    <h1><i>Your session has already been expired</i></h1>
  <%
  }
  %>
  
<jsp:include page='studentlogin.jsp'/>





