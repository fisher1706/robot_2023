*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://www.saucedemo.com/
${Browser}      Chrome

*** Test Cases ***
My First Test Case
    Open Browser    ${URL}      ${Browser}
#    Open Browser    https://www.saucedemo.com/      Firefox
    Maximize Browser Window
    Input Text    id:user-name      standard_user
    Input Text    xpath://*[@id="password"]     secret_sauce
    Click Button        name:login-button

    Sleep    5
    Close Browser
