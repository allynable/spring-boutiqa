package com.boutiqa.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="bulkemailrecipient")
public class BulkEmailRecipient {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="bulk_email_recipient_id")
    private int bulkEmailRecipientId;

    @ManyToOne
    @JoinColumn(name="bulk_email_id")
    private BulkEmail bulkEmail;

    @ManyToOne
    @JoinColumn(name="recipient_id")
    private Recipient recipient;

    public int getBulkEmailRecipientId() {
        return this.bulkEmailRecipientId;
    }

    public void setBulkEmailRecipientId(int bulkEmailRecipientId) {
        this.bulkEmailRecipientId = bulkEmailRecipientId;
    }

    public BulkEmail getBulkEmail() {
        return this.bulkEmail;
    }

    public void setBulkEmail(BulkEmail bulkEmail) {
        this.bulkEmail = bulkEmail;
    }

    public Recipient getRecipient() {
        return this.recipient;
    }

    public void setRecipient(Recipient recipient) {
        this.recipient = recipient;
    }
}
