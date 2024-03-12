*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    [Arguments]    ${url}
    Open Browser    ${url}    Chrome

Input Username
    [Arguments]    ${username}
    Clear Element Text    id:username    # Clear existing text
    Input Text    id:username    ${username}

Input Password
    [Arguments]    ${password}
    Clear Element Text    id:password    # Clear existing text
    Input Text    id:password    ${password}

Click Submit Button
    Click Button    id:submit

Verify Successful Login
    Wait Until Page Contains Element    xpath://*[contains(text(),'Congratulations') or contains(text(),'successfully logged in')]

Verify Negative Username Error Message
    Wait Until Page Contains Element    xpath://*[contains(text(),'Your username is invalid!')]

Verify Negative Password Error Message
    Wait Until Page Contains    Your password is invalid!

Wait For Page To Load
    Wait Until Page Contains Element    id:submit    timeout=10s
