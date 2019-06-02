package com.tendu.servlet;

import com.tendu.mapper.WorkMapper;
import com.tendu.model.Work;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/WorkEditServlet")
public class WorkEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String info = request.getParameter("info");

        SqlSession session = DBTools.getSession();
        WorkMapper workMapper = session.getMapper(WorkMapper.class);
        Work work = new Work(title, info, id);

        workMapper.updateWork(work);
        session.commit();
        session.close();
        response.sendRedirect("WorkListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer user_id = Integer.parseInt(request.getParameter("id"));
        SqlSession session = DBTools.getSession();

        WorkMapper workMapper = session.getMapper(WorkMapper.class);
        List<Work> list = workMapper.queryWorkById(user_id);

        request.setAttribute("work",list.get(0));
        request.getRequestDispatcher("Work/edit.jsp").forward(request,response);

    }
}
