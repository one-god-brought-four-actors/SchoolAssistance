package com.tendu.servlet;

import com.tendu.mapper.NeedMapper;
import com.tendu.mapper.SchoolMapper;
import com.tendu.model.Auth;
import com.tendu.model.Need;
import com.tendu.model.School;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/NeedEditServlet")
public class NeedEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Auth.is_login(request, response, "login.html");
        request.setCharacterEncoding("utf-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        Integer risk_level = Integer.parseInt(request.getParameter("level"));
        Integer school_id = Integer.parseInt(request.getParameter("schId"));
        String info = request.getParameter("info");


        Need need = new Need();
        need.setId(id);
        need.setTitle(title);
        need.setRisk_level(risk_level);
        need.setSchool_id(school_id);
        need.setInfo(info);

        SqlSession session = DBTools.getSession();
        NeedMapper needMapper = session.getMapper(NeedMapper.class);
        needMapper.update(need);

        session.commit();
        session.close();
        response.sendRedirect("NeedListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Auth.is_login(request, response, "login.html");
        Integer id = Integer.parseInt(request.getParameter("id"));
        SqlSession session = DBTools.getSession();
        NeedMapper needMapper = session.getMapper(NeedMapper.class);
        List<Need> list = needMapper.queryById(id);

        SqlSession session2 = DBTools.getSession();
        SchoolMapper schoolMapper = session2.getMapper(SchoolMapper.class);
        List<School> list2 = schoolMapper.queryAllSchool();


        request.setAttribute("need", list.get(0));
        request.setAttribute("schools",list2);
        session.close();
        request.getRequestDispatcher("Need/edit.jsp").forward(request, response);
    }
}
