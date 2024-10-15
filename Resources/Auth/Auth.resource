*** Settings ***

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***
Authentication
    [Arguments]    ${email}    ${password}

    ${header}    Create Dictionary    Content-Type=application/json

    ${response}    POST On Session    alias=api    url=/login    headers=${header}
    ...            data={"email": "${email}", "password": "${password}"}
    ...            expected_status=200  

    ${token}      Set Variable    ${response.json()['authorization']}
    ${message}    Set Variable    ${response.json()['message']}

    Should Be Equal        ${message}    Login realizado com sucesso
    Should Not Be Empty    ${token}

    RETURN        ${token}