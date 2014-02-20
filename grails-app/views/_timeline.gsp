<div class="col-md-9 col-sm-8">
	<g:if test="${session.user}">
		<g:render template="/post/write"/>
		<h4>
			<g:message code="default.timeline.label" />
		</h4>
	</g:if>
	<g:else>
		<h1 class="page-header">
			<g:message code="default.timeline.label" />
		</h1>
	</g:else>
	
	<div id="timelinePosts">
		<script>
		$('#timelinePosts').load("<g:createLink controller="Post" action="refreshTimeline" />");
		</script>
	</div>
</div>
