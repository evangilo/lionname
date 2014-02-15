package lionmessage

class Post {
	
	String message
	User author
	Date date
	boolean repost

    static constraints = {
		message maxLength: '140'
    }
}
