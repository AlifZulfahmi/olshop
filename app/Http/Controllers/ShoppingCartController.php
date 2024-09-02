<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Order;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Midtrans\Transaction;
use Midtrans\Snap;
use Midtrans\Config;

class ShoppingCartController extends Controller
{
    public function index()
    {
        if (!Auth::check()) {
            return redirect()->route('login');
        }

        $orders = Order::where('user_id', auth()->id())->get(); // Contoh pengambilan data
        return view('shopping-cart.index', compact('orders'));
    }

    public function addToCart(Request $request, $id)
    {
        if (!Auth::check()) {
            return redirect()->route('login');
        }

        $product = Product::find($id);

        if (!$product) {
            return redirect()->back()->with('error', 'Product not found');
        }

        // Periksa apakah produk sudah ada di keranjang
        $order = Order::where('user_id', Auth::id())->where('produk_id', $id)->first();


        if ($order) {
            // Update quantity jika produk sudah ada di keranjang
            $order->quantity += 1;
            $order->total_harga = $order->quantity * $product->price;
            $order->save();
        } else {
            // Tambahkan produk baru jika belum ada di keranjang
            Order::create([
                'user_id' => Auth::id(),
                'total_harga' => $product->price,
                'produk_id' => $product->id,
                'status' => 0,
                'quantity' => 1 // Tambahkan default quantity
            ]);
        }


        return redirect()->route('shopping-cart.index')->with('success', 'Product added to cart successfully!');
    }
    public function removeFromCart($id)
    {
        // Pastikan pengguna sudah login
        if (!Auth::check()) {
            return redirect()->route('login');
        }

        // Log ID produk yang diterima
        \Log::info('Attempting to remove product from cart', ['produk_id' => $id]);

        // Temukan order berdasarkan user_id dan produk_id
        $order = Order::where('user_id', Auth::id())->where('produk_id', $id)->first();

        // Jika order tidak ditemukan, tampilkan pesan kesalahan
        if (!$order) {
            \Log::warning('Product not found in cart', ['user_id' => Auth::id(), 'produk_id' => $id]);
            return redirect()->back()->with('error', 'Product not found in cart');
        }

        try {
            // Hapus order
            $order->delete();
            \Log::info('Product removed from cart successfully', ['user_id' => Auth::id(), 'produk_id' => $id]);
            return redirect()->route('shopping-cart.index')->with('success', 'Product removed from cart successfully!');
        } catch (\Exception $e) {
            \Log::error('Failed to remove product from cart', ['user_id' => Auth::id(), 'produk_id' => $id, 'error' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Failed to remove product from cart.');
        }
    }




    public function updateQuantity(Request $request, $id)
    {
        $request->validate([
            'quantity' => 'required|integer|min:1',
        ]);

        $order = Order::findOrFail($id);
        $product = Product::findOrFail($order->produk_id);

        $order->quantity = $request->input('quantity');
        $order->total_harga = $order->quantity * $product->price;
        $order->save();

        return redirect()->route('shopping-cart.index')->with('success', 'Quantity updated successfully');
    }

    public function checkout(Request $request)
    {
        if (!Auth::check()) {
            return redirect()->route('login');
        }

        // Mengarahkan ke rute proses checkout
        return redirect()->route('checkout.process');
    }
}
