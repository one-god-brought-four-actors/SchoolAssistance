package com.tendu.servlet;

import com.tendu.mapper.WorkMapper;
import com.tendu.model.Auth;
import com.tendu.model.Page;
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

@WebServlet("/WorkIndexServlet")
public class WorkIndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 登陆认证
//        Auth.is_login(request, response, "login.html");
        SqlSession session = DBTools.getSession();
        WorkMapper workMapper = session.getMapper(WorkMapper.class);

        String index = request.getParameter("index");

        if(index == null || "".equals(index)){
            index = "1";
        }

        Page page = new Page();

        Integer count = workMapper.getCountWork();
        page.setTotalRow(count);
        page.setIndex(Integer.parseInt(index));

        List<Work> list = workMapper.queryByPage(page);
//        List<Work> list = workMapper.queryAllWork();
        request.setAttribute("works", list);
        request.setAttribute("page",page);
        session.close();
        request.getRequestDispatcher("index/workindex.jsp").forward(request,response);
    }
}
