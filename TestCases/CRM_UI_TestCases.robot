*** Settings ***
Documentation   Sample TestCase For Automation FrameWork
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Resource/PageKeywords/NMS_UI_Keyword.robot
Resource    ../Resource/PageKeywords/SSO_Login_Keyword.robot
Resource    ../Resource/PageKeywords/CRM_UI_Keywords.robot

Resource    ../Resource/PageKeywords/Read_TestData_Keyword.robot
Library  ../Resource/TestData/Provision_Functions.py

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

*** Test Cases ***
TEST CASE 001
    [Documentation]     Sample TestCase For Automation FrameWork
    Login to SSO UI  ${CRM_CREDENTIAL}[username]  ${CRM_CREDENTIAL}[password]
    NAVIGATE SSO UI  ${CRM_UI}

    ${row}=  Read Number of Rows  ${CRM_TestData}  Sheet1
    ${data}=  Read Excel Data of cell  ${CRM_TestData}  Sheet1  1  1


    FOR  ${i}  IN RANGE  1  ${row}+1
      ${profile_ID}=  Read Excel Data of cell  ${CRM_TestData}  Sheet1  ${i}  1
      ${account_ID}=  Read Excel Data of cell  ${CRM_TestData}  Sheet1  ${i}  2
      ${service_ID}=  Read Excel Data of cell  ${CRM_TestData}  Sheet1  ${i}  3
      ${order_ID}=  Read Excel Data of cell  ${CRM_TestData}  Sheet1  ${i}  4
      #Search In By Profile Id  ${profile_ID}
      #Edit Profile Details  email101@gmail.com  911234567890  921234567890
      #Manage tab  ${ProfileDetailsPage}[ManageProfile]
      #Manage Permanent Profile Address
      #Manage Residential Profile Address
      #Go Back to Home Page
      #Search In By Account Id  ${account_ID}
      #Go Back to Home Page
      ##${orderid}=  Provision_Functions.OnBoarding_API    "251793000732"  "8925102406450009248"  "636024060001111"  "ABHIRAM"
      ##Search Order By OrderId1  ${orderid}
      ##Go Back to Home Page
      #Search In By Sevice Id  ${service_ID}
      #Manage Service in Service page
      #Edit Address page
      #Go Back to Home Page
      #Search In By Sevice Id  ${service_ID}
      #Manage Service in Service page
      #change SIM
      #Search In By Sevice Id  ${service_ID}
      #Service page Ticketing
      #Go Back to Home Page
      ##${response}=  Provision_Functions.UpdateStatus    "636024060001111"
      ##Log To Console  ${response}
      #Go Back to Home Page

    END

###########################  Service Address View / Update ######################################

    ${row_4}=  Read Number of Rows  ${CRM_TestData}  ServiceAddressUpdate

    FOR  ${i}  IN RANGE  1  ${row_4}+1
        ${serviceID}=  Read Excel Data of cell  ${CRM_TestData}  ServiceAddressUpdate  ${i}  1
        ${Union}=  Read Excel Data of cell  ${CRM_TestData}  ServiceAddressUpdate  ${i}  2
        ${HomeNo}=  Read Excel Data of cell  ${CRM_TestData}  ServiceAddressUpdate  ${i}  3
        ${StreetNo}=  Read Excel Data of cell  ${CRM_TestData}  ServiceAddressUpdate  ${i}  4
        ${POCode}=  Read Excel Data of cell  ${CRM_TestData}  ServiceAddressUpdate  ${i}  5
        ${POBox}=  Read Excel Data of cell  ${CRM_TestData}  ServiceAddressUpdate  ${i}  6
        ${Latitude}=  Read Excel Data of cell  ${CRM_TestData}  ServiceAddressUpdate  ${i}  7
        ${Longitude}=  Read Excel Data of cell  ${CRM_TestData}  ServiceAddressUpdate  ${i}  8
        ${Comment}=  Read Excel Data of cell  ${CRM_TestData}  ServiceAddressUpdate  ${i}  9

        #Search In By Sevice Id  ${serviceID}
        #Manage tab  ${ServiceDetailsPage}[ManageService]
        #Manage Service Address  ${ProfileDetailsPage}[RegionDropdownOption1]  ${ProfileDetailsPage}[ZoneDropdownOption1]  ${Union}  ${HomeNo}  ${StreetNo}  ${POCode}  ${POBox}  ${Latitude}  ${Longitude}  ${Comment}
        #Go Back to Home Page

    END


###########################  Permanent Address View / Update ######################################

    ${row_2}=  Read Number of Rows  ${CRM_TestData}  AddressUpdate

    FOR  ${i}  IN RANGE  1  ${row_2}+1
        ${profileID}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  1
        ${Union}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  2
        ${HomeNo}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  3
        ${StreetNo}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  4
        ${POCode}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  5
        ${POBox}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  6
        ${Latitude}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  7
        ${Longitude}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  8
        ${Comment}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  9


        #Search In By Profile Id  ${profileID}
        #Manage tab  ${ProfileDetailsPage}[ManageProfile]
        #Manage Permanent Profile Address  ${ProfileDetailsPage}[RegionDropdownOption2]  ${ProfileDetailsPage}[ZoneDropdownOption2]  ${Union}  ${HomeNo}  ${StreetNo}  ${POCode}  ${POBox}  ${Latitude}  ${Longitude}  ${Comment}
        #Go Back to Home Page
    END

###########################  Residential Address View / Update ######################################

    ${row_2}=  Read Number of Rows  ${CRM_TestData}  AddressUpdate

    FOR  ${i}  IN RANGE  1  ${row_2}+1
        ${profileID}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  1
        ${Union}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  2
        ${HomeNo}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  3
        ${StreetNo}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  4
        ${POCode}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  5
        ${POBox}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  6
        ${Latitude}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  7
        ${Longitude}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  8
        ${Comment}=  Read Excel Data of cell  ${CRM_TestData}  AddressUpdate  ${i}  9


        #Search In By Profile Id  ${profileID}
        #Manage tab  ${ProfileDetailsPage}[ManageProfile]
        #Manage Residential Profile Address  ${ProfileDetailsPage}[Residential_RegionDropdownOption1]  ${ProfileDetailsPage}[Residential_ZoneDropdownOption1]  ${Union}  ${HomeNo}  ${StreetNo}  ${POCode}  ${POBox}  ${Latitude}  ${Longitude}  ${Comment}
        #Go Back to Home Page
    END


###########################  Pofile Detail View / Update     ######################################

    ${row_3}=  Read Number of Rows  ${CRM_TestData}  ProfileInfoUpdate

    FOR  ${i}  IN RANGE  1  ${row_3}+1
        ${profileID}=  Read Excel Data of cell  ${CRM_TestData}  ProfileInfoUpdate  ${i}  1
        ${emailID}=  Read Excel Data of cell  ${CRM_TestData}  ProfileInfoUpdate  ${i}  2
        ${contact}=  Read Excel Data of cell  ${CRM_TestData}  ProfileInfoUpdate  ${i}  3
        ${alternatecontact}=  Read Excel Data of cell  ${CRM_TestData}  ProfileInfoUpdate  ${i}  4

        #Search In By Profile Id  ${profileID}
        #Edit Profile Details  ${emailID}  ${contact}  ${alternatecontact}
        #Refresh tab  ${ProfileDetailsPage}[ProfileRfresh]
        #Go Back to Home Page

    END

###########################  Account Address View / Update ######################################

        ${row_6}=  Read Number of Rows  ${CRM_TestData}  AccountAddressUpdate

        FOR  ${i}  IN RANGE  1  ${row_6}+1
            ${account_ID}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  1
            ${Union}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  2
            ${HomeNo}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  3
            ${StreetNo}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  4
            ${POCode}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  5
            ${POBox}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  6
            ${Latitude}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  7
            ${Longitude}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  8
            ${Comment}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  9

            Search In By Account Id  ${account_ID}
            Edit Account Details
            Manage tab  ${AccoutDetailPage}[ManageAccount]
            Manage Account Address   ${AccoutDetailPage}[RegionDropdown]  ${AccoutDetailPage}[ZoneDropdown]  ${Union}  ${HomeNo}  ${StreetNo}  ${POCode}  ${POBox}  ${Latitude}  ${Longitude}  ${Comment}
            Go Back to Home Page

        END

###########################  Account details View / Update ######################################

        ${row_7}=  Read Number of Rows  ${CRM_TestData}  AccountAddressUpdate

        FOR  ${i}  IN RANGE  1  ${row_6}+1
            ${account_ID}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  1
            ${Union}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  2
            ${HomeNo}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  3
            ${StreetNo}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  4
            ${POCode}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  5
            ${POBox}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  6
            ${Latitude}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  7
            ${Longitude}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  8
            ${Comment}=  Read Excel Data of cell  ${CRM_TestData}  AccountAddressUpdate  ${i}  9

            Search In By Account Id  ${account_ID}
            Edit Account Details
            Go Back to Home Page

        END