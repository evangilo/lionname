package lionmessage

class Post {
	
	String message
	User author
	String authorRepost
	Date date
	
    static constraints = {
		message maxLength: '140'
    }
}
