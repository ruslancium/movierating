package name.ruslan.rating.dbentity;

import java.util.Date;

public class User extends Entity {
	
	/**
     * User login - represented in primary key
     */ 
	private String login;
	
    /**
     * User email
     */
    private String email; 
    
    /**
     * User password
     */ 
    private String password;    
	
    /**
     * Registration date
     */ 
    
    private Date registrationDate;
    
    /**
     * User location country
     */
    private String country;

    /**
     * User birth date
     */
    private Date birthDate;
 
    /**
     * User rating
     */
    private double rating;
    
    
    /**
     * User role (admin/user)
     */
    private String role;
    

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}    
    
}
