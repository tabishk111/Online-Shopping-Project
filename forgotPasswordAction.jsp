<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("newPassword");
int cnt=0;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"'and mobileNumber='"+mobileNumber+"'and securityQuestion='"+securityQuestion+"'and answer='"+answer+"'");
	while(rs.next())
	{
		cnt=1;
		st.executeQuery("update users set password='"+password+"'where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	
	if(cnt==0)
	{
		response.sendRedirect("forgotPassword?msg=invalid");	
	}
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>