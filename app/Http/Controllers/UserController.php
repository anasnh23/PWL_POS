<?php

namespace App\Http\Controllers;

use App\Models\LevelModel;   //mengimpor model LevelModel
use App\Models\UserModel;   //mengimpor model UserModel
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Validator;   //mengimpor validator

use Illuminate\Support\Facades\Hash;    //mengimpor kelas Hash

class UserController extends Controller
{
    public function index()
    {

        //tambah data user dengan Eloquent Model
        /*$data = [
            /*'username' => 'customer-1',
            'nama' => 'Pelanggan',
            'password' => Hash::make('12345'),
            'level_id' => 4
            'nama' => 'Pelanggan Pertama'
        ];*/
        //UserModel::insert($data);   //menambahkan data ke tabel m_user

        //update data user dengan Eloquent Model
        //UserModel::where('username', 'customer-1')->update($data);

        //tambah data user dengan Eloquent ORM
        /*$data = [
            'level_id' => 2,
            'username' => 'manager_tiga',
            'nama' => 'Manager 3',
            'password' => Hash::make('12345'),
        ];
        //buat data user dengan Eloquent ORM
        UserModel::create($data);*/

        /*$user = UserModel::firstOrCreate(
            [
                'username' => 'manager22',
                'nama' => 'Manager Dua Dua',
                'password' => Hash::make('12345'),
                'level_id' => 2
            ],
        );*/

        /*$user = UserModel::firstOrNew(
            [
                'username' => 'manager333',
                'nama' => 'Manager Tiga Tiga',
                'password' => Hash::make('12345'),
                'level_id' => 2
            ],
        );
        $user->save();  //menyimpan data baru yang dibuat metode firstOrNew*/

        /*$user = UserModel::create(
            [
                'username' => 'manager11',
                'nama' => 'Manager11',
                'password' => Hash::make('12345'),
                'level_id' => 2
            ]);

            $user->username = 'manager12';

            /*$user->isDirty();   //true
            $user->isDirty('username'); //true
            $user->isDirty('nama'); //false
            $user->isDirty(['nama', 'username']); //true

            $user->isClean();   //false
            $user->isClean('username'); //false
            $user->isClean('nama'); //true
            $user->isClean(['nama', 'username']); //false

            $user->save();

            /*$user->isDirty();   //false
            $user->isClean();   //true
            dd($user->isDirty());

            $user->wasChanged();    //true
            $user->wasChanged('username');    //true
            $user->wasChanged(['username', 'level_id']);    //true
            $user->wasChanged('nama');    //false
            dd($user->wasChanged(['nama', 'username']));    //true*/
        
        //coba akses model UserModel
        /*$user = UserModel::all(); //mengambil semua data dari tabel m_user
        $user = UserModel::find(1); //ambil model dengan primary key
        $user = UserModel::where('level_id', 1)->first(); //ambil model pertama yang cocok dengan batasan kueri...
        $user = UserModel::firstWhere('level_id', 1); //alternatif ambil model pertama yang cocok dengan batasan kueri...
        $user = UserModel::findOr(20, ['username', 'nama'], function() {
            abort(404);
        });
        $user = UserModel::findOrFail(1);
        $user = UserModel::where('username', 'manager9')->firstOrFail();
        $user = UserModel::where('level_id', 2)->count();
        $user = UserModel::with('level')->get();
        dd($user);  //dd (dump and die) di sini berfungsi untuk membaca keseluruhan data pada tabel m_user
        return view('user', ['data' => $user]);*/

        $breadcrumb = (object) [
            'title' => 'Daftar User',
            'list' => ['Home', 'User']
        ];

        $page = (object) [
            'title' => 'Daftar user yang terdaftar dalam sistem'
        ];

        $activeMenu = 'user'; //set menu yang sedang aktif

        $level = LevelModel::all(); //ambil data level untuk filter level

        return view('user.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'level' => $level, 'activeMenu' =>$activeMenu]);
    }

    /*public function tambah()
    {
        return view('user_tambah');
    }

    public function tambah_simpan(Request $request)
    {
        UserModel::create([
            'username' => $request->username,
            'nama' => $request->nama,
            'password' => Hash::make('$request->password'),
            'level_id' => $request->level_id
        ]);
        return redirect('/user');
    }

    public function ubah($id)
    {
        $user = UserModel::find($id);
        return view('user_ubah', ['data' => $user]);
    }

    public function ubah_simpan($id, Request $request)
    {
        $user = UserModel::find($id);
        
        $user->username = $request->username;
        $user->nama = $request->nama;
        $user->password = Hash::make('$request->password');
        $user->level_id = $request->level_id;

        $user->save();
        
        return redirect('/user');
    }

    public function hapus($id)
    {
        $user = UserModel::find($id);
        $user->delete();

        return redirect('/user');
    }*/

    // Ambil data user dalam bentuk json untuk datatables
    // Ambil data user dalam bentuk json untuk datatables
    public function list(Request $request)
    {
        $users = UserModel::select('user_id', 'username', 'nama', 'foto', 'level_id')
                    ->with('level');
    
        // Filter data user berdasarkan level_id
        if ($request->level_id) {
            $users->where('level_id', $request->level_id);
        }
    
        return DataTables::of($users)
            ->addIndexColumn()
            // Menambahkan kolom foto
            ->editColumn('foto', function ($user) {
                if ($user->foto) {
                    return '<img src="' . asset($user->foto) . '" style="width: 50px; height: 50px;" />';
                }
                return 'Foto kosong';  // Jika tidak ada foto
            })
            // Menambahkan kolom aksi
            ->addColumn('aksi', function ($user) {
                $btn = '<button onclick="modalAction(\''.url('/user/' . $user->user_id . '/show_ajax').'\')" class="btn btn-info btn-sm">Detail</button> ';
                $btn .= '<button onclick="modalAction(\''.url('/user/' . $user->user_id . '/edit_ajax').'\')" class="btn btn-warning btn-sm">Edit</button> ';
                $btn .= '<button onclick="modalAction(\''.url('/user/' . $user->user_id . '/delete_ajax').'\')" class="btn btn-danger btn-sm">Hapus</button> ';
                return $btn;
            })
            ->rawColumns(['foto', 'aksi']) // Supaya HTML di kolom foto dan aksi dirender dengan benar
            ->make(true);
    }
    


    //Menampilkan laman form tambah user
    public function create()
    {
        $breadcrumb = (object) [
            'title' => 'Tambah User',
            'list' => ['Home', 'User', 'Tambah']
        ];

        $page = (object) [
            'title' => 'Tambah user baru'
        ];

        $level = LevelModel::all(); //ambil data level untuk ditampilkan di form
        $activeMenu = 'user'; //set menu yang sedang aktif

        return view('user.create', ['breadcrumb' => $breadcrumb, 'page' => $page, 'level' => $level, 'activeMenu' =>$activeMenu]);
    }

    //Menyimpan data user baru
    public function store(Request $request)
    {
        $request->validate([
            //username harus diisi, berupa string, minimal 3 karakter, dan bernilai unik di tabel m_user kolom username
            'username'  => 'required|string|min:3|unique:m_user,username',
            'nama'      => 'required|string|max:100',   //nama harus diisi, berupa string, dan maksimal 100 karakter
            'password'  => 'required|min:5',            //password harus diisi dan minimal 5 karakter
            'level_id'  => 'required|integer'           //level_id harus diisi dan berupa angka
        ]);

        UserModel::create([
            'username'  => $request->username,
            'nama'      => $request->nama,
            'password'  => bcrypt($request->password),  //password dienkripsi sebelum disimpan
            'level_id'  => $request->level_id
        ]);

        return redirect('/user')->with('success', 'Data user berhasil disimpan!');
    }

    //Menampilkan laman form tambah user baru AJAX
    public function create_ajax()
    {
        $level = LevelModel::select('level_id', 'level_nama')->get();

        return view('user.create_ajax')
                    ->with('level', $level);
    }

    //Menyimpan data user baru AJAX
    public function store_ajax(Request $request)
{
    // Periksa apakah request berupa AJAX
    if ($request->ajax() || $request->wantsJson()) {
        $rules = [
            'level_id'  => 'required|integer',
            'username'  => 'required|string|min:3|unique:m_user,username',
            'nama'      => 'required|string|max:100',
            'password'  => 'required|min:5',
            'foto'      => 'nullable|mimes:jpeg,png,jpg|max:4096'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status'    => false,
                'message'   => 'Validasi Gagal!',
                'msgField'  => $validator->errors()
            ]);
        }

        // Siapkan variabel untuk path foto
        $fotoPath = null;

        // Jika ada file foto yang diupload
        if ($request->hasFile('foto')) {
            $file = $request->file('foto');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $path = 'adminlte/dist/img/';
            $file->move(public_path($path), $filename);

            // Simpan path ke variabel
            $fotoPath = $path . $filename;
        }

        // Simpan data user ke dalam database
        UserModel::create([
            'username'  => $request->username,
            'nama'      => $request->nama,
            'password'  => bcrypt($request->password),  // Enkripsi password
            'level_id'  => $request->level_id,
            'foto'      => $fotoPath  // Simpan path foto, null jika tidak ada foto
        ]);

        return response()->json([
            'status'    => true,
            'message'   => 'Data user berhasil disimpan!'
        ]);
    }

    return redirect('/');
}


    //Menampilkan form detil data user AJAX
    public function show_ajax($id)
    {
        $user = UserModel::find($id);
        
        return view('user.show_ajax', ['user' => $user]);
    }

    //Menampilkan detil data user
    public function show(string $id)
    {
        $user = UserModel::with('level')->find($id);

        $breadcrumb = (object) [
            'title' => 'Detail User',
            'list' => ['Home', 'User', 'Detail']
        ];

        $page = (object) [
            'title' => 'Detail user'
        ];

        $activeMenu = 'user'; //set menu yang sedang aktif

        return view('user.show', ['breadcrumb' => $breadcrumb, 'page' => $page, 'user' => $user, 'activeMenu' => $activeMenu]);
    }

    //Menampilkan laman form edit user
    public function edit(string $id)
    {
        $user = UserModel::find($id);
        $level = LevelModel::all();

        $breadcrumb = (object) [
            'title' => 'Edit User',
            'list' => ['Home', 'User', 'Edit']
        ];

        $page = (object) [
            'title' => 'Edit user'
        ];

        $activeMenu = 'user'; //set menu yang sedang aktif

        return view('user.edit', ['breadcrumb' => $breadcrumb, 'page' => $page, 'user' => $user, 'level' => $level, 'activeMenu' => $activeMenu]);
    }

    //Menyimpan perubahan data user
    public function update(Request $request, string $id)
    {
        $request->validate([
            //username harus diisi, berupa string, minimal 3 karakter, dan bernilai unik di tabel m_user kolom username kecuali untuk user dengan id yang sedang diedit
            'username' => 'required|string|min:3|unique:m_user,username,' . $id . ',user_id', 
            'nama'     => 'required|string|max:100',    //nama harus diisi, berupa string, dan maksimal 100 karakter
            'password' => 'nullable|min:5',             //password bisa diisi (minimal 5 karakter) dan bisa tidak diisi
            'level_id' => 'required|integer'            //level_id harus diisi dan berupa angka
        ]);

        UserModel::find($id)->update([
            'username' => $request->username,
            'nama'     => $request->nama,
            'password' => $request->password ? bcrypt($request->password) : UserModel::find($id)->password,
            'level_id' => $request->level_id
        ]);
        return redirect('/user')->with('success', 'Data user berhasil diubah!');
    }

    //Menampilkan laman form edit user AJAX
    public function edit_ajax(string $id)
    {
        $user = UserModel::find($id);
        $level = LevelModel::select('level_id', 'level_nama')->get();

        return view('user.edit_ajax', ['user' => $user, 'level' => $level]);
    }

    //Menyimpan perubahan data user AJAX
    public function update_ajax(Request $request, $id){
        //periksa bila request dari ajax atau bukan
        if($request->ajax() || $request->wantsJson()) {
            $rules = [
                'level_id' => 'required|integer',
                'username' => 'required|max:20|unique:m_user,username,'.$id.',user_id',
                'nama'     => 'required|max:100',
                'password' => 'nullable|min:5|max:20',
                'foto'     => 'nullable|mimes:jpeg,png,jpg|max:4096'
            ];

            // use Illuminate\Support\Facades\Validator;
            $validator = Validator::make($request->all(), $rules);
            
            if ($validator->fails()) {
                return response()->json([
                    'status' => false, // respon json, true: berhasil, false: gagal
                    'message' => 'Validasi gagal!',
                    'msgField' => $validator->errors() // menunjukkan field mana yang error
                ]);
            }

            $check = UserModel::find($id);
            if ($check) {
                if(!$request->filled('password') ){ // jika password tidak diisi, maka hapus dari request
                    $request->request->remove('password');
                }

                $request['password'] = Hash::make($request->password);

                if ($request->has('foto')) {
                    $file = $request->file('foto');
                    $extension = $file->getClientOriginalExtension();

                    $filename = time() . '.' . $extension;

                    $path = 'adminlte/dist/img/';
                    $file->move($path, $filename);
                    $check->foto = $path . $filename; // Update foto hanya jika ada file baru
                }

                /*if (!$request->filled('foto')) { // jika foto tidak diisi, maka hapus dari request 
                    $request->request->remove('foto');
                }*/

                $check->update([
                    'username'  => $request->username,
                    'nama'      => $request->nama,
                    'password'  => $request->password ? bcrypt($request->password) : UserModel::find($id)->password,
                    'level_id'  => $request->level_id,
                    //'foto'      => $path.$filename
                ]);
                return response()->json([
                    'status' => true,
                    'message' => 'Data berhasil diupdate!'
                ]);
            } else{
                return response()->json([
                    'status' => false,
                    'message' => 'Data tidak ditemukan!'
                ]);
            }
        }
        return redirect('/');
    }

    //Menampilkan laman form konfirmasi hapus data user AJAX
    public function confirm_ajax(string $id){
        $user = UserModel::find($id);

        return view('user.confirm_ajax', ['user' => $user]);
    }

    //Menghapus data user AJAX
    public function delete_ajax(Request $request, $id)
    {
        //periksa bila request dari AJAX atau bukan
        if ($request->ajax() || $request->wantsJson()){
            $user = UserModel::find($id);
            if ($user) {
                $user->delete();
                return response()->json([
                    'status'    => true,
                    'message'   => 'Data berhasil dihapus!'
                ]);
            } else {
                return response()->json([
                    'status'    => false,
                    'message'   => 'Data tidak ditemukan!'
                ]);
            }
        }
        return redirect('/');
    }

    public function import()
    {
        return view('user.import');
    }

    public function import_ajax(Request $request)
    {
        if($request->ajax() || $request->wantsJson()){
            $rules = [
                // validasi file harus xls atau xlsx, max 1MB
                'file_user' => ['required', 'mimes:xlsx', 'max:1024']
            ];
            $validator = Validator::make($request->all(), $rules);
            if($validator->fails()){
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi Gagal',
                    'msgField' => $validator->errors()
                ]);
            }
            $file = $request->file('file_user'); // ambil file dari request
            $reader = IOFactory::createReader('Xlsx'); // load reader file excel
            $reader->setReadDataOnly(true); // hanya membaca data
            $spreadsheet = $reader->load($file->getRealPath()); // load file excel
            $sheet = $spreadsheet->getActiveSheet(); // ambil sheet yang aktif
            $data = $sheet->toArray(null, false, true, true); // ambil data excel
            $insert = [];
            if(count($data) > 1){ // jika data lebih dari 1 baris
                foreach ($data as $baris => $value) {
                    if($baris > 1){ // baris ke 1 adalah header, maka lewati
                        $insert[] = [
                            'username' => $value['A'],
                            'nama' => $value['B'],
                            'level_id' => $value['C'],
                            'created_at' => now(),
                        ];
                    }
                }
                if(count($insert) > 0){
                    // insert data ke database, jika data sudah ada, maka diabaikan
                    UserModel::insertOrIgnore($insert);
                }
                return response()->json([
                    'status' => true,
                    'message' => 'Data user berhasil diimpor'
                ]);
            }else{
                return response()->json([
                    'status' => false,
                    'message' => 'Tidak ada data user yang diimpor'
                ]);
            }
        }
        return redirect('/');
    }

    public function export_excel()
    {
        //ambil data user yang akan diekspor
        $user = UserModel::select('level_id', 'username', 'nama')
                    ->orderBy('level_id')
                    ->with('level')
                    ->get();
                    //dd($user);
        //load library excel
        $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet(); //ambil sheet yang aktif

        $sheet->setCellValue('A1', 'No.');
        $sheet->setCellValue('B1', 'Username');
        $sheet->setCellValue('C1', 'Nama');
        $sheet->setCellValue('D1', 'Level Pengguna');
        
        $sheet->getStyle('A1:D1')->getFont()->setBold(true); //bold header

        $no = 1; //nomor data dimulai dari 1
        $baris = 2; //baris data dimulai dari baris ke-2
        foreach($user as $key => $value){
            $sheet->setCellValue('A'.$baris,$no);
            $sheet->setCellValue('B'.$baris,$value->username);
            $sheet->setCellValue('C'.$baris,$value->nama);
            $sheet->setCellValue('D'.$baris,$value->level->level_nama);
            $baris++;
            $no++;
        }
        foreach(range('A', 'D') as $columnID){
            $sheet->getColumnDimension($columnID)->setAutoSize(true); //set auto size untuk kolom
        }
        $sheet->setTitle('Data User'); //set title sheet

        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $filename = 'Data User ' . date('Y-m-d H:i:s') . '.xlsx';
        //dd($filename);

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
        header('Cache-Control: cache, must-revalidate');
        header('Pragma: public');

        $writer->save('php://output');
        exit;
    } //end function export_excel

    public function export_pdf()
    {
        $user = UserModel::select('level_id', 'username', 'nama')
                    ->orderBy('level_id')
                    ->with('level')
                    ->get();
                    
        //use Barryvdh\DomPDF\Facade\Pdf;
        $pdf = Pdf::loadView('user.export_pdf', ['user' => $user]);
        $pdf->setPaper('a4', 'portrait'); //set ukuran kertas dan orientasi
        $pdf->setOption("isRemoteEnabled", true); //set true jika ada gambar dari url
        $pdf->render();

        return $pdf->stream('Data User '.date('Y-m-d H:i:s').'.pdf');
    }

    //Menghapus data user
    public function destroy(string $id)
    {
        $check = UserModel::find($id);
        if (!$check) {  //untuk mengecek bila data user dengan id tertentu ada atau tidak
            return redirect('/user')->with('error', 'Data user tidak ditemukan!');
        } 
        
        try{
            UserModel::destroy($id);    //hapus data level

            return redirect('/user')->with('success', 'Data user berhasil dihapus!');
        } catch (\Illuminate\Database\QueryException){

            //jika eror ketika menghapus data, redirect kembali ke laman dengan membawa pesan eror
            return redirect('/user')->with('error', 'Data user gagal dihapus karena terdapat tabel lain yang terkait dengan data ini!');
        }
    }
}
