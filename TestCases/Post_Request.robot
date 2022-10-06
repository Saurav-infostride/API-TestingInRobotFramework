*** Settings ***
Library    RequestsLibrary
*** Variables ***
${base_url}    https://reqres.in/

*** Test Cases ***
Post
    Create Session    myssion    ${base_url}
    ${Body}    Create Dictionary    name=morpheus    job=eader
    ${header}    Create Dictionary    Content-Type=application/json
    ${response}    Post Request    myssion    /api/users    data=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    ${response_code}    Convert To String    ${response.status_code}
    Should Be Equal        ${response_code}    201