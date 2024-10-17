*** Settings ***

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***
User Creation
    [Arguments]    ${USER}

    ${body}    Get File    path=${EXECDIR}/Resources/Data/Users/user_template.json
    ${body}    Replace String Using Regexp    ${body}    _nome             ${USER}[nome]
    ${body}    Replace String Using Regexp    ${body}    _email            ${USER}[email]
    ${body}    Replace String Using Regexp    ${body}    _password         ${USER}[password]
    ${body}    Replace String Using Regexp    ${body}    _administrador    ${USER}[administrador]
    
    ${header}    Create Dictionary    Content-Type=application/json
    
    ${response}    POST On Session    alias=api        url=/usuarios    headers=${header}
    ...    data=${body}
    ...    expected_status=201   
    
    ${user_id}    Set Variable    ${response.json()['_id']}

    ${message}    Set Variable    ${response.json()['message']}

    Should Be Equal    ${message}    Cadastro realizado com sucesso
    Should Be Equal    ${user_id}    ${user_id}    
    
    RETURN       ${user_id}  