***Settings***
Documentation    First Resource File
Library    SeleniumLibrary
Variables    ../constants/xpath/saucedemo_login.py
Variables    ../constants/xpath/saucedemo_inventory.py
Variables    ../constants/xpath/items_description.py
Variables    ../constants/xpath/checkout.py

*** Variables ***
${WEBSITE_URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${EXEC_PATH}    C://Users//SALESKEN//upskill_Learning//ROBOT_FRAMEWORK_SESSION//constants//drivers//chromedriver.exe

*** Keywords ***
Open Browser To "${URL}"
    
    Open Browser    ${URL}    ${BROWSER}    ${EXEC_PATH}

The Platform Is Working As Expected

    Open Browser To "${WEBSITE_URL}"
    Wait Until Page Contains    Swag Labs
    Page Should Contain Element    ${btn_login}

The User Logs In With Their Credentials Successfully

    Input Text    ${txt_box_username}    standard_user
    Input Password    ${txt_box_password}    secret_sauce
    Click Button    ${btn_login}
    Wait Until Page Contains    Products

The Home Page Should Be Displayed In Proper Format
    
    Page Should Contain    Sauce Labs Bike Light
    Page Should Contain Element    ${btn_add_to_cart}
    Page Should Contain Element    ${bike_light}

The User Adds The "${Product}" To The Cart

    Click Element    ${bike_light}
    Wait Until Page Contains Element   ${btn_add_to_cart}
    Click Button    ${btn_add_to_cart}
    Click Element    ${checkout_link}
    Page Should Contain    ${Product}
    


The User Checksout The Cart Successfully

    Page Should Contain Button    ${checkout_btn}
    Click Button    ${checkout_btn}
    Wait Until Page Contains Element    ${txt_box_first_name}
    Page Should Contain Element    ${txt_box_first_name}
    Page Should Contain Element    ${txt_box_last_name}
    Page Should Contain Element    ${txt_box_zipcode}
    Input Text    ${txt_box_first_name}    Ramesh
    Input Text    ${txt_box_last_name}    Ramesh
    Input Text    ${txt_box_zipcode}    12345
    Scroll Element Into View    ${continue_btn}
    Click Element    ${continue_btn}
    Wait Until Page Contains    Payment Information
    Page Should Contain Button    ${finish_btn}
    Click Button    ${finish_btn}

The Confirmation Page Should Be Displayed In Proper Format

    Page Should Contain    Thank you for your order!
