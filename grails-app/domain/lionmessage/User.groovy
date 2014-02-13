package lionmessage

class User {
	
	String lionname
	String username
	String password
	
	
	static hasMany = [followers: User]

    static constraints = {
		lionname nullable: false, blank: false, unique: true
		username nullable: false, blank: false
		password nullable: false, blank: false, password: true
		followers nullable: true
    }
	
	@Override
	public String toString() {
		return "Lionname: $lionname Username $username" ;
	}

}
