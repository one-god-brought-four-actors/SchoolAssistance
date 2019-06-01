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
@WebServlet("/SchoolListServlet")
public class SchoolListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession session = DBTools.getSession();
        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);

        List<School> list = schoolMapper.queryAllSchool();
        request.setAttribute("schoolList", list);
        request.getRequestDispatcher("School/index.jsp").forward(request, response);
    }
}
