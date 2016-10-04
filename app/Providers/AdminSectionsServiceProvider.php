<?php

namespace App\Providers;

use SleepingOwl\Admin\Providers\AdminSectionsServiceProvider as ServiceProvider;

class AdminSectionsServiceProvider extends ServiceProvider
{

    /**
     * @var array
     */
    protected $sections = [
        \App\Article::class => 'App\Http\Admin\Article',
        \App\Option::class => 'App\Http\Admin\Option',
        \App\Vote::class => 'App\Http\Admin\Vote',
        \App\Users_information::class => 'App\Http\Admin\Users_information',
        \App\User::class => 'App\Http\Admin\User',
        \App\User_vote::class => 'App\Http\Admin\User_vote',
    ];

    /**
     * Register sections.
     *
     * @return void
     */
    public function boot(\SleepingOwl\Admin\Admin $admin)
    {
    	//

        parent::boot($admin);
    }
}
