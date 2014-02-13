package lionmessage

class Post {
	
	String message
	User author
	Date date

    static constraints = {
		message max: '140'
    }
}
