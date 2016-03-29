<%@page import="com.app.model.DeleteResult"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.TreeSet"%>
<%@page import="com.app.model.ValidationError"%>
<%@page import="com.app.model.UploadResult"%>
<%@page import="java.util.ArrayList"%>
<%@include file="include/ValidCredentials.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>SMUA | Administrator</title>
    </head>
    <body>
        <div class="container">
            <h1>Administrator Menu | <a href='logout.jsp'>Logout</a></h1>
            <hr>
            <h2>Bootstrap/Update</h2>
            <%            String uploadError = (String) request.getAttribute("uploadError");
                String errorFormRadioButton = null;
                if (uploadError != null) {
                    out.println("<p><font color='red'>" + uploadError + "</font></p>");
                    errorFormRadioButton = request.getParameter("uploadOption");
                }
                request.removeAttribute("uploadError");
            %>
            <table>
                <form method="POST" enctype="multipart/form-data"  action="MainFileUpload">
                    <tr>
                        <td>Upload File:</td>
                        <td><input type="file" name="upfile" accept=".zip" required="required"></td>
                    </tr>
                    <tr>
                        <td>Bootstrap:</td>
                        <td><input type="radio" name="uploadOption" value="bootstrap"
                                   <%
                                       if (errorFormRadioButton != null && errorFormRadioButton.equals("bootstrap")) {
                                           out.println("checked");
                                       }
                                   %>     
                                   required="required" />
                        </td>
                    </tr>
                    <tr>
                        <td>Update:</td>
                        <td><input type="radio" name="uploadOption" value="update"
                                   <%
                                       if (errorFormRadioButton != null && errorFormRadioButton.equals("update")) {
                                           out.println("checked");
                                       }
                                   %>
                                   required="required" />
                        </td>
                    </tr>
                    <tr>
                        <td></td><td><input type="submit" value="Submit"/></td>
                    </tr>
                </form>
            </table>
            <hr>
            <h2>Manual Deletion</h1>
                <form method="POST" action="ManualDeletion">
                    <%
                        String manualDeletionError = (String) request.getAttribute("manualDeletionError");
                        boolean hasError = false;
                        if (manualDeletionError != null) {
                            out.println("<p><font color='red'>" + manualDeletionError + "<br />Please try again</font></p>");
                            hasError = true;
                        }
                        request.removeAttribute("manualDeletionError");
                    %>
                    <table>

                        <tr><td>Start date:</td><td><input type="date"  name="startdate" required="required" <%
                            if (request.getAttribute("startDate") != null) {
                                out.println("value=" + request.getAttribute("startDate"));
                            }%>></td></tr>
                        <tr>
                            <td>Mac Address (optional):</td>
                            <td><input type="text" name="macaddress" size="28"  /></td>
                        </tr>
                        <tr><td>End date (optional):</td><td><input type="date"  name="enddate"></td></tr>
                        <tr><td>Start time (optional):</td><td><input type="time" name="starttime"></td></tr>
                        <tr><td>End time (optional):</td><td><input type="time" name="endtime"></td></tr>
                        <tr><td>Enter a location id (optional):</td><td><input type="text" name="location-id"></td></tr>
                        <tr><td>Enter a semantic place  (optional):</td><td><input type="text" name="semantic-place"></td></tr>
                        <tr>
                            <td></td><td><input type="submit" name="Submit"/></td>
                        </tr>
                    </table>
                </form>
                <%
                    TreeSet<UploadResult> results = (TreeSet<UploadResult>) request.getAttribute("result");
                    if (results != null) {
                        String unknownFiles = (String) request.getAttribute("unknownFiles");
                        out.println("<h2>Results for your upload:</h2>");
                        if (unknownFiles != null) {
                            out.println("Invalid Files not uploaded: " + unknownFiles);
                        }
                        for (UploadResult uploadResult : results) {
                            out.println("<p>");
                            out.println("File: " + uploadResult.getFileName() + "<br/>");
                            if (!uploadResult.getFileName().equals("location-delete.csv")) {
                                out.println("Total Records Uploaded: " + uploadResult.getNumSuccessful());
                            } else {
                                int numSuccessfulDeletion = uploadResult.getNumSuccessful();
                                int totalValidData = uploadResult.getValidDataList().size();
                                out.println("Total Records that are valid and deleted: " + numSuccessfulDeletion + "<br />");
                                out.println("Total Records that are valid but not found in database: " + (totalValidData - numSuccessfulDeletion) + "<br />");
                            }
                        }
                        out.println("<h3>Errors</h3>");
                        for (UploadResult uploadResult : results) {
                            out.println("<p>");
                            out.println("File: " + uploadResult.getFileName() + "<br />");
                            out.println("Errors:");
                            TreeMap<Integer, ArrayList<String>> ve = uploadResult.getErrorList();

                            if (ve.size() != 0) {
                                out.println("<br />");
                                for (Integer key : ve.keySet()) {
                                    out.println("Row " + key);
                                    ArrayList<String> errors = ve.get(key);
                                    boolean isSubsequentLine = false;
                                    for (String indivError : errors) {
                                        if (isSubsequentLine) {
                                            out.println(", ");
                                        }
                                        out.println(indivError);
                                        isSubsequentLine = true;
                                    }
                                    out.println("<br />");
                                }
                            } else {
                                out.println(" None");
                            }
                            out.println("</p>");
                        }
                        request.removeAttribute("result");
                    }
                    Integer manualDeletionNum = (Integer) request.getAttribute("manualDeletionNum");
                    ArrayList<DeleteResult> deleteResults = (ArrayList<DeleteResult>) request.getAttribute("manualDeletionResults");
                    if (manualDeletionNum != null) {
                        out.println("<li>" + manualDeletionNum + " records were deleted</li></ul>");
                        out.println("<li>Results:</li></ul>");
                        for (DeleteResult dr : deleteResults) {
                            out.println("location-id: " + dr.getLocationid() + "</br>");
                            out.println("timestamp: " + dr.getTimestamp().toString().replace(".0", "") + "</br>");
                            out.println("macaddress: " + dr.getMacaddress() + "</br>");
                            out.println("</br>");
                        }
                        request.removeAttribute("manualDeletionResults");
                    }
                    request.removeAttribute("manualDeletionNum");
                %>
        </div>
    </body>
</html>
