<?php

function getPostParameter(string $value): string
{
    isset($_POST[$value]) ? $param = $_POST[$value] : $param = "";
    return $param;
}

function getRequestMethod(): string
{
    return strtolower($_SERVER['REQUEST_METHOD']);
}

