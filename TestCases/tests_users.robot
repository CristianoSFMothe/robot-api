*** Settings ***

Resource    ../Resources/Base.resource

Suite Setup            Start Session
Suite Teardown         Log Out

*** Variables ***
&{USER}            nome=Cristiano Ferreira    email=cristiano@email.com    password=Abc123    administrador=true
&{UPDATED_USER}    nome=Cristiano Mothe       email=cristiano@email.com    password=Abc123    administrador=true

*** Test Cases ***
Scenario 1 - Successful user creation
    [Documentation]    Tests for user creation
    [Tags]            create

    ${user_id}        User Creation         
    ...               USER=${USER}   
    
    Search User       user_id=${user_id}    
    ...               expected_status=200    
    ...               USER=${USER}

    Update User       user_id=${user_id}    
    ...               expected_status=200    
    ...               USER=${UPDATED_USER}

    Search User       user_id=${user_id}    
    ...               expected_status=200    
    ...               USER=${USER}

    Delete User       user_id=${user_id}    
    ...               expected_status=200    
    ...               USER=${USER}    
    ...               message=Registro excluído com sucesso 
