*** Settings ***
Documentation   Sample TestCase For Automation FrameWork
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Resource/PageKeywords/NMS_UI_Keyword.robot
Resource    ../Resource/PageKeywords/SSO_Login_Keyword.robot
Resource    ../Resource/PageKeywords/CRM_UI_Keywords.robot
Resource    ../Resource/PageKeywords/CRM_UI_Keywords_NEW.robot

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
    #NAVIGATE SSO UI  ${CRM_UI}

    ${UserInfo}=  Fetch From Excel  ${CRM_TestData}  UserInfo  TC_002  TD_02

    ${PROFILE_ID}=  getData  ${UserInfo}  ProfileId
    ${ACCOUNT_ID}=  getData  ${UserInfo}  AccountID
    ${SERVICE_ID}=  getData  ${UserInfo}  ServiceID




#    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFILE_ID}
#    wait until element is visible    ${ProfileDetailsPage}[ProfileTab]
#    Page should contain  ${PROFILE_ID}
#    Manage tab  ${ProfileDetailsPage}[ManageProfile]
#    View Identification Details
#    Go Back to Home Page
    Search By ID  ${HomePage}[HomeSeachOptionAccountId]  ${ACCOUNT_ID}
    wait until element is visible    ${ProfileDetailsPage}[ProfileTab]
    Page should contain  ${ACCOUNT_ID}
    Go Back to Home Page
    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    wait until element is visible    ${ProfileDetailsPage}[ServiceTab]
    Page should contain  ${SERVICE_ID}
    Go Back to Home Page
    Search By ID  ${HomePage}[HomeSeachOptionContactNumber]  911234567890
    Sleep  10s

    Go Back to Home Page







