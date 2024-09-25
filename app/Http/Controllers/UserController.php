<?php

namespace App\Http\Controllers;

use App\Models\LevelModel;
use App\Models\UserModel;   // mengimpor model UserModel
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;    // mengimpor kelas Hash
use Yajra\DataTables\Facades\DataTable; // mengimpor kelas DataTable
use Yajra\DataTables\Facades\DataTables;

class UserController extends Controller {
    //Jobsheet 3
    // public function index()
    // {
    //     // Data yang akan digunakan untuk update
    //     $data = [
    //         'username' => 'Customer-1',
    //         'nama' => 'Pelanggan Pertama',
    //         'password' => Hash::make('12345'),
    //         'level_id' => 4
    //     ];

    //     // update data user 
    //     $affectedRows = UserModel::where('username', 'customer-1')->update($data);

    //     // Jika tidak ada data yang terupdate, tambahkan data baru
    //     // if ($affectedRows === 0) {
    //     //     UserModel::insert($data); // Menambahkan data ke tabel m_user
    //     // }

    //     // Mengambil semua data dari tabel m_user
    //     $user = UserModel::all();
    //     return view('user', ['data' => $user]);
    // }


    //Jobsheet 4-Prartikum 1
    // public function index()
    // {
    //     $data = [
    //         'level_id' => 2,
    //         'username' => 'manager_tiga',
    //         'nama' => 'Manager 3',
    //         'password' => Hash::make('12345')
    //     ];
    //     UserModel::create($data);
    //     //coba akses model usermodel
    //     $user = UserModel::all(); //ambil semua data dari tabel m_user
    //     return view('user', ['data' => $user]);
    // }

    //jobsheet 4-Prartikum 2.1
    // public function index() {

        // $user = UserModel::find(1);
        // $user = UserModel::where('level_id', 1)->first();
        // $user = UserModel::firstWhere('level_id', 1);
    //     $user = UserModel::findOr(20, ['username', 'nama'], function(){
    //         abort(404);
    // });
    //     return view('user',['data' => $user]);
    // }

    //jobsheet 4-Prartikum 2.2
    // public function index() {

        // $user = UserModel::findOrFail(1);
    //     $user = UserModel::where('username', 'manager9')->firstOrFail();
    //     return view('user',['data' => $user]);

    // }

        //jobsheet 4-Prartikum 2.3
        // public function index() {

            // $user = UserModel::where('level_id', '2')->count();dd($user);
        //     $user = UserModel::where('level_id', 2)->count(); 
        //     return view('user',['data' => $user]);
    
        // }

         //jobsheet 4-Prartikum 2.4
        // public function index() {
        //     $user = UserModel::firstOrNew(
        //         [
        //                 'username' => 'manager33',
        //                 'nama' => 'Manager Tiga Tiga',
        //                 'password' => Hash::make('12345'),
        //                 'level_id' => 2

        //         ],
        //     ); 
        //     $user->save();
        //     return view('user',['data' => $user]);
    
        // }

        //Jobsheet 4-Prartikum 2.5
        // public function index() {
        //     $user = UserModel::create([
        //         'username' => 'manager55',
        //         'nama' => 'Manager55',
        //         'password' => Hash::make(12345),
        //         'level_id' => 2,
        // ]);
        
        // $user->username = 'manager56';
        
        // $user->isDirty(); // true
        // $user->isDirty('username'); // true
        // $user->isDirty('nama'); // false
        // $user->isDirty(['nama', 'username']); // true
        
        // $user->isClean(); // false
        // $user->isClean('username'); // false
        // $user->isClean('nama'); // true
        // $user->isClean(['nama', 'username']); // false
        
        // $user->save();
        
        // $user->isDirty(); // false
        // $user->isClean(); // true
        // dd($user->isDirty());


        //Modifikasi 
        // $user = UserModel::create([
        //     'username' => 'manager11',
        //     'nama' => 'Manager11',
        //     'password' => Hash::make(12345),
        //     'level_id' => 2,
        // ]);
        
        // $user->username = 'manager12';
        
        // $user->save();
        
        // $user->wasChanged(); // true
        // $user->wasChanged('username'); // true
        // $user->wasChanged(['username', 'level_id']); // true
        // $user->wasChanged('nama'); // false
        // dd($user->wasChanged(['nama', 'username'])); //true
        //     }
    
        //Jobsheet 4-Prartikum 2.6
        // public function index() {
            
        //     $user = UserModel::all();
        //     return view('user', ['data' => $user]);
        // }

        // public function tambah() {
        //     return view('user_tambah');
        // }

        // public function tambah_simpan(Request $request){
        //     UserModel::create([
        //         'username' => $request->username,
        //         'nama' => $request->nama,
        //         'password' => Hash::make($request->password),
        //         'level_id' => $request->level_id
        //     ]);
        
        //     return redirect('/user');
        // }

        // public function ubah($id){

        //     $user = UserModel::find($id);
        //     return view('user_ubah', ['data' => $user]);
        // }
        
        // public function ubah_simpan($id, Request $request){
        //     $user = UserModel::find($id);

        //     $user->username = $request->username;
        //     $user->nama = $request->nama;
        //     $user->password = Hash::make('$request->password');
        //     $user->level_id = $request->level_id;

        //     $user->save();

        //     return redirect ('/user');
        // }

        // public function hapus($id){
        //     $user = UserModel::find($id);
        //     $user->delete();

        //     return redirect('/user');
        // }

        //Pratikum 2.7
        // public function index(){
        //     $user = UserModel::with('level')->get();
        //     dd($user);
        // }

        // public function index(){
            
        // $user = UserModel::with('level')->get();
        // return view('user', ['data' => $user]);
        // }

        //menampilkan halaman user
        public function index() {
        
            $breadcrumb = (object) [
                'title' => 'Daftar User',
                'list' => ['Home', 'User']
            ];
            
            $page = (object) [
                'title' => 'Daftar user yang terdaftar dalam sistem'
            ];

            $activeMenu = 'user';
    
            return view('user.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'activeMenu' => $activeMenu]);
        }

    // Ambil data user dalam bentuk json untuk datatables
    public function list(Request $request)
    {
    $users = UserModel::select('user_id', 'username', 'nama', 'level_id')
        ->with('level');
    
    return DataTables::of($users)
        // menambahkan kolom index / no urut (default nama kolom: DT_RowIndex)
        ->addIndexColumn()
        ->addColumn('aksi', function ($user) { // menambahkan kolom aksi
            $btn = '<a href="'.url('/user/' . $user->user_id).'" class="btn btn-info btn-sm">Detail</a> ';
            $btn .= '<a href="'.url('/user/' . $user->user_id . '/edit').'" class="btn btn-warning btn-sm">Edit</a> ';
            $btn .= '<form class="d-inline-block" method="POST" action="'.url('/user/'.$user->user_id).'">'
                . csrf_field() . method_field('DELETE') .
                '<button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Apakah Anda yakin menghapus data ini?\');">Hapus</button></form>';
            return $btn;
        })
        ->rawColumns(['aksi']) // memberitahu bahwa kolom aksi adalah html
        ->make(true);
    }

    // Menampilkan halaman form tambah user
    public function create()
    {
        $breadcrumb = (object) [
            'title' => 'Tambah User',
            'list' => ['Home', 'User', 'Tambah']
        ];

        $page = (object) [
            'title' => 'Tambah user baru'
        ];

        $level = LevelModel::all(); // Ambil data level untuk ditampilkan di form
        $activeMenu = 'user'; // Set menu yang sedang aktif

        return view('user.create', [
            'breadcrumb' => $breadcrumb,
            'page' => $page,
            'level' => $level,
            'activeMenu' => $activeMenu
        ]);
    }


}