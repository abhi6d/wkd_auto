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
${HomePage}  ${CRMPage}[HomePage]        # Importing Home page Components
${ServiceDetailsPage}  ${CRMPage}[ServiceDetailsPage]   # Importing Service Details page Components
${ProfileDetailsPage}  ${CRMPage}[ProfileDetailPage]
*** Keywords ***

Search By ID
    [Arguments]     ${option}  ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${option}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${HomePage}[HomeSearchBar]      ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeSearchButton]
    Sleep   2s

Search By ProfileId
    [Arguments]     ${data}
    ${id}=  getData  ${data}  ProfileId
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${HomePage}[HomeSeachOptionProfileId]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${HomePage}[HomeSearchBar]      ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeSearchButton]
    Sleep   2s

Search By AccountId
    [Arguments]     ${data}
    ${id}=  getData  ${data}  AccountID
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${HomePage}[HomeSeachOptionAccountId]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${HomePage}[HomeSearchBar]      ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeSearchButton]
    Sleep   2s

Search By ServiceId
    [Arguments]     ${data}
    ${id}=  getData  ${data}  ServiceID
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${HomePage}[HomeSeachOptionServiceId]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${HomePage}[HomeSearchBar]      ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeSearchButton]
    Sleep   10s

Edit Profile Details

    ${email}=  Generate random string        3     0123456789
    ${contact}=  Generate random string        10     0123456789
    ${alternate_Contact}=  Generate random string        10     0123456789

    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[EditProfileDetail]
    wait until element is visible    ${ProfileDetailsPage}[EmailInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[EmailInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[EmailInput]      email${email}@gmail.com
    wait until element is visible    ${ProfileDetailsPage}[ContactNumberInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ContactNumberInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[ContactNumberInput]      ${contact}
    wait until element is visible    ${ProfileDetailsPage}[AlternateContactInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[AlternateContactInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[AlternateContactInput]      ${alternate_Contact}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[EditProfileSubmit]



Edit Account Details
    ${nameindex}=  Generate random string        3     0123456789
    ${contact}=  Generate random string        12     0123456789

    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[EditDetails]
    wait until element is visible    ${AccoutDetailPage}[AccountName]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[AccountName]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[AccountName]      Hello${nameindex}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[LanguageDropdown]
    Wait until element is visible    ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[ContactInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[ContactInput]      ${contact}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[AccountManagerDropdown]
    Wait until element is visible    ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[BillMediumDropdown]
    Wait until element is visible    ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[BankNameDropdown]
    Wait until element is visible    ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[AccountTypeDropdown]
    Wait until element is visible    ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[DropdownOption1]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[Submit]

Edit Service Details

    ${serviceIndex}=  Generate random string        3     0123456789

    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[EditDetails]
    Wait until element is visible    ${ServiceDetailsPage}[ServiceNameInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[ServiceNameInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[ServiceNameInput]      Service${serviceIndex}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[Submit]


Manage Profile Residential Address
    [Arguments]     ${data}

    ${Union}=  getData  ${data}  UNION
    ${HomeNo}=  getData  ${data}  HOME_NO
    ${StreetNo}=  getData  ${data}  STREET_NO
    ${POCode}=  getData  ${data}  PO_CODE
    ${POBox}=  getData  ${data}  PO_BOX
    ${Latitude}=  getData  ${data}  LATITUDE
    ${Longitude}=  getData  ${data}  LONGITUDE
    ${Comment}=  getData  ${data}  COMMENT

    wait until element is visible    ${ProfileDetailsPage}[ManageProfileAddress]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ManageProfileAddress]
    wait until element is visible    ${ProfileDetailsPage}[PermanentAddressEdit]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ResidentialAddressEdit]
    wait until element is visible    ${ProfileDetailsPage}[Residential_ProfileRegionDropdown]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[Residential_ProfileRegionDropdown]
    wait until element is visible    ${ProfileDetailsPage}[DropdownOption1]
    click element      ${ProfileDetailsPage}[DropdownOption1]
    wait until element is visible    ${ProfileDetailsPage}[Residential_ProfileZoneDropdown]
    click element      ${ProfileDetailsPage}[Residential_ProfileZoneDropdown]
    wait until element is visible    ${ProfileDetailsPage}[DropdownOption1]
    click element      ${ProfileDetailsPage}[DropdownOption1]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[Residential_UnionInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[Residential_UnionInput]      ${Union}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[Residential_HouseNoInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[Residential_HouseNoInput]      ${HomeNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[Residential_StreetInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[Residential_StreetInput]      ${StreetNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[Residential_PostalCodeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[Residential_PostalCodeInput]      ${POCode}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[Residential_POInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[Residential_POInput]      ${POBox}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[Residential_LatitudeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[Residential_LatitudeInput]      ${Latitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[Residential_LongitudeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[Residential_LongitudeInput]      ${Longitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[Residential_AddressComment]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[Residential_AddressComment]      ${Comment}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ResidentialAddressSubmit]

Manage Profile Permanent Address
    [Arguments]     ${data}

    ${Union}=  getData  ${data}  UNION
    ${HomeNo}=  getData  ${data}  HOME_NO
    ${StreetNo}=  getData  ${data}  STREET_NO
    ${POCode}=  getData  ${data}  PO_CODE
    ${POBox}=  getData  ${data}  PO_BOX
    ${Latitude}=  getData  ${data}  LATITUDE
    ${Longitude}=  getData  ${data}  LONGITUDE
    ${Comment}=  getData  ${data}  COMMENT

    wait until element is visible    ${ProfileDetailsPage}[ManageProfileAddress]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ManageProfileAddress]
    wait until element is visible    ${ProfileDetailsPage}[PermanentAddressEdit]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[PermanentAddressEdit]
    wait until element is visible    ${ProfileDetailsPage}[ProfileRegionDropdown]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ProfileRegionDropdown]
    wait until element is visible    ${ProfileDetailsPage}[DropdownOption1]
    click element      ${ProfileDetailsPage}[DropdownOption1]
    wait until element is visible    ${ProfileDetailsPage}[ProfileZoneDropdown]
    click element      ${ProfileDetailsPage}[ProfileZoneDropdown]
    wait until element is visible    ${ProfileDetailsPage}[DropdownOption1]
    click element      ${ProfileDetailsPage}[DropdownOption1]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[UnionInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[UnionInput]      ${Union}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[HouseNoInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[HouseNoInput]      ${HomeNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[StreetInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[StreetInput]      ${StreetNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[PostalCodeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[PostalCodeInput]      ${POCode}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[POInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[POInput]      ${POBox}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[LatitudeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[LatitudeInput]      ${Latitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[LongitudeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[LongitudeInput]      ${Longitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[AddressComment]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[AddressComment]      ${Comment}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[PermanentAddressSubmit]


Manage Account Address
    [Arguments]     ${data}

    ${Union}=  getData  ${data}  UNION
    ${HomeNo}=  getData  ${data}  HOME_NO
    ${StreetNo}=  getData  ${data}  STREET_NO
    ${POCode}=  getData  ${data}  PO_CODE
    ${POBox}=  getData  ${data}  PO_BOX
    ${Latitude}=  getData  ${data}  LATITUDE
    ${Longitude}=  getData  ${data}  LONGITUDE
    ${Comment}=  getData  ${data}  COMMENT

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



Manage Service_1 Address
    [Arguments]     ${data}

    ${Union}=  getData  ${data}  UNION
    ${HomeNo}=  getData  ${data}  HOME_NO
    ${StreetNo}=  getData  ${data}  STREET_NO
    ${POCode}=  getData  ${data}  PO_CODE
    ${POBox}=  getData  ${data}  PO_BOX
    ${Latitude}=  getData  ${data}  LATITUDE
    ${Longitude}=  getData  ${data}  LONGITUDE
    ${Comment}=  getData  ${data}  COMMENT

    wait until element is visible    ${ServiceDetailsPage}[AddressDetail]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[AddressDetail]
    wait until element is visible    ${ServiceDetailsPage}[AddressEdit]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[AddressEdit]
    wait until element is visible    ${ServiceDetailsPage}[RegionDropdown]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[RegionDropdown]
    wait until element is visible    ${ServiceDetailsPage}[DropdownOption1]
    click element      ${ServiceDetailsPage}[DropdownOption1]
    wait until element is visible    ${ServiceDetailsPage}[ZoneDropdown]
    click element      ${ServiceDetailsPage}[ZoneDropdown]
    wait until element is visible    ${ServiceDetailsPage}[DropdownOption1]
    click element      ${ServiceDetailsPage}[DropdownOption1]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[UnionInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[UnionInput]      ${Union}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[HouseNoInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[HouseNoInput]      ${HomeNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[StreetInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[StreetInput]      ${StreetNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[PostalCodeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[PostalCodeInput]      ${POCode}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[POInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[POInput]      ${POBox}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[LatitudeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[LatitudeInput]      ${Latitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[LongitudeInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[LongitudeInput]      ${Longitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[AddressComment]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[AddressComment]      ${Comment}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[Submit]


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