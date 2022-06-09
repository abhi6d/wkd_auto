*** Settings ***

Library  ../TestData/ReadDataFromExcel.py
Variables    ../../Resource/PageObjects/PageObjects.yaml
Variables    ../../Resource/PageObjects/TestData.yaml
Resource     ../../Resource/PageKeywords/Common.robot
Library     OperatingSystem
Library     SeleniumLibrary
Library    Collections
Library    String
Variables    ../../Resource/PageObjects/PageObjects.yaml
Variables    ../../Resource/PageObjects/TestData.yaml
Resource     ../../Resource/PageKeywords/Common.robot

*** Variables ***
${URL}      ${TestData}[URL]
${Broswer}  ${TestData}[Browser]
${Environment}      ${TestData}[Environment]
${LoginPage}      ${BICS}[LoginPage]
${TimeOut}      60s
${Start}        1s
${LoginPageTestdatas}     ${TestData}[USER][user1]
#${LoginPageTestdatas}     ${TestData}[USER][user1]
*** Keywords ***
Read Number of Rows
    [Arguments]  ${sheetname}
    ${maxr}=  fetch_no_rows  ${sheetname}
    [Return]  ${maxr}

Read Excel Data of cell
    [Arguments]  ${sheetname}  ${row}  ${cell}
    ${celldata}=  fetch_cell_data  ${sheetname}  ${row}  ${cell}
    [Return]  ${celldata}

OnboardingEKYC API
    [Arguments]  ${MSISDN}  ${ICCID}  ${IMSI}  ${FAMILYNAME}
    ${ORDER_ID}=  OnBoarding_API  ${MSISDN}  ${ICCID}  ${IMSI}  ${FAMILYNAME}
    [Return]  ${ORDER_ID}


OnboardingEKYC API 1
    [Arguments]  ${MSISDN}  ${ICCID}  ${IMSI}  ${FAMILYNAME}
    ${ORDER_ID}=  OnBoarding_API  ${MSISDN}  ${ICCID}  ${IMSI}  ${FAMILYNAME}
    [Return]  ${ORDER_ID}