*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGNIN_MAIN_HEADING}  xpath=//h1

*** Keywords ***
Verify Page Loaded
    Page Should Contain Element  ${SIGNIN_MAIN_HEADING}
    Element Text Should Be       ${SIGNIN_MAIN_HEADING}    Sign-In

Login With Valid Credentials
    [Arguments]  ${Username}   ${Password}
    Fill "Email" Field        ${Username}
    Fill "Password" Field     ${Password}
    Click "SignIn" Button

Fill "Email" Field
    [Arguments]  ${Username}
    Log  Filling Email Field With ${Username}

Fill "Password" Field
    [Arguments]  ${Password}
    Log  Filling Password Field With ${Password}

Click "SignIn" Button
    Log  Clicking SignIn Button