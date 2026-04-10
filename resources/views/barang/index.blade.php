@extends('layouts.main')

{{-- 1. Tambahkan Custom CSS ini --}}
<style>
    /* Styling untuk container gambar di dalam tabel */
    .img-table-container {
        width: 80px; /* Lebar kolom gambar dikunci */
        text-align: center; /* Gambar rata tengah di kolom */
    }

    /* Styling untuk gambarnya itu sendiri */
    .img-thumbnail-barang {
        width: 60px; /* Ukuran gambar yang pas untuk tabel */
        height: 60px; /* Buat aspek rasio kotak (1:1) */
        object-fit: cover; /* SANGAT PENTING: Gambar dipotong rapi agar tidak gepeng */
        border-radius: 8px; /* Sudut melengkung agar terlihat modern */
        border: 1px solid #ddd; /* Bingkai tipis kelabu */
        box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* Bayangan halus agar menonjol */
        transition: transform 0.2s; /* Animasi halus saat di-hover */
    }

    /* Efek sedikit membesar saat kursor di atas gambar */
    .img-thumbnail-barang:hover {
        transform: scale(1.1);
        cursor: pointer;
    }
</style>

@section('content')
    <div class="section-header">
        <h1>Data Barang</h1>
        <div class="ml-auto">
            <a href="/barang/create" class="btn btn-primary"><i class="fa fa-plus"></i> Tambah Produk</a>
        </div>
    </div>

    <div class="section-body">
        @if (session()->has('success'))
            <div class="alert alert-success" role="alert">
                {{ session('success') }}
            </div>
        @endif
        <div class="row">
            <div class="col">
                <div class="card card-primary">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="table_id" class="table table-bordered table-hover table-striped table-condensed">
                                <thead>
                                    <tr>
                                        <th style="width: 5%">No</th>
                                        {{-- 2. Beri class pada header kolom Gambar --}}
                                        <th class="img-table-container">Gambar</th>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Lokasi</th>
                                        <th style="width: 20%">Opsi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($barangs as $barang)
                                        <tr>
                                            <td class="text-center">{{ $loop->iteration }}</td>
                                            
                                            {{-- 3. Ganti kode gambar asli dengan perbaikan ini --}}
                                            <td class="img-table-container">
                                                @if($barang->gambar)
                                                    <img src="{{ asset('storage/' . $barang->gambar) }}" 
                                                         alt="gambar {{ $barang->nm_barang }}"
                                                         class="img-thumbnail-barang">
                                                @else
                                                    {{-- Tampilan jika barang tidak memiliki gambar --}}
                                                    <div class="img-thumbnail-barang d-flex align-items-center justify-content-center bg-light text-muted" style="font-size: 10px;">
                                                        No Img
                                                    </div>
                                                @endif
                                            </td>

                                            <td>{{ $barang->kd_barang }}</td>
                                            <td>{{ $barang->nm_barang }}</td>
                                            <td>{{ $barang->lokasi->lokasi }}</td>
                                            <td>
                                                <a href="/barang/{{ $barang->id }}" class="btn btn-sm btn-success">Detail</a>
                                                <a href="/barang/{{ $barang->id }}/edit" class="btn btn-sm btn-warning">Edit</a>
                                                <form id="{{ $barang->id }}" action="/barang/{{ $barang->id }}" method="POST" class="d-inline">
                                                    @method('delete')
                                                    @csrf
                                                    <div class="btn btn-sm btn-danger swal-confirm" data-form="{{ $barang->id }}">Hapus</div>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#table_id').DataTable();
        })
    </script>
@endsection