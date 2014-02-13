package lionmessage

import java.util.Date;

class PostController {

    def write() {
		render view: 'write', model: [post: new Post()]
	}
	
	def save() {
		/*def json = JSON.parse(params.json)
		def post = new Post(json)
		
		if (user.save(flush: true)) {
			def link = g.createLink(action: 'prePost')
			def message = "postagem realizada!"
			render message
		} else {
		render status: 500, text: g.message(code: 'default.registry.created.error')
		}*/
		
		render "xxxx"
	}
}
