*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections

*** Test Cases ***
TestCase 1:
    ${jsonObject}=    Load Json From File    JSON_Data/JsonData.json
    
    ${nameValue}=    Get Value From Json    ${jsonObject}    $.firstName
    Should Be Equal    ${nameValue[0]}    John
    Log To Console    ${nameValue}

    ${streetValue}=    Get Value From Json    ${jsonObject}    $.address.streetAddress
    Should Be Equal    ${streetValue[0]}    naist street
    Log To Console    ${streetValue}

    ${phoneNumbers}=    Get Value From Json    ${jsonObject}    $.phoneNumbers[0].number
    Should Be Equal    ${phoneNumbers[0]}    0123-4567-8888
    Log To Console    ${phoneNumbers[0]}
    
    