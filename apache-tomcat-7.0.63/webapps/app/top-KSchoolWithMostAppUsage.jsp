<%@page import="java.util.TreeSet"%>
<%@page import="com.app.model.TopKResult"%>
<%@page import="com.app.model.AppLookupDAO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="include/navigationBar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMUA | Top-K</title>
    </head>
    <body>
        <div class="container" align="center">
            <h1>Top-K Schools With Most App Usage (Given An App Category)</h1><br/>
            <%
                String errorMessage = (String) request.getAttribute("inputError");
                boolean hasError = false;
                if (errorMessage != null) {
                    hasError = true;
                    out.println("<p class=\" col-md-offset-4 col-md-4\" style=\"font-size: 115%; color: red\">" + errorMessage + "</p>");
                    request.removeAttribute("inputError");
                }
            %>
            <form class="form-horizontal" role="form" action="TopKReport" method="post">
                <div class="form-group">
                    <label for="start" class="col-md-5 control-label">Enter Start Date:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="date" name="startDate" id="start" required="required"
                               <%
                                   String start = request.getParameter("startDate");
                                   if (hasError) {
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
                                   if (hasError) {
                                       out.println("value='" + end + "'");
                                   }
                               %>       
                               />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-5" for="k">Top # of Records:</label>
                    <div class="col-sm-3">
                        <select name = "numEntries" id="k" class="form-control">
                            <%
                                String k = request.getParameter("numEntries");
                                for (int i = 1; i <= 10; i++) {

                                    out.println("<option value='" + i + "'");
                                    if (hasError && k.equals(i + "")) {
                                        out.println("selected");
                                    }
                                    out.println(">" + i + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-5" for="cat">Select Category:</label>
                    <div class="col-sm-3"> 
                        <select name = "appCategory" id="cat" class="form-control">
                            <%
                                String category = request.getParameter("appCategory");
                                TreeSet<String> categories = AppLookupDAO.retrieveAllAppCategory();
                                for (String cat : categories) {
                                    out.println("<option value = '" + cat + "'");
                                    if (hasError && cat.equals(category)) {
                                        out.println("selected");
                                    }
                                    out.println(">" + cat + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-8">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
                <input type='hidden' value='3' name='reportType'/>
            </form>
        </div>
        <div class="container" id="results" align="center">
            <%
                ArrayList<ArrayList<TopKResult>> results = (ArrayList<ArrayList<TopKResult>>) request.getAttribute("result");
                if (results != null) {
                    out.println("<h2>Your Results | <a id=\"a\" href=\"#top\">Back to Top</a></h2><br/>");
                    //out.println("<ul>");
                    out.println("<p style='font-size: 18px'>You have selected <b>Top-" + request.getParameter("numEntries") + "</b> from ");
                    out.println("<b>" + request.getParameter("startDate") + "</b> to ");
                    out.println("<b>" + request.getParameter("endDate") + "</b> for ");
                    out.println("<b>" + request.getParameter("appCategory") + "</b>.");
                    //out.println("</ul>");
                    if (results.size() == 0) {
                        out.println("<p style='font-size: 18px'>There are no Schools whose students have used apps belonging to the specified App Category during the specified window</p>");
                    } else {
                        out.println("<div class ='row'> <div class ='col-md-6 col-md-offset-3'> <table class='table table-bordered table-striped'>");
                        out.println("<thead><tr><th><center>Rank</center></th><th>School Name</th><th><center>Duration (seconds)</center></th></tr></thead><tbody>");
                        int counter = 1;
                        for (int i = 0; i < results.size(); i++) {
                            out.println("<tr>");
                            out.println("<td><center>" + (counter) + "</center></td><td>");
                            ArrayList<TopKResult> line = results.get(i);
                            long duration = 0;
                            String currentLine = "";
                            for (int j = 0; j < line.size(); j++) {
                                TopKResult currentResult = line.get(j);
                                duration = currentResult.getDuration();
                                if (j != 0) {
                                    currentLine += ", ";
                                }
                                currentLine += currentResult.getIdentifierName();
                                counter++;
                            }
                            out.println(currentLine + "</td>");
                            out.println("<td><center>" + duration + "</center></td>");
                            out.println("</tr>");
                        }
                        out.println("</tbody></table></div></div>");
                    }
                }
            %>
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
