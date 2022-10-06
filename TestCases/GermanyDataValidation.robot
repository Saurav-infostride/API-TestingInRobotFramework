*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections
Library    RequestsLibrary

*** Variables ***

*** Test Cases ***
Asserting Germany Data
    ${response}    Load Json From File    JSON_Data/GermanyData.json
#    ${jsonObject}    To Json    ${response.content}

    ${nameValue}    Get Value From Json    ${response}    $.name
    Log To Console    ${nameValue[0]}

    ${borders}    Get Value From Json    ${response}    $.borders
    Log To Console    ${borders[0]}
    Should Contain Any    ${borders[0]}    AUT    CZE    FRA    POL
    Should Not Contain Any    ${borders[0]}    BRIT