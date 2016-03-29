<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String msg = "";
    if(username != null && password != null){
        response.sendRedirect("admin.jsp");
    } else {
        request.setAttribute(msg,"invalid account");
        request.getRequestDispatcher("login.html").forward(request, response);
    }
%>