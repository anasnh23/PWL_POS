<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserModel extends Model
{
    use HasFactory;

    protected $table = 'm_user';        // Mendefinisikan nama tabel yang digunakan UserModel
    protected $primaryKey = 'user_id';  // Mendefinisikan primary key dari tabel yang digunakan

    // Kolom yang dapat diisi (mass assignable)
    protected $fillable = ['level_id', 'username', 'nama', 'password'];

    //modifikasi 
    // protected $fillable = ['level_id', 'username', 'nama'];

    public function level(): BelongsTo
{
    return $this->belongsTo(LevelModel::class, 'level_id', 'level_id');
}


    
}