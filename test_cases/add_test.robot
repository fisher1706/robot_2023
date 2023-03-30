*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resourses.robot


*** Variables ***
${URL}      https://www.thetestingworld.com/testings
${Browser}      Chrome


*** Test Cases ***
My First Test Case
    Open Browser And Maximize       ${Url}      ${Browser}
    Sleep    2

    Select Radio Button     add_type       office
    Sleep    2

    Select Checkbox    name:terms
    Sleep    2

#    Unselect Checkbox    name:terms
    Unselect Checkbox    terms
    Sleep    2

    Click Link      //*[@id="tab-content1"]/form/div/em/a
    Sleep    2

    Close Browser