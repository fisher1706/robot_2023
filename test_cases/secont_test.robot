*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/resourses2.robot
Variables       ../resources/variables.py


*** Test Cases ***
Standard User Test Case
    [Setup]    Open Browser And Maximize        ${url}      ${browser_name}
    [Teardown]    Close Browser And Log

    Login To Webpage    ${standard_user}        ${password}
    Add Product To Cart     //*[@id="item_4_title_link"]/div
    ...     //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div     add-to-cart-sauce-labs-backpack
    Change Sorting Method       ${sort_hilo}
    Open Shopping Cart
    Checkout Shopping Cart
    Logaut From Page

Locked Out User Test Case
    [Setup]    Open Browser And Maximize        ${url}      ${browser_name}
    [Teardown]    Close Browser And Log

    Login To Webpage    ${locked_out_user}        ${password}
