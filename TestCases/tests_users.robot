*** Settings ***

Resource    ../Resources/Base.resource

Suite Setup            Start Session
Suite Teardown         Log Out

*** Test Cases ***
Scenario 1 - Successful user creation
    [Documentation]    Tests for user creation
    [Tags]            create

    ${user_id}    User Creation    
    Search User       user_id=${user_id}
    Update User       user_id=${user_id}
    Search User       user_id=${user_id}
    Delete User       user_id=${user_id}       
