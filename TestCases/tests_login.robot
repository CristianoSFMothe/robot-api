*** Settings ***

Resource    ../Resources/Base.resource

Suite Setup            Criar Sessão
Suite Teardown         Encerrar Sessão

*** Test Cases ***
Scenario 1: Authentication successful
    [Documentation]    Tests for user creation
    [Tags]            create

    ${user_id}          User Creation    
    ${token}            Authentication     email=cristiano@email.com   password=Abc123 
    Delete User         user_id=${user_id}         
