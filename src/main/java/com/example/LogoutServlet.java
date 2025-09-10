package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // ambil session kalau ada
        if (session != null) {
            session.invalidate(); // hapus session
        }
        response.sendRedirect("login.jsp");
    }
}
