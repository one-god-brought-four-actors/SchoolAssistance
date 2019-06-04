package com.tendu.servlet;

import com.tendu.mapper.PolicyMapper;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@WebServlet("/PolicyDownloadServlet")
public class PolicyDownloadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        SqlSession session = DBTools.getSession();

        PolicyMapper policyMapper = session.getMapper(PolicyMapper.class);
        String fileFullName = policyMapper.queryFilePathByPolicyId(id);

        File file = new File(fileFullName);

        String filename = "";
        int index = fileFullName.lastIndexOf("/");
        filename = fileFullName.substring(index + 1);
        System.out.println(fileFullName);
        System.out.println(filename);
        filename = URLEncoder.encode(filename, "UTF-8");

        response.setHeader("Content-Disposition", "attachment; filename="+filename);
        InputStream is = new FileInputStream(file);

        OutputStream os = response.getOutputStream();
        int len = 0;
        byte[] b = new byte[1024];

        while ((len = is.read(b)) > -1) {
            os.write(b, 0, len);
        }
        is.close();
        os.close();
//        File file = new File(policyMapp)
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
