*** Settings ***
Documentation   Sample TestCase For Automation FrameWork
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Resource/PageKeywords/NMS_UI_Keyword.robot
Resource    ../Resource/PageKeywords/SSO_Login_Keyword.robot
Resource    ../Resource/PageKeywords/CRM_UI_Keywords.robot


Resource    ../Resource/PageKeywords/Read_TestData_Keyword.robot
Library  ../Resource/TestData/Provision_Functions.py
Library  ../Resource/TestData/ReadDataFromExcel.py

Variables    ../Resource/PageObjects/PageObjects.yaml
Variables    ../Resource/PageObjects/TestData.yaml
Resource     ../Resource/PageKeywords/Common.robot

Library  OperatingSystem
#Suite Setup  Setup chromedriver

Test Setup        Execute Suite Setup as User
Test Teardown     Execute Suite Teardown

*** Variables ***

${CRM_TestData}     ${TestData}[CRM_TestData]
${CRM_CREDENTIAL}     ${TestData}[USER][crm_user]
${CRM_UI}  ${wkd}[SSOPage][crm]
${ProfileDetailsPage}  ${CRMPage}[ProfileDetailPage]
${AccoutDetailPage}  ${CRMPage}[AccoutDetailPage]
${ServiceDetailsPage}  ${CRMPage}[ServiceDetailsPage]
${HomePage}  ${CRMPage}[HomePage]        # Importing Home page Components

*** Keywords ***
#Setup chromedriver
#  Set Environment Variable  webdriver.chrome.driver  C:/Users/abhishek.jayalal/Desktop/Wakanda/20-06-2022/wkd_auto-20-06-2022/venv/Scripts/chromedriver.exe

*** Test Cases ***
TEST CASE 001
    [Documentation]     Sample TestCase For Automation FrameWork
    Login to SSO UI  ${CRM_CREDENTIAL}[username]  ${CRM_CREDENTIAL}[password]
    NAVIGATE SSO UI  ${CRM_UI}
#-----------------------------------------------------------------------------------------------

    #Search By ID  //option[text()='${LABEL}']  251311000030
    #Verify elements is visible and displayed  //div[contains(text(),'${LABEL}')]/following-sibling::div//span[text()='251311000030']
    #Sleep  10s


    #View and Validate By  TC_001  TD_01

    #View and Validate By  TC_001  TD_02
    #View and Validate By  TC_001  TD_04
    #View and Validate By  TC_001  TD_06
    #View and Validate By  TC_001  TD_12
    #View and Validate By  TC_001  TD_14

    Validate Service Details  TC_001  TD_04
    Validate Profile Details  TC_004  TD_04
    Validate Account Details  TC_001  TD_04
    #Validate IMSI Details  TC_001  TD_04
    #Validate ICCID Details  TC_001  TD_04
    Validate SIM Details  TC_001  TD_04
    Sleep  10s





