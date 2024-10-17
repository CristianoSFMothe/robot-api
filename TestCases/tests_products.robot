*** Settings ***

Documentation        Testes da API de produtos

Resource        ../Resources/Base.resource

Suite Setup            Start Session
Suite Teardown         Log Out

*** Test Cases ***
Scenario 1: Product Creation

  ${user_id}          User Creation    
  ${token}            Authentication     
  ...    email=cristiano@email.com   
  ...    password=Abc123    
  ...    expected_status=200    
  ...    message=Login realizado com sucesso

    ${product_id}    Create Product
    ...    token=${token}    file=product_1  
    ...    expecet_status=201
    ...    message=Cadastro realizado com sucesso

    Search product    ${token}    ${product_id}    
    ...    expecet_status=200

    Update Product    auth_token=${token}    
    ...    product_id=${product_id}    
    ...    file=product_2   expecet_status=200
    ...    message=Registro alterado com sucesso

    Delete Product    auth_token=${token}     
    ...    product_id=${product_id}
    ...    expected_status=200

    Delete User    user_id=${user_id}
