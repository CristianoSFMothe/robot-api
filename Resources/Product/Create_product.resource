*** Settings ***
Documentation        Keywords da suite de teste de produtos

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***
Create Product
    [Arguments]    ${token}    ${file}    ${expecet_status}

    IF  "${file}" == "product_1"
        ${body}    Get File    path=${EXECDIR}/Resources/Data/Product/product_1.json
    ELSE IF    "${file}" == "product_2"        
        ${body}    Get File    path=${EXECDIR}/Resources/Data/Product/product_2.json        
    END

    ${header}    Create Dictionary    Content-Type=application/json    
    ...          Authorization=${token}

    ${response}    POST On Session    
    ...            alias=api    url=/produtos    
    ...            headers=${header}    data=${body}    
    ...            expected_status=${expecet_status}

    Log To Console    ${response.json()}
    Log To Console    ${response.json()['_id']}

    ${product_id}    Set Variable    ${response.json()['_id']}

    RETURN    ${product_id}
    