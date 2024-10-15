*** Settings ***
Documentation        Arquivo de keywords em comum na aplicação

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***

Criar Sessão

    Create Session    alias=api    url=http://localhost:3000

Encerrar Sessão

    Delete All Sessions