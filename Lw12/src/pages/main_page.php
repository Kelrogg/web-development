<?php

function mainPage(): void
{
    renderTemplate('main.tpl.php', ['name' => 'Ivan', 'email' => 'pseudonym@yandex.ru']);
}