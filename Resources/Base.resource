*** Settings ***
Documentation        Arquivo de união de todos os index

Resource    ../Resources/Config/Libs.resource

Resource    ../Resources/Hooks/Hooks.resource

Resource    ../Resources/Users/Create_user.resource
Resource    ../Resources/Users/Delete_user.resource
Resource    ../Resources/Users/Get_user.resource
Resource    ../Resources/Users/Update_user.resource

Resource    ../Resources/Product/Create_product.resource
Resource    ../Resources/Product/Get_product.resource
Resource    ../Resources/Product/Updated_product.resource
Resource    ../Resources/Product/Delete_product.resource

Resource    ../Resources/Auth/Auth.resource