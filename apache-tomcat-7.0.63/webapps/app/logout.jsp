<%@include file="include/ValidCredentials.jsp" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp?logout=true");
    return;
%>