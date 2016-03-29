<%@page import="java.util.TreeSet"%>
<%@include file="include/navigationBar.jsp" %>
<%@page import="com.app.model.SemanticPlace"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMUA | Smartphone Usage</title>
    </head>
    <body>
        <div class="container"  align="center">
            <h1>Smartphone Usage Heatmap</h1><br/>
            <%
                String[] floors = {"B1", "L1", "L2", "L3", "L4", "L5"};
                String appUsageTimeErrorMessage = (String) request.getAttribute("error");
                boolean hasError = false;
                if (appUsageTimeErrorMessage != null) {
                    hasError = true;
                    out.println("<p class=\" col-md-offset-4 col-md-4\" style=\"font-size: 115%; color: red\">" + appUsageTimeErrorMessage + "</p>");
                    request.removeAttribute("error");
                }
            %>
            <form action="UsageHeatmap" method="post" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="control-label col-sm-5" for="flr">Select Floor:</label>
                    <div class="col-sm-3"> 
                        <select name = "floor" id="flr" class="form-control">
                            <%
                                for (String floor : floors) {
                                    out.println("<option value='" + floor + "'");
                                    if (hasError && floor.equals(request.getParameter("floor"))) {
                                        out.println("selected");
                                    }
                                    out.println(">" + floor + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dateTime" class="col-md-5 control-label">Enter Date and Time:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="datetime-local" step="1" name="dateTime" id="dateTime" required="required"
                               <%
                                   String start = request.getParameter("dateTime");
                                   if (hasError) {
                                       out.println("value='" + start + "'");
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
                    TreeSet<SemanticPlace> results = (TreeSet<SemanticPlace>) request.getAttribute("result");
                    if (results != null) {
                        String parameter = request.getParameter("dateTime").replace("T", " ");
                        String floor = request.getParameter("floor");
                        if (parameter.length() == 16) {
                            parameter += ":00";
                        }
                %>
                <h1>Your Results | <a id="a" href="#top">Back to Top</a></h1><br/>
                <p style='font-size: 18px'>
                    Smartphone Usage Heatmap generated for Floor: <b><%= floor%></b> at Date Time: <b><%= parameter%></b>
                </p>
                <div class ='col-md-6 col-md-offset-3'>
                    <table class='table table-bordered table-striped'>
                        <thead><tr><th>Semantic Place</th><th><center>Density</center></th><th><center>Number of Users</center></th></thead>
                        <tbody>
                            <% for (SemanticPlace sp : results) {%>

                            <tr><td><%=sp.getName()%></td><td><center><%=sp.getDensity()%></center></td><td><center><%=sp.getNumOfUsers()%></center></td></tr>

                        <%}%>
                        </tbody>
                    </table>
                    <%
                            request.removeAttribute("result");
                        }
                    %>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(shiftToResults());
            function shiftToResults() {
                var results = $('#results');
                if (results.length) {
                    //defined scrollTop as below
                    //offset() returns the entire co-ordinate of the object
                    //top returns to the top of the co-ordinate
                    $('html,body').animate({scrollTop: results.offset().top}, 'slow');
                }
            }
        </script>
    </body>
</html>
