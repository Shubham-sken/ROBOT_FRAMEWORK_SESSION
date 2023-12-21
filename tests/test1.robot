*** Settings ***
Documentation    My first robot test suite
Resource    ../library/resource.robot
Test Teardown    Close All Browsers

*** Test Cases ***

Test Run 1

    [Tags]    test1    bike_light

    Given The Platform Is Working As Expected
    Given The User Logs In With Their Credentials Successfully
    Then The Home Page Should Be Displayed In Proper Format
    Then The User Adds The "Sauce Labs Bike Light" To The Cart
    When The User Checksout The Cart Successfully
    Then The Confirmation Page Should Be Displayed In Proper Format

Fail Run 1

    [Tags]    test2

    Given The Platform Is Working As Expected
    Given The User Logs In With Their Credentials Successfully
    Wait Until Page Contains Element    blah    10s