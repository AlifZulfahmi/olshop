@extends('layouts.LandingApp')

@section('title', 'Category')

@section('content')
    <div class="container mx-auto p-6 max-w-screen-xl">
        <h1 class="text-3xl font-bold text-gray-900 mb-10 mt-8 text-center">Categories</h1>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            @foreach ($subCategories as $subCategory)
                <a href="/shop?category={{ $subCategory->name }}">
                    <div class="bg-white rounded shadow-md overflow-hidden flex items-center py-3 px-3">
                        <svg class="w-[48px] h-[48px] text-gray-800 dark:text-white justify-center" aria-hidden="true"
                            xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                            viewBox="0 0 24 24">
                            <path
                                d="M5 3a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2H5Zm14 18a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h4ZM5 11a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2H5Zm14 2a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h4Z" />
                        </svg>

                        <div class="p-6">
                            <h2 class="text-md font-semibold text-gray-800 mb-2">{{ $subCategory->name }}</h2>
                        </div>
                    </div>
                </a>
            @endforeach
        </div>
    </div>
@endsection
