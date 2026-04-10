<?php

namespace App\Exports;

use App\Models\Barang;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithDrawings;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;

class LaporanInventarisExport implements FromCollection, WithHeadings, WithMapping, ShouldAutoSize, WithStyles, WithDrawings
{
    protected $rowNumber = 1;

    public function collection()
    {
        return Barang::with('lokasi', 'merk', 'kategori')
            ->orderBy('id', 'DESC')
            ->get();
    }

    public function map($barang): array
    {
        $this->rowNumber++;
        
        return [
            $this->rowNumber - 1,
            $barang->kd_barang,
            $barang->nm_barang,
            $barang->kategori->kategori ?? '-',
            $barang->merk->merk ?? '-',
            $barang->lokasi->lokasi ?? '-',
            \Carbon\Carbon::parse($barang->tgl_penambahan)->format('d-m-Y'),
            $barang->jumlah ?? 0,
            $barang->deskripsi ?? '-',
            $barang->qr_code_path ? 'Ada' : 'Tidak Ada',
        ];
    }

    public function headings(): array
    {
        return [
            'No',
            'Kode Barang',
            'Nama Barang',
            'Kategori',
            'Merek',
            'Lokasi',
            'Tanggal Penambahan',
            'Jumlah',
            'Deskripsi',
            'QR Code',
        ];
    }

    public function drawings()
    {
        $drawings = [];
        $barangs = Barang::with('lokasi', 'merk', 'kategori')
            ->orderBy('id', 'DESC')
            ->get();
        
        $row = 2;
        foreach ($barangs as $barang) {
            if ($barang->qr_code_path && file_exists(storage_path('app/public/' . $barang->qr_code_path))) {
                $drawing = new Drawing();
                $drawing->setName('QR Code');
                $drawing->setDescription('QR Code ' . $barang->kd_barang);
                $drawing->setPath(storage_path('app/public/' . $barang->qr_code_path));
                $drawing->setHeight(80);
                $drawing->setWidth(80);
                $drawing->setCoordinates('J' . $row);
                
                $drawings[] = $drawing;
            }
            $row++;
        }
        
        return $drawings;
    }

    public function styles(Worksheet $sheet)
    {
        // Style header
        $sheet->getStyle('A1:J1')->applyFromArray([
            'font' => [
                'bold' => true,
                'color' => ['rgb' => 'FFFFFF'],
            ],
            'fill' => [
                'fillType' => Fill::FILL_SOLID,
                'startColor' => ['rgb' => '0066CC'],
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
        $sheet->getStyle('A2:J' . ($this->collection()->count() + 1))->applyFromArray([
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

        // Center align jumlah
        $sheet->getStyle('H2:H' . ($this->collection()->count() + 1))->applyFromArray([
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
            ],
        ]);

        // Set row height untuk QR Code
        for ($i = 2; $i <= $this->collection()->count() + 1; $i++) {
            $sheet->getRowDimension($i)->setRowHeight(90);
        }

        // Set column width untuk QR Code
        $sheet->getColumnDimension('J')->setWidth(15);

        return [];
    }
}
