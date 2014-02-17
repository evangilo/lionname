package lionmessage

import grails.converters.JSON
import groovy.json.JsonBuilder

class UserController {
	
	def preLogin() {
		render view: '/login', model: [user: new User()]
	}
	
	def login() {
		def json = JSON.parse(params.json)
		def user = User.findByLionname(json.lionname)
		if (user) {
			if (user.password == json.password) {
				session.user = user
				render status: 200, text: g.message(code: 'login.success.message')
			} else {
				def jsonBuilder = new JsonBuilder()
				def returnJson = jsonBuilder {
					message g.message(code: 'wrong.password.message')
					field json.keys()[1]
				}
				render status: 500, text: (returnJson as JSON)
			}
		} else {
			def jsonBuilder = new JsonBuilder()
			def returnJson = jsonBuilder {
				message g.message(code: 'user.not.found.message')
				field json.keys()[0]
			}
			render status: 500, text: (returnJson as JSON)
		}
	}
	
	def logout() {
		session.user = null
		redirect uri: '/'
	}
	
	def editProfile() {
		def user = User.findByLionname(session?.user?.lionname)
		render template: 'editProfile', model: [user: user]
	}
	
	def edit() {
		def json = JSON.parse(params.json)
		def user = User.get(json.id)
        user.properties = json

        if (user.save(flush: true)) {
        	session.user.properties = json
			def jsonBuilder = new JsonBuilder()
			def returnJson = jsonBuilder {
				message g.message(code: 'default.registry.updated.success')
				headerPage g.render(template: '/shared/header')
			}
            render returnJson as JSON
        } else {
        	render status: 500, text: g.message(code: 'default.registry.updated.error')
        }
	}
	
	def createAccount() {
		def user = new User();
		render view: 'createAccount', model: [user: user]
	}
	
	def save() {
		def json = JSON.parse(params.json)
		def user = new User(json)

		if (user.save(flush: true)) {
			def link = g.createLink(action: 'preLogin')
			def message = "${message(code: 'default.registry.created.success')}. ${message(code: 'default.create.account.success', args: [link])}"
			render message
		} else {
			render status: 500, text: g.message(code: 'default.registry.created.error')
		}
	}
	
	def verifyUniqueLionname() {
		def user = User.findByLionname(params.lionname)
		if (user) {
			render status: 500, text: g.message(code: 'user.lionname.exists', args: [params.lionname])
		} else {
			render status: 200
		}	
	}

	def follow(){
		def follower = User.get(session.user.id)
		def user = User.get(params.id)
		follower.following.add(user)
		
		follower.save(flush: true)
		def jsonBuilder = new JsonBuilder()
		def returnJson = jsonBuilder {
			lionname user.lionname
			id user.id
		}
		render returnJson as JSON
	}

	def findFriends(){
		def users = User.findAllByLionname(params.lionname)
		def jsonBuilder = new JsonBuilder()
		def returnJson = jsonBuilder {
			users.each({
				id it.id
				lionname it.lionname
			})
		}

		render returnJson as JSON
		//render users
	}
	def unfollow(){
		def user = User.get(params.id)
		def follower = User.get(session.user.id)
		follower.following.remove(user)
		render status:200
	}
}
