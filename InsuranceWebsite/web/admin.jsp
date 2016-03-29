<%@page import="is301.util.ClientDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="is301.util.Client"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Dashboard - Bootstrap Admin</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />
    
    
    <link href="./css/font-awesome.css" rel="stylesheet" />
    
    <link href="./css/adminia.css" rel="stylesheet" /> 
    <link href="./css/adminia-responsive.css" rel="stylesheet" /> 
    
    <link href="./css/pages/dashboard.css" rel="stylesheet" /> 
    

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	
<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 				
			</a>
			
			<a class="brand" href="./admin.jsp">Adminia Admin</a>
			
			<div class="nav-collapse">
			
				<ul class="nav pull-right">
					
					<li class="divider-vertical"></li>
					
					<li class="dropdown">
						
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							Jovin <b class="caret"></b>							
						</a>
						
						<ul class="dropdown-menu">
							
							
							<li class="divider"></li>
							
							<li>
								<a href="./"><i class="icon-off"></i> Logout</a>
							</li>
						</ul>
					</li>
				</ul>
				
			</div> <!-- /nav-collapse -->
			
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->


<div id="content">
	
	<div class="container">
		
		<div class="row">
			
			<div class="span3">
				
				<div class="account-container">
				
					<div class="account-avatar">
						<img src="./img/headshot.png" alt="" class="thumbnail" />
					</div> <!-- /account-avatar -->
				
					<div class="account-details">
					
						<span class="account-name">Jovin</span>
						
						<span class="account-role">Administrator</span>
						
						<span class="account-actions">
							<a href="javascript:;">Profile</a> |
							
							<a href="javascript:;">Edit Settings</a>
						</span>
					
					</div> <!-- /account-details -->
				
				</div> <!-- /account-container -->
				
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					
					<li class="active">
						<a href="./admin.jsp">
							<i class="icon-home"></i>
							Dashboard 		
						</a>
					</li>
					
					<li>
						<a href="./client.jsp">
							<i class="icon-pushpin"></i>
							Client	
						</a>
					</li>
					
					<li>
						<a href="./whitelist.jsp">
							<i class="icon-th-list"></i>
							White List		
						</a>
					</li>
					
					<li>
						<a href="./blacklist.jsp">
							<i class="icon-th-large"></i>
							Black List
						</a>
					</li>
					
					
					
				</ul>	
				
				<hr />
				
				
				<br />
		
			</div> <!-- /span3 -->
			
			
			
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-home"></i>
					Dashboard					
				</h1>
				
				<div class="stat-container">
										
					<div class="stat-holder">						
						<div class="stat">							
                                                    <span><a href="client.jsp"><%=ClientDAO.getAllClient().size()%></a></span>							
							Client						
						</div> <!-- /stat -->						
					</div> <!-- /stat-holder -->
					
					<div class="stat-holder">						
						<div class="stat">							
                                                    <span><a href="whitelist.jsp"><%=ClientDAO.getWhite().size()%></a></span>								
							White List							
						</div> <!-- /stat -->						
					</div> <!-- /stat-holder -->
					
					<div class="stat-holder">						
						<div class="stat">							
                                                   <span> <a href="blacklist.jsp"><%=ClientDAO.getBlack().size()%></a></span>							
							Black List						
						</div> <!-- /stat -->						
					</div> <!-- /stat-holder -->
					
					
					
				</div> <!-- /stat-container -->
				
				
				
				
				<div class="widget widget-table">
										
					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3>Table</h3>
                                                
                                                <div class="btn" align="center">
                                                    <a href="./ClientServlet?method=start"><b>Check Expire</b></a>
                                                </div>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					
						<table class="table table-striped table-bordered">
							
                                                        <thead>
								<tr>
									<th>NRIC</th>
                                                                        <th>Licence Plate</th>
									<th>Name</th>
									<th>Vehicle Type</th>
									<th>Current Premium</th>
									<th>Start Date</th>
                                                                        <th>End Date</th>
                                                                        <th>Driving Tier</th>
                                                                        <th>Email</th>
								</tr>
							</thead>
							
							<tbody>
								<%
                                                                    ArrayList<Client> clientList = ClientDAO.getAllClient();
                                                                    for(Client c : clientList){
                                                                %>
                                                                <tr>
                                                                    <td><%=c.getNric()%></td>
                                                                    <td><%=c.getLicencePlate()%></td>
                                                                    <td><%=c.getName()%></td>
                                                                    <td><%=c.getVehicleType()%></td>
                                                                    <td><%=c.getCurrentPremium()%></td>
                                                                    <td><%=c.getStartDate()%></td>
                                                                    <td><%=c.getEndDate()%></td>
                                                                    <td><%=c.getDrivingTier()%></td>
                                                                    <td><%=c.getEmail()%></td>
                                                                </tr>
                                                                <%
                                                                    }
                                                                %>
							</tbody>
						</table>
					
					</div> <!-- /widget-content -->
					
				</div> <!-- /widget -->
				
				
				
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	


    

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/excanvas.min.js"></script>
<script src="./js/jquery.flot.js"></script>
<script src="./js/jquery.flot.pie.js"></script>
<script src="./js/jquery.flot.orderBars.js"></script>
<script src="./js/jquery.flot.resize.js"></script>


<script src="./js/bootstrap.js"></script>
<script src="./js/charts/bar.js"></script>

  </body>
</html>
