*** Settings ***

Library        RequestsLibrary

*** Test Cases ***
Cenário 1 - Criar Usuário
    # CRIAR
    
    # CRIAR SESSÃO
    Create Session    alias=api    url=http://localhost:3000

    # CABEÇALHO
    ${header}    Create Dictionary    Content-Type=application/json

    # ENVIANDO REQUISIÇÕES
    ${response}    POST On Session    alias=api    url=/usuarios    headers=${header}
    ...    data={"nome": "Cristiano Ferreira", "email": "cristiano@email.com", "password": "Abc123", "administrador": "true"}
    ${USER_ID}    Set Variable    ${response.json()['_id']}
    Log To Console    ${USER_ID}

    # LER
    ${response}    GET On Session    alias=api      url=/usuarios/${USER_ID}
    ${retorno_get}    Set Variable    ${response.json()}
    Log To Console    ${retorno_get}

    # ATUALIZAR
    PUT On Session    alias=api    url=/usuarios/${USER_ID}    headers=${header} 
    ...    data={"nome": "Cristiano Mothe", "email": "cristiano@email.com", "password": "Abc123", "administrador": "true"}
    ${retorno_put}    Set Variable    ${response.json()}
    Log To Console    ${retorno_put}

    ${response}    GET On Session    alias=api      url=/usuarios/${USER_ID}
    ${retorno_get}    Set Variable    ${response.json()}
    Log To Console    ${retorno_get}

    # DELETE
    DELETE On Session    alias=api    url=/usuarios/${USER_ID}

    Delete All Sessions