<%@page import="com.app.model.AppReport"%>
<%@page import="java.util.TreeSet"%>
<%@include file="include/navigationBar.jsp" %>
<%@page import="com.app.model.AppCategoryReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMUA | Basic App Usage Report</title>
    </head>
    <body>
        <div class="container" align="center">
            <h1>Breakdown by app category</h1><br/>
            <%            
                String appUsageTimeErrorMessage = (String) request.getAttribute("error");
                boolean hasError = false;
                if (appUsageTimeErrorMessage != null) {
                    hasError = true;
                    out.println("<p class=\" col-md-offset-4 col-md-4\" style=\"font-size: 115%; color: red\">" + appUsageTimeErrorMessage + "</p>");
                }
                request.removeAttribute("error");%>
            <form action="BasicAppReport" method="Post" class="form-horizontal" role="form">
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
                <input type='hidden' value='3' name='reportType'/>
            </form>
            <%
                AppCategoryReport report = (AppCategoryReport) request.getAttribute("basicAppUsageBreakDownByAppCategory");
                if (report != null) {
                    TreeSet<AppReport> reports = report.getReports();
            %>
            <div class ='col-md-4 col-md-offset-4'>
            <table class='table table-bordered table-striped' style='font-size: 18px'>
                <thead><tr><th>Category</th><th>Duration</th><th>Percentage</th></tr></thead>
                <tbody>
                    <%for (AppReport indivReport: reports) {%>
                    <tr>
                        <td><%= indivReport.getAppCategory() %></td>
                        <td><%= report.getAverageDuration(indivReport.getDuration()) %>s</td>
                        <td><%= report.getPercentageDuration(indivReport.getDuration())%>%</td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%}
                request.removeAttribute("basicAppUsageBreakDownByAppCategory");
            %>
            </div>
        </div>
    </body>
</html>
