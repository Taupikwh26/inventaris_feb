<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Exports\LaporanInventarisExport;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Barryvdh\DomPDF\Facade\Pdf as PDF;
use Maatwebsite\Excel\Facades\Excel;

class LaporanInventarisController extends Controller
{
    public function index()
    {
        return view('laporan-inventaris.index', [
            'barangs'   => Barang::orderBy('id', 'DESC')->get()
        ]);
    }

    public function cetakLaporan()
    {
        $barang = Barang::orderBy('id', 'DESC')->get();

        $pdf = PDF::loadView('laporan-inventaris.laporan', [
            'barangs'    => $barang
        ]);

        return $pdf->stream('laporan-inventaris.pdf');
    }

    public function exportExcel()
    {
        return Excel::download(new LaporanInventarisExport, 'laporan-inventaris.xlsx');
    }
}
