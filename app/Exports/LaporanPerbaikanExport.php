<?php

namespace App\Exports;

use App\Models\Pelaporan;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;

class LaporanPerbaikanExport implements FromCollection, WithHeadings, WithMapping, ShouldAutoSize, WithStyles
{
    public function collection()
    {
        return Pelaporan::with('barang', 'barang.lokasi')
            ->where('status', 'selesai')
            ->orderBy('id', 'DESC')
            ->get();
    }

    public function map($pelaporan): array
    {
        static $index = 0;
        $index++;
        
        return [
            $index,
            $pelaporan->judul,
            $pelaporan->deskripsi,
            $pelaporan->barang->nm_barang ?? '-',
            $pelaporan->barang->lokasi->lokasi ?? '-',
            $pelaporan->status,
            \Carbon\Carbon::parse($pelaporan->created_at)->format('d-m-Y H:i'),
            \Carbon\Carbon::parse($pelaporan->updated_at)->format('d-m-Y H:i'),
        ];
    }

    public function headings(): array
    {
        return [
            'No',
            'Judul',
            'Deskripsi',
            'Nama Barang',
            'Lokasi',
            'Status',
            'Tanggal Pelaporan',
            'Selesai Perbaikan',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        // Style header
        $sheet->getStyle('A1:H1')->applyFromArray([
            'font' => [
                'bold' => true,
                'color' => ['rgb' => 'FFFFFF'],
            ],
            'fill' => [
                'fillType' => Fill::FILL_SOLID,
                'startColor' => ['rgb' => '28A745'],
            ],
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
                'vertical' => Alignment::VERTICAL_CENTER,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                ],
            ],
        ]);

        // Style data rows
        $sheet->getStyle('A2:H' . ($this->collection()->count() + 1))->applyFromArray([
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                ],
            ],
            'alignment' => [
                'vertical' => Alignment::VERTICAL_CENTER,
                'wrapText' => true,
            ],
        ]);

        // Center align nomor
        $sheet->getStyle('A2:A' . ($this->collection()->count() + 1))->applyFromArray([
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
            ],
        ]);

        // Center align status
        $sheet->getStyle('F2:F' . ($this->collection()->count() + 1))->applyFromArray([
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
            ],
        ]);

        return [];
    }
}
