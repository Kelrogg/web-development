<?php
require_once ('../src/common.inc.php');

$method = getRequestMethod();

if ($method === 'get')
{
    mainPage();
}
if ($method === 'post')
{
    saveFeedbackPage();
}
