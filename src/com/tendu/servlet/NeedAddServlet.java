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

@WebServlet("/NeedAddServlet")
public class NeedAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Auth.is_login(request, response, "login.html");
        request.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        Integer risk_level = Integer.parseInt(request.getParameter("level"));
        Integer school_id = Integer.parseInt(request.getParameter("schId"));
        String info = request.getParameter("info");

        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String create_time = dateFormat.format(date);

        Need need = new Need();
        need.setTitle(title);
        need.setRisk_level(risk_level);
        need.setSchool_id(school_id);
        need.setInfo(info);
        need.setCreate_time(create_time);

        SqlSession session = DBTools.getSession();
        NeedMapper needMapper = session.getMapper(NeedMapper.class);
        needMapper.insert(need);

        session.commit();
        session.close();
        response.sendRedirect("NeedListServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Auth.is_login(request, response, "login.html");
        request.setCharacterEncoding("utf-8");

        SqlSession session = DBTools.getSession();

        SchoolMapper schoolMapper = session.getMapper(SchoolMapper.class);
        List<School> schoolList = schoolMapper.queryAllSchool();
        request.setAttribute("schools", schoolList);
        request.getRequestDispatcher("Need/add.jsp").forward(request, response);
    }
}
