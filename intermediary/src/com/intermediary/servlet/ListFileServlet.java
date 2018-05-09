package com.intermediary.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
* @ClassName: ListFileServlet
* @Description: 列出Web系统中所有下载文件
* @author: 孤傲苍狼
* @date: 2015-1-4 下午9:54:40
*
*/ 
public class ListFileServlet extends HttpServlet {
	String value;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	// 使用Apache文件上传组件处理文件上传步骤：
        // 1.创建一个DiskFileItemFactory工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 2.创建一个文件上传解析器
        ServletFileUpload upload = new ServletFileUpload(factory);
         // 监听文件上传进度
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 按照传统方式获取数据
            return;
        }
        List items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Iterator itr = items.iterator();
      //获取上传文件的目录
        String uploadFilePath = this.getServletContext().getRealPath("/WEB-INF/upload");
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            // 如果fileitem中封装的是普通的输入想数据
            if (item.isFormField()) {
                String name = item.getFieldName();
                // 解决普通输入项数据中文乱码问题
                value = item.getString("UTF-8");
                uploadFilePath+=("/"+value);
            }
        }
        
        
        Map<String,String> fileNameMap = new HashMap<String,String>();
        listfile(new File(uploadFilePath),fileNameMap);//File既可以代表一个文件也可以代表一个目录
        //将Map集合发送到listFile.jsp页面进行显示
        request.setAttribute("fileNameMap", fileNameMap);
        request.getRequestDispatcher("/listFile.jsp").forward(request, response);
        
        String data =value;
        HttpSession session=request.getSession();
        session.setAttribute("username", data);  
        //request.getRequestDispatcher("/download").forward(request, response);
    }
    
    /**
    * @Method: listfile
    * @Description: 递归遍历指定目录下的所有文件
    * @Anthor:孤傲苍狼
    * @param file 即代表一个文件，也代表一个文件目录
    * @param map 存储文件名的Map集合
    */ 
    public void listfile(File file,Map<String,String> map){
        //如果file代表的不是一个文件，而是一个目录
        if(!file.isFile()){
            //列出该目录下的所有文件和目录
        	 File files[] = file.listFiles();
        	 if(files == null) return;
        	 // 遍历files[]数组
             for (File f : files) {
            	 // 递归
        	     listfile(f, map);
        	 }
        }else{
            /**
             * 处理文件名，上传后的文件是以uuid_文件名的形式去重新命名的，去除文件名的uuid_部分
                file.getName().indexOf("_")检索字符串中第一次出现"_"字符的位置，如果文件名类似于：9349249849-88343-8344_阿_凡_达.avi
                那么file.getName().substring(file.getName().indexOf("_")+1)处理之后就可以得到阿_凡_达.avi部分
             */
            String realName = file.getName().substring(file.getName().indexOf("_")+1);
            //file.getName()得到的是文件的原始名称，这个名称是唯一的，因此可以作为key，realName是处理过后的名称，有可能会重复
            map.put(file.getName(), realName);
        }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
        String data =value;
        HttpSession session=request.getSession();
        session.setAttribute("username", data);  
    }
}