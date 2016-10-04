<?php

use SleepingOwl\Admin\Navigation\Page;


return [
    [
        'title' => 'Актуальная информация',
        'icon' => 'fa fa-newspaper-o',
        'priority'=>'1',
        'model' => \App\Article::class,
    ],

    [
        'title' => 'Голосования',
        'icon'  => 'fa fa-group',
        'priority'=>'2',
        'pages' => [
            (new Page(\App\User_vote::class))
                ->setIcon('fa fa-newspaper-o')
                ->setPriority(1)
                ->setTitle('Ответы пользователя'),
            (new Page(\App\Option::class))
                ->setIcon('fa fa-newspaper-o')
                ->setPriority(3)
                ->setTitle('Варианты ответов'),
            (new Page(\App\Vote::class))
                ->setIcon('fa fa-newspaper-o')
                ->setPriority(2)
                ->setTitle('Вопросы голосования')
        ]
    ],
    [
        'title' => 'Пользователи',
        'icon'  => 'fa fa-group',
        'priority'=>'3',
        'pages' => [
            (new Page(\App\User::class))
                ->setIcon('fa fa-user')
                ->setPriority(1)
                ->setTitle('Зарегистрированые'),
            (new Page(\App\Users_information::class))
                ->setIcon('fa fa-user')
                ->setPriority(2)
                ->setTitle('Ждут регистрацию')
        ]
    ],
];
