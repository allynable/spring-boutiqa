package com.boutiqa.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="recipient")
public class Recipient {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="recipient_id")
	private int recipientId;
	
	@Column(name="recipient_name")
	private String recipientName;
	
	@Column(name="recipient_email")
	private String recipientEmail;

	@OneToMany(mappedBy="recipient",cascade = CascadeType.ALL,fetch=FetchType.EAGER)
	private List<BulkEmailRecipient> bulkEmailRecipient;
	
	public Recipient() {
	}

	public int getRecipientId() {
		return recipientId;
	}

	public void setRecipientId(int recipientId) {
		this.recipientId = recipientId;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientEmail() {
		return recipientEmail;
	}

	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}

	public List<BulkEmailRecipient> getBulkEmailRecipient() {
		return bulkEmailRecipient;
	}

	public void setBulkEmailRecipient(List<BulkEmailRecipient> bulkEmailRecipient) {
		this.bulkEmailRecipient = bulkEmailRecipient;
	}
}
