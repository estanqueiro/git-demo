*** Settings ***
Documentation  This is some basic info about the whole suite
Resource  ../Resources/Amazon.resource
Resource  ../Resources/Common.resource
Test Setup  Begin Web Test
Test Teardown   End Web Test

*** Variables ***
${BROWSER}          firefox
${START_URL}        https://www.amazon.com
${SEARCH_TERM}      Ferrari 458
${LOGIN_EMAIL}      email@email.com
${LOGIN_PASSWORD}   password

*** Test Cases ***
Logged out user should be able to login
    Amazon.Login    ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}

Logged out user should be able to search for products
    [Documentation]  This is some basic information about the test
    [Tags]  Smoke
    Amazon.Search For Products

Logged out user should be able to view a product
    [Documentation]  This is some basic information about the test
    [Tags]  Smoke   Products    Checkout
    Amazon.Search For Products
    Select Product From Search Results

Logged out user should be able to add product to cart
    [Documentation]  This is some basic information about the test
    [Tags]  Smoke
    Amazon.Search For Products
    Select Product From Search Results
    Add Product To Cart

Logged out user should be able to sign in to check out
    [Documentation]  This is some basic information about the test
    [Tags]  Smoke
    Amazon.Search For Products
    Select Product From Search Results
    Add Product To Cart
    Begin Checkout
