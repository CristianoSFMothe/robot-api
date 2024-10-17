*** Settings ***
Documentation        Keywords da suite de teste de produtos

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***
Update Product
    [Arguments]    ${auth_token}    ${product_id}     ${file}    ${expecet_status}     ${message} 

    ${header}    Create Dictionary    Content-Type=application/json    
    ...          Authorization=${auth_token}

    IF  "${file}" == "product_1"
        ${body}    Get File    path=${EXECDIR}/Resources/Data/Product/product_1.json
    ELSE IF  "${file}" == "product_2"        
        ${body}    Get File    path=${EXECDIR}/Resources/Data/Product/product_2.json        
    END    

    ${response}    PUT On Session   
    ...            alias=api    
    ...            url=/produtos/${product_id}    
    ...            headers=${header}    
    ...            data=${body}    
    ...            expected_status=${expecet_status}

    ${response_put}     Set Variable   ${response.json()}
    ${message}          Set Variable    ${response.json()['message']}

    