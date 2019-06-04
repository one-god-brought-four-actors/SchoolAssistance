package com.tendu.servlet;

import com.tendu.mapper.PolicyMapper;
import com.tendu.model.Auth;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PolicyDeleteServlet")
public class PolicyDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Auth.is_login(request, response, "login.html");
        Integer id = Integer.parseInt(request.getParameter("id"));

        SqlSession session = DBTools.getSession();
        PolicyMapper policyMapper = session.getMapper(PolicyMapper.class);

        policyMapper.deleteById(id);
        session.commit();
        session.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
