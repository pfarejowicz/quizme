<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*, hw6Quiz.manager.*, hw6Quiz.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="normalize.css">
<link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
<%
QuizManager quizManager = (QuizManager) application.getAttribute("quiz manager");
QuestionManager questionManager = (QuestionManager) application.getAttribute("question manager");
int quiz_id = Integer.parseInt(request.getParameter("quiz_id"));
Quiz quiz = quizManager.getQuizByID(quiz_id);
out.println(quiz.getName() + " Results");
%>
</title>
</head>
<body>
<h1><%=quiz.getName()%> Results</h1>
<p>Score: <%=request.getParameter("score")%></p>
<p>Time Elapsed: <%=request.getParameter("time_elapsed")%></p>
</body>
</html>