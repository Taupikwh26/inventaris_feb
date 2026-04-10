@extends('layouts.app')

@section('loginContent')
<div id="app">
    <section class="section d-flex align-items-center justify-content-center" 
        style="background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('{{ asset('assets/img/background-feb.jpg') }}'); 
        background-size: cover; background-position: center; min-height: 100vh;">
        
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4">
                    
                    <div class="text-center mb-4">
                        <h3 class="custom-title">SISTEM INVENTARIS</h3>
                        <p class="custom-subtitle">Fakultas Ekonomi dan Bisnis</p>
                    </div>

                    <div class="card glass-card shadow-lg border-0">
                        <div class="card-header bg-transparent border-0 text-center pt-4">
                            <h4 class="text-dark font-weight-bold">Selamat Datang</h4>
                            
                        </div>

                        <div class="card-body px-4 pb-4">
                            @if ($errors->any())
                                <div class="alert alert-danger alert-dismissible show fade">
                                    <div class="alert-body">
                                        @foreach ($errors->all() as $error)
                                            <p class="small mb-0">{{ $error }}</p>
                                        @endforeach
                                    </div>
                                </div>
                            @endif

                            <form method="POST" action="{{ route('login') }}" class="needs-validation" novalidate>
                                @csrf

                                <div class="form-group">
                                    <label for="email" class="font-weight-600">Email</label>
                                    <div class="input-group custom-input">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fas fa-envelope"></i></div>
                                        </div>
                                        <input id="email" type="email" class="form-control" name="email"
                                            placeholder="contoh@feb.ac.id" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group mt-3">
                                    <label for="password" class="font-weight-600">Password</label>
                                    <div class="input-group custom-input">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fas fa-lock"></i></div>
                                        </div>
                                        <input id="password" type="password" class="form-control" name="password"
                                            placeholder="Masukkan password Anda" required>
                                    </div>
                                </div>

                                <div class="form-group mt-3 d-flex justify-content-between">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" name="remember" class="custom-control-input" id="remember-me">
                                        <label class="custom-control-label small" for="remember-me">Ingat Saya</label>
                                    </div>
                                    <a href="#" class="small text-primary">Lupa Password?</a>
                                </div>

                                <div class="form-group mt-4">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block shadow-primary btn-login">
                                        LOGIN
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="simple-footer text-center mt-4 text-white-50">
                        &copy; {{ date('Y') }} <strong>FEB</strong> | All Rights Reserved
                    </div>

                </div>
            </div>
        </div>
    </section>
</div>

<style>
    /* Tipografi Judul */
    .custom-title {
        font-family: 'Poppins', sans-serif;
        font-weight: 800;
        font-size: 2.2rem;
        color: #FFFFFF;
        letter-spacing: 2px;
        margin-bottom: 0;
        text-transform: uppercase;
    }

    .custom-subtitle {
        font-family: 'Poppins', sans-serif;
        font-weight: 400;
        font-size: 1.1rem;
        color: #AFEEEE;
        letter-spacing: 1px;
    }

    /* Efek Glassmorphism pada Card */
    .glass-card {
        background: rgba(255, 255, 255, 0.9); /* Transparansi putih */
        backdrop-filter: blur(10px); /* Blur background belakang card */
        border-radius: 15px !important;
    }

    /* Input Style */
    .custom-input .form-control {
        border-left: none;
        height: 45px;
    }
    
    .custom-input .input-group-text {
        background: #f8f9fa;
        border-right: none;
        color: #6777ef;
    }

    /* Button Style */
    .btn-login {
        border-radius: 30px;
        font-weight: 700;
        letter-spacing: 1px;
        transition: all 0.3s;
    }

    .btn-login:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(103, 119, 239, 0.4);
    }

    .font-weight-600 { font-weight: 600; }
</style>
@endsection