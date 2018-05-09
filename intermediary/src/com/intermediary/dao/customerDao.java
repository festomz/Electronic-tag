package com.intermediary.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.intermediary.model.Customer;


@Service @Transactional
public class customerDao {
	@Resource SessionFactory factory;
	
	public void addCustomer(Customer c)throws Exception{
		Session s=factory.getCurrentSession();
		s.save(c);	
	}
	
	public Customer getCustomerByName(String name){
		   Session s=factory.getCurrentSession();
		   Customer c=(Customer)s.get(Customer.class, name);
		   return c;
	}
	
	public Customer getCustomerById(Integer customerid){
		   Session s=factory.getCurrentSession();
		   Customer c=(Customer)s.get(Customer.class, customerid);
		   return c;
	}
	
	public void deleteCustomer(Integer customerid)throws Exception{
		   Session s=factory.getCurrentSession();
		   Object customer=s.load(Customer.class, customerid);
		   s.delete(customer);
	}
	
	public void updateCustomer(Customer c)throws Exception{
		   Session s=factory.getCurrentSession();
		   s.update(c);
	}
	
	
	public ArrayList<Customer> QueryCustomerInfo(String name) {
	    	
	    	Session s = factory.getCurrentSession();
	    	List customerList;
	    	String hql = "From Customer customer where 1=1";
	    	if(!name.equals("")){ 
	    		
	    		hql = hql + " and customer.name like '%" + name + "%'";
		    	Query q = s.createQuery(hql);
		    	customerList = q.list();
	    	}else{
	    	    customerList =null;	   	
	    	}
	    	return (ArrayList<Customer>) customerList;
	}
	public ArrayList<Customer> QueryCustomerInfo2(String idf){
		Session s = factory.getCurrentSession();
    	List customerList;
    	String hql = "From Customer customer where 1=1";
    	if(!idf.equals("")){ 
    		hql = hql + " and customer.identification like '%" + idf + "%'";
	    	Query q = s.createQuery(hql);
	    	customerList = q.list();
    	}else{
    	    customerList =null;	   	
    	}
    	return (ArrayList<Customer>) customerList;
	}
}
