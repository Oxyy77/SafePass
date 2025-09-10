<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.jsp" class="logo">
                        <img src="assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input">
                        <form id="search" action="#">
                            <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
                            <i class="fa fa-search"></i>
                        </form>
                    </div>
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="index.jsp" class="active">Home</a></li>
                        <li><a href="browse.jsp">Browse</a></li>
                        <li><a href="details.jsp">Details</a></li>
                        <li><a href="streams.jsp">Streams</a></li>

                        <%
                            Object userObj = session.getAttribute("username");
                            if (userObj == null) {
                        %>
                        <!-- Kalau belum login -->
                        <li class="d-flex justify-content-center align-items-center">
                            <a class="btn-login" href="login.jsp">Login</a>
                        </li>
                        <li class="d-flex justify-content-center align-items-center">
                            <a class="btn-daftar" href="daftar.jsp">Daftar</a>
                        </li>
                        <%
                        } else {
                            String user = (String) userObj; // cukup deklarasi sekali di sini
                        %>
                        <!-- Kalau sudah login -->
                        <li class="d-flex justify-content-center align-items-center">
                            <span style="color:#fff; margin-right:10px;">Halo, <%= user %></span>
                            <a class="btn-daftar" href="logout">Logout</a>
                        </li>
                        <%
                            }
                        %>
                    </ul>


                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>