
<script>
	$(document).ready(function() {
		$('#message').focus(function() {
			$('#message').autosize({append: "\n"});
			$('form .hidden').removeClass('hidden');
		});

		$('#message').limit('140','#charsLeft');


		$('#postForm').submit({
			
		});

		$('.post').click(function(){
			var repost = !$(this).attr("id") == "submitButton"
			console.log(repost)
			var message = $('#message').val()
			var isValid = message == "";
			if (!isValid) {
				var json = JSON.stringify({'message': message, 'author': "${session.user.id}", 'repost': repost});
								
				var dados = {'json': json}

				$.ajax({
					type:'POST',
					data: dados,
					url: "<g:createLink controller="Post" action="save" />",
					success:function(data,textStatus){
						$('#timelinePosts').prepend(data)
						
					}

				});	
			}
		});
		
	});

</script>
<form role="form" class="form-vertical" id="postForm" style="margin-top: 40px;">
	<div class="row">
		<div class="form-group col-lg-6">
			<g:textArea name="message" class="form-control" rows="1" value="${post?.message}" placeholder="${message(code: 'default.post.new.label')}"/>
			<small class="hidden"><span id="charsLeft"></span> <g:message code="chars.left.message"/></small>
		</div>
		<div class="form-group col-lg-4 hidden">
			<button type="button" class="btn btn-primary post" id="submitButton" ><g:message code="default.button.post.label" /></button>
		</div>
	</div>
</form>