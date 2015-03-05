<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.util.*, hw6Quiz.*, hw6Quiz.manager.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	UserManager userManager = (UserManager) getServletContext().getAttribute("user manager");
	DBConnection connection = (DBConnection) getServletContext().getAttribute("connection");
	FriendsManager friendsManager = (FriendsManager) getServletContext().getAttribute("friends manager");
	String info = (String) session.getAttribute("info");
	int userId = (Integer) session.getAttribute("user id");
	ArrayList<Integer> userInfo = userManager.findUsers(userId, info); 
	int otherUserId = 0;
	String otherUserEmail = "";
	int friendStatus = 0;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Search</title>
</head>
<body>

<h1>Search Result for <%=info%>:</h1>

	<ul>
	<%for (int i = 0 ; i < userInfo.size() ; i++) { %>
		<% 
		otherUserId = userInfo.get(i);
		otherUserEmail = userManager.getEmailByID(otherUserId);
		friendStatus = friendsManager.checkFriendStatus(userId, otherUserId); 
		%>
		<li>
		<a href="friend_homepage.jsp?friendEmail=<%=otherUserEmail%>"><%=userManager.getNameByID(otherUserId)%>: <%=otherUserEmail%></a>
		<%
		if (friendStatus == 2) {%>  
			<p>Friend Request Sent</p>
		<%}%>
		<%
		if (friendStatus == 3) {%>  
			<form action="FriendServlet" method="post">
			<input type="hidden" value=<%=otherUserEmail%> name="friendEmail" />
			<input type="submit" value="Accept" name="decision" />
			</form>
			<form action="FriendServlet" method="post">
			<input type="hidden" value=<%=otherUserEmail%> name="friendEmail" />
			<input type="submit" value="Reject" name="decision" />
			</form>
		<%}%>
		<%
		if (friendStatus == 4) {%>  
			<form action="FriendRequestServlet" method="post">
			<p><input type="hidden" value=<%=otherUserEmail%> name="friendEmail" />
		    <input type="submit" value="Send Friend Request" /></p>
		    </form>
		<%}%>
		</li>
	<%}%>
	</ul>

</body>
</html>