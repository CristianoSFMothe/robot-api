*** Settings ***

Resource    ../Resources/Base.resource

Suite Setup            Criar Sessão
Suite Teardown         Encerrar Sessão

*** Test Cases ***
Scenario 1 - Successful user creation
    [Documentation]    Tests for user creation
    [Tags]            create

    ${user_id}    User Creation    
    Search User       user_id=${user_id}
    Update User       user_id=${user_id}
    Search User       user_id=${user_id}
    Delete User       user_id=${user_id}       
