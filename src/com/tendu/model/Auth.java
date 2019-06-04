package com.tendu.model;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Auth {

    public static boolean is_login(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null){
            return true;
        }else{
            return false;
        }
    }

    public static void is_login(HttpServletRequest request, HttpServletResponse response, String redirect) {
        try {
            HttpSession session = request.getSession();

            if (session.getAttribute("user") == null) {
                request.getRequestDispatcher(redirect).forward(request, response);
            }
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
