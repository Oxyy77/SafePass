package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class CheckPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String inputPassword = request.getParameter("password");
        boolean isLeaked = false;

        // Ambil file CSV dari resources
        InputStream is = getClass().getClassLoader().getResourceAsStream("passwords.csv");
        if (is == null) {
            throw new FileNotFoundException("passwords.csv not found in resources folder");
        }

        try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (inputPassword.equals(line.trim())) {
                    isLeaked = true;
                    break;
                }
            }
        }

        // Kirim hasil ke JSP
        request.setAttribute("password", inputPassword);
        request.setAttribute("isLeaked", isLeaked);
        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
        dispatcher.forward(request, response);
    }
}   
