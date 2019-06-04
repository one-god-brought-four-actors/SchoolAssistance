package com.tendu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.tendu.mapper.UserMapper;
import com.tendu.model.User;
import com.tendu.utils.DBTools;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		SqlSession session = DBTools.getSession();
		UserMapper userMapper = session.getMapper(UserMapper.class);

		List<User> list = userMapper.queryUserName(username);
		
		PrintWriter writer = response.getWriter();
		
		if(list != null && list.size() > 0) {
			User user = list.get(0);
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
			
			if(user.getPassword().equals(password)) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("user", user);
				
				writer.print("1");
			} else {
				writer.print("0");
			}
		} else {
			writer.print("用户未注册");
		}
		
		writer.close();
		session.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
