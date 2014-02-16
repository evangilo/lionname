<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="lionmessage.Post"%>
<%@ page import="java.text.DateFormat"%>

<g:each var="post" in="${posts}">
<hr>
<p>

	<%
		def date = new SimpleDateFormat('MMMM, dd, yyyy')
		def hour = new SimpleDateFormat('HH:mm')
	 %>

	<i class="fa fa-clock-o"></i>
	<g:message code="default.timeline.post.message" args="[" ${post.author}", "${date.format(post.date)}", "${hour.format(post.date)}"]" />
	<g:if test="${session.user}">
		<g:if test="${session?.user?.username != post?.author?.username}">
		<a href="#" tooltip="true" data-toggle="tooltip"
			data-placement="bottom"
			title="${message(code: 'default.repost.label') }"> <i
			class="fa fa-repeat"></i></a>
	</g:if>
	</g:if>
</p>
<p>
	${post.message}
</p>
</g:each>