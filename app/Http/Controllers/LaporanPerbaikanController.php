<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf as PDF;
use App\Models\Pelaporan;
use App\Exports\LaporanPerbaikanExport;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;

class LaporanPerbaikanController extends Controller
{
    public function index()
    {
        return view('laporan-perbaikan.index', [
            'pelaporans'  => Pelaporan::where('status', 'selesai')->orderBy('id', 'DESC')->get()
        ]);
    }

    public function cetakLaporan()
    {
        $pelaporan = Pelaporan::where('status', 'selesai')->orderBy('id', 'DESC')->get();

        $pdf = PDF::loadView('laporan-perbaikan.laporan', [
            'pelaporans'    => $pelaporan
        ]);

        return $pdf->stream('laporan-perbaikan.pdf');
    }

    public function exportExcel()
    {
        return Excel::download(new LaporanPerbaikanExport, 'laporan-perbaikan.xlsx');
    }
}
