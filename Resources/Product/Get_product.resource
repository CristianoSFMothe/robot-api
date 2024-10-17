*** Settings ***
Documentation        Keywords da suite de teste de produtos

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***
Search product
    [Arguments]    ${auth_token}    ${product_id}    ${expecet_status}

    ${header}    Create Dictionary    Content-Type=application/json    
    ...          Authorization=${auth_token}

    ${response}    GET On Session    
    ...            alias=api    url=/produtos/${product_id}    
    ...            headers=${header}   
    ...            expected_status=${expecet_status}