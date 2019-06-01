package com.tendu.servlet;

import com.tendu.mapper.UserMapper;
import com.tendu.model.User;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession session = DBTools.getSession();
        Integer user_id = Integer.parseInt(request.getParameter("id"));

        UserMapper userMapper = session.getMapper(UserMapper.class);

        userMapper.deleteUser(user_id);
        session.commit();

    }
}
