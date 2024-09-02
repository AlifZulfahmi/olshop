@extends('layouts.LandingApp')

@section('title', 'Checkout Berhasil')

@section('content')
    <div class="flex justify-center items-center min-h-screen bg-gray-100">
        <div class="bg-white shadow-lg rounded-lg p-8 text-center">
            <h1 class="text-2xl font-bold text-green-600 mb-4">Pembayaran Berhasil</h1>
            <p class="text-lg text-green-600 mb-6">Terima kasih telah melakukan pembayaran</p>
            <a href="{{ route('transactions') }}"
                class="inline-block bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400">
                Lihat Transaksi
            </a>
        </div>
    </div>
@endsection
