package com.intermediary.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.intermediary.model.Feedback;
import com.intermediary.model.Message;


@Service @Transactional
public class feedbackDao {
@Resource SessionFactory factory;
	
	public void addFeedback(Feedback f)throws Exception{
		Session s=factory.getCurrentSession();
		s.save(f);	
	}
	
	public Feedback getFeedbackByName(String name){
		   Session s=factory.getCurrentSession();
		   Feedback f=(Feedback)s.get(Feedback.class, name);
		   return f;
	}
	
	public Feedback getFeedbackById(Integer feedbackid){
		   Session s=factory.getCurrentSession();
		   Feedback f=(Feedback)s.get(Feedback.class, feedbackid);
		   return f;
	}
	
	public void deleteFeedback(Integer feedbackid)throws Exception{
		   Session s=factory.getCurrentSession();
		   Object feedback=s.load(Feedback.class, feedbackid);
		   s.delete(feedback);
	}
	
	public void updateFeedback(Feedback f)throws Exception{
		   Session s=factory.getCurrentSession();
		   s.update(f);
	}
	
	public ArrayList<Feedback> queryAllFeedback(){
		Session s=factory.getCurrentSession();
		String hql="From Feedback";
		Query q=s.createQuery(hql);
		List feedbackList=q.list();
		return (ArrayList<Feedback>) feedbackList;
	}
	
	public ArrayList<Feedback> QueryFeedbackInfo(String name) {
	    	
	    	Session s = factory.getCurrentSession();
	    	List feedbackList;
	    	String hql = "From Feedback feedback where 1=1";
	    	if(!name.equals("")){ 
	    		
	    		hql = hql + " and feedback.name like '%" + name + "%'";
		    	Query q = s.createQuery(hql);
		    	feedbackList = q.list();
	    	}else{
	    	    feedbackList =null;	   	
	    	}
	    	return (ArrayList<Feedback>) feedbackList;
	}
	

}
