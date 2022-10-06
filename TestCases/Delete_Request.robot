*** Settings ***
Library    RequestsLibrary
*** Variables ***
${base_url}    https://reqres.in/
*** Test Cases ***
Delete api
    Create Session    myssion    ${base_url}
    ${Body}    Create Dictionary    name=morpheus    job=president
    ${header}    Create Dictionary    Content-Type=application/json
    ${response}    Delete Request    myssion    /api/users/2    data=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    ${response_code}    Convert To String    ${response.status_code}
    Should Be Equal        ${response_code}    204