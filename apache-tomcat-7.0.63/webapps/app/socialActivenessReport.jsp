<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.app.model.SocialReport"%>
<%@include file="include/navigationBar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMUA | Social</title>
    </head>
    <body>
        <div class="container" align="center">
            <h1>Social Activeness Report!</h1><br/>
            <form class="form-horizontal" action="SocialActivenessReport" method="post"> 
                <div class="form-group">
                    <label for="start" class="col-md-5 control-label">Enter Date: </label>
                    <div class="col-md-3">
                        <input class="form-control" type="date" id="start" name="date" required/>
                    </div>
                </div>
                <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-8">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>

            </form>
            <div class="container" align="center">

                <%
                    SocialReport results = (SocialReport) request.getAttribute("result");
                    if (results != null) {
                        HashMap<String, Integer> socialAppUsage = results.getSocialAppUsage();
                        if (results != null) {%>
                <h1>Your Results</h1>
                <p style='font-size: 18px'>
                    Social Activeness Report generated for <b><%= request.getParameter("date")%></b>
                </p>
                <div class ='col-md-6 col-md-offset-3'>
                    <table class='table table-bordered table-striped'>
                        <thead><tr><th>Results:</th><th><center>Duration</center></th><th><center>Percentage</center></th></tr></thead>
                        <!--<tbody><tr><td>Total Online Duration:</td><td><center><%=results.getTotalOnlineDuration()%>s</center></td><td><center>-</center></td></tr>-->
                            <tr><td>Social Online Duration: </td><td><center><%=results.getSocialDuration()%>s</center></td><td><center>-</center></td></tr>
                            <%Iterator it = socialAppUsage.entrySet().iterator();
                                while (it.hasNext()) {
                                    Map.Entry pair = (Map.Entry) it.next();%>
                    <tr><td><%= pair.getKey()%></td><td><center><%= pair.getValue()%>s</center></td><td><center><%= Math.round((Integer) pair.getValue() * 100.0 / results.getSocialDuration())%>%</center></td></tr>
                            <%}%>
                            <% if (results.getTotalSISDuration() != 0) {%>
                            <tr><td>Total Duration Spent in SIS: </td><td><center><%=results.getTotalSISDuration()%>s</center></td><td><center>-</center></td></tr>
                    <tr><td>Total Duration Alone </td><td><center><%=results.getAlongDuration()%>s</center></td><td><center><%= Math.round(results.getAlongDuration() * 100.0 / results.getTotalSISDuration())%>%</center></td></tr>
                    <tr><td>Total Duration in Groups </td><td><center><%=results.getGroupDuration()%>s</center></td><td><center><%= Math.round(results.getGroupDuration() * 100.0 / results.getTotalSISDuration())%>%</center></td></tr>
                            <%} else {%>
                    <tr><td>Total Duration Spent in SIS: </td><td><center><%=results.getTotalSISDuration()%>s</center></td><td><center>-</center></td></tr>
                    <tr><td>Total Duration Alone </td><td><center><%=results.getAlongDuration()%>s</center></td><td><center>-</center></td></tr>
                    <tr><td>Total Duration in Groups </td><td><center><%=results.getGroupDuration()%>s</center><td><center>-</center></td></tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                <%      }
                    }
                %>
            </div>
        </div>
    </body>
</html>
