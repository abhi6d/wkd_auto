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





Go Back to Home Page
    [Documentation]    To Navigate to Home screen of CRM UI
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeButton]

Handle PopUp
    [Arguments]     ${locator}  ${Expectedvalue}
    Verify elements is visible and displayed  ${locator}
    ${String}=  get text     ${locator}
    Log To Console  ------------------------
    Log To Console  ${String}
    Log To Console  ------------------------
    Should be equal  ${String}   ${Expectedvalue}


Edit Profile Details two
    [Documentation]    To Edit the Profile level details
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
    [Documentation]    To Edit Account level details
    [Arguments]     ${caseID}  ${dataID}

    ${ACCOUNT}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  ACCOUNT_DETAILS  ${caseID}  ${dataID}
    Log To Console  ${ACCOUNT}
    ${ACCOUNT_ID}=  getData  ${ACCOUNT}  ACCOUNT_ID
    ${ACCOUNT_NAME}=  getData  ${ACCOUNT}  ACCOUNT_NAME
    ${EMAIL}=  getData  ${ACCOUNT}  EMAIL
    ${CONTACT_NO}=  getData  ${ACCOUNT}  CONTACT_NO
    ${LANGUAGE}=  getData  ${ACCOUNT}  LANGUAGE
    ${KEY_ACC_MANAGER}=  getData  ${ACCOUNT}  KEY_ACC_MANAGER
    ${BILL_MEDIUM}=  getData  ${ACCOUNT}  BILL_MEDIUM
    ${BANK_NAME}=  getData  ${ACCOUNT}  BANK_NAME
    ${BRANCH_CODE}=  getData  ${ACCOUNT}  BRANCH_CODE
    ${BRANCH_ACCOUNT_TYPE}=  getData  ${ACCOUNT}  BRANCH_ACCOUNT_TYPE
    ${BRANCH_ACCOUNT_NO}=  getData  ${ACCOUNT}  BRANCH_ACCOUNT_NO

    ${contact}=  Generate random string        12     0123456789
    Search By ID  ${HomePage}[HomeSeachOptionAccountId]  ${ACCOUNT_ID}
    Click Item  ${AccoutDetailPage}[EditDetails]
    Set Input  ${AccoutDetailPage}[AccountName]  ${ACCOUNT_NAME}
    Set Dropdown  ${AccoutDetailPage}[LanguageDropdown]  ${LANGUAGE}
    Set Input  ${AccoutDetailPage}[ContactInput]  ${CONTACT_NO}
    Set Dropdown  ${AccoutDetailPage}[AccountManagerDropdown]  ${KEY_ACC_MANAGER}
    Set Dropdown  ${AccoutDetailPage}[BillMediumDropdown]  ${BILL_MEDIUM}
    Set Dropdown  ${AccoutDetailPage}[BankNameDropdown]  ${BANK_NAME}
    Set Dropdown  ${AccoutDetailPage}[AccountTypeDropdown]  ${BRANCH_ACCOUNT_TYPE}
    Click Item  ${AccoutDetailPage}[Submit]
    Go Back to Home Page

Edit Service Details two
    [Documentation]    To edit Sevice level details
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
    [Documentation]    To edit Profile level recidential address
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
    [Documentation]    To edit profile level permanent address
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
    [Documentation]    To edit account level details
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  ACCOUNT_ADDRESS  ${caseID}  ${dataID}
    ${ACCOUNT_ID}=  getData  ${data}  ACCOUNT_ID
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

    Search By ID  ${HomePage}[HomeSeachOptionAccountId]  ${ACCOUNT_ID}
    Click Item  ${AccoutDetailPage}[ManageAccount]
    Click Item  ${AccoutDetailPage}[AddressDetail]
    Click Item  ${AccoutDetailPage}[EditAccountDetail]
    Set Dropdown  ${AccoutDetailPage}[RegionDropdown]  ${REGION}
    Set Dropdown  ${AccoutDetailPage}[ZoneDropdown]  ${ZONE}
    Set Input  ${AccoutDetailPage}[UnionInput]      ${Union}
    Set Input  ${AccoutDetailPage}[HouseNoInput]      ${HomeNo}
    Set Input  ${AccoutDetailPage}[StreetInput]      ${StreetNo}
    Set Input  ${AccoutDetailPage}[PostalCodeInput]      ${POCode}
    Set Input  ${AccoutDetailPage}[POInput]      ${POBox}
    Set Input  ${AccoutDetailPage}[LatitudeInput]      ${Latitude}
    Set Input  ${AccoutDetailPage}[LongitudeInput]      ${Longitude}
    Set Input  ${AccoutDetailPage}[AddressComment]      ${Comment}
    Click Item  ${AccoutDetailPage}[Submit]
    Go Back to Home Page


Manage Service Address One
    [Documentation]    To edit service level details
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
    [Documentation]    To Buy Add-on offers
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
    [Documentation]    To change SIM number
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

    #Select Radio Button   upfrontPayment    2
    #Click Item    //input[@type='checkbox']
    #Select Checkbox  //input[@type='checkbox']
    Set Radio Button  upfrontPayment  ${VALUE}
    #${bool}=    Radio Button Should Be Set To   upfrontPayment  2
    #${bool}=    Execute Javascript      var a = document.querySelectorAll('input[type=radio]');for(var i=0;i<a.length;i++){if(a[i].checked==true && a[i].nextSibling.innerHTML.trim() === '${locator_label}') return true; else return false;}

    #${a}=    Execute Javascript      var a = document.querySelectorAll('input[value=2]');return a;console.log(a)
    #${a}=    Execute Javascript      var a = document.querySelectorAll('input[type=radio]');for(var i=0;i<a.length;i++){if(a[i].checked==true && a[i].value == '1') return true; else return false;}
    #@${a}=    Execute Javascript      var a = document.querySelectorAll('input[name=upfrontPayment]');for(var i=0;i<a.length;i++){if(a[i].checked==true) return i; else return false;}

    #Log To Console  ${a}

    Click Item    (//button[text()='Submit'])[2]
    Click Item    //span[@class='MuiIconButton-label']//*[name()='svg']
    Go Back to Home Page

    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[UpfrontPamentSubmit]

    #Go Back to Home Page

View Identification Details
    [Documentation]    To view and validate identification details
    [Arguments]     ${caseID}  ${dataID}
    ${PROFILE}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  PROFILE_DETAILS  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${PROFILE}  PROFIE_ID
    ${ID_NUMBER}=  getData  ${PROFILE}  ID_NUMBER
    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    Click Item  ${ProfileDetailsPage}[ManageProfile]
    Click Item  ${ProfileDetailsPage}[IdentificationDetails]
    Verify elements is visible and displayed  //td[normalize-space()='${ID_NUMBER}']
    Go Back to Home Page

View Document Details
    [Documentation]    To view and validate document details
    [Arguments]     ${caseID}  ${dataID}
    ${PROFILE}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  PROFILE_DETAILS  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${PROFILE}  PROFIE_ID
    ${DOCUMENT_ID}=  getData  ${PROFILE}  DOCUMENT_ID

    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    Click Item  ${ProfileDetailsPage}[ManageProfile]
    scroll element into view     ${ProfileDetailsPage}[ViewDocumentDetails]
    Click Item  ${ProfileDetailsPage}[ViewDocumentDetails]
    Set Input         ${ProfileDetailsPage}[InputDocumentID]   ${DOCUMENT_ID}
    Click Item  ${ProfileDetailsPage}[DocumentSearch]

    Go Back to Home Page



Search Order By OrderId
    [Documentation]    To look Up order by Order ID
    [Arguments]     ${caseID}  ${dataID}
    #[Arguments]     ${ORDER_ID}
    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  ORDER_INFO  ${caseID}  ${dataID}
    ${ORDER_ID}=  getData  ${data}  ORDER_ID
    Log To Console  ${ORDER_ID}
    click element   ${OrderSearch}[Ordertab]
    click element   ${OrderSearch}[viewOrder]
    Set Input  ${OrderSearch}[OrderSearchbar]      ${ORDER_ID}
    click element   ${OrderSearch}[SearchButton]
    scroll element into view     (//button[@type='button'])[7]
    click element   (//button[@type='button'])[7]
    click element   //button[@aria-label='View']
    Sleep  10s
    click element   ${OrderSearch}[OrderCloseButton]



Create Ticket
    [Documentation]    To Create new ticket
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
    [Documentation]    To filter tickets based on priority and Ticket ID
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  FILTER_TICKETS  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  SERVICE_ID
    ${STATUS}=  getData  ${data}  STATUS
    ${TICKET_ID}=  getData  ${data}  TICKET_ID

    Search By ID      ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item        ${ServiceDetailsPage}[ViewTickets]
    #Click Item        ${ServiceDetailsPage}[AdvanceSearchinViewTicket]
    Set Input         ${ServiceDetailsPage}[InputTicketID]   ${TICKET_ID}
    Set Dropdown      ${ServiceDetailsPage}[ViewTicketStatusDropdown]   ${STATUS}
    Click Item        ${ServiceDetailsPage}[ViewTicketSearch]
    Verify elements is visible and displayed  //td[normalize-space()='${TICKET_ID}']
    Go Back to Home Page


Alter Account State
    [Documentation]    To alter account state
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  ALTER_ACCOUNT_STATE  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  ServiceID
    ${STATUS}=  getData  ${data}  STATUS
    ${REASON}=  getData  ${data}  REASON
    ${COMMENT}=  getData  ${data}  COMMENT

    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item  ${ServiceDetailsPage}[ManageService]
    scroll element into view     ${ServiceDetailsPage}[ChangeLifeCycle]
    Click Item     ${ServiceDetailsPage}[ChangeLifeCycle]
    Set Dropdown   ${ServiceDetailsPage}[ChangeLifeCycleStatusDropdown]  ${STATUS}
    Set Dropdown   ${ServiceDetailsPage}[ChangeLifeCycleReasonDropdown]  ${REASON}
    Set Input      ${ServiceDetailsPage}[CommentsChangeLifeCycleInput]   ${COMMENT}
    Click Item     ${ServiceDetailsPage}[SubmitChangeLifeCycleButton]
    Go Back to Home Page


Suspend Supplementary Plan
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}   SERVICE_DETAILS  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  SERVICE_ID

    Click Item      ${HomePage}[HomeSeachOptionServiceId]
    Set Input      ${HomePage}[HomeSearchBar]    ${SERVICE_ID}
    Click Item   ${HomePage}[HomeSearchButton]
    Click Item      ${ServiceDetailsPage}[PlanSubscriptionButton]
    Sleep  3s
    scroll element into view  ${ServiceDetailsPage}[ActiomToCancelSubscriptionButton]
    Sleep  3s
    Click Item    ${ServiceDetailsPage}[ActiomToCancelSubscriptionButton]
    Sleep  3s
    Click Item    ${ServiceDetailsPage}[SuspendPlanButton]
    Sleep  3s
    Click Item    ${ServiceDetailsPage}[YesButton]
    Handle PopUp   ${ServiceDetailsPage}[OrderPlacedSuccessfully]    Order Placed Successfully

Update HLR Status

    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}   HLR  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  ServiceID
    ${NEW_DEVICE_STATUS}=  getData  ${data}  New device status
    ${Action}=  getData  ${data}  Action

    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item    ${ServiceDetailsPage}[ManageService]
    Click Item    ${ServiceDetailsPage}[HLR/EIR Status]
    Set Dropdown    ${ServiceDetailsPage}[HLRNewDeviceStatus]   ${NEW_DEVICE_STATUS}
    Set Dropdown    ${ServiceDetailsPage}[HLRStatusAction]      ${Action}
    Click Item    ${ServiceDetailsPage}[HLRStatusSubmitButton]