package com.boutiqa.entity;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="bulkemail")
public class BulkEmail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="bulk_email_id")
	private int bulkEmailId;
	
	@ManyToOne
	@JoinColumn(name="admin_id")
	private Admin admin;

	@OneToMany(mappedBy="bulkEmail", cascade = CascadeType.ALL,fetch=FetchType.EAGER)
	private List<BulkEmailRecipient> bulkEmailRecipient;
	
	private String subject;
	private String message;
	private String timestamp;
	
	public int getBulkEmailId() {
		return bulkEmailId;
	}
	public void setBulkEmailId(int bulkEmailId) {
		this.bulkEmailId = bulkEmailId;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public List<BulkEmailRecipient> getBulkEmailRecipient() {
		return bulkEmailRecipient;
	}
	public void setBulkEmailRecipient(List<BulkEmailRecipient> bulkEmailRecipient) {
		this.bulkEmailRecipient = bulkEmailRecipient;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
}
