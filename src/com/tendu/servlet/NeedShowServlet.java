package com.tendu.servlet;

import com.tendu.mapper.NeedMapper;
import com.tendu.mapper.SchoolMapper;
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
import java.util.List;

@WebServlet("/NeedShowServlet")
public class NeedShowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id = Integer.parseInt(request.getParameter("id"));
        SqlSession session = DBTools.getSession();
        NeedMapper needMapper = session.getMapper(NeedMapper.class);
        List<Need> list = needMapper.queryById(id);
        List<Need> needList = needMapper.queryAll();


        request.setAttribute("need", list.get(0));
        request.setAttribute("needs", needList);
        session.close();
        request.getRequestDispatcher("index/needshow.jsp").forward(request, response);
    }
}
