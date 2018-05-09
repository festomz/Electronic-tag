package com.intermediary.action;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.intermediary.dao.customerorderDao;
import com.intermediary.model.Customerorder;
import com.intermediary.model.Message;
import com.opensymphony.xwork2.ActionSupport;
@Controller @Scope("prototype")
public class customerorderAction extends ActionSupport {
	@Resource customerorderDao customerorderDao;
	private Customerorder customerorder;
	private Message message;
	private static final long serialVersionUID = 1L;
	private int key;
	private List<Customerorder> customerorderList;
	public String wantOrder() throws Exception{
	/*	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s=df.format(new Date());*/
		customerorder.setTime("得到的");	
		customerorderDao.addOrder(customerorder);
		System.out.println(customerorder.getTime());
		return "success2";
	}
	public int getcid(){
		return customerorder.getId();
	}

	public String editOrder(){
		customerorderList = customerorderDao.queryCustomerorderInfo(key);
		/*if(customerorderList.size()==0){	
			customerorder = null;
		}else{
		    customerorder = customerorderList.get(0);
		}*/
		return "ed";
	}
	
	public String editOrder2(){
		customerorderList = customerorderDao.queryCustomerorderInfo2(key);
		return "ed";
	}
	public String deleteyourorder() throws Exception{
		customerorderDao.deleteOrder(key);
		return "success3";
	}
	public String updataorder() throws Exception{
		customerorderDao.updateOrder(customerorder);
		return "success1";
	}

	public Customerorder getCustomerorder(){
		return customerorder;
	}

	public void setCustomerorder(Customerorder customerorder) {
		this.customerorder = customerorder;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public List<Customerorder> getCustomerorderList() {
		return customerorderList;
	}

	public void setCustomerorderList(List<Customerorder> customerorderList) {
		this.customerorderList = customerorderList;
	}
}
