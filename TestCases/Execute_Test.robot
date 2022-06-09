*** Settings ***

Library     SeleniumLibrary



Resource    ../Resource/PageKeywords/Read_TestData_Keyword.robot
Library     OperatingSystem


*** Variables ***

${CRM_TestData}     ${TestData}[CRM_TestData]



*** Test Cases ***
TC_100 READING CSV
    [Documentation]     Sample TestCase For Automation FrameWork
    ${row}=  Read Number of Rows  ${CRM_TestData}  Sheet1
    Log To Console  ${row}
    ${data}=  Read Excel Data of cell  ${CRM_TestData}  Sheet1  1  1
    Log To Console  ${data}

    FOR  ${i}  IN RANGE  1  ${row}+1
      ${MSISDN}=  Read Excel Data of cell  ${CRM_TestData}  Sheet1  ${i}  1
      ${ICCID}=  Read Excel Data of cell  ${CRM_TestData}  Sheet1  ${i}  2
      ${IMSI}=  Read Excel Data of cell  ${CRM_TestData}  Sheet1  ${i}  3
      #OnboardingEKYC API  ${MSISDN}  ${ICCID}  ${IMSI}  AJITH
      #${ORDER_ID}=  OnboardingEKYC API  ${MSISDN}  ${ICCID}  ${IMSI}  AJITH
      Log To Console  ${MSISDN}
      Log To Console  ${ICCID}
      Log To Console  ${IMSI}
    END




