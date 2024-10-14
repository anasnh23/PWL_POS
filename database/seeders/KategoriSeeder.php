<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class KategoriSeeder extends Seeder
{
    public function run(): void
    {
        $data = [
            [
                'kategori_id' => 1,
                'kategori_kode' => 'SBK',
                'kategori_nama' => 'Sembako',
            ],
            [
                'kategori_id' => 2,
                'kategori_kode' => 'SNK',
                'kategori_nama' => 'Makanan ringan',
            ],
            [
                'kategori_id' => 3,
                'kategori_kode' => 'MND',
                'kategori_nama' => 'Peralatan Mandi',
            ],
            [
                'kategori_id' => 4,
                'kategori_kode' => 'BAY',
                'kategori_nama' => 'Keperluan Bayi',
            ],
            [
                'kategori_id' => 5,
                'kategori_kode' => 'MNM',
                'kategori_nama' => 'Minuman',
            ],
        ];
        DB::table('m_kategori') -> insert($data);
    }
}