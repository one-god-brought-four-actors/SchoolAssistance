package com.tendu.servlet;

import com.tendu.mapper.SchoolMapper;
import com.tendu.model.School;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/SchoolAddServlet")
public class SchoolAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String school_name = request.getParameter("school_name");
        Integer isNeed = Integer.parseInt(request.getParameter("is_need"));
        String history = request.getParameter("history");
        Integer isGo = Integer.parseInt(request.getParameter("is_go"));
        String message = request.getParameter("message");

        SqlSession session = DBTools.getSession();
        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);
        School school = new School(school_name, isNeed, isGo);
        school.setInfo(message);
        school.setHistory(history);
        schoolMapper.insertSchool(school);
        session.commit();
        session.close();
        response.sendRedirect("SchoolListServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        request.getRequestDispatcher("School/add.jsp").forward(request, response);
    }
}
