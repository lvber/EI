<%@include file="include/ValidCredentials.jsp" %>
<%@include file="include/navigationBar.jsp" %>
<%@ page isErrorPage="true" import="java.io.*" contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <%
            response.sendRedirect("javascript: history.back();");
        %>
    </body>
</html>