package lionmessage

import java.util.Date;

import grails.converters.JSON
import groovy.json.JsonBuilder
class PostController {

	def write() {
		render view: 'write', model: [post: new Post()]
	}

	def save() {
		def json = JSON.parse(params.json)
		def post = new Post()

		post.author = User.get(session.user.id)
		post.authorRepost = json.author
		post.date = new Date()
		post.message = json.message
		
		println post.author.username == post.authorRepost

		if (post.save(flush: true)) {
			refreshTimeline()
		}else {
			post.errors.allErrors.each{ println it }
		}
	}

	def generateJSON(post) {
		def json = [
			'author': post.author.username,
			'message': post.message,
			'date': post.date,
			'repost': post.repost
		]
	}
	
	def refreshTimeline() {
		def user = User.get(session.user.id)
		def posts = criteria{
			or {
				author { eq "username", user.username }
				if (user.following) {
					author {
						'in' "username", user.following.username
					}
				}
			}
			order 'date', 'desc'
			maxResults 10
		}

		render (template: "/post/post", model: [posts: posts])
	}

	def criteria = Post.createCriteria()
}
