<div class="col-lg-6">
	<h1 class="page-header">
		<g:message code="default.friends.connections.label" />
	</h1>
	<div id="connectDiv">
		<hr>
		<table class="table table-bordered table-hover" >
	    	<thead>
	    		<tr>
	    			<th>Nome</th>
	    			<th>&nbsp;</th>
	    		</tr>
	    	</thead>
	    	<tbody id="following">
	    		<g:each in="${following}" status="i" var="user">
			    	<tr>
			    		<td>${user.lionname}</td>
			    		<td>
			    			<a href="#" tooltip="true" data-toggle="tooltip"
								data-placement="right" title="${message(code: 'default.follow.message.label')}">
							<i class="fa fa-arrow-right"></i></a>
			    		</td>
			    	</tr>
		    	</g:each>
	    	</tbody>
	    </table>
	</div>
</div>
<div class="col-lg-3 sidebar">
	<div class="well">
		<h4><g:message code="default.find.friends.label"/></h4>
	    <div class="input-group">
	    	<input type="text" class="form-control" id="inputLionname">
	        <span class="input-group-btn">
	            <button class="btn btn-default" type="button" id="find"><i class="fa fa-search"></i>
	            </button>
	        </span>
	    </div>
	</div>
	<div class="well">
		<h4><g:message code="default.connect.to.friends.label"/></h4>
	    <table class="table table-bordered table-hover">
	    	<thead>
	    		<tr>
	    			<th>Nome</th>
	    			<th>&nbsp;</th>
	    		</tr>
	    	</thead>
	    	<tbody id="hoToFollow">
				<g:each in="${users}" status="i" var="user">
			    	<tr>
			    		<td>${user.lionname}</td>
			    		<td>
			    			<a href="#" onclick='follow("<g:createLink controller="User" action="follow" id="${user.id}" />")' tooltip="true" data-toggle="tooltip"
								data-placement="right" title="${message(code: 'default.follow.message.label')}">
							<i class="fa fa-arrow-right"></i></a>
			    		</td>
			    	</tr>
		    	</g:each>
	    	</tbody>
	    </table>
	</div>
</div>
<script>
	$('a[tooltip=true]').tooltip();
	function follow(link){
		$.ajax({
			url: link,
			success: function(data) {
				$("#following").append("<tr><td>"+data.lionname+"</td><td><a href='#' tooltip='true' datatoggle='tooltip' data-placement='right' title='${message(code: 'default.follow.message.label')}'><i class='fa fa-arrow-right'></i></a></td></tr>");
				//console.log(data)
			}
		});
	}

	$(function($){
		$("#find").click(function(){
			var busca = $("#inputLionname").val();
			if(busca != ""){
				var dados = {'lionname': busca};
				$.ajax({
					url: "<g:createLink controller='User' action='findFriends'/>",
					data: dados,
					success: function(dado) {

						if(dado.id != null){
							$("#hoToFollow").hide("slow").html("<tr><td>"+dado.lionname+"</td><td><a href='#' onclick=\"follow('/lionmessage/User/follow/"+dado.id+"')\" tooltip='true' datatoggle='tooltip' data-placement='right' title='${message(code: 'default.follow.message.label')}'><i class='fa fa-arrow-right'></i></a></td></tr>").show("slow");
						}

					}
				});
			}
		});

	});
</script>