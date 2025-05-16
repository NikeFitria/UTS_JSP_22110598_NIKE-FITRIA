<%-- 
    Document   : index
    Created on : 16 May 2025, 17.06.56
    Author     : Dell
--%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    class Film {
        String judul, genre, image;
        int durasi, harga;
        String[] jam;

        public Film(String judul, String genre, int durasi, int harga, String[] jam, String image) {
            this.judul = judul;
            this.genre = genre;
            this.durasi = durasi;
            this.harga = harga;
            this.jam = jam;
            this.image = image;
        }
    }

    ArrayList<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film("Naruto: The Last", "Action", 110, 45000, new String[]{"13:00", "16:00", "19:00"},
            "https://pic.bstarstatic.com/ugc/5429ecb011463d277d67c2cf4d5cfc66.jpg"));
    daftarFilm.add(new Film("Attack on Titan Final Season", "Action", 120, 50000, new String[]{"13:00", "17:00"},
            "https://m.media-amazon.com/images/S/pv-target-images/5c3d637c0b4df937b0d4ab480335963ff1eddaaf7a9470f3491ae1cb3771cd74.jpg"));
    daftarFilm.add(new Film("Kimetsu no Yaiba: Mugen Train", "Fantasy", 115, 48000, new String[]{"14:00", "18:00"},
            "https://vcover-hz-pic.wetvinfo.com/vcover_hz_pic/0/nke7w5i3cuiw7o81730718519830_UaDvtLqa/0"));
    daftarFilm.add(new Film("Jujutsu Kaisen 0", "Supernatural", 105, 46000, new String[]{"12:00", "15:00", "19:00"},
            "https://m.media-amazon.com/images/S/pv-target-images/2d8b3a4ff164e6286badc555d2908ee27f7d3b5d2fd01dd72ffce7d067eecc64.jpg"));
    daftarFilm.add(new Film("Ultraman Rising", "Sci-Fi", 90, 42000, new String[]{"11:00", "14:00"},
            "https://kaijuunited.com/wp-content/uploads/2024/06/thumbnail.jpg"));
    daftarFilm.add(new Film("Kamen Rider: Battle Familia", "Hero", 100, 47000, new String[]{"13:00", "16:00"},
            "https://vcover-hz-pic.wetvinfo.com/vcover_hz_pic/0/he8mlz18jk3v6pd1730717654598_7Zx92PW0/0"));

    session.setAttribute("daftarFilm", daftarFilm);
%>
<html>
<head>
    <title>LayarTatakae</title>
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
            background-color: rgba(0, 0, 0, 0.8);
            border-bottom: 2px solid #ff0000;
        }
        .film-card {
            background-color: rgba(44, 44, 44, 0.95);
            border: 1px solid #8B0000;
        }
        .btn-akatsuki {
            background-color: #8B0000;
            color: white;
        }
        .btn-akatsuki:hover {
            background-color: #a80000;
        }
        .card-img-top {
            height: 300px;
            object-fit: cover;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-dark">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">LayarTatakae 🎴</span>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="mb-4">Film Anime Tersedia</h2>
        <div class="row">
            <%
                for (Film f : daftarFilm) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card film-card h-100">
                    <img src="<%= f.image %>" class="card-img-top" alt="<%= f.judul %>">
                    <div class="card-body">
                        <h5 class="card-title text-danger"><%= f.judul %></h5>
                        <p class="card-text">Genre: <%= f.genre %></p>
                        <p class="card-text">Durasi: <%= f.durasi %> menit</p>
                        <p class="card-text">Harga: Rp <%= f.harga %></p>
                        <p class="card-text">Jam: 
                            <%
                                for (int i = 0; i < f.jam.length; i++) {
                                    out.print(f.jam[i]);
                                    if (i < f.jam.length - 1) out.print(", ");
                                }
                            %>
                        </p>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="text-center">
            <a href="formPesan.jsp" class="btn btn-akatsuki">Pesan Tiket Sekarang</a>
        </div>
    </div>
</body>
</html>
