<%@page import="java.util.ArrayList"%>
<%@page import="com.app.model.BAUR"%>
<%@include file="include/navigationBar.jsp" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.app.model.BasicReport"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMUA | Basic App Usage Report</title>
    </head>
    <body>
        <div class="container" align="center">
            <h2>Breakdown by usage time category and demographics</h2><br/>
            <%
                String appUsageTimeWithDemographicsError = (String) request.getAttribute("error");
                boolean hasErrors = false;
                String[] options = {"school", "gender", "year", "cca"};
                if (appUsageTimeWithDemographicsError != null) {
                    out.println("<p class=\" col-md-offset-3 col-md-6\" style=\"font-size: 115%; color: red\">" + appUsageTimeWithDemographicsError + "</p>");
                    request.removeAttribute("error");
                    hasErrors = true;
                }
            %>
            <form action="BasicAppReport" method="post" class="form-horizontal" role="form">
                <table  class="col-md-8 col-md-offset-2"><tr><td>
                            <div class="form-group">
                                <label for="start" class="col-md-5 control-label">Enter Start Date:</label>
                                <div class="col-md-7">
                                    <input class="form-control" type="date" name="startDate" id="start" required="required"
                                           <%
                                               if (hasErrors) {
                                                   out.println("value='" + request.getParameter("startDate") + "'");
                                               }
                                           %>
                                           />
                                </div>
                            </div>
                        </td><td>
                            <div class="form-group">
                                <label for="end" class="col-md-5 control-label">Enter End Date:</label>
                                <div class="col-md-7">
                                    <input class="form-control" type="date" name="endDate" id="end" required="required"<%
                                        if (hasErrors) {
                                            out.println("value='" + request.getParameter("endDate") + "'");
                                        }
                                           %>/>
                                </div>
                            </div>
                        </td></tr></table>
                <div class="form-group">
                    <label for="first" class="col-md-5 control-label">Breakdown 1:</label>
                    <div class="col-md-3">
                        <select name="first" id="first" class="form-control">
                            <option value="">First Choice</option>
                            <%
                                for (String option : options) {
                                    out.println("<option value='" + option + "'");
                                    if (hasErrors && request.getParameter("first").equals(option)) {
                                        out.println(" selected");
                                    }
                                    out.println(">" + option + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="second" class="col-md-5 control-label">Breakdown 2:</label>
                    <div class="col-md-3">
                        <select name="second" id="second" class="form-control">
                            <option value="">Second Choice</option>
                            <%
                                for (String option : options) {
                                    out.println("<option value='" + option + "'");
                                    if (hasErrors && request.getParameter("second").equals(option)) {
                                        out.println(" selected");
                                    }
                                    out.println(">" + option + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="third" class="col-md-5 control-label">Breakdown 3:</label>
                    <div class="col-md-3">
                        <select name="third" id="third" class="form-control">
                            <option value="">Third Choice</option>
                            <%
                                for (String option : options) {
                                    out.println("<option value='" + option + "'");
                                    if (hasErrors && request.getParameter("third").equals(option)) {
                                        out.println(" selected");
                                    }
                                    out.println(">" + option + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fourth" class="col-md-5 control-label">Breakdown 4:</label>
                    <div class="col-md-3">
                        <select name="fourth" id="fourth" class="form-control">
                            <option value="">Fourth Choice</option>
                            <%
                                for (String option : options) {
                                    out.println("<option value='" + option + "'");
                                    if (hasErrors && request.getParameter("fourth").equals(option)) {
                                        out.println(" selected");
                                    }
                                    out.println(">" + option + "</option>");
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
                <input type='hidden' value='2' name='reportType'/>
            </form>
            <% if (request.getAttribute("result") != null) {%>
            <div class="container" id="results" align="center">
                <h1>Results | <a id="a" href="#top">Back to Top</a></h1><br/>
                <p style='font-size: 18px'>
                    You have requested to generate the report from <b><%= request.getParameter("startDate")%></b> to <b><%= request.getParameter("endDate")%></b>
                    <%  
                        String[] rawBreakdowns = {request.getParameter("first"), request.getParameter("second"), request.getParameter("third"), request.getParameter("fourth")};
                        ArrayList<String> validBreakdowns = new ArrayList<String>();
                        for (String raw : rawBreakdowns) {
                            if (!raw.isEmpty()){
                                validBreakdowns.add(raw);
                            }
                        }
                        if (validBreakdowns.isEmpty()) {
                            out.println(" with no breakdowns");
                        } else {
                            out.println(" broken down by ");
                            for (int i = 0; i < validBreakdowns.size(); i++) {
                                String current = validBreakdowns.get(i);
                                if (i==validBreakdowns.size()-1) {
                                    out.println(" then ");
                                } else if (i!= 0) {
                                    out.println(", ");
                                }
                                out.println("<b>" + current + "</b>");
                            }
                        }
                        
                    %>
                </p>
                <div class ='col-md-12'>
                    <table class='table table-bordered table-striped text-center' style='font-size: 18px'>
                        <thead><tr><th><center>Breakdown</center></th><th><center>Total No. of Users</center></th><th><center>No. of Intense User</center></th><th><center>No. of Normal User</center></th><th><center>No. of Mild User</center></th></tr></thead>
                        <%
                                BAUR baur = (BAUR) request.getAttribute("result");
                                int totalNumber = baur.getTotalNumber();
                                ArrayList<BAUR> firstLayer = baur.getChild();
                                if (firstLayer.get(0).getChild() != null) {
                                    for (BAUR b : firstLayer) {
                                        out.println("<tr><td>" + b.getCategoryValue() + "</td><td>" + b.getTotalNumber() + " (" + b.getPercentage(b.getTotalNumber(), totalNumber) + "%)" + "</td><td><center>-</center></td><td><center>-</center></td><td><center>-</center></td></tr>");
                                        ArrayList<BAUR> secondLayer = b.getChild();
                                        if (secondLayer.get(0).getChild() != null) {
                                            for (BAUR bb : secondLayer) {
                                                out.println("<tr><td>" + bb.getCategoryValue() + "</td><td>" + bb.getTotalNumber() + " (" + bb.getPercentage(bb.getTotalNumber(), totalNumber) + "%)" + "</td><td><center>-</center></td><td><center>-</center></td><td><center>-</center></td></tr>");
                                                ArrayList<BAUR> thirdLayer = bb.getChild();
                                                if (thirdLayer.get(0).getChild() != null) {
                                                    for (BAUR bbb : thirdLayer) {
                                                        out.println("<tr><td>" + bbb.getCategoryValue() + "</td><td>" + bbb.getTotalNumber() + " (" + bbb.getPercentage(bbb.getTotalNumber(), totalNumber) + "%)" + "</td><td><center>-</center></td><td><center>-</center></td><td><center>-</center></td></tr>");
                                                        ArrayList<BAUR> fourthLayer = bbb.getChild();
                                                        for (BAUR bbbb : fourthLayer) {
                                                            String toprintString = bbbb.getKey();
                                                            String[] toprint = toprintString.split("\\|");
                                                            out.println("<tr><td>" +  toprint[toprint.length - 1] + "</td><td>" + bbbb.calculateTotalNumber() + " (" + bbbb.getPercentage(bbbb.calculateTotalNumber(), totalNumber) + "%)<td>" + bbbb.getIntenseNumber() + " (" + bbbb.getPercentage(bbbb.getIntenseNumber(), totalNumber) + "%)</td><td>" + bbbb.getNormalNumber() + " (" + bbbb.getPercentage(bbbb.getNormalNumber(), totalNumber) + "%)</td><td>" + bbbb.getMildNumber() + " (" + bbbb.getPercentage(bbbb.getMildNumber(), totalNumber) + "%)</td></td></tr>");
                                                        }
                                                    }
                                                } else {
                                                    for (BAUR bbb : thirdLayer) {
                                                        String toprintString = bbb.getKey();
                                                        String[] toprint = toprintString.split("\\|");
                                                        out.println("<tr><td>" + toprint[toprint.length - 1] + "</td><td>" + bbb.calculateTotalNumber() + " (" + bbb.getPercentage(bbb.calculateTotalNumber(), totalNumber) + "%)<td>"+ bbb.getIntenseNumber() + " (" + bbb.getPercentage(bbb.getIntenseNumber(), totalNumber) + "%)</td><td>" + bbb.getNormalNumber() + " (" + bbb.getPercentage(bbb.getNormalNumber(), totalNumber) + "%)</td><td>" + bbb.getMildNumber() + " (" + bbb.getPercentage(bbb.getMildNumber(), totalNumber) + "%)</td></td></tr>");
                                                    }
                                                }
                                            }
                                        } else {
                                            for (BAUR bb : secondLayer) {
                                                String toprintString = bb.getKey();
                                                String[] toprint = toprintString.split("\\|");
                                                out.println("<tr><td>" + toprint[toprint.length - 1] + "</td><td>" + bb.calculateTotalNumber() + " (" + bb.getPercentage(bb.calculateTotalNumber(), totalNumber) + "%)<td>" + bb.getIntenseNumber() + " (" + bb.getPercentage(bb.getIntenseNumber(), totalNumber) + "%)</td><td> " + bb.getNormalNumber() + " (" + bb.getPercentage(bb.getNormalNumber(), totalNumber) + "%)</td><td> " + bb.getMildNumber() + " (" + bb.getPercentage(bb.getMildNumber(), totalNumber) + "%)</td></td></tr>");
                                            }
                                        }
                                    }
                                } else {
                                    for (BAUR b : firstLayer) {
                                        String toprintString = b.getKey();
                                        String[] toprint = toprintString.split("\\|");
                                        out.println("<tr><td>" + toprint[toprint.length - 1] + "</td><td>" + b.calculateTotalNumber() + " (" + b.getPercentage(b.calculateTotalNumber(), totalNumber) + "%)<td>"  + b.getIntenseNumber() + " (" + b.getPercentage(b.getIntenseNumber(), totalNumber) + "%)</td><td> " + b.getNormalNumber() + " (" + b.getPercentage(b.getNormalNumber(), totalNumber) + "%)</td><td> " + b.getMildNumber() + " (" + b.getPercentage(b.getMildNumber(), totalNumber) + "%)</td></td></tr>");
                                    }
                                }
                            }%>
                    </table>
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