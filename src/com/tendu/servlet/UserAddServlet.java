package com.tendu.servlet;

import com.tendu.mapper.SchoolMapper;
import com.tendu.mapper.UserMapper;
import com.tendu.model.School;
import com.tendu.model.User;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@WebServlet("/UserAddServlet")
public class UserAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Integer school_id = Integer.parseInt(request.getParameter("school_id"));
        String phone = request.getParameter("phone");
        Integer level = Integer.parseInt(request.getParameter("level"));

        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String create_time = dateFormat.format(date);

        User user = new User(username, password, school_id, phone, level, create_time);
        SqlSession session = DBTools.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        userMapper.insertUser(user);
        session.commit();
        session.close();
//        request.getRequestDispatcher("UserListServlet").forward(request, response);
        response.sendRedirect("UserListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        SqlSession session = DBTools.getSession();

        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);
        List<School> schoolList = schoolMapper.queryAllSchool();
        request.setAttribute("schoolList", schoolList);
        request.getRequestDispatcher("User/add.jsp").forward(request, response);
    }
}
