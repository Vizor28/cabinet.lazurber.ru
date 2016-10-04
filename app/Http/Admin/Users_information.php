<?php

namespace App\Http\Admin;

use SleepingOwl\Admin\Contracts\DisplayInterface;
use SleepingOwl\Admin\Contracts\FormInterface;
use SleepingOwl\Admin\Section;

use AdminColumn;
use AdminDisplay;
use AdminForm;
use AdminFormElement;

class Users_information extends Section
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
            ->setActions([
                AdminColumn::action('new_user', 'Зарегестрировать')->setIcon('fa fa-share')->setAction(route('admin.info.user'))
            ])->setColumns([
                AdminColumn::text('id', '#')->setWidth('30px'),
                AdminColumn::text('name', 'Имя'),
                AdminColumn::text('surname', 'Фамилия'),
                AdminColumn::text('secondname', 'Отчество'),
                AdminColumn::text('email', 'Емайл'),
                AdminColumn::text('phone', 'Телефон'),
                AdminColumn::text('room.block', 'Блок'),
                AdminColumn::text('room.number', 'Новмер кв.'),
                AdminColumn::datetime('created_at', 'Дата создания')->setFormat('d.m.Y'),
                AdminColumn::datetime('updated_at', 'Дата обновления')->setFormat('d.m.Y'),
                AdminColumn::checkbox(),
            ])->setApply(function ($query){
              $query->whereNull("user_id")->orderBy('created_at', 'desc');
            })->paginate(20);
    }


    public function isDeletable(\Illuminate\Database\Eloquent\Model $model)
    {
        return false;
    }

}
