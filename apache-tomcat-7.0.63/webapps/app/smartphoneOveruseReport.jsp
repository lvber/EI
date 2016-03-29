<%@page import="com.app.model.OveruseReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/navigationBar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMUA | Smartphone Overuse</title>
    </head>
    <body>
        <div class="container" align="center">
            <h1>Smartphone Overuse Report</h1><br/>
            <%  String errorMessage = (String) request.getAttribute("error");
                boolean hasErrors = false;
                if (errorMessage != null) {
                    hasErrors = true;
                    out.println("<p class=\" col-md-offset-4 col-md-4\" style=\"font-size: 115%; color: red\">" + errorMessage + "</p>");
                    request.removeAttribute("error");
                }
            %>
            <form class="form-horizontal" role="form" action="SmartphoneOveruseReport" method="post">
                <div class="form-group">
                    <label for="start" class="col-md-5 control-label">Enter Start Date:</label>
                    <div class="col-md-3">

                        <input class="form-control" type="date" name="startDate" id="start" required="required"
                               <%
                                   String start = request.getParameter("startDate");
                                   if (hasErrors) {
                                       out.println("value='" + start + "'");
                                   }
                               %>       
                               />
                    </div>
                </div>
                <div class="form-group">
                    <label for="end" class="col-md-5 control-label">Enter End Date:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="date" name="endDate" id="end" required="required"
                               <%
                                   String end = request.getParameter("endDate");
                                   if (hasErrors) {
                                       out.println("value='" + end + "'");
                                   }
                               %>       
                               />
                    </div>
                </div>
                <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-8">
                        <button type="submit" class="btn btn-primary">Generate Report</button>
                    </div>
                </div>
            </form>
            <div class="container" id="results" align="center">
                <%
                    OveruseReport results = (OveruseReport) request.getAttribute("result");
                    if (results != null) {%>
                <h1>Your Results</h1><br/>
                <p style='font-size: 18px'>
                    You have requested to generate your Smartphone Overuse Report from <b><%= request.getParameter("startDate")%></b>
                    to <b><%= request.getParameter("endDate")%></b>
                </p>
                <div class ='col-md-6 col-md-offset-3'>
                    <table class='table table-bordered table-striped'>
                        <thead><tr><th></th><th>Usage Duration</th><th>Usage Category</th></tr></thead>
                        <tbody>
                            <tr><td>Average daily smartphone usage duration: </td><td><center><%=results.displayUsageDuration()%>s</center></td><td><center><%=results.getUsageDurationCategory()%></center></tr>
                        <tr><td>Average daily gaming duration: </td><td><center><%=results.displayGameDuration()%>s</center></td><td><center><%=results.getGameDurationCategory()%></center></td></tr>
                        <tr><td>Smartphone access frequency </td><td><center><%=results.getFormattedFrequency()%> per hour</center></td><td><center><%=results.getFrequencyCategory()%></center></td></tr>
                        <tr><td><strong>Overuse Index:</strong></td><td colspan="2"><center><strong><%=results.getIndexValue()%></strong></center></td></tr>
                        </tbody>
                    </table>
                    <% }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
