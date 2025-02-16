<%@page import="com.online.jdbc.dto.QuestionsDto"%>
<%@page import="java.util.*"%>
<%@page import="com.online.jdbc.dao.QuestionDao"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>

 
 <% 
   String eid = request.getParameter("examid");
   if(eid==null)
     eid = (String)session.getAttribute("examid");
   if(eid==null && session.getAttribute("sname")==null){
   %>
   <h1 style="color: red;"><em>Error: Please login before starting test</em></h1>
   <jsp:include page="studentlogin.jsp"/> 
   <%
      return;
      }
    %>
 

<%
	int n = 1, total = 0;
	Integer current= (Integer)session.getAttribute("current");
	ArrayList qlist = (ArrayList) session.getAttribute("qlist");
	
	if (qlist == null) {
		QuestionDao qDao = new QuestionDao();
		qlist = qDao.selectAllQuestions(request.getParameter("examid"));
		Collections.sort(qlist);
		session.setAttribute("qlist", qlist);
	}

	total = qlist.size();

	String option = request.getParameter("option"); //a,b,c,d,null
	if (option != null) {
		current = (Integer) session.getAttribute("current"); //null: 1req   
		QuestionsDto qDto = (QuestionsDto) qlist.get(current - 1);
		qDto.setAttempt(true);
		if (qDto.getAnswer().equalsIgnoreCase(option))
			qDto.setCorrect(true);
		else
			qDto.setCorrect(false);
	}

	String btn = request.getParameter("btn");
	if (btn != null)
		btn = btn.toUpperCase();

	if (current == null)
		n = 1;
	else if(btn!=null) {
		if (  btn.equals("PREVIOUS"))
			n = current - 1;
		else if ( btn.equals("NEXT"))
			n = current + 1;
		else if( btn.equals("SUBMIT")){
		   pageContext.forward("result.jsp");
		}
		else {  
			n = Integer.parseInt(btn);
		}
	}

	QuestionsDto qDto = (QuestionsDto) qlist.get(n - 1);
	pageContext.setAttribute("qDto", qDto);
	pageContext.setAttribute("total", total);
	session.setAttribute("n", n);
	session.setAttribute("current", n);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	font-family: sans-serif;
	color: #555;
	height: 100vh;
}

.container {
	max-width: 1200px;
	margin: 100px auto;
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 64px;
	padding: 20px 40px;
}

.question-container {
	padding: 60px 40px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 1);
	border-radius: 12px;
}

.all-question-container {
	border-radius: 12px;
	padding: 30px 20px;
	display: grid;
	gap: 10px;
	grid-template-columns: 1fr 1fr 1fr;
	box-shadow: 0 0 10px rgba(0, 0, 0, 1);
	max-height: 100vh;
	overflow: scroll;
}

.question {
	font-size: 20px;
	font-weight: 600;
	color: #333;
	margin-bottom: 20px;
}

.box {
	margin-bottom: 16px;
	margin-left: 20px;
}

.option-label {
	font-size: 18px;
	font-weight: 600;
	color: #444;
	margin-left: 10px;
}

.form-box {
	display: inline-block;
	display: flex;
	align-items: center;
	justify-content: center;
}

.btn.question-btn {
	width: 50px;
	height: 50px;
	background-color: orange;
	border: none;
	font-size: 18px;
	font-weight: bold;
}

.btn-box {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 20px;
}

.pre-btn,.next-btn {
	padding: 8px 16px;
	border: none;
	background-color: #333;
	color: #fff;
	font-size: 20px;
	display: inline-block;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="question-container">
			<p class="question">Q${n}: ${qDto.que}</p>
			<form action="startexam.jsp">
				<div class="box">
					<input type="radio" name="option" value="a" /> <span
						class="option-label">${qDto.a}</span>
				</div>

				<div class="box">
					<input type="radio" name="option" value="b" /> <span
						class="option-label">${qDto.b}</span>
				</div>

				<div class="box">
					<input type="radio" name="option" value="c" /> <span
						class="option-label">${qDto.c}</span>
				</div>

				<div class="box">
					<input type="radio" name="option" value="d" /> <span
						class="option-label">${qDto.d}</span>
				</div>
				<div class="btn-box">
					<input type="submit" value="Previous" ${n==1?
						"disabled":""} name="btn" class="pre-btn" /> <input type="submit"
						value="Next" ${n==total? "disabled":""} name="btn"
						class="next-btn" /> <input type="submit" value="Submit"
						name="btn" class="next-btn" />
				</div>
			</form>
		</div>
		<div class="all-question-container">
			<c:forEach items="${qlist}" var="q">
				<form action="" class="form-box">
					<input type="submit" value="${q.qid}" name="btn"
						class="btn question-btn" />
				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>
