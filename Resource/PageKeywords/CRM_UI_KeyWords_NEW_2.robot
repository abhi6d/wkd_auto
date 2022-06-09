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
Resource     ../../Resource/PageKeywords/Common.robot


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
${CRM_CREDENTIAL}     ${TestData}[USER][crm_user]
${CRM_UI}  ${wkd}[SSOPage][crm]
${ProfileDetailsPage}  ${CRMPage}[ProfileDetailPage]
${AccoutDetailPage}  ${CRMPage}[AccoutDetailPage]
${ServiceDetailsPage}  ${CRMPage}[ServiceDetailsPage]
${HomePage}  ${CRMPage}[HomePage]        # Importing Home page Components
*** Keywords ***

Search By ID
    [Arguments]     ${option}  ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${option}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${HomePage}[HomeSearchBar]      ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeSearchButton]
    Sleep   2s

Set Input
    [Arguments]     ${locator}  ${value}

    wait until element is visible    ${locator}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${locator}

    Run Keyword If  '${value}' == 'nan'  Log To Console  NANACONDITION
    ...  ELSE IF  '${value}' == 'BLANK'  Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${locator}  \
    ...  ELSE  Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${locator}  ${value}

    #IF  '${value}'!='nan'
    #Log To Console  NANACONDITION
    #Log To Console  ${value}

    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${locator}      ${value}
    #ELSE IF    '${value}'!='BLANK'
    #Log To Console  THE_VALUE_ISBLANK
    #Log To Console  ${value}

    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${locator}  \
    #END


Set Dropdown
    [Arguments]     ${dropdown}  ${locator_label}

    #Log To Console  ${locator_label}
    wait until element is visible    ${dropdown}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${dropdown}
    Wait until element is visible    //label[text()='${locator_label}']
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   //label[text()='${locator_label}']

    ${bool}=    Execute Javascript      var a = document.querySelectorAll('input[type=radio]');for(var i=0;i<a.length;i++){if(a[i].checked==true && a[i].nextSibling.innerHTML.trim() === '${locator_label}') return true; else return false;}
    Log To Console  ------------------------
    Log To Console  ${locator_label}
    Log To Console  ------------------------
    #IF    ${bool}
    # click element
    #END


Click Item
    [Arguments]     ${locator}

    Wait until element is visible    ${locator}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${locator}






Edit Profile Details two
    [Arguments]     ${caseID}  ${dataID}

    ${PROFILE}=  Fetch From Excel  ${CRM_TestData}  PROFILE  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${PROFILE}  ProfileId
    ${email}=  getData  ${PROFILE}  EMAIL
    ${contact}=  Generate random string        12     0123456789
    ${alternate_Contact}=  Generate random string        12     0123456789

    Search By ID  ${HomePage}[HomeSeachOptionProfileId]  ${PROFIE_ID}
    Click Item  ${ProfileDetailsPage}[EditProfileDetail]
    Set Input  ${ProfileDetailsPage}[EmailInput]  ${email}
    Set Input  ${ProfileDetailsPage}[ContactNumberInput]  ${contact}
    Set Input  ${ProfileDetailsPage}[AlternateContactInput]  ${alternate_Contact}
    Click Item  ${ProfileDetailsPage}[EditProfileSubmit]



Edit Account Details two
    [Arguments]     ${caseID}  ${dataID}

    ${ACCOUNT}=  Fetch From Excel  ${CRM_TestData}  ACCOUNT  ${caseID}  ${dataID}

    ${ACCOUNT_ID}=  getData  ${ACCOUNT}  AccountID
    ${ACCOUNT_NAME}=  getData  ${ACCOUNT}  AccountName
    ${contact}=  Generate random string        12     0123456789
    Search By ID  ${HomePage}[HomeSeachOptionAccountId]  ${ACCOUNT_ID}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[EditDetails]
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
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[Submit]

Edit Service Details two

    [Arguments]     ${caseID}  ${dataID}
    ${data}=  Fetch From Excel  ${CRM_TestData}  SERVICE  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  ServiceID
    ${serviceIndex}=  Generate random string        3     0123456789

    Search By ID  ${HomePage}[HomeSeachOptionServiceId]  ${SERVICE_ID}
    Click Item  ${ServiceDetailsPage}[EditDetails]
    Set Input  ${ServiceDetailsPage}[ServiceNameInput]      Service${serviceIndex}
    Click Item  ${ServiceDetailsPage}[Submit]


Manage Profile Residential Address two
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${CRM_TestData}  PROFILE  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${data}  ProfileId
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
    Manage tab  ${ProfileDetailsPage}[ManageProfile]
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

    ${data}=  Fetch From Excel  ${CRM_TestData}  PROFILE  ${caseID}  ${dataID}
    ${PROFIE_ID}=  getData  ${data}  ProfileId
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
    Manage tab  ${ProfileDetailsPage}[ManageProfile]
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

    ${data}=  Fetch From Excel  ${CRM_TestData}  SERVICE  ${caseID}  ${dataID}
    ${SERVICE_ID}=  getData  ${data}  ServiceID
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
    Manage tab  ${ServiceDetailsPage}[ManageService]
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

change SIM ID

    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[ManageSim]
    wait until element is visible    ${ServiceDetailsPage}[ChangeSimButton]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[ChangeSimButton]
    wait until element is visible    ${ServiceDetailsPage}[NewICCIDSimID]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[NewICCIDSimID]
    #Select Radio Button   ICCID    636024060009712
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[SimChangeReasonDropdown]
    wait until element is visible    ${ServiceDetailsPage}[SimChangeReasonDropdownOption1]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[SimChangeReasonDropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[SimChangeComment]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[SimChangeComment]      Edit1
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[SimChangeSubmit]
    #Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[OrderHandleChargeComment]
    #Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[OrderHandleChargeComment]      Edit1
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[UpfrontPamentSubmit]
    Sleep   5s

View Identification Details
    wait until element is visible    ${ProfileDetailsPage}[IdentificationDetails]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[IdentificationDetails]
    wait until element is visible    ${ProfileDetailsPage}[ViewDocument]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ViewDocument]
    wait until element is visible    ${ProfileDetailsPage}[DownloadDocument]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[DownloadDocument]
    Sleep  5s
    wait until element is visible    ${ProfileDetailsPage}[DocumentDone]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[DocumentDone]


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