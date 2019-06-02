package com.tendu.servlet;

<<<<<<< HEAD
import com.tendu.mapper.AdverMapper;
import com.tendu.mapper.SchoolMapper;
import com.tendu.model.Adver;
=======
import com.tendu.mapper.SchoolMapper;
>>>>>>> 809ed5f5a14a73e7b8d4271f46152c50335dd788
import com.tendu.model.School;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
<<<<<<< HEAD
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
=======
>>>>>>> 809ed5f5a14a73e7b8d4271f46152c50335dd788
import java.util.List;

@WebServlet("/AdverAddServlet")
public class AdverAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
        //转码UTF-8防止中文乱码
        request.setCharacterEncoding("UTF-8");
        //获取数据
        String title = request.getParameter("title");
        Integer schId = Integer.parseInt(request.getParameter("schId"));
        String message = request.getParameter("message");
        //保存数据
        Adver adver = new Adver();
        adver.setTitle(title);
        adver.setSchool_id(schId);
        adver.setInfo(message);
        Date date = new Date();
        DateFormat df = new SimpleDateFormat();
        String createTime = df.format(date);
        adver.setCreate_time(createTime);

        //与数据库连接
        SqlSession session = DBTools.getSession();
        AdverMapper adverMapper = session.getMapper(AdverMapper.class);
        adverMapper.insertAdver(adver);
        //发送数据并关闭数据库连接
        session.commit();
        session.close();

        response.sendRedirect("AdverListServlet");
=======

>>>>>>> 809ed5f5a14a73e7b8d4271f46152c50335dd788
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession session = DBTools.getSession();
        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);
        List<School> list = schoolMapper.queryAllSchool();
        request.setAttribute("schools",list);
        session.close();
        request.getRequestDispatcher("Adver/add.jsp").forward(request, response);
    }
}
