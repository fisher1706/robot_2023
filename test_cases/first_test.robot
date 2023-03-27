*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resourses.robot


*** Variables ***
${Browser}      Chrome
${Url}      http://www.saucedemo.com/

${StandardUser}     standard_user
${LockedOutUser}    locked_out_user

${Password}     secret_sauce


*** Test Cases ***
My First Test Case
    Open Browser And Maximize       ${Url}      ${Browser}
    Login To Website        ${StandardUser}      ${Password}
#    Go Back
    Sleep    2
    Close Browser
