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

*** Test Cases ***
TEST CASE 001
    [Documentation]     Sample TestCase For Automation FrameWork
    Login to SSO UI  ${CRM_CREDENTIAL}[username]  ${CRM_CREDENTIAL}[password]
    NAVIGATE SSO UI  ${CRM_UI}


    #Edit Profile Details one  TC_001  TD_01
    #Manage Account Address One  TC_001  TD_01
    #Manage Service Address One  TC_001  TD_01
    #Manage Profile Residential Address one  TC_001  TD_01
    #Manage Profile Permanent Address One  TC_001  TD_01


    #Manage Profile Residential Address two  TC_001  TD_02
    #Manage Profile Permanent Address two  TC_001  TD_02
    #Manage Service Address One  TC_001  TD_01
    #Edit Profile Details two  TC_001  TD_01       #SCREEN ISSUE
    #Edit Service Details two  TC_001  TD_01
    #Edit Account Details two  TC_001  TD_03
    #Manage Account Address One  TC_001  TD_01

    #Add Supplementary Offer  TC_001  TD_01
    #change SIM ID  TC_001  TD_01
    #Create Ticket  TC_001  TD_01
    #View Identification Details  TC_001  TD_01
    #Filter Ticket By Status Open    TC_001  TD_01

    #Alter Account State   TC_001  TD_03
    #Create Ticket  TC_001  TD_01
    #Alter Account State   TC_001  TD_03
    #View Document Details  TC_001  TD_01
    #Filter Ticket By Status Open    TC_001  TD_01
    #Search Order By OrderId  TC_001  TD_01
    #Suspend Supplementary Plan  TC_001  TD_01
    Update HLR Status  TC_001  TD_01
    #Sleep   10s




