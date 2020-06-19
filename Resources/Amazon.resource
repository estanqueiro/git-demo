*** Settings ***
Resource  ../Resources/Common.resource
Resource  ../Resources/PO/Cart.resource
Resource  ../Resources/PO/LandingPage.resource
Resource  ../Resources/PO/Product.resource
Resource  ../Resources/PO/SearchResults.resource
Resource  ../Resources/PO/SignIn.resource
Resource  ../Resources/PO/TopNav.resource

*** Keywords ***
Login
    [Arguments]  ${Username}   ${Password}
    SignIn.Login With Valid Credentials     ${Username}   ${Password}

Login With Invalid Credentials
    SignIn.Fill "Email" Field     bogus@bogus.com
    SignIn.Fill "Password" Field  badPassword
    SignIn.Click "SignIn" Button

Search For Products
    LandingPage.Load
    LandingPage.Verify Page Loaded
    TopNav.Search For Products
    SearchResults.Verify Search Completed

Select Product From Search Results
    SearchResults.Click Product Link
    Product.Verify Page Loaded

Add Product To Cart
    Product.Add To Cart
    Cart.Verify Product Added

Begin Checkout
    Cart.Proceed To Checkout
    SignIn.Verify Page Loaded

