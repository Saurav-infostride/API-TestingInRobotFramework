*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseUrl}    https://reqres.in/
${city}    api/users?page=2

*** Test Cases ***
Get
    Create Session    mysession    ${baseUrl}
    ${responseVariable}   Get Request    mysession    ${city}
#    log to console    ${responseVariable.status_code}
#    log to console    ${responseVariable.content}
    log to console    ${responseVariable.headers}

    # VALIDATIONS
    ${statusCode}    Convert To String    ${responseVariable.status_code}
    Should Be Equal    ${statusCode}    200

    ${body}    Convert To String    ${responseVariable.content}
    Should Contain    ${body}    Michael

    ${contentTypeValue}    Get From Dictionary    ${responseVariable.headers}   Content-type
    Should Be Equal    ${contentTypeValue}    application/json; charset=utf-8
