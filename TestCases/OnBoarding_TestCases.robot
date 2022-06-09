*** Settings ***
Documentation   Sample TestCase For Automation FrameWork
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Resource/PageKeywords/LoginPageKeyword.robot
Resource    ../Resource/PageKeywords/SearchOrderKeyword.robot
Resource    ../Resource/PageKeywords/OnBoarding_via_KYC_API.robot
Resource    ../Resource/PageKeywords/OnboardSample.robot
Resource    ../Resource/PageKeywords/SearchOrder.robot
Library  ../Resource/PageKeywords/OnBoardingAPI.py


Test Setup        Execute Suite Setup as User
Test Teardown     Execute Suite Teardown

*** Test Cases ***
Sample TestCase For Automation FrameWork
    [Documentation]     Sample TestCase For Automation FrameWork
    #Login to Application as Specific User
    #Search Order By OrderId
    #Search Order By OrderId List  ${orderid}
    #Logout as User
    #ONBOARDING_EKYC
    #API_TEST
    ONBOARDING_EKYC_SAMPLE
    #Post Request With Json
    #ONBOARDING_EKYC_TEST
    #${orderid}=  OnBoardingAPI.OnBoarding_API  "278600"  "251793000732"  "8925102406450009248"  "636024060001111"  "ABHIRAM"
    Log To Console  ${orderid}