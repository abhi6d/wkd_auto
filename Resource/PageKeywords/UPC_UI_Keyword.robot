*** Settings ***
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
${TimeOut}      60s
${Start}        1s
${SSO}      ${WKD}[SSOPage]
${NMS}            ${WKD}[NMSPage]


*** Keywords ***
