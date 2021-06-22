<?php

use App\Models\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // Seeder to create roles and assing them.
        $admin_role = Role::create(['name' => 'admin']);
        $accounter_role = Role::create(['name' => 'accounter']);
        $customer_role = Role::create(['name' => 'customer']);
        $admin_role->users()->attach(User::where('user_type', 1)->get());
        $accounter_role->users()->attach(User::where('user_type', 2)->get());
        $customer_role->users()->attach(User::where('user_type', 3)->get());
        // INSERT INTO `users` (`id`, `branch_id`, `first_name`, `last_name`, `user_type`, `position`, `email`, `phone`, `address`, `password`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES (NULL, '1', 'Super', 'Admin', '1', 'General Site Admin', 'siteadmin@gmail.com', '0781328723', 'mahdi', '$2y$10$6ImNZFVM9yJ7jePyKf7qEO59np2v9VuXXeZREIMYD8LlnlIafmdrC', '', NULL, '2020-12-23 06:48:10', '2021-02-17 04:42:55');
    }
}
