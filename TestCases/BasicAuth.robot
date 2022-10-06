*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections
Library    RequestsLibrary

*** Variables ***
${baseUrl}    http://httpbin.org/basic-auth

*** Test Cases ***
Validating Headers
    ${auth}    Create List    foo    bar
    Create Session    mysession    ${baseUrl}   auth=${auth}
    ${response}    Get Request    mysession    /foo/bar
    Log To Console    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200