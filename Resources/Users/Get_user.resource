*** Settings ***

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***
Search User
    [Arguments]    ${user_id}    ${expected_status}        ${USER}

    ${response}    GET On Session    alias=api      url=/usuarios/${user_id}
    ...    expected_status=200

    ${retorno_get}    Set Variable    ${response.json()}   

    IF  ${expected_status} == 200
        ${email}    Set Variable    ${response.json()['email']}
        Should Be Equal    ${email}    ${USER.email}
    END