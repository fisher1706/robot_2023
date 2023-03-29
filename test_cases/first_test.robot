*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resourses.robot


*** Variables ***
${Browser}      Chrome
${Url}      http://www.saucedemo.com/

${StandardUser}     standard_user
#${StandardUser}     standard
${LockedOutUser}    locked_out_user
${Loc}      https://www.saucedemo.com/inventory.html

${Password}     secret_sauce


*** Test Cases ***
My First Test Case
    [Setup]      Open Browser And Maximize       ${Url}      ${Browser}
    [Teardown]    Close Browser

    Login To Website        ${StandardUser}      ${Password}
#    Go Back
    ${Title}=       Get Title
    Log    Page title is: ${Title}
    Log To Console    \n${Title}

    ${Cookies}=     Get Cookies
    Log     ${Cookies}

    ${Location}     Get Location
    Log    ${Location}
    Location Should Be      ${Loc}

    Wait Until Element Is Visible       xpath://*[@id="page_wrapper"]/footer/div
    Scroll Element Into View    xpath://*[@id="page_wrapper"]/footer/div
    Set Screenshot Directory    screenshots
    Capture Page Screenshot

    Capture Element Screenshot      xpath://*[@id="item_2_img_link"]/img
