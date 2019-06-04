package com.tendu.servlet;

import com.tendu.mapper.AdverMapper;
import com.tendu.model.Adver;
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
@WebServlet("/AdverIndexServlet")
public class AdverIndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 查询数据库中所有管理员的信息
        SqlSession session = DBTools.getSession();
        AdverMapper adverMapper = session.getMapper(AdverMapper.class);

        String index = request.getParameter("index");

        if(index == null || "".equals(index)){
            index = "1";
        }

        Page page = new Page();

        Integer count = adverMapper.getCountAdver();
        page.setTotalRow(count);
        page.setIndex(Integer.parseInt(index));

        List<Adver> list = adverMapper.queryByPage(page);
        System.out.println(list);

        request.setAttribute("advers", list);
        request.setAttribute("page", page);
        session.close();
        request.getRequestDispatcher("index/adverindex.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
