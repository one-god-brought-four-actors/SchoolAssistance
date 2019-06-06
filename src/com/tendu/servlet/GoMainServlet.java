package com.tendu.servlet;

import com.tendu.mapper.AdverMapper;
import com.tendu.mapper.NeedMapper;
import com.tendu.mapper.WorkMapper;
import com.tendu.model.Adver;
import com.tendu.model.Need;
import com.tendu.utils.DBTools;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/GoMainServlet")
public class GoMainServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession session = DBTools.getSession();

        NeedMapper needMapper = session.getMapper(NeedMapper.class);
        AdverMapper adverMapper = session.getMapper(AdverMapper.class);


        List<Need> needList = needMapper.queryLot();
        List<Adver> adverList = adverMapper.queryLot();

        request.setAttribute("needs",needList);
        request.setAttribute("advers",adverList);
        session.close();
        request.getRequestDispatcher("main.jsp").forward(request,response);
    }
}
