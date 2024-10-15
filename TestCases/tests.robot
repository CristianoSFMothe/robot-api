*** Settings ***

Library        RequestsLibrary

Suite Setup            Criar Sessão
Suite Teardown         Encerrar Sessão

*** Test Cases ***
Cenário 1 - Criar Usuário

    ${user_id}    Criação de Usuário    
    Buscar Usuário       user_id=${user_id}
    Atualizar Usuário    user_id=${user_id}
    Buscar Usuário       user_id=${user_id}
    Deletar Usuário      user_id=${user_id}       

*** Keywords ***
Criação de Usuário
    
    ${header}    Create Dictionary    Content-Type=application/json
    
    ${response}    POST On Session    alias=api    url=/usuarios    headers=${header}
    ...    data={"nome": "Cristiano Ferreira", "email": "cristiano@email.com", "password": "Abc123", "administrador": "true"}
    ...    expected_status=201   
    
    ${user_id}    Set Variable    ${response.json()['_id']}

    ${message}    Set Variable    ${response.json()['message']}

    Should Be Equal    ${message}    Cadastro realizado com sucesso
    Should Be Equal    ${user_id}    ${user_id}    
    
    RETURN       ${user_id}

Buscar Usuário
    [Arguments]    ${user_id}    

    ${response}    GET On Session    alias=api      url=/usuarios/${user_id}
    ...    expected_status=200
    ${retorno_get}    Set Variable    ${response.json()}    
    ${email}    Set Variable    ${response.json()['email']}
    Should Be Equal    ${email}    cristiano@email.com     

Atualizar Usuário
    [Arguments]    ${user_id}

    ${header}    Create Dictionary    Content-Type=application/json
    
    ${response}    PUT On Session    alias=api    url=/usuarios/${user_id}    headers=${header} 
    ...    data={"nome": "Cristiano Mothe", "email": "cristiano@email.com", "password": "Abc123", "administrador": "true"}
    ...    expected_status=200
    ${retorno_put}    Set Variable    ${response.json()}

    
Deletar Usuário
    [Arguments]    ${user_id}    

    ${response}    DELETE On Session    alias=api    url=/usuarios/${user_id}
    ...    expected_status=200

    ${message}    Set Variable    ${response.json()['message']}

    Should Be Equal    ${message}    Registro excluído com sucesso

Criar Sessão

    Create Session    alias=api    url=http://localhost:3000

Encerrar Sessão

    Delete All Sessions