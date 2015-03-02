<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Question</title>
</head>
<body>
<h1>Select Question Type</h1>
<form action="SelectQuestionTypeServlet" method="post">
<p>Question Type: 
<select name="ques_type">
<option value="text_response">Question-Response Question</option>
<option value="fill_blank">Fill in the Blank Question</option>
<option value="multiple_choice">Multiple Choice Question</option>
<option value="picture">Picture-Response Question</option>
</select>
</p>
<%
	String quiz_id = (String) request.getAttribute("quiz_id");
%>
<input type="hidden" name="quiz_id" value="<%=quiz_id%>"/>
<p><input  type="submit" value="Next" /></p>
</form>
</body>
</html>