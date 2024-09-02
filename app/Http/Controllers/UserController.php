<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Arr;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;


class UserController extends Controller
{
    /**
     * Create a new controller instance with permission checks.
     */
    public function __construct()
    {
        $this->middleware('permission:user-list|user-create|user-edit|user-delete', ['only' => ['index', 'show']]);
        $this->middleware('permission:user-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:user-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:user-delete', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $data = User::latest()->paginate(10);

        return view('users.index', compact('data'))
            ->with('i', ($request->input('page', 1) - 1) * 10);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $permission = Permission::all();
        $roles = Role::pluck('name', 'name')->all();

        return view('users.create', compact('permission', 'roles'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): RedirectResponse
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|same:confirm-password',
            'roles' => 'required',
        ]);

        $input = $request->only('name', 'email', 'password');
        $input['password'] = Hash::make($input['password']);

        $user = User::create($input);
        $user->assignRole($request->input('roles'));

        return redirect()->route('users.index')
            ->with('success', 'User created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $user = User::find($id);

        return view('users.show', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $user = User::find($id);
        $roles = Role::pluck('name', 'name')->all();
        $userRole = $user->roles->pluck('name', 'name')->all();
        $permissions = Permission::all(); // Get all permissions to display

        return view('users.edit', compact('user', 'roles', 'userRole', 'permissions'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id): RedirectResponse
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email,' . $id,
            'password' => 'nullable|same:confirm-password',
            'roles' => 'required',
            'profile_image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'gender' => 'nullable|string',
            'address' => 'nullable|string',
        ]);

        $input = $request->only('name', 'email', 'gender', 'address');

        // Handle profile image upload
        if ($request->hasFile('profile_image')) {
            $imageName = time() . '.' . $request->file('profile_image')->getClientOriginalExtension();

            $user = User::find($id);
            if ($user->profile_image) {
                Storage::delete('public/images/' . $user->profile_image);
            }

            $request->file('profile_image')->storeAs('public/images', $imageName);
            $input['profile_image'] = $imageName;
        }

        // Update password if provided
        if ($request->filled('password')) {
            $input['password'] = Hash::make($request->input('password'));
        } else {
            $input = Arr::except($input, ['password']);
        }

        $user = User::find($id);
        $user->update($input);

        // Reassign roles
        DB::table('model_has_roles')->where('model_id', $id)->delete();
        $user->assignRole($request->input('roles'));

        return redirect()->route('users.index')
            ->with('success', 'User updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id): RedirectResponse
    {
        $user = User::find($id);

        if ($user->profile_image) {
            Storage::delete('public/profile_images/' . $user->profile_image);
        }

        $user->delete();

        return redirect()->route('users.index')
            ->with('success', 'User deleted successfully');
    }

    /**
     * Show the form for editing the authenticated user's profile.
     */
    public function editProfile(): View
    {
        $user = auth()->user(); // Get the authenticated user
        $roles = Role::pluck('name', 'name')->all(); // Get all roles
        $userRole = $user->roles->pluck('name', 'name')->all(); // Get user roles
        $permissions = Permission::all(); // Get all permissions to display

        return view('users.edit_profile', compact('user', 'roles', 'userRole', 'permissions'));
    }

    /**
     * Update the authenticated user's profile in storage.
     */
    public function updateProfile(Request $request): RedirectResponse
    {
        $user = auth()->user(); // Get the authenticated user

        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email,' . $user->id,
            'password' => 'nullable|same:confirm-password',
            'profile_image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'gender' => 'nullable|string',
            'address' => 'nullable|string',
        ]);

        $input = $request->only('name', 'email', 'gender', 'address');

        // Handle profile image upload
        if ($request->hasFile('profile_image')) {
            $imageName = time() . '.' . $request->file('profile_image')->getClientOriginalExtension();

            // Delete old profile image if exists
            if ($user->profile_image) {
                Storage::delete('public/images/' . $user->profile_image);
            }

            $request->file('profile_image')->storeAs('public/images', $imageName);
            $input['profile_image'] = $imageName;
        }

        // Update password if provided
        if ($request->filled('password')) {
            $input['password'] = Hash::make($request->input('password'));
        }

        $user->update($input);

        return redirect()->route('home')
            ->with('success', 'Profile updated successfully');
    }
}
