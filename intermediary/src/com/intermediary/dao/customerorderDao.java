package com.intermediary.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.intermediary.model.Customerorder;

@Service @Transactional
public class customerorderDao {
	@Resource SessionFactory factory;
	public void addOrder(Customerorder o)throws Exception{
		Session s=factory.getCurrentSession();
		s.save(o);
	}
	
	public ArrayList<Customerorder> queryAllOrder(){
		Session s=factory.getCurrentSession();
		String hql="From Order";
		Query q=s.createQuery(hql);
		List orderList=q.list();
		return (ArrayList<Customerorder>)  orderList;
	}
	
	public void deleteOrder(Integer orderid)throws Exception{
		   Session s=factory.getCurrentSession();
		   Object order=s.load(Customerorder.class, orderid);
		   s.delete(order);
	}	
	
	public void updateOrder(Customerorder o)throws Exception{
		   Session s=factory.getCurrentSession();
		   s.update(o);
	}
    
	
    public ArrayList<Customerorder> queryCustomerorderInfo(Integer id) {	
    	Session s = factory.getCurrentSession();
    	List customerorderList;
    	String hql = "From Customerorder customerorder where 1=1";
    	if(!id.equals("")){ 	
    		hql = hql + " and customerorder.id like '%" + id + "%'";
	    	Query q = s.createQuery(hql);
	    	customerorderList = q.list();
    	}else{ 		
    		customerorderList =null;	
    	}
    	return (ArrayList<Customerorder>) customerorderList;
    }
    
    public ArrayList<Customerorder> queryCustomerorderInfo2(Integer fid) {	
    	Session s = factory.getCurrentSession();
    	List customerorderList;
    	String hql = "From Customerorder customerorder where 1=1";
    	if(!fid.equals("")){ 	
    		hql = hql + " and customerorder.fid like '%" + fid + "%'";
	    	Query q = s.createQuery(hql);
	    	customerorderList = q.list();
    	}else{ 		
    		customerorderList =null;	
    	}
    	return (ArrayList<Customerorder>) customerorderList;
    }
    
    
}
