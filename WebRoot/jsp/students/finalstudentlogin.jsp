<%@page import="com.online.jdbc.dto.ExamsDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.online.jdbc.dao.ExamsDao"%>
<%@page import="com.online.jdbc.dao.StudentDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    StudentDao sdao = new StudentDao();
    String sname = sdao.studentLogin(request.getParameter("studid"), request.getParameter("password"));
    if (sname != null) {
        session.setAttribute("sname", sname);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .container {
            background: #fff;
            padding: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 90%;
            max-width: 600px;
            text-align: center;
        }
        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }
        h3 {
            font-size: 24px;
            margin-bottom: 30px;
            color: #555;
        }
        .exam-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            margin-bottom: 10px;
            background: #e9ecef;
            border-radius: 6px;
        }
        .btn {
            padding: 8px 16px;
            border: none;
            color: #fff;
            background-color: #007bff;
            font-size: 16px;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class='container'>
        <h2>Welcome, <%= sname %></h2>
        <h3>Active Exams</h3>
        <%
            ArrayList<ExamsDto> list = new ExamsDao().selectAllExams();
            pageContext.setAttribute("list", list);
        %>
        <c:forEach items="${list}" var="e" varStatus="status">
            <div class='exam-container'>
                <span>${status.count}. ${e.topic}</span>
                <form action="startexam.jsp">
                    <input type="hidden" name="examid" value="${e.examid}" />
                    <input type="submit" value="Start" class='btn' />
                </form>
            </div>
        </c:forEach>
    </div>
<%
    } else {
%>
    <div class="container">
        <h1 style="color: red;">Login Failed: Invalid User or Password</h1>
    </div>
<%
    }
%>
</body>
</html>