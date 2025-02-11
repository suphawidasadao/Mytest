*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open Browser    http://automationexercise.com
Suite Teardown      Close Browser

*** Variables ***
${BASE_URL}                  http://automationexercise.com
${PRODUCTS_BTN}              //a[contains(text(),'Products')]
${ALL_PRODUCTS_HEADER}       //h2[contains(text(),'All Products')]
${SEARCH_FIELD}              //input[@id='search_product']
${SEARCH_BTN}                //button[@id='submit_search']
${SEARCHED_PRODUCTS_HEADER}  //h2[contains(text(),'Searched Products')]
${PRODUCT_LIST}              //div[@class='features_items']//div[@class='productinfo text-center']

${SEARCH_TERM}               Dress

*** Keywords ***
Verify Home Page Loaded
    Wait Until Page Contains    Home

Click Products Button
    Click Element    ${PRODUCTS_BTN}
    Wait Until Element Is Visible    ${ALL_PRODUCTS_HEADER}

Search For Product
    Input Text    ${SEARCH_FIELD}    ${SEARCH_TERM}
    Click Element    ${SEARCH_BTN}

Verify Search Results
    Wait Until Element Is Visible    ${SEARCHED_PRODUCTS_HEADER}
    Element Should Contain    ${SEARCHED_PRODUCTS_HEADER}    SEARCHED PRODUCTS
    Page Should Contain Element    ${PRODUCT_LIST}

*** Test Cases ***
Test Search Product
    Verify Home Page Loaded
    Click Products Button
    Search For Product
    Verify Search Results
