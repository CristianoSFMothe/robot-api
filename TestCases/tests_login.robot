*** Settings ***

Resource    ../Resources/Base.resource

Suite Setup            Start Session
Suite Teardown         Log Out

*** Test Cases ***
Scenario 1: Authentication successful
    [Documentation]    Tests for user creation
    [Tags]             login

    ${user_id}          User Creation    
    ${token}            Authentication     
    ...    email=cristiano@email.com   
    ...    password=Abc123    
    ...    expected_status=200    
    ...    message=Login realizado com sucesso
    Delete User         user_id=${user_id} 
    
Scenario 1: Invalid authentication
    [Documentation]    Tests for user creation
    [Tags]             invalid

    ${user_id}          User Creation    
    ${token}            Authentication     
    ...    email=401@email.com   
    ...    password=Abc123  
    ...    expected_status=401    
    ...    message=Email e/ou senha inválidos     
    Delete User         user_id=${user_id} 
