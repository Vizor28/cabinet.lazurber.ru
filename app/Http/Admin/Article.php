<?php

namespace App\Http\Admin;

use SleepingOwl\Admin\Contracts\DisplayInterface;
use SleepingOwl\Admin\Contracts\FormInterface;
use SleepingOwl\Admin\Section;

use AdminColumn;
use AdminDisplay;
use AdminForm;
use AdminFormElement;

class Article extends Section
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
            ->setColumns(
                AdminColumn::text('id', '#')->setWidth('30px'),
                AdminColumn::link('name', 'Название'),
                AdminColumn::text('text', 'Текст превью'),
                AdminColumn::text('detail_text', 'Детальный текст'),
                AdminColumn::text('user_id', 'Создатель'),
                AdminColumn::datetime('created_at', 'Дата создания')->setFormat('d.m.Y'),
                AdminColumn::datetime('updated_at', 'Дата обновления')->setFormat('d.m.Y')
            )->paginate(20);
    }

    /**
     * @param int $id
     *
     * @return FormInterface
     */
    public function onEdit($id)
    {
        // todo: remove if unused
        return AdminForm::panel()->addBody([
            AdminFormElement::text('name', 'Названия')->required()->unique(),
            AdminFormElement::select('user_id', 'Создатель')
                ->setModelForOptions('\App\User')->setDisplay('email')->required(),
            AdminFormElement::wysiwyg('text', 'Текст превью2')->setParameters(["1111"])->required(),
            AdminFormElement::wysiwyg('detail_text', 'Детальный текст')->setParameters(["2222"]),

        ]);
    }

    /**
     * @return FormInterface
     */
    public function onCreate()
    {
        return $this->onEdit(null);
    }

    /**
     * @return void
     */
    public function onDelete($id)
    {
        // todo: remove if unused
    }

    /**
     * @return void
     */
    public function onRestore($id)
    {
        // todo: remove if unused
    }
}
