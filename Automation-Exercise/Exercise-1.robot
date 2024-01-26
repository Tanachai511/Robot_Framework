*** Settings ***
Documentation     This is a sample test suite using Robot Framework
Library           SeleniumLibrary
Suite Setup       Open Browser    https://app.futureskill.co/login   chrome
Suite Teardown  Close Browser

*** Variables ***
${EMAIL}  xxx@gmail.com
${FIRSTNAME}  xxx
${LASTNAME}  xxx
${PHONENUMBER}  0951219105
${PASSWORD}  Xxxxxxxx099


*** Keywords ***
Click Register Element
  Click Element  //*[@id="__next"]/div[2]/div/div[2]/div/div/a

Input Email
  [Arguments]  ${EMAIL}
  Input Text  //*[@name="email"]  ${EMAIL}

Input FirstName 
  [Arguments]  ${FIRSTNAME}
  Input Text  //*[@name="firstName"]  ${FIRSTNAME}

Input LastName 
   [Arguments]  ${LASTNAME}
   Input Text  //*[@name="lastName"]  ${LASTNAME}

Input PhoneNumber 
  [Arguments]  ${PHONENUMBER}
  Input text  //*[@name="phoneNumber"]  ${PHONENUMBER}

Input NewPassword
  [Arguments]  ${PASSWORD}
  Input Text  //*[@name="newPassword"]  ${PASSWORD}

Input ConfirmPassword
  [Arguments]  ${PASSWORD}
  Input Text  //*[@name="confirmPassword"]   ${PASSWORD}

Checked Checkbox
  Click Element  //*[@id="__next"]/div[2]/div/div[2]/div/form/div/div[6]/label/input

Click Register Button
  Click Button  //*[@id="__next"]/div[2]/div/div[2]/div/form/div/div[7]/button
  
*** Test Cases ***
Register with valid info
   [Documentation]    Test the login functionality with valid credentials
   Click Register Element
   
   Input Email  ${EMAIL}               
   Input firstname   ${FIRSTNAME}         
   Input lastName  ${LASTNAME}      
   Input phoneNumber  ${PHONENUMBER}         
   Input newPassword   ${PASSWORD}  
   Input confirmPassword  ${PASSWORD}

   
   Checked Checkbox 
   Click Register Button
   Page Should Contain Element  //*[@id="__next"]/div[2]/div/div[2]/h6[1] 


 