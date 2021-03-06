<html>
  <head>
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
%>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Do-Did-Done</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="CSS/calendar-webshim.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://afarkas.github.io/webshim/js-webshim/minified/polyfiller.js"></script>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="JS/webshim.js"></script>
    <script type="text/javascript" src="JS/ajaxCalls.js"></script>   
    <script type="text/javascript" src="JS/renderData.js"></script>
    <script type="text/javascript" src="JS/operation.js"></script>
  </head>
  <body style="background-image:url('background.jpg');
    				background-repeat:no-repeat;
    				background-size:cover;">
    <div class="w3-container w3-teal">
        <div class="w3-container w3-third">
        	<h1 class="w3-padding w3-left">Do-Did-Done</h1>
<%
	String currentUser = (String) session.getAttribute("user");
	if(currentUser != null) {
		String currentUserName = (String) session.getAttribute("userName");
%>
        	<i class="w3-center w3-padding-24 fa fa-circle-o-notch fa-spin" style="font-size:200%" id="isLoading"></i>
        </div>
        <div class="w3-third w3-center w3-padding-16"><h3><u><%=currentUserName%></u></h3></div>
        <div class="w3-container w3-third">
        	<a id="logOut" class="w3-padding-32 w3-circle w3-button w3-right" href="ServiceCalls/logoutUser.jsp">&nbsp;Logout</a>
        </div>
    </div>
    <div class="w3-container w3-padding-16">
    	<div class="w3-card-4 w3-margin-right w3-third w3-border-right" style="">
    		<header class="w3-container" style="background-color: #ADD8E6;">
      			<h2>Calendar</h2>
    		</header>

    		<div class="w3-container w3-padding-large w3-white">
    			<div>
    				<p class="w3-center w3-large" id="currentMonth"></p> 
    			</div>
      			<div id = "dateSource">
      			</div>
      			<div class="w3-bar">
  					<button class="w3-bar-item w3-button w3-hover-purple w3-left" id = "prevWeek" onclick="switchToPreviousWeek()">
  						<i class="fa fa-arrow-left"></i>
  					</button>
  					<button class="w3-bar-item w3-button w3-hover-purple w3-right" id = "nextWeek" onclick="switchToNextWeek()">
  						<i class="fa fa-arrow-right"></i>
  					</button>
  				</div>
    		</div>
			<!--
      		<button class="w3-button w3-block w3-hover-indigo" style="background-color: #ADD8E6;" id = "search" >
      			Search
      		</button>
      		-->
  		</div>
  		<div class="w3-container w3-rest">
    		<div class="w3-card-4 w3-half  w3-margin-right">
    			<header class="w3-container w3-orange">
      				<h2>To-Do</h2>
    			</header>
    			<div class="w3-container w3-padding-large w3-white">
      				<div id = "tableArea_TODO"></div>
    			</div>
				<div class="w3-container w3-orange w3-padding-16">
					<input class="w3-input w3-orange w3-cell" placeholder="Add Event here" type = "text" id = "eventName" style="width:80%"/>
    				<button class="w3-button w3-orange w3-hover-text-white w3-hover-orange w3-cell" id = "create" style="width:15%">
    					Add
    				</button>
    			</div>
  			</div>
  			<div class = "w3-card-4 w3-rest">
  				<div class="w3-card-4 w3-margin-bottom">
    				<header class="w3-container w3-yellow">
      					<h2>Doing</h2>
    				</header>

    				<div class="w3-container w3-padding-large w3-white">
      					<div id = "tableArea_DOING"></div>
    				</div>
  				</div>
  				<div class="w3-card-4 w3-margin-bottom">
    				<header class="w3-container w3-khaki">
      					<h2>Done</h2>
    				</header>

    				<div class="w3-container w3-padding-large w3-white">
      					<div id = "tableArea_DONE"></div>
    				</div>
  				</div>
  			</div>
  		</div>
    </div>
<%
	} else {
%> 
		</div>
		<div class="w3-third w3-center w3-padding-16"></div>
		<div class="w3-container w3-third">
        	<a id="logOut" class="w3-padding-32 w3-circle w3-button w3-right" href="ServiceCalls/logoutUser.jsp">&nbsp;&nbsp;Home&nbsp;</a>
    	</div>
    </div>   
	<div class="w3-container w3-center">
		<br><br>
		<font color="red">
			<h3> Sorry. You don't seem to be logged in. </h3>
		</font>
	</div>
<%
	}
%>
  </body>
</html>