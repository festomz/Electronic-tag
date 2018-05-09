package com.intermediary.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.intermediary.dao.messageDao;
import com.intermediary.model.Message;
import com.opensymphony.xwork2.ActionSupport;
@Controller @Scope("prototype")
public class messageAction extends ActionSupport{
	@Resource messageDao messageDao;
	private List<Message> messageList;
	private Message message;
	private String keyWords;
	String sortname;
	private File uploadFile;
	private String uploadFileFileName,uploadFileContentType;
	private static final long serialVersionUID = 1L;
	
	public String getAll(){
		messageList=messageDao.queryAllMessage();
		return "ccc";
	}
	

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
	
	public String queryMessage() throws Exception {
		messageList=messageDao.queryMessageInfo(keyWords);
        return "show_view";
    }
	
	public String sortMessage() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String boxStr[]=request.getParameterValues("box");
		messageList=messageDao.queryAllMessage();
		int t;
		for(int i=0;i<messageList.size();i++){
			if(boxStr==null)break;
			Message m= messageList.get(i);
			t = 0;
			for(int j=0;j<boxStr.length;j++){
				if(boxStr[j].equals(m.getSorts())){
					t++;
				}
			}
			if(t==0){
				messageList.remove(i);
				i--;
			}
	    }
		return "show_view";
    }
    
	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}
	
	 public String getComMessage() throws Exception{
	        message=messageDao.getMessageById(message.getJobid());
	        return "one";
	 }
	 public String getComMessage2() throws Exception{
	        message=messageDao.getMessageById(message.getJobid());
	        return "two";
	 }
	 public String addComMessage2(){
		 messageDao.addMessage(message);
		 return "success";
	 }
	 
	 public String addComMessage() throws Exception{
		 String path = ServletActionContext.getServletContext().getRealPath("/upload");
		 String companyphotoFileName = "";
		 if(uploadFile!=null){
			 InputStream is = new FileInputStream(uploadFile);
			 String fileContentType = this.getUploadFileContentType();
			 System.out.println(fileContentType);
			 if(fileContentType.equals("image/jpeg") || fileContentType.equals("image/pjeg"))
				 companyphotoFileName = UUID.randomUUID().toString()+".jpg";
			 else if(fileContentType.equals("image/gif"))
				 companyphotoFileName = UUID.randomUUID().toString()+".gif";
			 else if(fileContentType.equals("image/png"))
				 companyphotoFileName = UUID.randomUUID().toString()+".png";
			 File file = new File(path,companyphotoFileName);
			 OutputStream os = new FileOutputStream(file);
			 byte[] b = new byte[1024];
			 int bs = 0;
			 while((bs = is.read(b))>0){
				 os.write(b,0,bs);
			 }
			 is.close();
			 os.close();
		 }
		 message.setCompanyphoto(companyphotoFileName);
		 messageDao.addMessage(message);
		 System.out.println("hh");
		 return "success";
	 }
	 
	 
	 
	 public String deleteComMessage() throws Exception{
		 messageDao.deleteMessage(message.getJobid());
		 return "success";
	 }
     
	  
	 public String editMessage()  throws Exception{
		 messageDao.updateMessage(message);
		 return "success";
	 }
	 
	 public void updata() throws Exception{
		 messageDao.updateMessage(message);
	 }
	 
	 public String fwork(){
		 System.out.println(message.getFid());
		 messageList=messageDao.queryMessageInfo2(message.getFid());
		 return "fwork";
	 }


	public File getUploadFile() {
		return uploadFile;
	}


	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}


	public String getUploadFileFileName() {
		return uploadFileFileName;
	}


	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}


	public String getUploadFileContentType() {
		return uploadFileContentType;
	}


	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}


	public String getSortname() {
		return sortname;
	}


	public void setSortname(String sortname) {
		this.sortname = sortname;
	}

}
