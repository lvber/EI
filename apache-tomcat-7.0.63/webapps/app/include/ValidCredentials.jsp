<%
    if(session.getAttribute("student") == null && session.getAttribute("admin")==null) {
        response.sendRedirect("");
        return;
    } 
%>