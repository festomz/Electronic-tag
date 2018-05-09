package com.intermediary.model;

/**
 * Feedback entity. @author MyEclipse Persistence Tools
 */

public class Feedback implements java.io.Serializable {

	// Fields

	private Integer feedbackid;
	private String name;
	private String contact;
	private String sendtime;
	private String content;

	// Constructors

	/** default constructor */
	public Feedback() {
	}

	/** minimal constructor */
	public Feedback(String name, String content) {
		this.name = name;
		this.content = content;
	}

	/** full constructor */
	public Feedback(String name, String contact, String sendtime, String content) {
		this.name = name;
		this.contact = contact;
		this.sendtime = sendtime;
		this.content = content;
	}

	// Property accessors

	public Integer getFeedbackid() {
		return this.feedbackid;
	}

	public void setFeedbackid(Integer feedbackid) {
		this.feedbackid = feedbackid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getSendtime() {
		return this.sendtime;
	}

	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}