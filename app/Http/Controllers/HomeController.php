<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    // /**
    //  * Create a new controller instance.
    //  *
    //  * @return void
    //  */
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $products = Product::latest()->take(8)->get();
        $categories = Category::all();
        $subCategories = Category::whereNotNull('parent_id')->get();

        return view('landing', compact('products', 'subCategories', 'categories'));
    }

    public function home()
    {
        // Retrieve the latest 8 products
        $products = Product::latest()->take(8)->get();

        // Retrieve all categories
        $categories = Category::all();

        // Retrieve subcategories (categories with a non-null parent_id)
        $subCategories = Category::whereNotNull('parent_id')->get();

        // Calculate counts
        $userCount = User::count(); // Total number of users
        $productCount = Product::count(); // Total number of products
        $transactionCount = Transaction::count(); // Total number of transactions
        $income = Transaction::where('status', 'success')->sum('price'); // Total income from successful transactions

        // Pass the retrieved data to the 'home' view
        return view('home', [
            'products' => $products,
            'categories' => $categories,
            'subCategories' => $subCategories,
            'userCount' => $userCount,
            'productCount' => $productCount,
            'transactionCount' => $transactionCount,
            'income' => $income,
        ]);
    }



    public function getProducts()
    {
        $products = Product::all(); // Mengambil semua data produk

        return view('shop', compact('products')); // Mengirim data produk ke view welcome
    }

    public function beli($id)
    {
        if (!Auth::check()) {
            return redirect()->route('login');
        }

        $product = Product::find($id);

        if (!$product) {
            return redirect()->back()->with('error', 'Product not found');
        }

        Order::create([
            'user_id' => Auth::user()->id,
            'total_harga' => $product->price,
            'produk_id' => $product->id,
            'status' => 0
        ]);

        return redirect()->back()->with('success', 'Product purchased successfully!');
    }

    public function categories()
    {
        $products = Product::latest()->take(8)->get();
        $categories = Category::all();
        $subCategories = Category::whereNotNull('parent_id')->get();

        return view('categories', compact('products', 'subCategories', 'categories'));
    }
}
