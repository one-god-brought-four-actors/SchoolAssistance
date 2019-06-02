package com.tendu.servlet;

import com.tendu.mapper.AdverMapper;
import com.tendu.model.Adver;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DelAdverServlet")
public class DelAdverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));

        SqlSession session = DBTools.getSession();
        AdverMapper adverMapper = session.getMapper(AdverMapper.class);
        adverMapper.DelAdver(id);
        session.commit();
        session.close();

        response.sendRedirect("AdverListServlet");
    }
}
