<?php

use App\Http\Controllers\KategoriController;
use App\Http\Controllers\LevelController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WelcomeController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function() {
//     return view('welcome');
// });

//Jobsheet 4
// Route::get('/level', [LevelController::class, 'index']);
// Route::get('/kategori', [KategoriController::class, 'index']);
// Route::get('/user', [UserController::class, 'index']);
// Route::get('/user/tambah', [UserController::class, 'tambah']);
// Route::post('/user/tambah_simpan', [UserController::class, 'tambah_simpan']);
// Route::get('/user/ubah/{id}', [UserController::class, 'ubah']);
// Route::put('/user/ubah_simpan/{id}', [UserController::class, 'ubah_simpan']);
// Route::get('/user/hapus/{id}', [UserController::class, 'hapus']);

//Jobsheet 5
Route::get('/', [WelcomeController::class, 'index']);

route::group(['prefix'=>'user'], function() {
    route::get('/', [UserController::class, 'index']); //Menampilkan halaman awal user
    route::post('/list', [UserController::class, 'list']); //Menampilkan data user dalam bentuk json untuk datatables
    route::get('/create', [UserController::class, 'create']); //Menampilkan halaman form tambah user
    route::post('/', [UserController::class, 'store']); //Menampilkan data user baru
    route::get('/{id}', [UserController::class, 'show']); //Menampilkan detail user
    route::get('/{id}/edit', [UserController::class, 'edit']); //Menampilkan halaman form user
    route::put('/{id}', [UserController::class, 'update']); //Menampilkan perubahan data user
    route::delete('/{id}', [UserController::class, 'hapus']); //Menghapus data user

});