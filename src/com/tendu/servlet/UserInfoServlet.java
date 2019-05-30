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

public class UserInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer user_id = Integer.parseInt(request.getParameter("id"));
        SqlSession session = DBTools.getSession();

        UserMapper userMapper = session.getMapper(UserMapper.class);
        List<User> list = userMapper.queryUserById(user_id);

        request.setAttribute("user", list.get(0));
        session.close();
        request.getRequestDispatcher("User/show.jsp").forward(request, response);
    }
}
