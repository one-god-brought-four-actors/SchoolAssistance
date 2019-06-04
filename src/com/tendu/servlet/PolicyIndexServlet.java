package com.tendu.servlet;

import com.tendu.mapper.AdverMapper;
import com.tendu.mapper.PolicyMapper;
import com.tendu.model.Adver;
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

@WebServlet("/PolicyIndexServlet")
public class PolicyIndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession session = DBTools.getSession();
        PolicyMapper policyMapper = session.getMapper(PolicyMapper.class);

        String index = request.getParameter("index");

        if(index == null || "".equals(index)){
            index = "1";
        }

        Page page = new Page();
        Integer count = policyMapper.queryCountPolicy();

        page.setTotalRow(count);
        page.setIndex(Integer.parseInt(index));
//
        List<Policy> list = policyMapper.queryByPage(page);
        request.setAttribute("policys", list);
        request.setAttribute("page", page);
        session.close();
        request.getRequestDispatcher("index/policyindex.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
