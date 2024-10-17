*** Settings ***
Documentation        Keywords da suite de teste de produtos

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***
Update Product
    [Arguments]    ${auth_token}    ${product_id}     ${file}    ${expecet_status}     ${message} 

    ${header}    Create Dictionary    Content-Type=application/json    
    ...          Authorization=${auth_token}

    ${body}    Get File    path=${EXECDIR}/Resources/Data/Product/product_template.json
    ${body}    Replace String Using Regexp    ${body}    _nome             ${file}[nome]
    ${body}    Replace String Using Regexp    ${body}    "_preco"          ${file}[preco]
    ${body}    Replace String Using Regexp    ${body}    "_quantidade"     ${file}[quantidade]
    ${body}    Replace String Using Regexp    ${body}    _descricao        ${file}[descricao]  

    ${response}    PUT On Session   
    ...            alias=api    
    ...            url=/produtos/${product_id}    
    ...            headers=${header}    
    ...            data=${body}    
    ...            expected_status=${expecet_status}

    ${response_put}     Set Variable   ${response.json()}
    ${message}          Set Variable    ${response.json()['message']}

    