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
		def user = User.get(json.author)

		def post = new Post()

		post.author = user
		post.date = new Date()
		post.message = json.message
		post.repost = json.repost

		if (post.save(flush: true)) {
			render (template: "/post/post", model: [post: post])
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
}
