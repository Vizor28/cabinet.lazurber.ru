<?php

namespace App\Http\Admin;

use SleepingOwl\Admin\Contracts\DisplayInterface;
use SleepingOwl\Admin\Contracts\FormInterface;
use SleepingOwl\Admin\Section;

use AdminColumn;
use AdminDisplay;
use AdminForm;
use AdminFormElement;

class User extends Section
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
                AdminColumn::text('id', '#')->setWidth('30px'),
                AdminColumn::text('email', 'Емайл'),
                AdminColumn::lists('groups.name', 'Група'),
                AdminColumn::text('info.name', 'Имя'),
                AdminColumn::text('info.phone', 'Телефон'),
                AdminColumn::text('info.room.block', 'Блок'),
                AdminColumn::text('info.room.number', 'Номер кв.'),
                AdminColumn::datetime('created_at', 'Дата создания')->setFormat('d.m.Y'),
                AdminColumn::datetime('updated_at', 'Дата обновления')->setFormat('d.m.Y'),
            ])->setApply(function ($query){
                $query->orderBy('created_at', 'desc');
            })->paginate(20);
    }


    public function isDeletable(\Illuminate\Database\Eloquent\Model $model)
    {
        return false;
    }
}
