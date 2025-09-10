package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class LoginServlet extends HttpServlet {
    private static final String USERS_FILE = "/WEB-INF/data/users.csv"; // user login data (writeable)
    private static final String LEAKED_CSV = "passwords.csv";           // leaked password list (read-only)

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            // Pastikan file users.csv ada di WEB-INF/data
            String realPath = getServletContext().getRealPath(USERS_FILE);
            File file = new File(realPath);

            if (!file.exists()) {
                file.getParentFile().mkdirs(); // buat folder jika belum ada
                try (InputStream is = getClass().getClassLoader().getResourceAsStream("users.csv")) {
                    if (is != null) {
                        try (FileOutputStream fos = new FileOutputStream(file)) {
                            is.transferTo(fos);
                        }
                    } else {
                        // kalau tidak ada seed, buat file kosong dengan header
                        try (FileWriter fw = new FileWriter(file)) {
                            fw.write("email,username,password\n");
                        }
                    }
                }
            }
        } catch (IOException e) {
            throw new ServletException("Gagal inisialisasi users.csv", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 1. Cek apakah password bocor
        if (isPasswordLeaked(password)) {
            request.setAttribute("errorMessage", "Password kamu ada di daftar bocor! Gunakan password lain.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // 2. Cek user ke file di WEB-INF/data
        if (isValidUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("streams.jsp");
        } else {
            request.setAttribute("errorMessage", "Username atau password salah.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private boolean isPasswordLeaked(String inputPassword) throws IOException {
        InputStream is = getClass().getClassLoader().getResourceAsStream(LEAKED_CSV);
        if (is == null) return false;

        try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (inputPassword.equals(line.trim())) {
                    return true;
                }
            }
        }
        return false;
    }

    private boolean isValidUser(String inputUsername, String inputPassword) throws IOException {
        String filePath = getServletContext().getRealPath(USERS_FILE);
        File file = new File(filePath);
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
                if (parts.length >= 3) {
                    String username = parts[1].trim();
                    String password = parts[2].trim();

                    if (username.equals(inputUsername) && password.equals(inputPassword)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
