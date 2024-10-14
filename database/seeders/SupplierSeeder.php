<?php

namespace Database\Seeders;

use App\Models\m_supplier;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SupplierSeeder extends Seeder
{
        public function run(): void
        {
            $data = [
                // Supplier untuk kategori Sembako (SBK)
                [
                    'supplier_id' => 1,
                    'supplier_kode' => 'SP001',
                    'supplier_nama' => 'CV Berkah Sembako',
                    'supplier_alamat' => 'Jakarta, Indonesia',
                ],
                [
                    'supplier_id' => 2,
                    'supplier_kode' => 'SP002',
                    'supplier_nama' => 'PT Sumber Pangan Nusantara',
                    'supplier_alamat' => 'Bandung, Indonesia',
                ],
    
                // Supplier untuk kategori Makanan ringan (SNK)
                [
                    'supplier_id' => 3,
                    'supplier_kode' => 'SP003',
                    'supplier_nama' => 'Toko Snack Maju Sejahtera',
                    'supplier_alamat' => 'Surabaya, Indonesia',
                ],
    
                // Supplier untuk kategori Peralatan Mandi (MND)
                [
                    'supplier_id' => 4,
                    'supplier_kode' => 'SP004',
                    'supplier_nama' => 'PT Peralatan Mandi Bersih',
                    'supplier_alamat' => 'Semarang, Indonesia',
                ],
    
                // Supplier untuk kategori Minuman (MNM)
                [
                    'supplier_id' => 5,
                    'supplier_kode' => 'SP005',
                    'supplier_nama' => 'CV Segar Jaya',
                    'supplier_alamat' => 'Medan, Indonesia',
                ],
            ];

        DB::table('m_supplier')->insert($data);
    }
}