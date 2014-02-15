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
		<hr>
		<p>
			<i class="fa fa-clock-o"></i>
			<g:message code="default.timeline.repost.message"	args="["${session?.user?.username}", 'February, 8, 2014', '23:40', 'Maria José']" />
			<g:if test="${session.user}">
				<!--<g:if test="${session?.user?.username != post?.author?.username}"></g:if> -->
				<g:if test="${false}">
					<a href="#" tooltip="true" data-toggle="tooltip" data-placement="bottom"
						title="${message(code: 'default.unfollow.parameterized.message.label', args: ['Leo Silva']) }">
					<i class="fa fa-arrow-down"></i></a>
				</g:if>
			</g:if>
		</p>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc
			placerat diam quis nisl vestibulum dignissim. In hac habitasse platea
			dictumst. Interdum et malesuada fames ac ante ipsum primis in
			faucibus. Pellentesque habitant morbi tristique senectus et netus et
			malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus
			tristique, non posuere neque iaculis. Fusce aliquet dui ut felis
			rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo
			a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
		<hr>
		<p>
			<i class="fa fa-clock-o"></i>
			<g:message code="default.timeline.post.message"	args="['Maria José', 'February, 8, 2014', '23:40']" />
			<g:if test="${session.user}">
				<!--<g:if test="${session?.user?.username != post?.author?.username}"></g:if> -->
				<g:if test="${true}">
					<a href="#" tooltip="true" data-toggle="tooltip" data-placement="bottom"
						title="${message(code: 'default.repost.label') }">
					<i class="fa fa-repeat"></i></a>
				</g:if>
			</g:if>
		</p>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc
			placerat diam quis nisl vestibulum dignissim. In hac habitasse platea
			dictumst. Interdum et malesuada fames ac ante ipsum primis in
			faucibus. Pellentesque habitant morbi tristique senectus et netus et
			malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus
			tristique, non posuere neque iaculis. Fusce aliquet dui ut felis
			rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo
			a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
			<hr>
		<p>
			<i class="fa fa-clock-o"></i>
			<g:message code="default.timeline.post.message"	args="['Leo Silva', 'February, 8, 2014', '23:40']" />
			<g:if test="${session.user}">
				<!--<g:if test="${session?.user?.username != post?.author?.username}"></g:if> -->
				<g:if test="${false}">
					<a href="#" tooltip="true" data-toggle="tooltip" data-placement="bottom"
						title="${message(code: 'default.unfollow.parameterized.message.label', args: ['Leo Silva']) }">
					<i class="fa fa-arrow-down"></i></a>
				</g:if>
			</g:if>
		</p>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc
			placerat diam quis nisl vestibulum dignissim. In hac habitasse platea
			dictumst. Interdum et malesuada fames ac ante ipsum primis in
			faucibus. Pellentesque habitant morbi tristique senectus et netus et
			malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus
			tristique, non posuere neque iaculis. Fusce aliquet dui ut felis
			rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo
			a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
	</div>
</div>