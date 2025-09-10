package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class RegisterServlet extends HttpServlet {
    private static final String USERS_FILE = "/WEB-INF/data/users.csv";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        // 1. Validasi password dan konfirmasi
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Password dan konfirmasi tidak sama.");
            request.getRequestDispatcher("daftar.jsp").forward(request, response);
            return;
        }

        // 2. Path file users.csv
        String filePath = getServletContext().getRealPath(USERS_FILE);
        File file = new File(filePath);
        file.getParentFile().mkdirs();

        // 3. Cek apakah username atau email sudah ada
        if (isUserExist(file, username, email)) {
            request.setAttribute("errorMessage", "Username atau email sudah terdaftar.");
            request.getRequestDispatcher("daftar.jsp").forward(request, response);
            return;
        }

        // 4. Tambahkan user baru ke CSV
        try (FileWriter fw = new FileWriter(file, true);
             BufferedWriter bw = new BufferedWriter(fw)) {

            // Jika file kosong, tulis header dulu
            if (file.length() == 0) {
                bw.write("email,username,password\n");
            }

            bw.write(email + "," + username + "," + password + "\n");
        }

        // 5. Redirect ke login
        response.sendRedirect("login.jsp");
    }

    private boolean isUserExist(File file, String inputUsername, String inputEmail) throws IOException {
        if (!file.exists()) return false;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            boolean firstLine = true;
            while ((line = br.readLine()) != null) {
                if (firstLine) { // skip header
                    firstLine = false;
                    continue;
                }
                String[] parts = line.split(",");
                if (parts.length >= 2) {
                    String email = parts[0].trim();
                    String username = parts[1].trim();
                    if (username.equals(inputUsername) || email.equals(inputEmail)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
