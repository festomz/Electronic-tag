package com.intermediary.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.intermediary.dao.customerDao;
import com.intermediary.model.Customer;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class mainAction extends ActionSupport implements SessionAware{
	@Resource customerDao customerDao;
	private Customer customer;
	private Map<String,Object> session;
	private static final long serialVersionUID = 1L;
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String re(){
		System.out.println("hhaa");
		session.remove("customer");
		return "re";
	}

}
