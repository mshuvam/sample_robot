*** Settings ***
Resource    ../resources/keywords.resource
Test Setup    Open Browser To Login Page    https://practicetestautomation.com/practice-test-login/
Test Teardown    Close All Browsers

*** Test Cases ***
Positive LogIn Test
    [Documentation]    Test case to verify positive login
    Input Username    student
    Input Password    Password123
    Click Submit Button
    Verify Successful Login

Negative Username Test
    [Documentation]    Test case to verify negative login with incorrect username
    Input Username    incorrectUser
    Input Password    Password123
    Click Submit Button
    Verify Negative Username Error Message

Negative Password Test
    [Documentation]    Test case to verify negative login with incorrect password
    Input Username    student
    Input Password    incorrectPassword
    Click Submit Button
    Verify Negative Password Error Message

