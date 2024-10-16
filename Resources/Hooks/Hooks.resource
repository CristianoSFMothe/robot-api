*** Settings ***
Documentation        Arquivo de keywords em comum na aplicação

Resource    ../../Resources/Config/Libs.resource

*** Keywords ***

Start Session

    Create Session    alias=api    url=http://localhost:3000

Log Out

    Delete All Sessions