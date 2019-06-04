package com.tendu.servlet;

import com.tendu.model.Policy;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@WebServlet("/PolicyAddServlet")
public class PolicyAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 上传目录
        String filepath = this.getServletContext().getRealPath("/WEB-INFO/upload");
        File fileFile = new File(filepath);

        // 临时文件存放位置
        String tempPath = this.getServletContext().getRealPath("/WEB-INFO/temp");
        File tempFile = new File(tempPath);

        if(!tempFile.exists()){
            tempFile.mkdirs();
        }
        if(!fileFile.exists()) {
            fileFile.mkdirs();
        }

        // 文件工厂对象
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        // 设置缓冲区, 如果超过缓冲区大小, 则会自动生成一个临时文件, 存放到临时目录中
//        factory.setSizeThreshold(1024*1024*1);      // 1M
//        // 设置临时目录
//        factory.setRepository(tempFile);
//
//        // 获取文件解析器
//        ServletFileUpload upload = new ServletFileUpload(factory);
//
//        // 设置上传文件总量的最大值
//        upload.setFileSizeMax(1024*1024*10);        // 单个文件
//        upload.setSizeMax(1024*1024*50);                        // 所有文件
//
//        try {
//            // 接续请求对象 并得到请求参数
//            List<FileItem> fileItemList = upload.parseRequest(request);
//            for(FileItem item: fileItemList){
//                if(item.isFormField()) {
//                    // 如果不是文件
//                    String title = item.getString("utf-8");
//                }else{
//                    // 如果是文件
//                    String filename = item.getName();
//                    // 获取文件类型
//                    String fileType = filename.substring(fileItemList.lastIndexOf('.'));
//                    // 文件输入流
//                    InputStream is = item.getInputStream();
//                    // 获取文件保存的名称
//                    String savePath = filepath + File.separator + filename;
//                    OutputStream os = new FileOutputStream(savePath);
//
//                    byte[] b = new byte[1024];
//                    int len = 0;
//
//                    // 每次读取 1024 个字节
//                    while ((len = is.read()) > -1) {
//                        // 每次读取 1024 个字节
//                        os.write(b, 0, len);
//                    }
//                    os.close();
//                    is.close();
//
//                    // 删除临时文件
//                    item.delete();
//                }
//
//                // 创建对象 用来保存
//                Policy policy = new Policy();
//
//
//            }
//        }catch (FileUploadException e){
//            e.printStackTrace();
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
