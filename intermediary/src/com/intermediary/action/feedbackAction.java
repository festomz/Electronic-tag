package com.intermediary.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.intermediary.dao.feedbackDao;
import com.intermediary.model.Feedback;

@Controller @Scope("prototype")
public class feedbackAction {
	@Resource feedbackDao feedbackDao;
	private List<Feedback> feedbackList;
	private Feedback feedback;
	private String keyWords;
	private static final long serialVersionUID = 1L;
	
	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}
	
	public String queryFeedback() throws Exception {
		feedbackList=feedbackDao.queryAllFeedback();
        return "fe";
    }

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public List<Feedback> getFeedbackList() {
		return feedbackList;
	}

	public void setFeedbackList(List<Feedback> feedbackList) {
		this.feedbackList = feedbackList;
	}
	
	 public String addFeedback() throws Exception{
		 System.out.println("hhaa");
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String s=df.format(new Date());
		 feedback.setSendtime(s);
		 System.out.println("dd");
		 feedbackDao.addFeedback(feedback);
		 return "re";
	 }
	 
	 public String deleteFeedback() throws Exception{
		 feedbackDao.deleteFeedback(feedback.getFeedbackid());
		 return "   ";
	 }
     
	 public void updata() throws Exception{
		 feedbackDao.updateFeedback(feedback);
	 }
	 
	 
}
