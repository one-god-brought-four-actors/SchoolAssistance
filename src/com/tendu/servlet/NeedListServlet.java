package com.tendu.servlet;


import com.tendu.mapper.NeedMapper;
import com.tendu.model.Need;
import com.tendu.model.Page;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/NeedListServlet")
public class NeedListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 查询数据库中所有需求的信息
        SqlSession session = DBTools.getSession();
        NeedMapper needMapper = session.getMapper(NeedMapper.class);
        String index = request.getParameter("index");

        if(index == null || "".equals(index)){
            index = "1";
        }

        Page page = new Page();
        Integer count = needMapper.getCountNeed();
        page.setTotalRow(count);
        page.setIndex(Integer.parseInt(index));

        List<Need> list = needMapper.queryByPage(page);
        request.setAttribute("needs", list);
        request.setAttribute("page", page);
        session.close();
        request.getRequestDispatcher("Need/index.jsp").forward(request, response);
    }
}
