<%-- 
    Document   : struk
    Created on : 16 May 2025, 17.10.46
    Author     : Dell
--%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    

    String nama = request.getParameter("nama");
    String jumlahStr = request.getParameter("jumlah");
    String filmDipilih = request.getParameter("film");
    String jamTayang = request.getParameter("jam");

    int jumlahTiket = Integer.parseInt(jumlahStr);
    int hargaTiket = 0;

    ArrayList<?> daftarFilm = (ArrayList<?>) session.getAttribute("daftarFilm");

    for (Object obj : daftarFilm) {
        java.lang.reflect.Field judulField = obj.getClass().getDeclaredField("judul");
        judulField.setAccessible(true);
        String judul = (String) judulField.get(obj);

        if (judul.equals(filmDipilih)) {
            java.lang.reflect.Field hargaField = obj.getClass().getDeclaredField("harga");
            hargaField.setAccessible(true);
            hargaTiket = hargaField.getInt(obj);
            break;
        }
    }

    int totalHarga = jumlahTiket * hargaTiket;
    String tanggalSekarang = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(new Date());
%>
<html>
<head>
    <title>Struk - LayarTatakae</title>
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
        .struk-box {
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
            <span class="navbar-brand mb-0 h1">LayarTatakae 🧾</span>
        </div>
    </nav>

    <div class="container">
        <h2 class="mb-4">Struk Pemesanan</h2>
        <div class="struk-box">
            <p><strong>Nama Pemesan:</strong> <%= nama %></p>
            <p><strong>Film:</strong> <%= filmDipilih %></p>
            <p><strong>Jam Tayang:</strong> <%= jamTayang %></p>
            <p><strong>Jumlah Tiket:</strong> <%= jumlahTiket %></p>
            <p><strong>Harga per Tiket:</strong> Rp <%= hargaTiket %></p>
            <p><strong>Total Bayar:</strong> Rp <%= totalHarga %></p>
            <p><strong>Tanggal Transaksi:</strong> <%= tanggalSekarang %></p>
        </div>

        <a href="index.jsp" class="btn btn-akatsuki mt-3">Kembali ke Beranda</a>
    </div>
</body>
</html>
