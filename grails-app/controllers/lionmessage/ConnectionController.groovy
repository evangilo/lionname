package lionmessage

class ConnectionController {

	def listConnections() {
		def users = User.list()
		def user = User.get(session.user.id)

		def following = user.following
		render template: 'connect', model:[users:users, following:following]
	}
}
