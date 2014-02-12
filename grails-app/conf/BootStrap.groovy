import lionmessage.User

class BootStrap {

    def init = { servletContext ->
		def user0 = new User(lionname: "leosilva", username: "Leo Silva", password: "123")
		def user1 = new User(lionname: "evangilo", username: "evangilo", password: "123")
		def user2 = new User(lionname: "jeff", username: "jeff", password: "321")
		user0.save(flush: true)
		user1.save(flush: true)
		user2.save(flush: true)
    }
    def destroy = {
    }
}
