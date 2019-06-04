package com.tendu.servlet;

import com.tendu.mapper.SchoolMapper;
import com.tendu.mapper.WorkMapper;
import com.tendu.model.Auth;
import com.tendu.model.School;
import com.tendu.model.Work;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/WorkAddServlet")
public class WorkAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 登陆认证
        Auth.is_login(request, response, "login.html");
        request.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        String info = request.getParameter("info");
        Integer school_id = Integer.parseInt(request.getParameter("school_id"));

        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String create_time = dateFormat.format(date);

        SqlSession session = DBTools.getSession();
        WorkMapper workMapper = session.getMapper(WorkMapper.class);
        Work work = new Work(title, info, school_id, create_time);
        workMapper.insertWork(work);
        session.commit();
        session.close();
        response.sendRedirect("WorkListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 登陆认证
        Auth.is_login(request, response, "login.html");
        SqlSession session = DBTools.getSession();
        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);

        List<School> list = schoolMapper.queryAllSchool();
        request.setAttribute("schoolList", list);
        request.getRequestDispatcher("Work/add.jsp").forward(request, response);
    }
}
