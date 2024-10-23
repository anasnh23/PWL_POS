<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ansapremium</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('{{ asset('adminlte/dist/img/background.jpg') }}');
            background-size: cover;
            background-position: center;
            color: white;
            position: relative;
        }

        /* Dark overlay for better contrast */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 50px;
            background-color: rgba(0, 0, 0, 0.8);
            position: relative;
            z-index: 2;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .title {
            font-size: 26px;
            font-weight: bold;
            display: flex;
            align-items: center;
            color: #fff;
        }

        .title img {
            width: 60px;
            height: 60px;
            margin-right: 15px;
        }

        .nav-link {
            color: white !important;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* Main content area */
        .content {
            text-align: center;
            padding: 80px 20px;
            margin-top: 100px;
            position: relative;
            z-index: 2;
            color: #fff;
        }

        h1 {
            font-size: 4rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.5rem;
            margin-bottom: 30px;
        }

        .btn-primary-custom {
            background-color: #007bff;
            border: none;
            padding: 12px 30px;
            font-size: 1.25rem;
            border-radius: 5px;
        }

        .btn-primary-custom:hover {
            background-color: #0056b3;
        }

        /* Footer */
        .footer {
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.9);
            color: #ccc;
            text-align: center;
            position: relative;
            z-index: 2;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }

            p {
                font-size: 1.25rem;
            }

            .header {
                padding: 15px 20px;
            }

            .title img {
                width: 40px;
                height: 40px;
            }

            .btn-primary-custom {
                font-size: 1rem;
                padding: 10px 25px;
            }
        }
    </style>
</head>

<body>
    <!-- Header -->
    <header class="header">
        <div class="title">
            <img src="{{ asset('adminlte/dist/img/LogoAnsa.jpg') }}" alt="Ansapremium Logo">
            Ansapremium
        </div>
        <nav>
            <ul class="nav">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Layanan</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Tentang</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ url('/login') }}">Masuk</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ url('/signup') }}">Daftar</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main content -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">
                <div class="content">
                    <h1>Layanan Aplikasi Terbaik</h1>
                    <p>Ansapremium menyediakan akun premium dengan harga terjangkau, langsung bisa digunakan tanpa kendala.</p>
                    <a href="{{ url('/login') }}" class="btn btn-primary-custom">Masuk Sekarang</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 Ansapremium. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
