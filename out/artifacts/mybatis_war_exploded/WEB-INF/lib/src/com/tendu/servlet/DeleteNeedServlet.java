package com.tendu.servlet;

import com.tendu.mapper.NeedMapper;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteNeedServlet")
public class DeleteNeedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        SqlSession session = DBTools.getSession();
        NeedMapper needMapper = session.getMapper(NeedMapper.class);
        needMapper.deleteNeedById(id);
        session.commit();
        session.close();
        response.sendRedirect("NeedListServlet");
    }
}
