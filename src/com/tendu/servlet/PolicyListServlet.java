package com.tendu.servlet;

import com.tendu.mapper.PolicyMapper;
import com.tendu.model.Page;
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

        String index = request.getParameter("index");

        if(index == null || "".equals(index)){
            index = "1";
        }

        PolicyMapper policyMapper = session.getMapper(PolicyMapper.class);
        Page page = new Page();

        Integer count = policyMapper.queryCountPolicy();
        page.setIndex(Integer.parseInt(index));
        page.setTotalRow(count);

        List<Policy> list = policyMapper.queryByPage(page);
        request.setAttribute("policys", list);
        request.setAttribute("page", page);

        request.getRequestDispatcher("Policy/index.jsp").forward(request, response);
    }
}
