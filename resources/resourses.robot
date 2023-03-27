*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Open Browser and Maximize
    [Arguments]    ${UserUrl}       ${BrowserName}
    Open Browser    ${UserUrl}      ${BrowserName}
    Maximize Browser Window

Login to website
    [Arguments]    ${UserName}      ${Password}
    Input Text    id:user-name      ${UserName}
    Sleep    2

    Input Text    xpath://*[@id="password"]     ${Password}
    Sleep    2

#    Clear Element Text      name:user-name
#    Sleep    2
#
#    Input Text    id:user-name      ${UserName}
#    Sleep    2

    Click Button        name:login-button
    Sleep    2

    Page Should Not Contain Element     class:error-message-container error
    Element Should Contain    class:title     Products
