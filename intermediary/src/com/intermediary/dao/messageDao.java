package com.intermediary.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.intermediary.model.Message;


@Service @Transactional
public class messageDao {
	@Resource SessionFactory factory;
	public void addMessage(Message m){
		Session s=factory.getCurrentSession();
		s.save(m);		
	}
	
	public ArrayList<Message> queryAllMessage(){
		Session s=factory.getCurrentSession();
		String hql="From Message";
		Query q=s.createQuery(hql);
		List messageList=q.list();
		return (ArrayList<Message>) messageList;
	}
	
	public void deleteMessage(Integer jobid)throws Exception{
		   Session s=factory.getCurrentSession();
		   Object job=s.load(Message.class, jobid);
		   s.delete(job);
	}
	
	
	public void updateMessage(Message m)throws Exception{
		   Session s=factory.getCurrentSession();
		   s.update(m);
	}
	
	public ArrayList<Message> queryMessageInfo(String jobname) {
    	
    	Session s = factory.getCurrentSession();
    	List messageList;
    	String hql = "From Message message where 1=1";
    	if(!jobname.equals("")){ 
    		
    		hql = hql + " and message.jobname like '%" + jobname + "%'";
	    	Query q = s.createQuery(hql);
	    	messageList = q.list();
	    	
    	}else{
    		
    		messageList =queryAllMessage();	
    	
    	}
    	return (ArrayList<Message>) messageList;
    }
	/*
    public ArrayList<Message> queryMessage(String sortname) {
    	
    	Session s = factory.getCurrentSession();
    	List messageList;
    	String hql = "From Message message where 1=1";
    	if(!sortname.equals("")){ 
    		
    		hql = hql + " and message.sorts like '%" + sortname + "%'";
	    	Query q = s.createQuery(hql);
	    	messageList = q.list();
	    	
    	}else{
    		
    		messageList =queryAllMessage();	
    	
    	}
    	return (ArrayList<Message>) messageList;
    }
	*/
	public Message getMessageById(Integer jobid){
		   Session s=factory.getCurrentSession();
		   Message c=(Message)s.get(Message.class, jobid);
		   return c;
	}
	public ArrayList<Message> queryMessageInfo2(int fid) {
    	
    	Session s = factory.getCurrentSession();
    	List messageList;
    	String hql = "From Message message where 1=1";    		
    	hql = hql + " and message.fid like '%" + fid + "%'";
	    Query q = s.createQuery(hql);
	    messageList = q.list();
    	return (ArrayList<Message>) messageList;
    }

	

}
