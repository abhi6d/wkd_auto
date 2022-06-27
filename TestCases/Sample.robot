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
Suite Setup  Setup chromedriver

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
Setup chromedriver
  Set Environment Variable  webdriver.chrome.driver  C:/Users/abhishek.jayalal/Desktop/Wakanda/20-06-2022/wkd_auto-20-06-2022/venv/Scripts/chromedriver.exe

*** Test Cases ***
TEST CASE 001
    [Documentation]     Sample TestCase For Automation FrameWork
    Create Webdriver  chrome  executable_path="C:\Users\abhishek.jayalal\Desktop\Wakanda\20-06-2022\wkd_auto-20-06-2022\venv\Scripts\chromedriver.exe"
    Open Browser  https://www.google.co.in





