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
import java.util.List;

@WebServlet("/AdverInfoServlet")
public class AdverInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取需要查询的记录的ID
        Integer id = Integer.parseInt(request.getParameter("id"));
        Integer hits = Integer.parseInt(request.getParameter("readNum"));

        Adver adver = new Adver();
        adver.setId(id);
        adver.setHits(hits);
        //链接数据库并传值
        SqlSession session = DBTools.getSession();
        AdverMapper adverMapper = session.getMapper(AdverMapper.class);
        adverMapper.updateReadNum(adver);

        session.commit();
        session.close();
        response.sendRedirect("AdverListServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        //链接数据库并传值
        SqlSession session = DBTools.getSession();
        AdverMapper adverMapper = session.getMapper(AdverMapper.class);
        List<Adver> list = adverMapper.selectAdverById(id);
        request.setAttribute("adver",list.get(0));
        session.close();
        request.getRequestDispatcher("Adver/show.jsp").forward(request, response);
    }
}
