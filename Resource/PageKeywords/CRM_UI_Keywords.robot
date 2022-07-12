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


Validate Value
    [Arguments]     ${value}  ${locator}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}     wait until page contains element    ${locator}



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

Set Slider
    [Arguments]     ${label}  ${value}
    #${String}=  get text     ${locator}
    #Log To Console  ${String}
    ${Is_Checkbox_Selected}=    Run Keyword And Return Status    Checkbox Should Be Selected    //label[text()='${label}']/following-sibling::div/label//span/input[@type='checkbox']
    #Run Keyword If  '${Is_Checkbox_Selected}' != 'False'  Log To Console  NANACONDITION

    #Click Item  ${locator}

    ${passed}=    Run Keyword If  '${Is_Checkbox_Selected}' == 'False'  Set Variable    NO
    ...  ELSE IF  '${Is_Checkbox_Selected}' == 'True'  Set Variable    YES
    ...  ELSE  Log To Console  SLIDER STATUS SHOULD BE BINARY[True/False]

    Log To Console  bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
    Log To Console  ${passed}
    Log To Console  bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb

    Run Keyword If  '${value}' != '${passed}'  Click Item  //label[text()='${label}']/following-sibling::div/label//div
    ...  ELSE IF  '${value}' == 'nan'  Log To Console  Blank
    ...  ELSE  Log To Console  SLIDER STATUS SHOULD BE BINARY[YES/NO]




Edit Profile Details two
    [Documentation]    To Edit the Profile level details
    [Arguments]     ${caseID}  ${dataID}

    ${PROFILE}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  PROFILE_DETAILS  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${PROFILE}  PROFIE_ID
    ${email}=  getData  ${PROFILE}  EMAIL
    ${contact}=  getData  ${PROFILE}  CONTACT
    ${alternate_Contact}=  getData  ${PROFILE}  ALTERNATE CONTACT

    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    Click Item  ${ProfileDetailsPage}[EditProfileDetail]
    Set Input  ${ProfileDetailsPage}[EmailInput]  ${email}
    Set Input  ${ProfileDetailsPage}[ContactNumberInput]  ${contact}
    Set Input  ${ProfileDetailsPage}[AlternateContactInput]  ${alternate_Contact}
    Click Item  ${ProfileDetailsPage}[EditProfileSubmit]
    Verify elements is visible and displayed  //span[@class='block-refresh-icon ']
    Click Item  //span[@class='block-refresh-icon ']
    #Verify elements is visible and displayed  //label[normalize-space()='Email']/following-sibling::input[@value='${email}']

    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}     wait until page contains element    //label[normalize-space()='Email']/following-sibling::input[@value='${email}']
    #Validate Value  ${email}  //label[normalize-space()='Email']/following-sibling::input[@value='${email}']
    #Validate Value  ${contact}  //label[normalize-space()='Contact Number']/following-sibling::input[@value='${contact}']
    #Validate Value  ${alternate_Contact}  //label[normalize-space()='Alternate Contact Number']/following-sibling::input[@value='${alternate_Contact}']
    Go Back to Home Page


Manage Account Service
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
    ${ITEMIZED_BILL_STATEMENT}=  getData  ${ACCOUNT}  ITEMIZED_BILL_STATEMENT
    ${DIRECT_DEBT}=  getData  ${ACCOUNT}  DIRECT_DEBT
    ${EMAIL_NOTIFICATION}=  getData  ${ACCOUNT}  EMAIL_NOTIFICATION

    Search By ID  ${HomePage}[HomeSeachOptionAccountId]  ${ACCOUNT_ID}
    Click Item  //span[normalize-space()='Services - 2']


    Go Back to Home Page
    Sleep  10s





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
    ${ITEMIZED_BILL_STATEMENT}=  getData  ${ACCOUNT}  ITEMIZED_BILL_STATEMENT
    ${DIRECT_DEBT}=  getData  ${ACCOUNT}  DIRECT_DEBT
    ${EMAIL_NOTIFICATION}=  getData  ${ACCOUNT}  EMAIL_NOTIFICATION

    Search By ID  ${HomePage}[HomeSeachOptionAccountId]  ${ACCOUNT_ID}
    Click Item  ${AccoutDetailPage}[EditDetails]
    Set Input  ${AccoutDetailPage}[AccountName]  ${ACCOUNT_NAME}
    Set Dropdown  ${AccoutDetailPage}[LanguageDropdown]  ${LANGUAGE}
    Set Input  ${AccoutDetailPage}[ContactInput]  ${CONTACT_NO}
    Set Dropdown  ${AccoutDetailPage}[AccountManagerDropdown]  ${KEY_ACC_MANAGER}
    Set Dropdown  ${AccoutDetailPage}[BillMediumDropdown]  ${BILL_MEDIUM}
    Set Slider  Itemized Bill Statement  ${ITEMIZED_BILL_STATEMENT}
    Set Slider  Email Notification  ${EMAIL_NOTIFICATION}
    Set Slider  Direct Debit  ${DIRECT_DEBT}

    IF    '${DIRECT_DEBT}' == 'YES'
        #Log To Console  DEBIT PANEL ENABLLED OOOOOOOOOOOOOOOOOOOOOOOOOOOOO

        Click Item  ${AccoutDetailPage}[BankNameDropdown]
        Click Item  //label[text()='${BANK_NAME}' and @md='10']
        Click Item  ${AccoutDetailPage}[AccountTypeDropdown]
        Click Item  //label[text()='${BRANCH_ACCOUNT_TYPE}' and @md='10']

        #Set Dropdown  ${AccoutDetailPage}[BankNameDropdown]  ${BANK_NAME}
        #Set Dropdown  ${AccoutDetailPage}[AccountTypeDropdown]  ${BRANCH_ACCOUNT_TYPE}
    END
    #Sleep  10s
    #Run Keyword If  '${DIRECT_DEBT}' == 'YES'  Set Dropdown  ${AccoutDetailPage}[BankNameDropdown]  ${BANK_NAME}
    #Run Keyword If  '${DIRECT_DEBT}' == 'YES'  Set Dropdown  ${AccoutDetailPage}[AccountTypeDropdown]  ${BRANCH_ACCOUNT_TYPE}

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

    Verify elements is visible and displayed  //span[@class='block-refresh-icon ']
    Click Item  //span[@class='block-refresh-icon ']
    #Verify elements is visible and displayed  //label[normalize-space()='Email']/following-sibling::input[@value='${email}']

    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}     wait until page contains element    //label[normalize-space()='Email']/following-sibling::input[@value='${email}']
    #Validate Value  ${serviceIndex}  //label[normalize-space()='Service Name']/following-sibling::input[@value='${serviceIndex}']
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

    Verify elements is visible and displayed  //span[@class='block-refresh-icon ']
    Click Item  //span[@class='block-refresh-icon ']
    #Validate Value  ${Union}  //label[normalize-space()='Kebele/Farmer Union']/following-sibling::input[@value='${Union}']
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
    Sleep  20s
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
    ${REASON}=  getData  ${data}  REASON
    ${PAYMENT}=  getData  ${data}  PAYMENT
    ${WAVEOFF}=  getData  ${data}  WAVEOFF

    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item    ${ServiceDetailsPage}[ManageService]
    Click Item    ${ServiceDetailsPage}[ManageSim]
    Click Item    ${ServiceDetailsPage}[ChangeSimButton]
    Click Item    ${ServiceDetailsPage}[NewICCIDSimID]
    #Click Item    ${ServiceDetailsPage}[SimChangeReasonDropdown]
    #Click Item    ${ServiceDetailsPage}[SimChangeReasonDropdownOption1]
    Set Dropdown  ${ServiceDetailsPage}[SimChangeReasonDropdown]  ${REASON}
    Click Item    ${ServiceDetailsPage}[SimChangeComment]
    Set Input  ${ServiceDetailsPage}[SimChangeComment]      Edit1
    Click Item    ${ServiceDetailsPage}[SimChangeSubmit]

    #Select Radio Button   upfrontPayment    2
    #Click Item    //input[@type='checkbox']
    #Select Checkbox  //input[@type='checkbox']
    Sleep  10s
    #Set Radio Button  Upfront  ${VALUE}
    #Set Radio Button  Invoice  ${VALUE}
    #Click Item    //span[text()='Upfront']/preceding-sibling::span//input
    Set Slider  Wave off Handling Charges  ${WAVEOFF}

    IF    '${WAVEOFF}' == 'NO'
        IF    '${PAYMENT}' == 'Upfront'
            Select Radio Button   upfrontPayment    1
        END

        IF    '${PAYMENT}' == 'Invoice'
            Select Radio Button   upfrontPayment    2
        END
    END

    Click Item    (//button[text()='Submit'])[2]
    Click Item    //span[@class='MuiIconButton-label']//*[name()='svg']
    Go Back to Home Page



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
    ${DOCUMENT_NAME}=  getData  ${PROFILE}  DOCUMENT_NAME

    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    Click Item  ${ProfileDetailsPage}[ManageProfile]
    scroll element into view     ${ProfileDetailsPage}[ViewDocumentDetails]
    Click Item  ${ProfileDetailsPage}[ViewDocumentDetails]
    Set Input         ${ProfileDetailsPage}[InputDocumentID]   ${DOCUMENT_NAME}
    Click Item  ${ProfileDetailsPage}[DocumentSearch]
    Click Item  //button[@aria-label='Download']
    Click Item  //a//span[text()='Dashboard']

    #Go Back to Home Page



Search Order By OrderId
    [Documentation]    To look Up order by Order ID
    [Arguments]     ${caseID}  ${dataID}
    #[Arguments]     ${ORDER_ID}
    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  ORDER_INFO  ${caseID}  ${dataID}
    ${ORDER_ID}=  getData  ${data}  ORDER_ID
    Log To Console  ${ORDER_ID}
    Click Item   ${OrderSearch}[Ordertab]
    Click Item   ${OrderSearch}[viewOrder]
    Click Item   ${OrderSearch}[Ordertab]
    Set Input  ${OrderSearch}[OrderSearchbar]      ${ORDER_ID}
    Click Item   ${OrderSearch}[SearchButton]
    scroll element into view     (//button[@type='button'])[7]
    Click Item   (//button[@type='button'])[7]
    Click Item   //button[@aria-label='View']
    Verify elements is visible and displayed  //span[normalize-space()='Order Status']/following-sibling::span//b[normalize-space()='Completed']
    Click Item   ${OrderSearch}[OrderCloseButton]
    go to   ${HomePage}[Homeurl]
    Verify elements is visible and displayed  ${HomePage}[HomeLabel]
    #Go Back to Home Page
    Sleep  10s



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
    ${Language}=  getData  ${data}   Language
    ${DESCRIPTION}=  getData  ${data}      Description
    ${REGION}=  getData  ${data}  REGION
    ${ZONE}=  getData  ${data}  ZONE
    ${WOREDA}=  getData  ${data}  WOREDA
    ${Union}=  getData  ${data}  UNION
    ${HomeNo}=  getData  ${data}  HOME_NO
    ${StreetNo}=  getData  ${data}  STREET_NO
    ${POCode}=  getData  ${data}  PO_CODE
    ${POBox}=  getData  ${data}  PO_BOX

    Search By ID      ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item        ${ServiceDetailsPage}[ViewTickets]
    Click Item        ${ServiceDetailsPage}[CreateTicketButton]
    Switch Window    new
    Set Dropdown2     ${ServiceDetailsPage}[ProductTypeDropdown]  ${PRODUCT_TYPE}
    Set Dropdown2     ${ServiceDetailsPage}[CaseTypeDropdown]    ${CASE_TYPE}
    Set Input         ${ServiceDetailsPage}[NameInput]   ${NAME}
    Set Input         ${ServiceDetailsPage}[EmailInput]   ${EMAIL}
    Set Input         ${ServiceDetailsPage}[Contact Number]   ${CONTACT_NUMBER}
    Set Dropdown2  ${ServiceDetailsPage}[CreateTicketLanguage]  ${Language}
    Set Input         ${ServiceDetailsPage}[Descripion]     ${DESCRIPTION}
    Set Dropdown2  ${ServiceDetailsPage}[Region]  ${REGION}
    Set Dropdown2  ${ServiceDetailsPage}[Zone]  ${ZONE}
    Set Input  ${ServiceDetailsPage}[Kebele]      ${Union}
    Set Input  ${ServiceDetailsPage}[HouseNumber]      ${HomeNo}
    Set Input  ${ServiceDetailsPage}[StreetName]      ${StreetNo}
    Set Input  ${ServiceDetailsPage}[PostCode]      ${POCode}
    Set Input  ${ServiceDetailsPage}[POBoxNumber]      ${POBox}
    #Set Dropdown2  //span[@class='select2 select2-container select2-container--default select2-container--below select2-container--focus']//span[@role='combobox']  1User
    #Click Item        //span[@class='select2 select2-container select2-container--default select2-container--below select2-container--focus']//span[@role='combobox']
    #Click Item        ${ServiceDetailsPage}[Save]

    Verify elements is visible and displayed  //button[@id='saveButton_ticket']
    Click Item        //button[@id='saveButton_ticket']
    Sleep  13s
    #${TicketId}=  get text    ${ServiceDetailsPage}[TicketCreationPopUp]
    #log to console   ${TicketId}





Filter Ticket By Status Open
    [Documentation]    To filter tickets based on priority and Ticket ID
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  FILTER_TICKETS  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  SERVICE_ID
    ${STATUS}=  getData  ${data}  STATUS
    ${TICKET_ID}=  getData  ${data}  TICKET_ID
    ${PRIORITY}=  getData  ${data}  PRIORITY

    Search By ID      ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item        ${ServiceDetailsPage}[ViewTickets]
    Click Item        ${ServiceDetailsPage}[AdvanceSearchinViewTicket]
    Set Input         ${ServiceDetailsPage}[InputTicketID]   ${TICKET_ID}
    Set Dropdown      ${ServiceDetailsPage}[ViewTicketStatusDropdown]   ${STATUS}
    Set Dropdown      ${ServiceDetailsPage}[ViewTicketPriorityDropdown]   ${PRIORITY}
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
    Go Back to Home Page

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
    Go Back to Home Page


View and Validate By
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  SEARCH  ${caseID}  ${dataID}

    ${LABEL}=  getData  ${data}  LABEL
    ${ID}=  getData  ${data}  ID


    IF    '${LABEL}' == 'Account Email ID'
        Search By ID  //option[text()='${LABEL}']  ${ID}
        #Verify elements is visible and displayed  //div[contains(text(),'${LABEL}')]/following-sibling::div//span[text()='${ID}']
        Click Item    //button[normalize-space()='Cancel']

    END

    IF    '${LABEL}' == 'Biometric ID'
        Search By ID  //option[text()='${LABEL}']  ${ID}
        #Verify elements is visible and displayed  //div[contains(text(),'${LABEL}')]/following-sibling::div//span[text()='${ID}']
        Click Item    //button[normalize-space()='Cancel']

    END

     Search By ID  //option[text()='${LABEL}']  ${ID}
     Verify elements is visible and displayed  //div[contains(text(),'${LABEL}')]/following-sibling::div//span[text()='${ID}']

    Sleep  10s
    Go Back to Home Page


Validate Service Details
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}   SERVICE_DETAILS  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  SERVICE_ID

    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Sleep  10s
    Go Back to Home Page

Validate Profile Details
    [Arguments]     ${caseID}  ${dataID}
    ${PROFILE}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  PROFILE_DETAILS  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${PROFILE}  PROFIE_ID

    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    Sleep  10s
    Go Back to Home Page

Validate Account Details

    [Documentation]    To edit account level details
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${WKD_CRM_TESTDATA}  ACCOUNT_DETAILS  ${caseID}  ${dataID}
    ${ACCOUNT_ID}=  getData  ${data}  ACCOUNT_ID

    Search By ID  ${HomePage}[HomeSeachOptionAccountId]  ${ACCOUNT_ID}
    Sleep  10s
    Go Back to Home Page






