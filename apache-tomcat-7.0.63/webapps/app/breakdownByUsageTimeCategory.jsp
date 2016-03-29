<%@include file="include/navigationBar.jsp" %>
<%@page import="com.app.model.BasicReport"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMUA | Basic App Usage Report</title>
    </head>
    <body>
        <div class="container" align="center">
            <h1>Breakdown by usage time category</h1><br/>
            <%
                String appUsageTimeErrorMessage = (String) request.getAttribute("error");
                boolean hasError = false;
                if (appUsageTimeErrorMessage != null) {
                    hasError = true;
                    out.println("<p class=\" col-md-offset-4 col-md-4\" style=\"font-size: 115%; color: red\">" + appUsageTimeErrorMessage + "</p>");
                    request.removeAttribute("appUsageTimeError");
                }
            %>
            <form action="BasicAppReport" method="Post"  class="form-horizontal" role="form" >
                <div class="form-group">
                    <label for="start" class="col-md-5 control-label">Enter Start Date:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="date" name="startDate" id="start" required="required"
                        <%
                          String start = request.getParameter("startDate");  
                          if (hasError){
                              out.println("value='" + start + "'");
                          }              
                                    %>/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="end" class="col-md-5 control-label">Enter End Date:</label>
                    <div class="col-md-3">

                        <input class="form-control" type="date" name="endDate" id="end" required="required"
                        <%
                          String end = request.getParameter("endDate");  
                          if (hasError){
                              out.println("value='" + end + "'");
                          }              
                                    %>/>
                    </div>
                </div>
                <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-8">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
                <input type='hidden' value='1' name='reportType'/>
            </form>
            <%
                BasicReport report = (BasicReport) request.getAttribute("basicAppUsageTime");
                if (report != null) {
            %>
            <div class="container" id="results" align="center">
                <h1>Results</h1><br/>
                <p style='font-size: 18px'>
                    You have requested to generate the report from <b><%= request.getParameter("startDate")%></b> to <b><%= request.getParameter("endDate")%></b>
                </p>
                <div class ='col-md-8 col-md-offset-2'>
                    <table class='table table-bordered table-striped'>
                        <thead>
                            <tr>
                                <th><center>No. of Intense users<br/>(5 hours <= daily usage time)</center></th>
                                <th><center>No. of Normal users<br/>(1 <= average daily usage time < 5 hours)</center></th>
                                <th><center>No. of Mild Users<br/>(daily usage time < 1 hour)</center></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><center><%=report.getNumIntenseUsers()%> (<%=report.getIntenseUsersPercentage()%>%)</center></td>
                                <td><center><%=report.getNumNormalUsers()%> (<%= report.getNormalUsersPercentage()%>%)</center></td>
                                <td><center><%=report.getNumMildUsers()%> (<%=report.getMildUsersPercentage()%>%)</center></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <% }
                %>
            </div>
        </div>
    </body>
</html>
