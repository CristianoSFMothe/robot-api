*** Settings ***
Documentation        Keywords da suite de teste de produtos

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***
Create Product
    [Arguments]    ${token}    ${file}    ${expecet_status}    ${message}

    ${body}    Get File    path=${EXECDIR}/Resources/Data/Product/product_template.json
    ${body}    Replace String Using Regexp    ${body}    _nome             ${file}[nome]
    ${body}    Replace String Using Regexp    ${body}    "_preco"          ${file}[preco]
    ${body}    Replace String Using Regexp    ${body}    "_quantidade"     ${file}[quantidade]
    ${body}    Replace String Using Regexp    ${body}    _descricao        ${file}[descricao]

    ${header}    Create Dictionary    Content-Type=application/json    
    ...          Authorization=${token}

    ${response}    POST On Session    
    ...            alias=api    url=/produtos    
    ...            headers=${header}    data=${body}    
    ...            expected_status=${expecet_status}

    ${message}       Set Variable    ${response.json()['message']}
    ${product_id}    Set Variable    ${response.json()['_id']}

    Should Be Equal        ${message}    ${message}
    Should Not Be Empty    ${token}

    RETURN    ${product_id}
    