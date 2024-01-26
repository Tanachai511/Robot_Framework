*** Settings ***
Documentation  Example test Robotframework
Library  SeleniumLibrary
Suite Setup  Open Browser  https://www.saucedemo.com/
Suite Teardown  Close Browser

*** Variables ***
${STANDARD_USERNAME}  standard_user
${PROBLEM_USERNAME}  problem_user
${USERNAME_LOUT}  lock_out_user
${PASSWORD}  secret_sauce


*** Keywords ***
Input STANDARD_USERNAME
  [Arguments]  ${STANDARD_USERNAME}
  Input Text  //*[@id="user-name"]  ${STANDARD_USERNAME}

Input PROBLEM_USERNAME
  [Arguments]  ${PROBLEM_USERNAME}
  Input Text  //*[@id="user-name"]  ${PROBLEM_USERNAME}

Input USERNAME LockOut
  Input Text  //*[@id="user-name"]  ${USERNAME_LOUT}  

Input PASSWORD
  [Arguments]  ${PASSWORD}
  Input Text  //*[@id="password"]  ${PASSWORD}

Click Login Button
  Click Button  //*[@id="login-button"]
  
Click Add Sauce Labs Backpack to cart
  Click Button  //*[@id="add-to-cart-sauce-labs-backpack"]

*** Test Cases ***
Login with Standard User
  [Documentation]  This testcaes is expexted to showw 'Product'
  Input STANDARD_USERNAME  ${STANDARD_USERNAME}
  Input PASSWORD  ${PASSWORD}
  Click Login Button
  Page Should Contain  Product  

Login with LockOut User  
  [Documentation]   This testcaes is expexted to showw 'Warning'
  Input USERNAME LockOut
  Input PASSWORD         ${PASSWORD}
  Click Login Button
  Page Should Contain Element   //*[@id="login_button_container"]/div/form/div[3]/h3[1] 

Login with Problem User
  [Documentation]  This testcaes is expexted to showw 'Product'
  Input PROBLEM_USERNAME  ${PROBLEM_USERNAME}
  Input PASSWORD  ${PASSWORD}
  Click Login Button
  Page Should Contain  Product    