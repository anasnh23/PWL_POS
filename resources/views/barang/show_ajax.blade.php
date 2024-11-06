@empty($barang)
    <div id="modal-master" class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Terjadi kesalahan!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger">
                    <h5><i class="icon fas fa-ban"></i>Terjadi kesalahan!</h5>
                    Data yang Anda cari tidak ditemukan!</div>
                <a href="{{ url('/barang') }}" class="btn btn-warning">Kembali</a>
            </div>
        </div>
    </div>
@else
    @csrf
    <div id="modal-master" class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Detil Data Barang</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <table class="table table-sm table-bordered table-striped">
                    <tr><th class="text-right col-4">Kategori Barang :</th><td class="col-9">{{$barang->kategori->kategori_nama }}</td></tr>
                    <tr><th class="text-right col-4">Kode :</th><td class="col-9">{{$barang->barang_kode }}</td></tr>
                    <tr><th class="text-right col-4">Nama :</th><td class="col-9">{{ $barang->barang_nama }}</td></tr>
                    <tr><th class="text-right col-4">Harga Beli :</th><td class="col-9">{{ $barang->harga_beli }}</td></tr>
                    <tr><th class="text-right col-4">Harga Jual :</th><td class="col-9">{{ $barang->harga_jual }}</td></tr>
                    <tr>
                        <th class="text-right col-4">Barang Image :</th>
                        <td class="col-9">
                            @if($barang->image && filter_var($barang->image, FILTER_VALIDATE_URL))
                                <img width="150px" src="{{ $barang->image }}" alt="Barang picture">
                            @elseif($barang->image && file_exists(public_path('storage/' . $barang->image)))
                                <img width="150px" src="{{ asset('storage/' . $barang->image) }}" alt="Barang picture">
                            @else
                                <span>Foto kosong</span>
                            @endif
                        </td>
                    </tr>
                </table>
                
                    
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-warning">Tutup</button>
            </div>
        </div>
    </div>
@endempty