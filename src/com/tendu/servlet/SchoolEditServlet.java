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
@WebServlet("/SchoolEditServlet")
public class SchoolEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String school_name = request.getParameter("school_name");
        Integer scool_id = Integer.parseInt(request.getParameter("id"));
        Integer isNeed = Integer.parseInt(request.getParameter("is_need"));
        Integer isGo = Integer.parseInt(request.getParameter("is_go"));

        SqlSession session = DBTools.getSession();
        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);
        School school = new School(school_name, isNeed, isGo);
        school.setId(scool_id);

        schoolMapper.updateSchool(school);
        session.commit();
        session.close();
        response.sendRedirect("SchoolListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer school_id = Integer.parseInt(request.getParameter("id"));
        SqlSession session = DBTools.getSession();

        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);
        List<School> schools = schoolMapper.querySchoolNameById(school_id);
        session.close();
        request.setAttribute("school", schools.get(0));
        request.getRequestDispatcher("School/edit.jsp").forward(request, response);
    }
}
