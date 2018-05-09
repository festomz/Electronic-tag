package com.intermediary.model;

/**
 * Customerorder entity. @author MyEclipse Persistence Tools
 */

public class Customerorder implements java.io.Serializable {

	// Fields

	private Integer orderid;
	private Integer jobid;
	private Integer id;
	private String time;
	private String resume;
	private Integer fid;
	private String retime;

	// Constructors

	/** default constructor */
	public Customerorder() {
	}

	/** full constructor */
	public Customerorder(Integer jobid, Integer id, String time, String resume,
			Integer fid, String retime) {
		this.jobid = jobid;
		this.id = id;
		this.time = time;
		this.resume = resume;
		this.fid = fid;
		this.retime = retime;
	}

	// Property accessors

	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getJobid() {
		return this.jobid;
	}

	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getResume() {
		return this.resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public Integer getFid() {
		return this.fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public String getRetime() {
		return this.retime;
	}

	public void setRetime(String retime) {
		this.retime = retime;
	}

}