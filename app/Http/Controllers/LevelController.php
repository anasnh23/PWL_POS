<?php

namespace App\Http\Controllers;
use App\Models\LevelModel;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;

class LevelController extends Controller
{
    // public function index()

    // {
    // DB::insert('insert into m_level(level_kode, level_nama, created_at) values(?, ?, ?)', ['cus', 'pelanggan', now()]);
        // return 'insert data baru berhasil';

        // $row = DB::update('update m_level set level_nama = ? where level_kode = ?',['Customer', 'CUS']);

        // return 'update data baru berhasil. Jumlah data yang diupdate:' . $row.'baris';

        
        // $row = DB::delete('delete from m_level where level_kode = ?', ['CUS']);
        // return 'Delete data berhasil. Jumlah data yang dihapus: ' . $row.' baris';

        // $data = DB::select('select * from m_level');
        // return view('level', ['data' => $data]);

        // }
    //

        // Menampilkan halaman awal level
    // Menampilkan halaman awal level
    public function index() {
        $breadcrumb = (object) [
            'title' => 'Daftar Level',
            'list' => ['Home', 'Level']
        ];

        $page = (object) [
            'title' => 'Daftar level yang terdaftar dalam sistem'
        ];

        $activeMenu = 'level';

        return view('level.index', [
            'breadcrumb' => $breadcrumb, 
            'page' => $page, 
            'activeMenu' => $activeMenu
        ]);
    }

    // Ambil data level dalam bentuk json untuk datatables
    public function list(Request $request)
    {
        $levels = LevelModel::select('level_id', 'level_kode', 'level_nama');

        return datatables()->of($levels)
            ->addIndexColumn()
            ->addColumn('aksi', function($level){
                $btn = '<a href="'.url('/level/' . $level->level_id . '/edit').'" class="btn btn-warning btn-sm">Edit</a> ';
                $btn .= '<form class="d-inline-block" method="POST" action="'.url('/level/'.$level->level_id).'" onsubmit="return confirm(\'Apakah Anda yakin menghapus data ini?\');">'
                    . csrf_field() . method_field('DELETE') .
                    '<button type="submit" class="btn btn-danger btn-sm">Hapus</button></form>';
                return $btn;
            })
            ->rawColumns(['aksi'])
            ->make(true);
    }

    // Menampilkan halaman form tambah level
    public function create()
    {
        $breadcrumb = (object) [
            'title' => 'Tambah Level',
            'list' => ['Home', 'Level', 'Tambah']
        ];

        $page = (object) [
            'title' => 'Tambah level baru'
        ];

        $activeMenu = 'level'; // Set menu yang sedang aktif

        return view('level.create', [
            'breadcrumb' => $breadcrumb,
            'page' => $page,
            'activeMenu' => $activeMenu
        ]);
    }

    // Menyimpan data level baru
    public function store(Request $request)
    {
        // Validasi input untuk level_kode dan level_nama
        $request->validate([
            'level_kode' => 'required|string|max:10|unique:m_level,level_kode',
            'level_nama' => 'required|string|max:100|unique:m_level,level_nama',
        ]);

        // Simpan data level baru
        LevelModel::create([
            'level_kode' => $request->level_kode,
            'level_nama' => $request->level_nama
        ]);

        return redirect('/level')->with('success', 'Data level berhasil disimpan');
    }

    // Menampilkan halaman form edit level
    public function edit(string $id)
    {
        $level = LevelModel::find($id);

        $breadcrumb = (object) [
            "title" => 'Edit Level',
            "list" => ['Home', 'Level', 'Edit']
        ];

        $page = (object) [
            'title' => "Edit level"
        ];

        $activeMenu = "level"; // Set menu yang sedang aktif

        return view('level.edit', [
            'breadcrumb' => $breadcrumb,
            'page' => $page,
            'level' => $level,
            'activeMenu' => $activeMenu
        ]);
    }

    // Menyimpan perubahan data level
    public function update(Request $request, string $id)
    {
        // Validasi input untuk level_kode dan level_nama
        $request->validate([
            'level_kode' => "required|string|max:10|unique:m_level,level_kode,$id,level_id",
            'level_nama' => "required|string|max:100|unique:m_level,level_nama,$id,level_id",
        ]);

        // Update data level
        LevelModel::find($id)->update([
            'level_kode' => $request->level_kode,
            'level_nama' => $request->level_nama
        ]);

        return redirect('/level')->with('success', 'Data level berhasil diubah');
    }

    // Menghapus data level
    public function destroy(string $id)
    {
        $check = LevelModel::find($id); // Cek apakah data level ada
        if (!$check) {
            return redirect('/level')->with('error', "Data level tidak ditemukan");
        }

        try {
            LevelModel::destroy($id); // Hapus data level
            return redirect('/level')->with('success', 'Data level berhasil dihapus');
        } catch (QueryException $e) {
            // Jika gagal menghapus karena ada relasi dengan data lain
            return redirect('/level')->with('error', 'Data level gagal dihapus karena masih terkait dengan data lain');
        }
    }
}
