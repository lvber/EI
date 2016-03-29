<%@page import="com.app.model.Student"%>
<%@include file="ValidCredentials.jsp" %>
<%Student student = (Student) session.getAttribute("student");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="SMUA">
        <meta name="author" content="G4T7">

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom styles for this template -->
        <link href="css/navbar-static-top.css" rel="stylesheet" type="text/css"/>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <!-- Static navbar -->
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <p class="navbar-text" >Signed in as <strong style="font-size:120%"><%= student.getName()%>&nbsp;</strong></p>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Basic App Usage Reports <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="breakdownByUsageTimeCategory.jsp">Breakdown By Usage Time Category</a></li>
                                <li><a href="breakdownByUsageTimeCategoryAndDemographics.jsp">Breakdown By Usage Time Category and Demographics</a></li>
                                <li><a href="breakdownByAppCategory.jsp">Breakdown By App Category</a></li>
                                <li><a href="diurnalPattern.jsp">Diurnal Pattern Of App Usage Time</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Top-K Reports <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="top-KMostUsedApps.jsp">Top-K Most Used Apps (Given a School)</a></li>
                                <li><a href="top-KStudentsWithMostAppUsage.jsp">Top-K Students With Most App Usage (Given An App)</a></li>
                                <li><a href="top-KSchoolWithMostAppUsage.jsp">Top-K Schools With Most App Usage (Given A School)</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Smartphone Reports <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="smartphoneOveruseReport.jsp">Smartphone Overuse Report</a></li>
                                <li><a href="smartphoneUsageHeatmap.jsp">Smartphone Usage Heatmap</a></li>
                            </ul>
                        </li>
                        <li><a href="socialActivenessReport.jsp">Social Activeness Report</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="logout.jsp" style="font-weight: bold; font-size: 20px">Logout</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <!--<footer class="footer" >
            <div class="container">
                <p class="text-muted" align="center"><a id="a" href="#top">Back to Top</a></p>
            </div>
        </footer>-->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>