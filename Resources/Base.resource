*** Settings ***
Documentation        Arquivo de união de todos os index

Resource    ../Resources/Config/Libs.resource

Resource    ../Resources/Hooks/Hooks.resource

Resource    ../Resources/Users/Users.resource

Resource    ../Resources/Product/Create_product.resource
Resource    ../Resources/Product/Get_product.resource
Resource    ../Resources/Product/Updated_product.resource
Resource    ../Resources/Product/Delete_product.resource

Resource    ../Resources/Auth/Auth.resource