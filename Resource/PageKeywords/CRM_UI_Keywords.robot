*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library    Collections
Library    String
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

Search Order By OrderId1
    [Arguments]     ${Orderid}
    click element   ${OrderSearch}[Ordertab]
    sleep  5s
    click element   ${OrderSearch}[viewOrder]
    sleep  5s
    click element   ${OrderSearch}[Ordertype]
    sleep  5s
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${OrderSearch}[OrderSearchbar]
    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${OrderSearch}[OrderSearchbar]      955731433640275968
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${OrderSearch}[OrderSearchbar]      ${Orderid}
    Sleep   1s
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${OrderSearch}[SearchButton]
    Sleep   5s
    click element   ${OrderSearch}[OrderAction]
    Sleep   5s
    click element   ${OrderSearch}[OrderView]
    Sleep   5s
    click element   ${OrderSearch}[OrderCloseButton]

Search In By Profile Id
    [Arguments]     ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${HomePage}[HomeSeachOptionProfileId]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${HomePage}[HomeSearchBar]      ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeSearchButton]
    Sleep   10s

Edit Profile Details_1
    [Arguments]     ${email}  ${contact}  ${alternate_Contact}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[EditProfileDetail]
    wait until element is visible    ${ProfileDetailsPage}[EmailInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[EmailInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[EmailInput]      ${email}
    wait until element is visible    ${ProfileDetailsPage}[ContactNumberInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ContactNumberInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[ContactNumberInput]      ${contact}
    wait until element is visible    ${ProfileDetailsPage}[AlternateContactInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[AlternateContactInput]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${ProfileDetailsPage}[AlternateContactInput]      ${alternate_Contact}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${ProfileDetailsPage}[EditProfileSubmit]

Manage tab
    [Arguments]     ${Managetab}
    wait until element is visible    ${Managetab}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${Managetab}

Refresh tab
    [Arguments]     ${Refreshtab}
    wait until element is visible    ${Refreshtab}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${Refreshtab}


Manage Permanent Profile Address
    [Arguments]     ${Region}  ${Zone}  ${Union}  ${HomeNo}  ${StreetNo}  ${POCode}  ${POBox}  ${Latitude}  ${Longitude}  ${Comment}
    wait until element is visible    ${ProfileDetailsPage}[ManageProfileAddress]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ManageProfileAddress]
    wait until element is visible    ${ProfileDetailsPage}[PermanentAddressEdit]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[PermanentAddressEdit]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ProfileRegionDropdown]
    wait until element is visible    ${Region}
    click element      ${Region}
    wait until element is visible    ${ProfileDetailsPage}[ProfileZoneDropdown]
    click element      ${ProfileDetailsPage}[ProfileZoneDropdown]
    click element      ${Zone}
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


Manage Residential Profile Address
    [Arguments]     ${Region}  ${Zone}  ${Union}  ${HomeNo}  ${StreetNo}  ${POCode}  ${POBox}  ${Latitude}  ${Longitude}  ${Comment}
    wait until element is visible    ${ProfileDetailsPage}[ManageProfileAddress]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ManageProfileAddress]
    wait until element is visible    ${ProfileDetailsPage}[PermanentAddressEdit]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[ResidentialAddressEdit]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ProfileDetailsPage}[Residential_ProfileRegionDropdown]
    wait until element is visible    ${Region}
    click element      ${Region}
    wait until element is visible    ${ProfileDetailsPage}[Residential_ProfileZoneDropdown]
    click element      ${ProfileDetailsPage}[Residential_ProfileZoneDropdown]
    wait until element is visible    ${Zone}
    click element      ${Zone}
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





Search In By Sevice Id
    [Arguments]     ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${HomePage}[HomeSeachOptionServiceId]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${HomePage}[HomeSearchBar]      ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeSearchButton]
    Sleep   5s

Search By Contact Number
    [Arguments]     ${id}

Manage Service in Service page
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[ManageService]
    Sleep   5s

Manage Service Address
    [Arguments]     ${Region}  ${Zone}  ${Union}  ${HomeNo}  ${StreetNo}  ${POCode}  ${POBox}  ${Latitude}  ${Longitude}  ${Comment}
    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[ManageService]
    #Sleep   5s
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[AddressDetail]
    Sleep   5s
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[AddressEdit]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[RegionDropdown]
    wait until element is visible    ${Region}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${Region}
    click element      ${ServiceDetailsPage}[ZoneDropdown]
    wait until element is visible    ${Zone}
    click element      ${Zone}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[Union]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[Union]      ${Union}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[HouseNumber]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[HouseNumber]      ${HomeNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[StreetName]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[StreetName]      ${StreetNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[PostalCode]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[PostalCode]      ${POCode}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[PoBoxnumber]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[PoBoxnumber]      ${POBox}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[Latitude]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[Latitude]      ${Latitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[Longitude]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[Longitude]      ${Longitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[AddressComment]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[AddressComment]      ${Comment}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[AddressSubmit]


Search In By Account Id
    [Arguments]     ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${HomePage}[HomeSeachOptionAccountId]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      input text      ${HomePage}[HomeSearchBar]      ${id}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeSearchButton]
    Sleep   10s

Manage Account_1 Address
    [Arguments]     ${Region}  ${Zone}  ${Union}  ${HomeNo}  ${StreetNo}  ${POCode}  ${POBox}  ${Latitude}  ${Longitude}  ${Comment}
    wait until element is visible    ${AccoutDetailPage}[AddressDetail]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[AddressDetail]
    wait until element is visible    ${AccoutDetailPage}[EditAccountDetail]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[EditAccountDetail]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[RegionDropdown]
    wait until element is visible    ${Region}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${Region}
    click element      ${ServiceDetailsPage}[ZoneDropdown]
    wait until element is visible    ${Zone}
    click element      ${Zone}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[Union]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[Union]      ${Union}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[HouseNumber]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[HouseNumber]      ${HomeNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[StreetName]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[StreetName]      ${StreetNo}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[PostalCode]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[PostalCode]      ${POCode}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[PoBoxnumber]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[PoBoxnumber]      ${POBox}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[Latitude]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[Latitude]      ${Latitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[Longitude]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[Longitude]      ${Longitude}
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[AddressComment]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[AddressComment]      ${Comment}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[AddressSubmit]

Edit Account_1 Details
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[EditDetails]
    wait until element is visible    ${AccoutDetailPage}[AccountName]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[AccountName]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[AccountName]      Hello
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[LanguageDropdown]
    Wait until element is visible    ${AccoutDetailPage}[LanguageDropdown2]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[LanguageDropdown2]
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${AccoutDetailPage}[ContactInput]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${AccoutDetailPage}[ContactInput]      911234567890
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${AccoutDetailPage}[Submit]



change SIM

    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[ManageSim]
    Sleep   5s
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[ChangeSimButton]
    Sleep   5s
    Select Radio Button   ICCID    636024060009712
    Sleep   5s
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[SimChangeReasonDropdown]
    Sleep   5s
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[SimChangeReasonDropdownOption1]
    Sleep   5s
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[SimChangeComment]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[SimChangeComment]      Edit1
    Sleep   5s
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[SimChangeSubmit]
    Sleep   5s
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      click element   ${ServiceDetailsPage}[OrderHandleChargeComment]
    Wait Until Keyword Succeeds     ${TimeOut}      ${Start}      input text      ${ServiceDetailsPage}[OrderHandleChargeComment]      Edit1
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[OrderHandleChargeSubmit]
    Sleep   5s

Service page Ticketing
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[ViewTickets]
    Sleep   5s
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element      ${ServiceDetailsPage}[CreateTicketButton]
    Sleep   5s
    Switch Window    new

Go Back to Home Page
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeButton]
