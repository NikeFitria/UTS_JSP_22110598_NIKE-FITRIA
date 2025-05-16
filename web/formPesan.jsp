<%-- 
    Document   : formPesan
    Created on : 16 May 2025, 17.08.49
    Author     : Dell
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Ambil daftar film dari session
    ArrayList<?> daftarFilmObj = (ArrayList<?>) session.getAttribute("daftarFilm");
%>

<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pesan Tiket - LayarTatakae</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom, #8B0000, #000000);
            color: white;
            font-family: 'Roboto Condensed', sans-serif;
            background-image: url('https://cdn.wallpapersafari.com/24/23/1QE2CZ.png');
            background-repeat: repeat;
            background-size: 200px;
        }
        .navbar {
            background-color: #8B0000;
        }
        .form-container {
            background-color: #2c2c2c;
            padding: 2rem;
            border-radius: 10px;
            border: 1px solid #8B0000;
        }
        .btn-akatsuki {
            background-color: #8B0000;
            color: white;
        }
        .btn-akatsuki:hover {
            background-color: #a80000;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-dark mb-4">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">LayarTatakae 🎴</span>
        </div>
    </nav>

    <div class="container">
        <h2 class="mb-4">Form Pemesanan Tiket</h2>
        <div class="form-container">
            <form action="struk.jsp" method="post">
                <div class="mb-3">
                    <label for="nama" class="form-label">Nama Pemesan:</label>
                    <input type="text" name="nama" id="nama" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="jumlah" class="form-label">Jumlah Tiket:</label>
                    <input type="number" name="jumlah" id="jumlah" class="form-control" min="1" required>
                </div>

                <div class="mb-3">
                    <label for="film" class="form-label">Pilih Film:</label>
                    <select name="film" id="film" class="form-select" required>
                        <%
                            for (Object obj : daftarFilmObj) {
                                java.lang.reflect.Field judulField = obj.getClass().getDeclaredField("judul");
                                judulField.setAccessible(true);
                                String judul = (String) judulField.get(obj);
                        %>
                        <option value="<%= judul %>"><%= judul %></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="jam" class="form-label">Pilih Jam Tayang:</label>
                    <select name="jam" id="jam" class="form-select" required>
                        <option>13:00</option>
                        <option>16:00</option>
                        <option>19:00</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-akatsuki">Bayar Sekarang</button>
            </form>
        </div>
    </div>
</body>
</html>
