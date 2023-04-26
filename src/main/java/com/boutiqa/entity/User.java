package com.boutiqa.entity;

import java.sql.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private int userId;
	
	@ManyToOne
	@JoinColumn(name="user_type_id")
	private UserType userType;
	
	@Column(name="first_name")
	private String firstName; 
	
	@Column(name="last_name")
	private String lastName;
	
	private String email;
	private String username;
	private String password;
	
	@Transient
	private String confirmPassword;
	
	@Transient
	private String newPassword;
	
	@Transient
	private String role;

	@Column(name="phone_number")
	private String phoneNumber;
	
	@Column(name="date_of_birth")
	private Date dateOfBirth;
	
	private String gender;
	
	@Column(name="created_at")
	private String createdAt;
	
	@OneToOne(mappedBy="user", cascade = CascadeType.ALL)
	private Admin admin;
	
	@OneToOne(mappedBy="user", cascade = CascadeType.ALL)
	private Consumer consumer;
	
	@OneToOne(mappedBy="user", cascade = CascadeType.ALL)
	private Seller seller;
	
	public User() {
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public User(UserType userType, String firstName, String lastName, String email, String username, String password,
			String confirmPassword, String phoneNumber, Date dateOfBirth, String gender, String createdAt, Admin admin,
			Consumer consumer, Seller seller) {
		super();
		this.userType = userType;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.username = username;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.phoneNumber = phoneNumber;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.createdAt = createdAt;
		this.admin = admin;
		this.consumer = consumer;
		this.seller = seller;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Consumer getConsumer() {
		return consumer;
	}

	public void setConsumer(Consumer consumer) {
		this.consumer = consumer;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userType=" + userType + ", firstName=" + firstName + ", lastName="
				+ lastName + ", email=" + email + ", username=" + username + ", password=" + password
				+ ", confirmPassword=" + confirmPassword + ", newPassword=" + newPassword + ", role=" + role
				+ ", phoneNumber=" + phoneNumber + ", dateOfBirth=" + dateOfBirth + ", gender=" + gender
				+ ", createdAt=" + createdAt + ", admin=" + admin + ", consumer=" + consumer + ", seller=" + seller
				+ "]";
	}
}
