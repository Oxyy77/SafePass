<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hasil Cek Password</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <h1>Hasil Pengecekan</h1>

    <%
        String password = (String) request.getAttribute("password");
        Boolean isLeaked = (Boolean) request.getAttribute("isLeaked");
    %>

    <p>Password yang dicek: <b><%= password %></b></p>

    <%
        if (isLeaked != null && isLeaked) {
    %>
    <p style="color:red;">⚠ Password ini termasuk dalam daftar bocor!</p>
    <%
    } else {
    %>
    <p style="color:green;">✔ Password ini aman (tidak ada di daftar bocor).</p>
    <%
        }
    %>

    <a href="index.jsp" class="btn">Cek Lagi</a>
</div>
</body>
</html>
