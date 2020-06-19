*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Search Completed
    Wait Until Page Contains  results for "Ferrari 458"

Click Product Link
    [Documentation]  Clicks on the first product in the search results list
    Click Link  xpath=//span[text()='Ferrari 458 Italia Red 1/24 by Bburago 26003']//parent::a
