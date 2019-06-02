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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/AdverEditServlet")
public class AdverEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String message = request.getParameter("message");

        Adver adver = new Adver();

        adver.setId(id);
        adver.setTitle(title);
        adver.setInfo(message);

        Date date = new Date();
        DateFormat df = new SimpleDateFormat();
        String createTime = df.format(date);
        adver.setCreate_time(createTime);

        //与数据库连接
        SqlSession session = DBTools.getSession();
        AdverMapper adverMapper = session.getMapper(AdverMapper.class);
        adverMapper.updateAdver(adver);
        //发送数据并关闭数据库连接
        session.commit();
        session.close();

        response.sendRedirect("AdverListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取需要查询的记录的ID
        Integer id = Integer.parseInt(request.getParameter("id"));
        //链接数据库并传值
        SqlSession session = DBTools.getSession();
        AdverMapper adverMapper = session.getMapper(AdverMapper.class);
        List<Adver> list = adverMapper.selectAdverById(id);
        request.setAttribute("adver",list.get(0));
        session.close();
        request.getRequestDispatcher("Adver/edit.jsp").forward(request, response);
    }
}
