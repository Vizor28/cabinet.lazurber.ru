<?php

namespace App\Http\Admin;

use SleepingOwl\Admin\Contracts\DisplayInterface;
use SleepingOwl\Admin\Contracts\FormInterface;
use SleepingOwl\Admin\Section;

use AdminDisplay;
use AdminColumn;

class User_vote extends Section
{
    /**
     * @var bool
     */
    protected $checkAccess = false;

    /**
     * @var string
     */
    protected $title;

    /**
     * @var string
     */
    protected $alias;

    /**
     * @return DisplayInterface
     */
    public function onDisplay()
    {
        // todo: remove if unused
        return AdminDisplay::table()
            ->setHtmlAttribute('class', 'table-primary')
            ->setColumns([
                AdminColumn::text('user.email', 'Емайл'),
                AdminColumn::text('vote.question', 'Вопрос'),
                AdminColumn::text('option.text', 'Ответ'),
                AdminColumn::datetime('created_at', 'Дата создания')->setFormat('d.m.Y'),
                AdminColumn::datetime('updated_at', 'Дата обновления')->setFormat('d.m.Y'),
            ])->setApply(function ($query){
                $query->orderBy('created_at', 'desc');
            })->paginate(20);
    }


    public function isDeletable(\Illuminate\Database\Eloquent\Model $model)
    {
        return true;
    }


}
