<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Pengguna</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('adminlte/plugins/fontawesome-free/css/all.min.css') }}">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="{{ asset('adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="{{ asset('adminlte/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('adminlte/dist/css/adminlte.min.css') }}">

    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Source Sans Pro', sans-serif;
            background: linear-gradient(135deg, #1d3557 0%, #457b9d 100%);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 100%;
            max-width: 900px;
            display: flex;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .left-section {
            flex: 1;
            background: #1d3557;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            border-radius: 15px 0 0 15px;
        }

        .left-section img {
            width: 150px;
        }

        .right-section {
            flex: 1;
            padding: 40px;
            background: #f4f9f9;
            border-radius: 0 15px 15px 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .right-section h2 {
            text-align: center;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 20px;
            color: #1d3557;
        }

        .right-section p {
            text-align: center;
            margin-bottom: 30px;
            color: #6c757d;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group input {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            background: #f76c38;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background: #ff8c55;
        }

        .remember-me {
            margin-top: 10px;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }

        .register-link a {
            color: #f76c38;
            text-decoration: none;
        }

        .error-text {
            display: block;
            margin-top: 5px;
            font-size: 12px;
            color: #e74c3c;
        }
    </style>
</head>
<body class="hold-transition login-page">

<div class="login-container">
    <!-- Left Section with Logo -->
    <div class="left-section">
        <img src="{{ asset('adminlte/dist/img/LogoAnsa.jpg') }}" alt="AdminLTE Logo"> <!-- Replace with your logo -->
    </div>

    <!-- Right Section with Login Form -->
    <div class="right-section">
        <h2>Selamat Datang Di ANSA PREMIUM</h2>
        <p>SILAHKAN LOGIN </p>
        <form action="{{ url('login') }}" method="POST" id="form-login">
            @csrf
            <div class="input-group mb-3">
                <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                <small id="error-username" class="error-text"></small>
            </div>
            <div class="input-group mb-3">
                <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                <small id="error-password" class="error-text"></small>
            </div>

            <div class="remember-me icheck-primary">
                <input type="checkbox" id="remember">
                <label for="remember">Remember Me</label>
            </div>

            <button type="submit" class="btn btn-primary">Sign In</button>
        </form>

        <div class="register-link">
            <p>Don't have an account? <a href="{{ url('signup') }}">Register here</a></p>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="{{ asset('adminlte/plugins/jquery/jquery.min.js') }}"></script>
<!-- Bootstrap 4 -->
<script src="{{ asset('adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<!-- jquery-validation -->
<script src="{{ asset('adminlte/plugins/jquery-validation/jquery.validate.min.js') }}"></script>
<script src="{{ asset('adminlte/plugins/jquery-validation/additional-methods.min.js') }}"></script>
<!-- SweetAlert2 -->
<script src="{{ asset('adminlte/plugins/sweetalert2/sweetalert2.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('adminlte/dist/js/adminlte.min.js') }}"></script>

<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $(document).ready(function() {
        $("#form-login").validate({
            rules: {
                username: {required: true, minlength: 4, maxlength: 20},
                password: {required: true, minlength: 5, maxlength: 20}
            },
            submitHandler: function(form) { // ketika valid, maka bagian yg akan dijalankan
                $.ajax({
                    url: form.action,
                    type: form.method,
                    data: $(form).serialize(),
                    success: function(response) {
                        if(response.status){ // jika sukses
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil',
                                text: response.message,
                            }).then(function() {
                                window.location = response.redirect;
                            });
                        } else { // jika error
                            $('.error-text').text('');
                            $.each(response.msgField, function(prefix, val) {
                                $('#error-'+prefix).text(val[0]);
                            });
                            Swal.fire({
                                icon: 'error',
                                title: 'Terjadi Kesalahan',
                                text: response.message
                            });
                        }
                    }
                });
                return false;
            },
            errorElement: 'span',
            errorPlacement: function (error, element) {
                error.addClass('invalid-feedback');
                element.closest('.input-group').append(error);
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
    });
</script>

</body>
</html>
