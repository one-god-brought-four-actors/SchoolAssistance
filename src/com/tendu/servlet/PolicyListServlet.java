package com.tendu.servlet;

import com.tendu.mapper.PolicyMapper;
import com.tendu.model.Policy;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/PolicyListServlet")
public class PolicyListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession session = DBTools.getSession();

        PolicyMapper policyMapper = session.getMapper(PolicyMapper.class);
        List<Policy> policyList = policyMapper.queryAll();
        request.setAttribute("policys", policyList);

        request.getRequestDispatcher("Policy/index.jsp").forward(request, response);
    }
}
