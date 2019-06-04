package com.tendu.servlet;

import com.tendu.mapper.WorkMapper;
import com.tendu.model.Auth;
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

@WebServlet("/WorkShowServlet")
public class WorkShowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 登陆认证
//        Auth.is_login(request, response, "login.html");

        Integer id = Integer.parseInt(request.getParameter("id"));
        SqlSession session = DBTools.getSession();

        WorkMapper workMapper = session.getMapper(WorkMapper.class);
        List<Work> list = workMapper.queryWorkById(id);
        request.setAttribute("work",list.get(0));
        session.close();
        request.getRequestDispatcher("index/workshow.jsp").forward(request,response);
    }
}
