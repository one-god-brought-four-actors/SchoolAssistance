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
import java.util.List;
@WebServlet("/UserEditServlet")
public class UserEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer user_id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        Integer level = Integer.parseInt(request.getParameter("level"));

        User user = new User(username, password, phone, level);
        user.setId(user_id);
        SqlSession session = DBTools.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        userMapper.updateUser(user);
        session.commit();
        session.close();
        response.sendRedirect("UserListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer user_id = Integer.parseInt(request.getParameter("id"));
        SqlSession session = DBTools.getSession();

        UserMapper userMapper = session.getMapper(UserMapper.class);
        List<User> list = userMapper.queryUserById(user_id);

        request.setAttribute("user", list.get(0));
        request.getRequestDispatcher("User/edit.jsp").forward(request, response);
    }
}
