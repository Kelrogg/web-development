<?php

function removeExtraBlanks(string $value): string
{    
    return preg_replace('/\s+/', ' ', trim($value));
}

function setEmptyValErr(string $value, array &$errorArr): void
{
    $errorArr['valid'] = false;
    $errorArr["{$value}_error_msg"] = ucwords($value) . " cannot be empty";
}

function setWrongValErr(string $value, array &$errorArr): void
{
    $errorArr['valid'] = false;
    $errorArr["{$value}_error_msg"] = ucwords($value) . " has a wrong format";
}

function saveFeedbackPage(): void
{
    $name = trim(getPostParameter('name'));
    $email = trim(getPostParameter('email'));
    $message = removeExtraBlanks(getPostParameter('message'));
    $gender = getPostParameter('gender');
    $country = getPostParameter('country');
    $nameTemplate = '/^([а-яА-ЯЁёa-zA-Z]+)$/u';
    $response['valid'] = true;

    if (empty($name)) {
        setEmptyValErr('name', $response);
    } else if (!preg_match($nameTemplate, $name)) {
        setWrongValErr('name', $response);
    } else {
        $response['name'] = $name;
    }

    if (empty($email)) {
        setEmptyValErr('email', $response);
    } else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        setWrongValErr('email', $response);
    } else {
        $response['email'] = $email;
    }

    if (!empty($gender))
    {
        $response['gender'] = $gender;
    }

    if (!empty($country))
    {
        $response['country'] = $country;
    }

    if (empty($message)) {
        setEmptyValErr('message', $response);
    } else {
        $message = str_replace("\r\n", "<br />", $message);
        $response['message'] = $message;
    }

    renderTemplate("main.tpl.php", $response);
    if ($response['valid'])
    {
        unset($response['valid']);
        saveFeedback($response);
    }
}


