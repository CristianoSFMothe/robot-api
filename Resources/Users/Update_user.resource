*** Settings ***

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***
Update User
    [Arguments]    ${user_id}    ${expected_status}    ${USER}

    ${header}    Create Dictionary    Content-Type=application/json

    ${body}    Get File    path=${EXECDIR}/Resources/Data/Users/user_template.json
    ${body}    Replace String Using Regexp    ${body}    _nome             ${USER}[nome]
    ${body}    Replace String Using Regexp    ${body}    _email            ${USER}[email]
    ${body}    Replace String Using Regexp    ${body}    _password         ${USER}[password]
    ${body}    Replace String Using Regexp    ${body}    _administrador    ${USER}[administrador]
    
    ${response}    PUT On Session    alias=api    url=/usuarios/${user_id}    headers=${header} 
    ...    data=${body}
    ...    expected_status=${expected_status}
    ${retorno_put}    Set Variable    ${response.json()}
