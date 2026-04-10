@extends('layouts.main')

@section('content')
    <div class="section-header">
        <h1>Laporan Barang Inventaris</h1>
        <div class="ml-auto">
            <a href="/laporan-inventaris/export" class="btn btn-success"><i class="fa fa-download"></i> Export Excel</a>
            <a href="/laporan-inventaris/laporan" class="btn btn-danger"><i class="fa fa-print"></i> Cetak Laporan</a>
        </div>
    </div>

    <div class="section-body">
        <div class="row">
            <div class="col">
                <div class="card card-primary">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="table_id" class="table table-bordered table-hover table-striped table-condensed">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Tgl. Penambahan</th>
                                        <th>Lokasi</th>
                                        <th>Merek</th>
                                        <th>Barcode</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($barangs as $barang)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $barang->kd_barang }}</td>
                                            <td>{{ $barang->nm_barang }}</td>
                                            <td>{{ \Carbon\Carbon::parse($barang->tgl_penambahan)->format('d-m-Y') }}</td>
                                            <td>{{ $barang->lokasi->lokasi }}</td>
                                            <td>{{ $barang->merk->merk }}</td>
                                            <td>
                                                @if ($barang->qr_code_path)
                                                    <img src="{{ asset('storage/' . $barang->qr_code_path) }}" alt="QR Code" style="width:80px; height:80px; object-fit:contain;">
                                                @endif
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

    <!-- Datatables Jquery -->
    <script>
        $(document).ready(function() {
            $('#table_id').DataTable();
        })
    </script>
@endsection
