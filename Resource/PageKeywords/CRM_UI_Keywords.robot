*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library    Collections
Library    String
Variables    ../../Resource/PageObjects/PageObjects.yaml
Variables    ../../Resource/PageObjects/TestData.yaml
Resource     ../../Resource/PageKeywords/Common.robot
Library  ../TestData/ReadDataFromExcel.py

Library     OperatingSystem
Library     SeleniumLibrary
Library    Collections
Library    String
Variables    ../../Resource/PageObjects/PageObjects.yaml
Variables    ../../Resource/PageObjects/TestData.yaml
Resource     ./Common.robot


*** Variables ***
${URL}      ${TestData}[URL]
${Broswer}  ${TestData}[Browser]
${Environment}      ${TestData}[Environment]
${OrderSearch}      ${CRMPage}[OrderSearch]
${LoginPage}      ${CRMPage}[LoginPage]
${TimeOut}      60s
${Start}        1s

${URL}      ${TestData}[URL]
${Broswer}  ${TestData}[Browser]
${Environment}      ${TestData}[Environment]
${OrderSearch}      ${CRMPage}[OrderSearch]
${TimeOut}      120s
${Start}        1s
${Orderid}=  960908078870589440


#############################################################

${CRM_TestData}     ${TestData}[CRM_TestData]
${WKD_CRM_TESTDATA}     ${TestData}[WKD_CRM_TESTDATA]
${CRM_CREDENTIAL}     ${TestData}[USER][crm_user]
${CRM_UI}  ${wkd}[SSOPage][crm]
${ProfileDetailsPage}  ${CRMPage}[ProfileDetailPage]
${AccoutDetailPage}  ${CRMPage}[AccoutDetailPage]
${ServiceDetailsPage}  ${CRMPage}[ServiceDetailsPage]
${HomePage}  ${CRMPage}[HomePage]        # Importing Home page Components
*** Keywords ***


#Manage tab
#    [Arguments]     ${Managetab}
#    #Verify elements is visible and displayed  ${Managetab}
#    wait until element is visible    ${Managetab}
#    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${Managetab}

#Refresh tab
#    [Arguments]     ${Refreshtab}
#    wait until element is visible    ${Refreshtab}
#    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${Refreshtab}



Set Radio Button
     [Arguments]     ${label}  ${value}
     Select Radio Button   ${label}  ${value}


Go Back to Home Page
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeButton]




Edit Profile Details two
    [Arguments]     ${caseID}  ${dataID}

    ${PROFILE}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  PROFILE_DETAILS  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${PROFILE}  PROFIE_ID
    ${email}=  getData  ${PROFILE}  EMAIL
    ${contact}=  getData  ${PROFILE}  CONTACT
    ${alternate_Contact}=  getData  ${PROFILE}  ALTERNATE CONTACT

    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    Sleep  10s
    Click Item  ${ProfileDetailsPage}[EditProfileDetail]
    Set Input  ${ProfileDetailsPage}[EmailInput]  ${email}
    Set Input  ${ProfileDetailsPage}[ContactNumberInput]  ${contact}
    Set Input  ${ProfileDetailsPage}[AlternateContactInput]  ${alternate_Contact}
    Click Item  ${ProfileDetailsPage}[EditProfileSubmit]
    Go Back to Home Page



Edit Account Details two
    [Arguments]     ${caseID}  ${dataID}

    ${ACCOUNT}=  Fetch From Excel  ${CRM_TestData}  ACCOUNT  ${caseID}  ${dataID}
    ${ACCOUNT_ID}=  getData  ${ACCOUNT}  AccountID
    ${ACCOUNT_NAME}=  getData  ${ACCOUNT}  AccountName
    ${contact}=  Generate random string        12     0123456789
    Search By ID  ${HomePage}[HomeSeachOptionAccountId]  ${ACCOUNT_ID}
    #Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[EditDetails]
    Click Item  ${AccoutDetailPage}[EditDetails]
    Set Input  ${AccoutDetailPage}[AccountName]  ${ACCOUNT_NAME}
    #Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[LanguageDropdown]
    Set Dropdown  ${AccoutDetailPage}[LanguageDropdown]  Amharic
    Set Input  ${AccoutDetailPage}[ContactInput]  ${contact}
    #Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[AccountManagerDropdown]
    Set Dropdown  ${AccoutDetailPage}[AccountManagerDropdown]  slm_impl
    #Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[BillMediumDropdown]
    Set Dropdown  ${AccoutDetailPage}[BillMediumDropdown]  Email
    #Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[BankNameDropdown]
    #Set Dropdown  ${AccoutDetailPage}[BankNameDropdown]  NATIONAL BANK OF ETHOPIA
    #Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[AccountTypeDropdown]
    #Set Dropdown  ${AccoutDetailPage}[AccountTypeDropdown]  CURRENT
    #Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[Submit]
    Click Item  ${AccoutDetailPage}[Submit]
    Go Back to Home Page

Edit Service Details two

    [Arguments]     ${caseID}  ${dataID}
    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  SERVICE_DETAILS  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  SERVICE_ID
    ${serviceIndex}=  getData  ${data}  SERVICE_NAME

    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item  ${ServiceDetailsPage}[EditDetails]
    Set Input  ${ServiceDetailsPage}[ServiceNameInput]      ${serviceIndex}
    Click Item  ${ServiceDetailsPage}[Submit]
    Go Back to Home Page


Manage Profile Residential Address two
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  PROFILE_ADDRESS  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${data}  PROFIE_ID
    ${REGION}=  getData  ${data}  REGION
    ${ZONE}=  getData  ${data}  ZONE
    ${WOREDA}=  getData  ${data}  WOREDA
    ${Union}=  getData  ${data}  UNION
    ${HomeNo}=  getData  ${data}  HOME_NO
    ${StreetNo}=  getData  ${data}  STREET_NO
    ${POCode}=  getData  ${data}  PO_CODE
    ${POBox}=  getData  ${data}  PO_BOX
    ${Latitude}=  getData  ${data}  LATITUDE
    ${Longitude}=  getData  ${data}  LONGITUDE
    ${Comment}=  getData  ${data}  COMMENT


    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    #Manage tab  ${ProfileDetailsPage}[ManageProfile]
    Click Item  ${ProfileDetailsPage}[ManageProfile]
    Click Item  ${ProfileDetailsPage}[ManageProfileAddress]
    Click Item  ${ProfileDetailsPage}[ResidentialAddressEdit]
    Set Dropdown  ${ProfileDetailsPage}[Residential_ProfileRegionDropdown]  ${REGION}
    Set Dropdown  ${ProfileDetailsPage}[Residential_ProfileZoneDropdown]  ${ZONE}
    Set Input  ${ProfileDetailsPage}[Residential_UnionInput]      ${Union}
    Set Input  ${ProfileDetailsPage}[Residential_HouseNoInput]      ${HomeNo}
    Set Input  ${ProfileDetailsPage}[Residential_StreetInput]      ${StreetNo}
    Set Input  ${ProfileDetailsPage}[Residential_PostalCodeInput]      ${POCode}
    Set Input  ${ProfileDetailsPage}[Residential_POInput]      ${POBox}
    Set Input  ${ProfileDetailsPage}[Residential_LatitudeInput]      ${Latitude}
    Set Input  ${ProfileDetailsPage}[Residential_LongitudeInput]      ${Longitude}
    Set Input  ${ProfileDetailsPage}[Residential_AddressComment]      ${Comment}
    Click Item  ${ProfileDetailsPage}[ResidentialAddressSubmit]
    Go Back to Home Page


Manage Profile Permanent Address two
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  PROFILE_ADDRESS  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${data}  PROFIE_ID
    ${REGION}=  getData  ${data}  REGION
    ${ZONE}=  getData  ${data}  ZONE
    ${WOREDA}=  getData  ${data}  WOREDA
    ${Union}=  getData  ${data}  UNION
    ${HomeNo}=  getData  ${data}  HOME_NO
    ${StreetNo}=  getData  ${data}  STREET_NO
    ${POCode}=  getData  ${data}  PO_CODE
    ${POBox}=  getData  ${data}  PO_BOX
    ${Latitude}=  getData  ${data}  LATITUDE
    ${Longitude}=  getData  ${data}  LONGITUDE
    ${Comment}=  getData  ${data}  COMMENT

    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    #Manage tab  ${ProfileDetailsPage}[ManageProfile]
    Click Item  ${ProfileDetailsPage}[ManageProfile]
    Click Item  ${ProfileDetailsPage}[ManageProfileAddress]
    Click Item  ${ProfileDetailsPage}[PermanentAddressEdit]
    Set Dropdown  ${ProfileDetailsPage}[ProfileRegionDropdown]  ${REGION}
    Set Dropdown  ${ProfileDetailsPage}[ProfileZoneDropdown]  ${ZONE}
    Set Input  ${ProfileDetailsPage}[UnionInput]      ${Union}
    Set Input  ${ProfileDetailsPage}[HouseNoInput]      ${HomeNo}
    Set Input  ${ProfileDetailsPage}[StreetInput]      ${StreetNo}
    Set Input  ${ProfileDetailsPage}[PostalCodeInput]      ${POCode}
    Set Input  ${ProfileDetailsPage}[POInput]      ${POBox}
    Set Input  ${ProfileDetailsPage}[LatitudeInput]      ${Latitude}
    Set Input  ${ProfileDetailsPage}[LongitudeInput]      ${Longitude}
    Set Input  ${ProfileDetailsPage}[AddressComment]      ${Comment}
    Click Item  ${ProfileDetailsPage}[PermanentAddressSubmit]
    Go Back to Home Page

Manage Account Address One
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${CRM_TestData}  ACCOUNT  ${caseID}  ${dataID}
    ${ACCOUNT_ID}=  getData  ${data}  AccountID
    ${Union}=  getData  ${data}  UNION
    ${HomeNo}=  getData  ${data}  HOME_NO
    ${StreetNo}=  getData  ${data}  STREET_NO
    ${POCode}=  getData  ${data}  PO_CODE
    ${POBox}=  getData  ${data}  PO_BOX
    ${Latitude}=  getData  ${data}  LATITUDE
    ${Longitude}=  getData  ${data}  LONGITUDE
    ${Comment}=  getData  ${data}  COMMENT

    Search By ID  ${HomePage}[HomeSeachOptionAccountId]  ${ACCOUNT_ID}
    Manage tab  ${AccoutDetailPage}[ManageAccount]

    wait until element is visible    ${AccoutDetailPage}[AddressDetail]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[AddressDetail]
    wait until element is visible    ${AccoutDetailPage}[EditAccountDetail]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[EditAccountDetail]
    wait until element is visible    ${AccoutDetailPage}[RegionDropdown]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[RegionDropdown]
    wait until element is visible    ${AccoutDetailPage}[DropdownOption1]
    click element      ${AccoutDetailPage}[DropdownOption1]
    wait until element is visible    ${AccoutDetailPage}[ZoneDropdown]
    click element      ${AccoutDetailPage}[ZoneDropdown]
    wait until element is visible    ${AccoutDetailPage}[DropdownOption1]
    click element      ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[UnionInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[UnionInput]      ${Union}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[HouseNoInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[HouseNoInput]      ${HomeNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[StreetInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[StreetInput]      ${StreetNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[PostalCodeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[PostalCodeInput]      ${POCode}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[POInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[POInput]      ${POBox}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[LatitudeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[LatitudeInput]      ${Latitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[LongitudeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[LongitudeInput]      ${Longitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[AddressComment]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[AddressComment]      ${Comment}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[Submit]
    Go Back to Home Page


Manage Service Address One
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  SERVICE_ADDRESS  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  SERVICE_ID
    ${REGION}=  getData  ${data}  REGION
    ${ZONE}=  getData  ${data}  ZONE
    ${WOREDA}=  getData  ${data}  WOREDA
    ${Union}=  getData  ${data}  UNION
    ${HomeNo}=  getData  ${data}  HOME_NO
    ${StreetNo}=  getData  ${data}  STREET_NO
    ${POCode}=  getData  ${data}  PO_CODE
    ${POBox}=  getData  ${data}  PO_BOX
    ${Latitude}=  getData  ${data}  LATITUDE
    ${Longitude}=  getData  ${data}  LONGITUDE
    ${Comment}=  getData  ${data}  COMMENT

    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    #Manage tab  ${ServiceDetailsPage}[ManageService]
    Click Item  ${ServiceDetailsPage}[ManageService]
    Click Item  ${ServiceDetailsPage}[AddressDetail]
    Click Item  ${ServiceDetailsPage}[AddressEdit]
    Set Dropdown  ${ServiceDetailsPage}[RegionDropdown]  ${REGION}
    Set Dropdown  ${ServiceDetailsPage}[ZoneDropdown]  ${ZONE}
    Set Input  ${ServiceDetailsPage}[UnionInput]      ${Union}
    Set Input  ${ServiceDetailsPage}[HouseNoInput]      ${HomeNo}
    Set Input  ${ServiceDetailsPage}[StreetInput]      ${StreetNo}
    Set Input  ${ServiceDetailsPage}[PostalCodeInput]      ${POCode}
    Set Input  ${ServiceDetailsPage}[POInput]      ${POBox}
    Set Input  ${ServiceDetailsPage}[LatitudeInput]      ${Latitude}
    Set Input  ${ServiceDetailsPage}[LongitudeInput]      ${Longitude}
    Set Input  ${ServiceDetailsPage}[AddressComment]      ${Comment}
    Click Item  ${ServiceDetailsPage}[Submit]
    Go Back to Home Page


Add Supplementary Offer
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  OFFER  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  SERVICE_ID
    ${OFFER}=  getData  ${data}  OFFER

    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Sleep  20s
    #wait until element is visible    ${ServiceDetailsPage}[PlanSubscriptionButton]
    Click Item    ${ServiceDetailsPage}[PlanSubscriptionButton]
    Click Item    ${ServiceDetailsPage}[BuyAddOnsButton]
    Sleep  5s
    scroll element into view    //div[contains(text(),'${OFFER}')]/child::input
    Click Item    //div[contains(text(),'${OFFER}')]/child::input
    Click Item    ${ServiceDetailsPage}[AddToCartButton]
    Click Item    ${ServiceDetailsPage}[AddToCartSubmitButton]
    Click Item    ${ServiceDetailsPage}[OrderOverviewSubmitButton]
    Click Item    ${ServiceDetailsPage}[OrderOverViewDoneButton]
    Go Back to Home Page

change SIM ID
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  SIM_CHANGE  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  SERVICE_ID
    ${VALUE}=  getData  ${data}  PAYMENT
    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item    ${ServiceDetailsPage}[ManageService]
    Click Item    ${ServiceDetailsPage}[ManageSim]
    Click Item    ${ServiceDetailsPage}[ChangeSimButton]
    Click Item    ${ServiceDetailsPage}[NewICCIDSimID]
    Click Item    ${ServiceDetailsPage}[SimChangeReasonDropdown]
    Click Item    ${ServiceDetailsPage}[SimChangeReasonDropdownOption1]
    Click Item    ${ServiceDetailsPage}[SimChangeComment]
    Set Input  ${ServiceDetailsPage}[SimChangeComment]      Edit1
    Click Item    ${ServiceDetailsPage}[SimChangeSubmit]
    Sleep   10s
    #Select Radio Button   upfrontPayment    2
    #Click Item    //input[@type='checkbox']
    Select Checkbox  //input[@type='checkbox']
    Set Radio Button  upfrontPayment  ${VALUE}
    #${bool}=    Radio Button Should Be Set To   upfrontPayment  2
    #${bool}=    Execute Javascript      var a = document.querySelectorAll('input[type=radio]');for(var i=0;i<a.length;i++){if(a[i].checked==true && a[i].nextSibling.innerHTML.trim() === '${locator_label}') return true; else return false;}

    #${a}=    Execute Javascript      var a = document.querySelectorAll('input[value=2]');return a;console.log(a)
    #${a}=    Execute Javascript      var a = document.querySelectorAll('input[type=radio]');for(var i=0;i<a.length;i++){if(a[i].checked==true && a[i].value == '1') return true; else return false;}
    #@${a}=    Execute Javascript      var a = document.querySelectorAll('input[name=upfrontPayment]');for(var i=0;i<a.length;i++){if(a[i].checked==true) return i; else return false;}

    #Log To Console  ${a}
    Sleep   10s
    Click Item    (//button[text()='Submit'])[2]

    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[UpfrontPamentSubmit]
    Sleep   5s
    #Go Back to Home Page

View Identification Details
    [Arguments]     ${caseID}  ${dataID}
    ${PROFILE}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  PROFILE_DETAILS  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${PROFILE}  PROFIE_ID
    ${ID_NUMBER}=  getData  ${PROFILE}  ID_NUMBER
    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    Click Item  ${ProfileDetailsPage}[ManageProfile]
    Click Item  ${ProfileDetailsPage}[IdentificationDetails]
    #wait until element is visible    ${ProfileDetailsPage}[ViewDocument]
    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ViewDocument]
    #wait until element is visible    ${ProfileDetailsPage}[DownloadDocument]
    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[DownloadDocument]
    #Sleep  5s
    #wait until element is visible    ${ProfileDetailsPage}[DocumentDone]
    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[DocumentDone]
    Verify elements is visible and displayed  //td[normalize-space()='${ID_NUMBER}']
    Go Back to Home Page

Search Order By OrderId
    [Arguments]     ${Orderid}
    wait until element is visible    ${OrderSearch}[Ordertab]
    click element   ${OrderSearch}[Ordertab]
    wait until element is visible    ${OrderSearch}[viewOrder]
    click element   ${OrderSearch}[viewOrder]
    wait until element is visible    ${OrderSearch}[Ordertype]
    click element   ${OrderSearch}[Ordertype]
    wait until element is visible    ${OrderSearch}[OrderSearchbar]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${OrderSearch}[OrderSearchbar]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${OrderSearch}[OrderSearchbar]      ${Orderid}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${OrderSearch}[SearchButton]
    click element   ${OrderSearch}[OrderAction]
    click element   ${OrderSearch}[OrderView]
    wait until element is visible    ${OrderSearch}[OrderCloseButton]
    click element   ${OrderSearch}[OrderCloseButton]



Create Ticket
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}   CREATE_TICKET  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  ServiceID
    ${PRODUCT_TYPE}=  getData  ${data}  Product_Type
    ${CASE_TYPE}=  getData  ${data}     Case_Type
    ${CASE_CATEGORY}=  getData  ${data}   Case_Category
    ${PRIORITY}=  getData  ${data}      Priority
    ${TEAM}=  getData  ${data}      Team
    ${ASSIGNE}=  getData  ${data}      Assigne
    ${SUBJECT}=  getData  ${data}       Subject
    ${CAUSED_CODE}=  getData  ${data}   Caused_Code
    ${CHANNEL}=  getData  ${data}       Channel
    ${CASE_NATURE}=  getData  ${data}       Case_Nature
    ${CASE_SUB_NATURE}=  getData  ${data}  Case_Sub_Nature
    ${NAME}=  getData  ${data}  Name
    ${EMAIL}=  getData  ${data}       Email
    ${CONTACT_NUMBER}=  getData  ${data}   Contact_Number
    ${DESCRIPTION}=  getData  ${data}      Description

    Search By ID      ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item        ${ServiceDetailsPage}[ViewTickets]
    Click Item        ${ServiceDetailsPage}[CreateTicketButton]
    Switch Window    new
    Set Dropdown2     ${ServiceDetailsPage}[ProductTypeDropdown]  ${PRODUCT_TYPE}
    Set Dropdown2     ${ServiceDetailsPage}[CaseTypeDropdown]    ${CASE_TYPE}
    Set Input         ${ServiceDetailsPage}[NameInput]   ${NAME}
    Set Input         ${ServiceDetailsPage}[EmailInput]   ${EMAIL}
    Set Input         ${ServiceDetailsPage}[Contact Number]   ${CONTACT_NUMBER}
    Set Input         ${ServiceDetailsPage}[Descripion]     ${DESCRIPTION}
    Click Item        ${ServiceDetailsPage}[Save]


Filter Ticket By Status Open
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  FILTER_TICKETS  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  SERVICE_ID
    ${STATUS}=  getData  ${data}  STATUS

    Search By ID      ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item        ${ServiceDetailsPage}[ViewTickets]
    Click Item        ${ServiceDetailsPage}[AdvanceSearchinViewTicket]
    Set Dropdown      ${ServiceDetailsPage}[ViewTicketStatusDropdown]   ${STATUS}
    Click Item        ${ServiceDetailsPage}[ViewTicketSearch]



Alter Account State
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  ALTER_ACCOUNT_STATE  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  ServiceID
    ${STATUS}=  getData  ${data}  STATUS
    ${REASON}=  getData  ${data}  REASON
    ${COMMENT}=  getData  ${data}  COMMENT

    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    #Manage tab  ${ServiceDetailsPage}[ManageService]
    Click Item  ${ServiceDetailsPage}[ManageService]
    scroll element into view     ${ServiceDetailsPage}[ChangeLifeCycle]
    Click Item     ${ServiceDetailsPage}[ChangeLifeCycle]
    Set Dropdown   ${ServiceDetailsPage}[ChangeLifeCycleStatusDropdown]  ${STATUS}
    Set Dropdown   ${ServiceDetailsPage}[ChangeLifeCycleReasonDropdown]  ${REASON}
    Set Input      ${ServiceDetailsPage}[CommentsChangeLifeCycleInput]   ${COMMENT}
    Click Item     ${ServiceDetailsPage}[SubmitChangeLifeCycleButton]