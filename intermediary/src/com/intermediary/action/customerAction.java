package com.intermediary.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.intermediary.dao.customerDao;
import com.intermediary.model.Customer;
import com.opensymphony.xwork2.ActionSupport;


@Controller @Scope("prototype")
public class customerAction extends ActionSupport implements SessionAware{
	@Resource customerDao customerDao;
	private static final long serialVersionUID = 1L;
	private Customer customer;
    private Map<String,Object> session;
    private String prePage;
    private String confirmpass;
    private String flag;
    private File customerphoto;
    private String customerphotoFileName,customerphotoContentType;
    private String orginphoto;
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	/*public String reg() throws Exception{
		//System.out.println(customer.getCustomerid());
		customerDao.addCustomer(customer);
		session.put("customer", customer);
		return "show_view";	
	}*/
	public String reg() throws Exception{
		ArrayList<Customer> listCustomer=customerDao.QueryCustomerInfo2(customer.getIdentification());
		if(listCustomer.size()==0){
			this.errMessage="此用户可用。";
			System.out.print(this.errMessage);
			String pass =customer.getPassword();
			if(pass.equals(this.getConfirmpass())){
				System.out.println("确认密码一致。");
				if((this.getFlag()).equals("我是招聘方")){
					customer.setIfcustomer(1);
				}
				else{
					customer.setIfcustomer(0);
				}
		        customerDao.addCustomer(customer);
		        session.put("customer", customer);
			}else{
				System.out.println("密码必须一致。");
				return "fail";
			}
		}
		else{
			this.errMessage="此用户已被注册。";
			System.out.print(this.errMessage);
			return "fail";
		}
		return "show_view";	
	}
	
	private String errMessage;
	
	public String getErrMessage() {
		return errMessage;
	}

	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}
	
	
	public String login2(){
		ArrayList<Customer> listCustomer=customerDao.QueryCustomerInfo2(customer.getIdentification());
		if(listCustomer.size()==0) { 
			this.errMessage = " 账号不存在 ";
			System.out.print(this.errMessage);
			return "login";
		}else{
			
		    Customer db_customer = listCustomer.get(0);
			if(!db_customer.getPassword().equals(customer.getPassword())) {
				this.errMessage = " 密码不正确! ";
				System.out.print(this.errMessage);
				return "login";
			
		    }else{		
				session.put("customer", db_customer);
				return "show_view";
		    }
		}

	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getPrePage() {
		return prePage;
	}

	public void setPrePage(String prePage) {
		this.prePage = prePage;
	}

	public String getConfirmpass() {
		return confirmpass;
	}

	public void setConfirmpass(String confirmpass) {
		this.confirmpass = confirmpass;
		
	}
	public String showEdit() throws Exception {
    	customer = customerDao.getCustomerById(customer.getCustomerid());
    	System.out.println(customer.getCustomerid());
        return "customer_updatamessage";
    }
    public String editCustomer() throws Exception{
    	System.out.println("sss");
    	String path = ServletActionContext.getServletContext().getRealPath("/upload/customerp");
    	String filename = "";
    	if(customerphoto!=null){
    		System.out.println("ssss");
    		InputStream is = new FileInputStream(customerphoto);
    		String fileContentType = this.getCustomerphotoContentType();
    		System.out.println(fileContentType);
    		if(fileContentType.equals("image/jpeg") || fileContentType.equals("image/pjeg"))
    			filename = UUID.randomUUID().toString()+".jpg";
			else if(fileContentType.equals("image/gif"))
				 filename = UUID.randomUUID().toString()+".gif";
			else if(fileContentType.equals("image/png"))
				 filename = UUID.randomUUID().toString()+".png";
    		OutputStream os =new FileOutputStream(new File(path,filename));
    		byte[] b = new byte[1024];
    		System.out.println("sssss");
    		int bs = 0;
			while((bs = is.read(b))>0){
				 os.write(b,0,bs);
			}
			 is.close();
			 os.close();
			 System.out.println(filename);
    	}else{
    		System.out.println("没有图片");
    		filename = orginphoto;
    		System.out.println(filename);
    	}
    	
    	customer.setCustomerphoto(filename);
    	
    	if((this.getFlag()).equals("我是招聘方")){
			customer.setIfcustomer(1);
		}
		else{
			customer.setIfcustomer(0);
		}
        customerDao.updateCustomer(customer);
        session.put("customer", customer);
        return "main";
    }
    /*public String setif1(){
    	customer.setIf_(1);
    	return "main";
    }
    
    public String changeCustomer(){
    	customer.setIf_(0);
    	return "main";
    }*/

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public File getCustomerphoto() {
		return customerphoto;
	}

	public void setCustomerphoto(File customerphoto) {
		this.customerphoto = customerphoto;
	}

	public String getCustomerphotoFileName() {
		return customerphotoFileName;
	}

	public void setCustomerphotoFileName(String customerphotoFileName) {
		this.customerphotoFileName = customerphotoFileName;
	}


	public String getOrginphoto() {
		return orginphoto;
	}

	public void setOrginphoto(String orginphoto) {
		this.orginphoto = orginphoto;
	}

	public String getCustomerphotoContentType() {
		return customerphotoContentType;
	}

	public void setCustomerphotoContentType(String customerphotoContentType) {
		this.customerphotoContentType = customerphotoContentType;
	}


}