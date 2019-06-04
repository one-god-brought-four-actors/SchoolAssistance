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

@WebServlet ("/AdverShowServlet")
public class AdverShowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        //链接数据库并传值
        SqlSession session = DBTools.getSession();
        AdverMapper adverMapper = session.getMapper(AdverMapper.class);
        List<Adver> list = adverMapper.selectAdverById(id);
        List<Adver> All = adverMapper.queryAllAdver();
        request.setAttribute("adver",list.get(0));
        request.setAttribute("alladvers",All);
        session.close();
        request.getRequestDispatcher("index/advershow.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
