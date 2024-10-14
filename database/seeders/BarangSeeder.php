<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BarangSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            // Kategori 1: Sembako (SBK)
            [
                'barang_id' => 1,
                'kategori_id' => 1,
                'barang_kode' => 'SBK-001',
                'barang_nama' => 'Beras Cap Jago (5kg)',
                'harga_beli' => 65000,
                'harga_jual' => 68000,
            ],
            [
                'barang_id' => 2,
                'kategori_id' => 1,
                'barang_kode' => 'SBK-002',
                'barang_nama' => 'Beras Bramo Cap Lele',
                'harga_beli' => 80000,
                'harga_jual' => 83000,
            ],

            // Kategori 2: Makanan ringan (SNK)
            [
                'barang_id' => 3,
                'kategori_id' => 2,
                'barang_kode' => 'SNK-001',
                'barang_nama' => 'Happy Toss',
                'harga_beli' => 10500,
                'harga_jual' => 11000,
            ],
            [
                'barang_id' => 4,
                'kategori_id' => 2,
                'barang_kode' => 'SNK-002',
                'barang_nama' => 'Oreo',
                'harga_beli' => 7200,
                'harga_jual' => 7800,
            ],

            // Kategori 3: Peralatan Mandi (MND)
            [
                'barang_id' => 5,
                'kategori_id' => 3,
                'barang_kode' => 'MND-001',
                'barang_nama' => 'Sabun Lifebuoy',
                'harga_beli' => 4250,
                'harga_jual' => 5000,
            ],
            [
                'barang_id' => 6,
                'kategori_id' => 3,
                'barang_kode' => 'MND-002',
                'barang_nama' => 'Pasta Gigi Pepsoden',
                'harga_beli' => 6750,
                'harga_jual' => 7500,
            ],

            // Kategori 4: Keperluan Bayi (BAY)
            [
                'barang_id' => 7,
                'kategori_id' => 4,
                'barang_kode' => 'BAY-001',
                'barang_nama' => 'Susu SGM Coklat 900gr',
                'harga_beli' => 92500,
                'harga_jual' => 95000,
            ],
            [
                'barang_id' => 8,
                'kategori_id' => 4,
                'barang_kode' => 'BAY-002',
                'barang_nama' => 'Popok Mamy Poko',
                'harga_beli' => 56000,
                'harga_jual' => 58000,
            ],

            // Kategori 5: Minuman (MNM)
            [
                'barang_id' => 9,
                'kategori_id' => 5,
                'barang_kode' => 'MNM-001',
                'barang_nama' => 'Aqua 600ml',
                'harga_beli' => 3700,
                'harga_jual' => 4500,
            ],
            [
                'barang_id' => 10,
                'kategori_id' => 5,
                'barang_kode' => 'MNM-002',
                'barang_nama' => 'Le Mineral',
                'harga_beli' => 3500,
                'harga_jual' => 4000,

            ],
        ];

        DB::table('m_barang')->insert($data);
    
    }
}
