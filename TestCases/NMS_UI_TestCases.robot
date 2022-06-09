*** Settings ***
Documentation   Sample TestCase For Automation FrameWork
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Resource/PageKeywords/NMS_UI_Keyword.robot
Resource    ../Resource/PageKeywords/SSO_Login_Keyword.robot



Test Setup        Execute Suite Setup as User
Test Teardown     Execute Suite Teardown

*** Variables ***

${NMS_CREDENTIAL}     ${TestData}[USER][nms_user]
${NMS_UI}  ${wkd}[SSOPage][nms]

*** Test Cases ***
Sample TestCase For Automation FrameWork
    [Documentation]     Sample TestCase For Automation FrameWork
    Login to SSO UI  ${NMS_CREDENTIAL}[username]  ${NMS_CREDENTIAL}[password]
    NAVIGATE SSO UI  ${NMS_UI}
    CREATE SUPPLIER in NMS UI
    CREATE SUPPLIER PROFILE in NMS UI
    CREATE STOCK IMSI in NMS UI
    CREATE STOCK ICCID in NMS UI
    CREATE STOCK MSISDN in NMS UI
    CREATE PROCUREMENT in NMS UI





