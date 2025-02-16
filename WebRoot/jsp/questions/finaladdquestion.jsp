<%@page import="com.online.jdbc.dao.QuestionDao"%>
<%@page import="com.online.jdbc.dto.QuestionsDto"%>

<%
    // Retrieve examid from request
    String examid = request.getParameter("examid");

    // If examid is still null, get it from application scope
    if (examid == null || examid.trim().isEmpty()) {
        examid = (String) application.getAttribute("examid");
    }

    // Debugging: Print Exam ID to logs
    System.out.println("DEBUG: Exam ID from request = " + request.getParameter("examid"));
    System.out.println("DEBUG: Exam ID from application scope = " + application.getAttribute("examid"));
    System.out.println("DEBUG: Final Exam ID used = " + examid);

    // If examid is still missing, show an error and stop execution
    if (examid == null || examid.trim().isEmpty()) {
        out.println("<h2 style='color:red;'>Error: Exam ID is missing!</h2>");
        return;
    }

    // Retrieve question data from the form
    String questionText = request.getParameter("que");
    String optionA = request.getParameter("a");
    String optionB = request.getParameter("b");
    String optionC = request.getParameter("c");
    String optionD = request.getParameter("d");
    String answer = request.getParameter("answer");

    // Get Question ID from session and increment it
    Integer qid = (Integer) session.getAttribute("qid");
    if (qid == null) {
        qid = 1;  // Start from 1 if no previous ID exists
    } else {
        qid++;
    }
    session.setAttribute("qid", qid);

    // Debugging: Print values to server logs
    System.out.println("DEBUG: Received Data:");
    System.out.println("Question ID: " + qid);
    System.out.println("Exam ID: " + examid);
    System.out.println("Question Text: " + questionText);
    System.out.println("Option A: " + optionA);
    System.out.println("Option B: " + optionB);
    System.out.println("Option C: " + optionC);
    System.out.println("Option D: " + optionD);
    System.out.println("Answer: " + answer);

    // Validate data before inserting
    if (questionText == null || questionText.trim().isEmpty()) {
        out.println("<h2 style='color:red;'>Error: Question text cannot be empty!</h2>");
        return;
    }

    // Create a DTO object and set values
    QuestionsDto question = new QuestionsDto();
    question.setQid(qid);
    question.setExamid(examid);
    question.setQue(questionText);
    question.setA(optionA);
    question.setB(optionB);
    question.setC(optionC);
    question.setD(optionD);
    question.setAnswer(answer);

    // Insert into database
    boolean status = new QuestionDao().insertQuestion(question);

    if (!status) {
%>
        <h1 style="color: red;">Failed to insert new Question!</h1>
<%  
    } else {
%>
        <h1 style="color: green;">Question Inserted Successfully!</h1>
<%
    }
%>

<!-- Include addquestion.jsp to show the form again -->
<jsp:include page="addquestion.jsp"/>
