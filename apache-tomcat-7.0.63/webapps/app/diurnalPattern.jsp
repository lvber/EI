
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="include/navigationBar.jsp" %>
<%@page import="com.app.model.StudentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMUA | Basic App Usage Report</title>
    </head>
    <body>
        <div class="container" align="center">
            <h1>Breakdown by Diurnal Pattern</h1><br/>
            <%
                String appUsageTimeWithDemographicsError = (String) request.getAttribute("error");
                if (appUsageTimeWithDemographicsError != null) {
                    out.println("<p class=\" col-md-offset-4 col-md-4\" style=\"font-size: 115%; color: red\">" + appUsageTimeWithDemographicsError + "</p>");
                    request.removeAttribute("error");
                }
            %>
            <form action="BasicAppReport" class="form-horizontal" role="form" method="Post">
                <div class="form-group">
                    <label for="date" class="col-md-5 control-label">Enter Date:</label>
                    <div class="col-md-2">
                        <input class="form-control" type="date" name="date" id="date" required="required"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-5" for="school">Select School:</label>
                    <div class="col-sm-2">
                        <select name="school" id="school" class="form-control">
                            <option value="">None</option> 
                            <%ArrayList<String> schoolList = StudentDAO.getSchools();
                                for (int i = 0; i < schoolList.size(); i++) {
                                    String school = schoolList.get(i);
                            %>
                            <option value="<%=school%>"><%=school%></option> 
                            <%}%>
                        </select>
                    </div>
                </div>      
                <div class="form-group">
                    <label class="control-label col-sm-5" for="year">Select Year:</label>
                    <div class="col-sm-2">
                        <select name="year" id="year" class="form-control" >
                            <option value="">None</option> 
                            <%ArrayList<String> yearList = StudentDAO.retrieveAllYears();
                                for (int i = 0; i < yearList.size(); i++) {
                                    String year = yearList.get(i);
                            %>
                            <option value="<%=year%>"><%=year%></option> 
                            <%}%>
                        </select>
                    </div>
                </div>     
                <div class="form-group">
                    <label class="control-label col-sm-5" for="gender">Select Gender:</label>
                    <div class="col-sm-2">
                        <select name="gender" id="gender"  class="form-control">
                            <option value="">None</option> 
                            <option value="M">Male</option> 
                            <option value="F" >Female</option>
                        </select>
                    </div>
                </div>
                <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-8">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
                <input type='hidden' value='4' name='reportType'/>
            </form>
            <%
                TreeMap<Integer, Integer> result = (TreeMap<Integer, Integer>) request.getAttribute("DiurnalPatternReport");
                if (result != null) {
                    String school = request.getParameter("school");
                    String year = request.getParameter("year");
                    String gender = request.getParameter("gender");
                    ArrayList<String> filters = new ArrayList<String>();
                    if (!school.isEmpty()) {
                        filters.add(school);
                    }
                    if (!year.isEmpty()) {
                        filters.add(year);
                    }
                    if (!gender.isEmpty()) {
                        filters.add(gender);
                    }
            %>
            <div class="container" id="results" align="center">
                <h1>Results | <a id="a" href="#top">Back to Top</a></h1><br/>
                <p style='font-size: 18px'>
                    You have requested to generate Diurnal Pattern of App Usage for <b><%= request.getParameter("date")%></b>
                    <%
                        if (filters.isEmpty()) {
                            out.println(" and no demographics");
                        } else {
                            if (filters.size() == 2) {
                                out.println(" and filtered by <b>" + filters.get(0) + "</b> and <b>" + filters.get(1) + "</b> only");
                            } else {
                                out.println(" and filtered by ");
                                for (int i = 0; i < filters.size(); i++) {
                                    if (i == filters.size()-1) {
                                        out.println("and ");
                                    } else if (i != 0) {
                                        out.println(", ");
                                    }  
                                    out.println("<b>" + filters.get(i) + "</b>");
                                }
                            }
                        }

                    %> 
                </p>
                <div class ='col-md-4 col-md-offset-4'>
                    <table class='table table-bordered table-striped' style='font-size: 18px'>
                        <thead><tr><th><center>Time Period</center></th><th><center>Duration</center></th></tr></thead>
                        <tbody>
                            <%                                int count = 0;
                                String period = "";
                                for (Map.Entry<Integer, Integer> entry : result.entrySet()) {
                                    if (count / 9 == 0) {
                                        period = "0" + count + ":00 - 0" + (count + 1) + ":00";
                                    } else if (count == 9) {
                                        period = "0" + count + ":00 - " + (count + 1) + ":00";
                                    } else {
                                        period = count + ":00 - " + (count + 1) + ":00";
                                    }
                            %>
                            <tr><td><center><%=period%> (exclusive)</center></td><td><center><%=result.get(count)%>s</center></td></tr>
                            <%
                                        count++;
                                    }
                                }

                            %>
                        </tbody>
                    </table>
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
