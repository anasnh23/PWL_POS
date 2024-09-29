@extends('layouts.template')

@section('content')
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">Tambah Kategori</h3>
    </div>
    <div class="card-body">
        <form method="POST" action="{{ url('kategori') }}">
            @csrf
            
            <div class="form-group">
                <label for="kode_kategori">Kode Kategori</label>
                <input type="text" class="form-control" id="kode_kategori" name="kode_kategori" value="{{ old('kode_kategori') }}" required>
                @error('kode_kategori')
                    <small class="form-text text-danger">{{ $message }}</small>
                @enderror
            </div>
            
            <div class="form-group">
                <label for="nama_kategori">Nama Kategori</label>
                <input type="text" class="form-control" id="nama_kategori" name="nama_kategori" value="{{ old('nama_kategori') }}" required>
                @error('nama_kategori')
                    <small class="form-text text-danger">{{ $message }}</small>
                @enderror
            </div>

            <button type="submit" class="btn btn-primary">Simpan</button>
            <a href="{{ url('kategori') }}" class="btn btn-default">Kembali</a>
        </form>
    </div>
</div>
@endsection
