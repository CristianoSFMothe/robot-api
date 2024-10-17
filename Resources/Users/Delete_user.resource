*** Settings ***

Resource    ../../Resources/Config/Libs.resource
Resource    ./Get_user.resource

*** Keywords ***    
Delete User
    [Arguments]    ${user_id}    ${expected_status}     ${message}    ${USER}   

    ${response}    DELETE On Session    alias=api    url=/usuarios/${user_id}
    ...    expected_status=${expected_status}

    ${message}    Set Variable    ${response.json()['message']}
    Should Be Equal    ${message}    ${message}    
