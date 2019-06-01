package com.tendu.servlet;

import com.tendu.mapper.SchoolMapper;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/DeleteSchoolServlet")
public class DeleteSchoolServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession session = DBTools.getSession();
        Integer school_id = Integer.parseInt(request.getParameter("id"));

        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);

        schoolMapper.deleteSchoolById(school_id);
        session.commit();

        session.close();
    }
}
