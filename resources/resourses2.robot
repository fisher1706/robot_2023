*** Settings ***
Library    SeleniumLibrary
Variables       ../resources/variables.py


*** Keywords ***
Open Browser And Maximize
    [Arguments]    ${user_url}      ${user_browser}
    Open Browser    ${user_url}      ${user_browser}
    Maximize Browser Window
    Log     Starting test in ${user_browser}
    Log     Test URL: ${user_url}

Close Browser And Log
    Close Browser
    Log    Finished test

Login To Webpage
    [Arguments]    ${user_name}     ${user_password}
    Input Text    id:user-name      ${user_name}
    Input Password    id:password       ${user_password}
    Click Button    id:login-button
    Log     Username: ${user_name}, Pass: ${user_password}
    Location Should Be    https://www.saucedemo.com/inventory.html

Logaut From Page
    Click Button    id:react-burger-menu-btn
#    Wait Until Element Is Enabled    id:logout_sidebar_link
    Wait Until Element Is Visible    id:logout_sidebar_link
    Click Link    id:logout_sidebar_link
    Log     Logget out from webpage

Change sorting method
    [Arguments]    ${sorting-method}
    Select From List By Value       xpath://*[@id="header_container"]/div[2]/div/span/select    ${sorting-method}
    Sleep    5

Add Product To Cart
    [Arguments]    ${product_id}      ${product_price_id}       ${add_btn_id}
    ${product_name}=    Get Text    xpath:${product_id}
    ${product_price}=    Get Text    xpath:${product_price_id}
    Log    Product name: ${product_name}
    Log    Product price: ${product_price}
#    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Button    id:${add_btn_id}
    Wait Until Element Is Visible       id:remove-sauce-labs-backpack
    Page Should Contain Element     id:remove-sauce-labs-backpack

Open Shopping Cart
    Click Link      xpath://*[@id="shopping_cart_container"]/a
    Set Screenshot Directory    screenshots
    Capture Element Screenshot    xpath://*[@id="cart_contents_container"]/div/div[1]

Checkout Shopping Cart
    Click Button    id:checkout
    Input Text    id:first-name     Oleg
    Input Text    id:last-name     Zapel
    Input Text    id:postal-code     13625
    Click Button    id:continue
    Capture Element Screenshot    xpath://*[@id="checkout_summary_container"]/div/div[2]
    Click Button    id:finish
    Page Should Contain    Thank you for your order!
    Click Button    id:back-to-products
    Sleep    5
