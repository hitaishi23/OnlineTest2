<%-- Set examid in application scope if not already set --%>
<%
    String examid = (String) application.getAttribute("examid");
    if (examid == null) {
        examid = "e3"; // Set a default exam ID (Replace this with dynamic value)
        application.setAttribute("examid", examid);
    }
%>

<h2>Add New Question in Exam: <em><%= examid %></em></h2><br/>

<form action="/OnlineTest2/jsp/questions/finaladdquestion.jsp" method="post">

    <!-- Ensure examid is passed correctly -->
    <input type="hidden" name="examid" value="<%= examid %>" />

    <label>Enter Question:</label>
    <input type="text" name="que" required/><br/>

    <label>Option A:</label>
    <input type="text" name="a" required/><br/>

    <label>Option B:</label>
    <input type="text" name="b" required/><br/>

    <label>Option C:</label>
    <input type="text" name="c" required/><br/>

    <label>Option D:</label>
    <input type="text" name="d" required/><br/>

    <strong>Choose Correct Option:</strong><br/>
    <input type="radio" name="answer" value="A" required/> Option 1  
    <input type="radio" name="answer" value="B" required/> Option 2  
    <input type="radio" name="answer" value="C" required/> Option 3  
    <input type="radio" name="answer" value="D" required/> Option 4<br/><br/>

    <input type="submit" value="+ Add"/>
</form>
