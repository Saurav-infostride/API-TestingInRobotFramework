*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections
Library    RequestsLibrary

*** Variables ***
${baseUrl}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Validating Headers
    Create Session    mysession    ${baseUrl}
    ${response}    Get Request    mysession    /photos
    Log To Console    ${response.headers}

    ${ContentTypeValue}    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${ContentTypeValue}    application/json; charset=utf-8
    Log To Console    ${ContentTypeValue}

    ${ContentEncodeValue}    Get From Dictionary    ${response.headers}    Content-Encoding
    Should Be Equal    ${ContentEncodeValue}    br
    Log To Console    ${ContentEncodeValue}

Verifying cookies are created
    Create Session    mysession    https://petstore.octoperf.com
    ${response}    Get Request    mysession    /actions/Catalog.action
    Log To Console    ${response.cookies} # Displays all the cookies from response

    ${Cookies}    Get From Dictionary    ${response.cookies}    JSESSIONID
    Log To Console    ${Cookies}
