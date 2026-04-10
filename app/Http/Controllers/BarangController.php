<?php

namespace App\Http\Controllers;

use App\Models\Merk;
use App\Models\Barang;
use App\Models\Lokasi;
use App\Models\Feedback;
use App\Models\Kategori;
use App\Models\Pelaporan;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\Writer\PngWriter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class BarangController extends Controller
{
    public function index()
    {
        return view('barang.index', [
            'barangs' => Barang::orderBy('id', 'DESC')->get()
        ]);
    }

    public function create()
    {
        return view('barang.create', [
            'kategories' => Kategori::all(),
            'merks' => Merk::all(),
            'lokasies' => Lokasi::all()
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'kd_barang' => 'required',
            'gambar' => 'required|mimes:jpeg,jpg,png',
            'nm_barang' => 'required',
            'jumlah' => 'required|integer|min:0',
            'deskripsi' => 'required',
            'kategori_id' => 'required',
            'merk_id' => 'required',
            'lokasi_id' => 'required'
        ], [
            'kd_barang.required' => 'Kode barang wajib diisi!',
            'gambar.required' => 'Wajib menambahkan gambar!',
            'gambar.mimes' => 'Format gambar yang diizinkan: jpeg, jpg, png.',
            'nm_barang.required' => 'Form wajib diisi!',
            'jumlah.required' => 'Jumlah barang wajib diisi!',
            'jumlah.integer' => 'Jumlah harus berupa angka!',
            'jumlah.min' => 'Jumlah minimal 0!',
            'deskripsi.required' => 'Form wajib diisi!',
            'kategori_id.required' => 'Form wajib dipilih!',
            'merk_id.required' => 'Form wajib dipilih!',
            'lokasi_id.required' => 'Form wajib dipilih!',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $gambar = null;
        if ($request->hasFile('gambar')) {
            $path = 'gambar/';
            $file = $request->file('gambar');
            $extension = $file->getClientOriginalExtension();
            $fileName = uniqid() . '.' . $extension;
            $gambar = $file->storeAs($path, $fileName, 'public');
        }

        $kd_barang = $request->kd_barang;
        $qrCodePath = 'qrcode/' . $kd_barang . '_' . time() . '.png';

        if (!Storage::disk('public')->exists($qrCodePath)) {
            $qrCode = new QrCode($kd_barang);
            $writer = new PngWriter();

            $qrImage = $writer->write($qrCode);

            // Simpan hasil QR ke storage
            Storage::disk('public')->put($qrCodePath, $qrImage->getString());
        }

        Barang::create([
            'kd_barang' => $kd_barang,
            'nm_barang' => $request->nm_barang,
            'jumlah' => $request->jumlah,
            'deskripsi' => $request->deskripsi,
            'tgl_penambahan' => $request->tgl_penambahan,
            'gambar' => $gambar,
            'kategori_id' => $request->kategori_id,
            'merk_id' => $request->merk_id,
            'lokasi_id' => $request->lokasi_id,
            'qr_code_path' => $qrCodePath,
        ]);

        return redirect('/barang')->with('success', 'Berhasil menambahkan data barang baru');
    }

    public function show(string $id)
    {
        $barang = Barang::findOrFail($id);
        $pelaporan = Pelaporan::where('barang_id', $barang->id)->get();
        $feedback = Feedback::where('pelaporan_id', $barang->id)->first();
        $qrCode = new QrCode($barang->kd_barang);

        return view('barang.show', [
            'barang' => $barang,
            'pelaporans' => $pelaporan,
            'feedback' => $feedback,
            'qrCode' => $qrCode
        ]);
    }

    public function edit(string $id)
    {
        $barang = Barang::findOrFail($id);

        return view('barang.edit', [
            'barang' => $barang,
            'kategories' => Kategori::all(),
            'merks' => Merk::all(),
            'lokasies' => Lokasi::all()
        ]);
    }

    public function update(Request $request, string $id)
    {
        $barang = Barang::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'kd_barang' => 'required',
            'gambar' => 'nullable|mimes:jpeg,jpg,png',
            'nm_barang' => 'required',
            'jumlah' => 'required|integer|min:0',
            'deskripsi' => 'required',
            'kategori_id' => 'required',
            'merk_id' => 'required',
            'lokasi_id' => 'required'
        ], [
            'kd_barang.required' => 'Kode barang wajib diisi!',
            'gambar.mimes' => 'Format gambar yang diizinkan: jpeg, jpg, png.',
            'nm_barang.required' => 'Form wajib diisi!',
            'jumlah.required' => 'Jumlah barang wajib diisi!',
            'jumlah.integer' => 'Jumlah harus berupa angka!',
            'jumlah.min' => 'Jumlah minimal 0!',
            'deskripsi.required' => 'Form wajib diisi!',
            'kategori_id.required' => 'Form wajib dipilih!',
            'merk_id.required' => 'Form wajib dipilih!',
            'lokasi_id.required' => 'Form wajib dipilih!',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $gambar = $barang->gambar;
        if ($request->hasFile('gambar')) {
            if ($barang->gambar && Storage::disk('public')->exists($barang->gambar)) {
                Storage::disk('public')->delete($barang->gambar);
            }

            $path = 'gambar/';
            $file = $request->file('gambar');
            $extension = $file->getClientOriginalExtension();
            $fileName = uniqid() . '.' . $extension;
            $gambar = $file->storeAs($path, $fileName, 'public');
        }

        $qrCodePath = $barang->qr_code_path;
        if ($request->kd_barang !== $barang->kd_barang) {
            // Hapus QR code lama jika ada
            if ($barang->qr_code_path && Storage::disk('public')->exists($barang->qr_code_path)) {
                Storage::disk('public')->delete($barang->qr_code_path);
            }

            // Generate QR code baru
            $qrCodePath = 'qrcode/' . $request->kd_barang . '_' . time() . '.png';
            $qrCode = new QrCode($request->kd_barang);
            $writer = new PngWriter();
            $qrImage = $writer->write($qrCode);
            Storage::disk('public')->put($qrCodePath, $qrImage->getString());
        }

        $barang->update([
            'kd_barang' => $request->kd_barang,
            'nm_barang' => $request->nm_barang,
            'jumlah' => $request->jumlah,
            'deskripsi' => $request->deskripsi,
            'gambar' => $gambar,
            'kategori_id' => $request->kategori_id,
            'merk_id' => $request->merk_id,
            'lokasi_id' => $request->lokasi_id,
            'qr_code_path' => $qrCodePath,
        ]);

        return redirect('/barang')->with('success', 'Berhasil memperbarui data barang');
    }

    public function destroy(string $id)
    {
        $barang = Barang::findOrFail($id);

        if ($barang->gambar && Storage::disk('public')->exists($barang->gambar)) {
            Storage::disk('public')->delete($barang->gambar);
        }

        if ($barang->qr_code_path && Storage::disk('public')->exists($barang->qr_code_path)) {
            Storage::disk('public')->delete($barang->qr_code_path);
        }

        $barang->delete();

        return redirect()->back()->with('success', 'Berhasil menghapus data barang');
    }
}
