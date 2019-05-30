package com.tendu.servlet;

import com.tendu.mapper.UserMapper;
import com.tendu.model.User;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 查询数据库中所有管理员的信息
        SqlSession session = DBTools.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        List<User> list = userMapper.queryAll();
        System.out.println(list);
        request.setAttribute("users", list);
        session.close();
        request.getRequestDispatcher("User/index.jsp").forward(request, response);
    }
}
