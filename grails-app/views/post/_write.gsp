<script>
	$(document).ready(function() {
		$('#message').focus(function() {
			$('#message').autosize({append: "\n"});
			$('form .hidden').removeClass('hidden');
		});
		$('#message').blur(function() {
			$('#message').trigger('autosize.destroy');
			$('#message').val('');
			$('form small').addClass('hidden');
			$('form .col-lg-4').addClass('hidden');
		});
		$('#message').limit('140','#charsLeft');

		$('#postForm').submit({
			
		});
	});

	$('#submitButton').click(function(){
		var isValid = $('#message').text == "";
		if (isValid) {
			var json = JSON.stringify($('#message').serializeJSON());
			var dados = {'json': json}

			$.ajax({
				type:'POST',
				data: dados,
				url: <g:createLink controller="Post" action="save" />,
				success:function(data,textStatus){
					alert(data);
				}

			});	
		}
	});
	
</script>
<form role="form" class="form-vertical" id="postForm" style="margin-top: 40px;">
	<g:hiddenField name="date" value="${new Date()}" />
	<div class="row">
		<div class="form-group col-lg-6">
			<g:textArea name="message" class="form-control" rows="1" value="${post?.message}" placeholder="${message(code: 'default.post.new.label')}"/>
			<small class=	"hidden"><span id="charsLeft"></span> <g:message code="chars.left.message"/></small>
		</div>
		<div class="form-group col-lg-4 hidden">
			<button type="button" class="btn btn-primary" id="submitButton"><g:message code="default.button.post.label" /></button>
		</div>
	</div>
</form>