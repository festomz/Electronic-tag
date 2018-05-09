package com.intermediary.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.intermediary.model.Customer;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptors extends AbstractInterceptor{
	private String sessionName;
	private String excludeName;
	private static final long serialVersionUID = 1L;
	private List <String>list;
	public List<String> strlist(String str){
		String[] s=str.split(",");
		List <String> list=new ArrayList <String>();
		for(String ss : s){
			list.add(ss.trim());
			
		}
		return list;
	}
	
	public void init(){
		list=strlist(excludeName);
	}
	
	public String intercept(ActionInvocation invocation)throws Exception{
		System.out.println("----进入拦截器----");
		String actionName=invocation.getProxy().getActionName();
		Map<String,Object> session=invocation.getInvocationContext().getSession();
		
		if(list.contains(actionName)){
			System.out.println(actionName+"没有拦截");
			return invocation.invoke();
			
		}else{
			System.out.println(actionName+"被拦截");
			
			Customer customer=(Customer) session.get(sessionName);
			
			if(customer==null){
				HttpServletRequest req=ServletActionContext.getRequest();
				
				String path=req.getRequestURI().replaceAll("/intermediary", "");
				
				session.put("prePage", path);
				return "login";
			}else{
				return invocation.invoke();
			}
		}
	}

	public String getSessionName() {
		return sessionName;
	}

	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}

	public String getExcludeName() {
		return excludeName;
	}

	public void setExcludeName(String excludeName) {
		this.excludeName = excludeName;
	}

	public List<String> getList() {
		return list;
	}

	public void setList(List<String> list) {
		this.list = list;
	}

}
