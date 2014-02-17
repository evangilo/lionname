<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Lion Message</title>
	</head>
	<body onload="refleshTimeline()">
	    <!-- Page Content -->
	    <div class="container" id="containerDiv">
	        <div class="row">
	        	<div id="menuDiv">
					<g:render template="/shared/menu" />
	        	</div>
	        	<div id="mainDiv">
					<g:render template="/timeline" />
	        	</div>
	        </div>
	        <!-- /.row -->
	    </div>
	    <!-- /.container -->
	</body>
</html>
