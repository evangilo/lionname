<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="lionmessage.Post"%>
<%@ page import="java.text.DateFormat"%>

<g:each var="post" in="${posts}">

	<%
		def date = new SimpleDateFormat('MMMM, dd, yyyy')
		def hour = new SimpleDateFormat('HH:mm')
		def id = "${post.author}_${post.id}"
		def idMessage = "message_${id}"
	 %>

	<g:if test="${post.author.username == post.authorRepost}">
		<hr>
		<p>
			<i class="fa fa-clock-o"></i>
			<g:message code="default.timeline.post.message" args="[" ${post.author}", "${date.format(post.date)}", "${hour.format(post.date)}"]" />
			<g:if test="${session.user}">
				<g:if test="${session?.user?.username != post?.author?.username}">
					<a class="${post.author}" id="${id}" onclick="repost(this)"
						href="#" tooltip="true" data-toggle="tooltip"
						data-placement="bottom"
						title="${message(code: 'default.repost.label') }"> <i
						class="fa fa-repeat"></i></a>
				</g:if>
			</g:if>
		</p>
		<p id="${idMessage}">
			${post.message}
		</p>
	</g:if>
	<g:else>
		
		<hr>
		<p>
			<i class="fa fa-clock-o"></i>
			<g:message code="default.timeline.repost.message"
				args="["${post.author}", "${date.format(post.date)}", "${hour.format(post.date)}", "${post.authorRepost}"]" />
			<g:if test="${session.user}">
				<!--<g:if test="${session?.user?.username != post?.author?.username}"></g:if> -->
				<g:if test="${false}">
					<a href="#" tooltip="true" data-toggle="tooltip"
						data-placement="bottom"
						title="${message(code: 'default.unfollow.parameterized.message.label', args: [session.user.username]) }">
						<i class="fa fa-arrow-down"></i>
					</a>
				</g:if>
			</g:if>
		</p>
		<p id="${idMessage}">
			${post.message}
		</p>
	</g:else>
</g:each>