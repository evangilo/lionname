import lionmessage.User

class BootStrap {

    def init = { servletContext ->
		def user0 = new User(lionname: "leosilva", username: "Leo Silva", password: "123", following: [])
		def user1 = new User(lionname: "evangilo", username: "evangilo", password: "123", following: [])
		def user2 = new User(lionname: "jeff", username: "jeff", password: "321", following: [])
		user0.following.add(user1)
		user0.following.add(user2)
		user1.following.add(user0)
		user1.following.add(user2)
		//user2.following.add(user0)
		user2.following.add(user1)
		user0.save(flush: true)
		user1.save(flush: true)
		user2.save(flush: true)
    }
    def destroy = {
    }
}
