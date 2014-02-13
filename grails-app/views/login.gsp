<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<script>
			$(document).ready(function() {

				preValidateRequiredFields('loginForm');
				
				$('#submitButton').click(function() {

					var isValid = validateRequiredFields('loginForm');

					if (isValid) {
						var json = JSON.stringify($('#loginForm').serializeJSON());

						var dados = {'json': json};
						$.ajax({
					        url: "${createLink(controller: 'user', action: 'login')}",
					        type: "POST",
					        data : dados,
					        success: function(data) {
					    		goToPage("${createLink(uri:'/')}");
					        },
					        error: function(data) {
						        var json = $.parseJSON(data.responseText);
						        showMessage(json.message, 'danger');
						        markInput(json.field, 'error');
						    }
					    });
					}
			    });
			});
		</script>
	</head>
	<body>
	    <div class="container">
	        <div class="row">
				<div class="col-sm-12 media" style="margin-top: 30px;">
					<form role="form" class="form-horizontal" id="loginForm">
						<div class="row">
							<div class="form-group has-feedback">
								<label for="lionname" class="col-sm-4 control-label"><g:message code="default.lionname.label" /></label>
								<div class="col-lg-3">
									<input type="text" name="lionname" class="form-control" id="lionname" value="${user.lionname}" required>
									<span class="glyphicon form-control-feedback hidden"></span>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="form-group has-feedback">
								<label for="password" class="col-sm-4 control-label"><g:message code="default.password.label" /></label>
								<div class="col-lg-3">
									<input type="password"	name="password" class="form-control" id="password" value="${user.password}" required>
									<span class="glyphicon form-control-feedback hidden"></span>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="form-group has-feedback">
								<div class="col-sm-offset-4 col-sm-10">
									<button type="button" class="btn btn-primary" id="submitButton"><g:message code="default.login.label" /></button>
									<g:link controller="user" action="createAccount" class="btn btn-link"><g:message code="default.title.create.account" /></g:link>
								</div>
							</div>
						</div>
					</form>
				</div>
	        </div>
	    </div>
	</body>
</html>