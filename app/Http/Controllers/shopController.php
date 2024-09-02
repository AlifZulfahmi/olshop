<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class shopController extends Controller
{
    public function index(Request $request)
    {
        // Ambil semua kategori
        $categories = Category::all();

        $products = Product::filter(request(['search', 'category']))->latest()->paginate(12);

        return view('shop', compact('products', 'categories'));
    }
}
