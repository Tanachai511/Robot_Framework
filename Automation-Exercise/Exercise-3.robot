*** Settings ***
Documentation  Example test Robotframework
Library  SeleniumLibrary
Suite Setup  Open Browser  https://computer-database.gatling.io/computers
Suite Teardown  Close Browser

*** Variables ***
${ACE}  ACE
${Computer_name}  Acer Nitro
${Input_introduced}  2003-09-12
${Input_discontinued}  2010-10-12

*** Keywords ***
Input Search ACE
  [Arguments]  ${ACE}
  Input Text  //*[@id="searchbox"]  ${ACE}

Click Filter Button
  Click Button  //*[@id="searchsubmit"]

Click Add a new computer  
  # Click Button  //*[@id="add"]
  Click Element  //*[@id="add"]

Click Creaet Button  
  Click Button  //*[@id="main"]/form/div/input

Click Cancel Button
  # Click Button  //*[@id="main"]/form/div/a
  Click Element  //*[@id="main"]/form/div/a

Input Computer name
  [Arguments]  ${Computer_name}
  Input Text  //*[@id="name"]  ${Computer_name}

Input Introduced
  [Arguments]  ${Input_introduced}
  Input Text  //*[@id="introduced"]  ${Input_introduced}

Input Discontinued
  [Arguments]  ${Input_discontinued}
  Input Text  //*[@id="discontinued"]  ${Input_discontinued}

Select Company
  Select From List By Index  name:company  6 


*** Test Cases ***
Search ACE
  [Documentation]  This testcaes is expexted to show '6 computers found'
  Input Search ACE  ${ACE}
  Click Filter Button
  Page Should Contain  6 computers found

Add a new computer
  [Documentation]  This testcaes is expexted to show 'Done ! Computer Acer Nitro has been created'
  Click Add a new computer
  Input Computer name  ${Computer_name}
  Input Introduced  ${Input_introduced}
  Input Discontinued  ${Input_discontinued}
  Select Company  
  Click Creaet Button
  Element Text Should Be  //*[@id="main"]/div[1]  Done ! Computer Acer Nitro has been created

Not input a computer name 
  [Documentation]  This testcaes is expexted to show 'Failed to refine type : Predicate isEmpty() did not fail.'
  Click Add a new computer
  Input Introduced  ${Input_introduced}
  Input Discontinued  ${Input_discontinued}
  Select Company  
  Click Creaet Button
  Element Text Should Be  //*[@id="main"]/form/fieldset/div[1]/div  Failed to refine type : Predicate isEmpty() did not fail.

Cancel create a computer
  [Documentation]  This testcaes is expexted to show '574 computers found'
  Click Add a new computer
  Input Computer name  ${Computer_name}
  Input Introduced  ${Input_introduced}
  Input Discontinued  ${Input_discontinued}
  Select Company  
  Click Creaet Button
  Page Should Contain  574 computers found

Enter the Introduced and Discontinued dates on the same day
  [Documentation]  This testcaes is expexted to show 'Discontinued date is before introduction date'
  Click Add a new computer
  Input Computer name  ${Computer_name}
  Input Introduced  ${Input_introduced}
  Input Discontinued  ${Input_introduced}
  Select Company  
  Click Creaet Button
  Element Text Should Be  //*[@id="main"]/form/fieldset/div[3]/div/span  Discontinued date is before introduction date

Enter Introduced date and leave Discontinued date blank 
  [Documentation]  This testcaes is expexted to show 'Done ! Computer Acer Nitro has been created'
  Click Add a new computer
  Input Computer name  ${Computer_name}
  Input Introduced  ${Input_introduced}
  Select Company  
  Click Creaet Button
  Element Text Should Be  //*[@id="main"]/div[1]  Done ! Computer Acer Nitro has been created

Enter Discontinued date and leave Introduced date blank
  [Documentation]  This testcaes is expexted to show 'Done ! Computer Acer Nitro has been created'
  Click Add a new computer
  Input Computer name  ${Computer_name}
  Input Discontinued  ${Input_discontinued}
  Select Company  
  Click Creaet Button  
  Element Text Should Be  //*[@id="main"]/div[1]  Done ! Computer Acer Nitro has been created