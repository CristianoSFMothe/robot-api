*** Settings ***
Documentation        Keyword de remoção de uma product

Resource            ../../Resources/Config/Libs.resource

*** Keywords ***
Delete Product
    [Arguments]     ${auth_token}    ${product_id}    ${expected_status}

    ${header}    Create Dictionary    Content-Type=application/json    
    ...          Authorization=${auth_token}

    ${respose}    DELETE On Session    
    ...           alias=api    headers=${header}    
    ...           url=/produtos/${product_id}    
    ...           expected_status=${expected_status}