*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
Library     JSONLibrary
Variables   ../Common_Lib/api_locators.py

*** Variables ***
#${json_String}=  {"FileName": "..\\Json_Data\\Post_Data.json", "ClientCode": "Attachments", "Template": "$::Attachments"}

*** Test Cases ***
API Testing Mode Get
    [Documentation]     This Testcase is used to verify API Testing using GET Request
    [Tags]      API_Testing
    Create Session     session_user      ${base_url}
    ${res}=     Get On Session      session_user        ${get_url}
    ${status_code}=     Convert To String       ${res.status_code}
    Should Be Equal     ${status_code}      200
    ${s}=        Convert To Integer         2
    Should Be Equal     ${res.json()["total_pages"]}     ${s}
    Should Be Equal     ${res.json()["data"][0]["email"]}     michael.lawson@reqres.in

API Testing Mode Post
    [Documentation]     This Testcase is used to verify API Testing using POST Request
    [Tags]      API_Testing
    Create Session     session_user      ${base_url}
    ${my_var}   Create Dictionary       email=eve.holt@reqres.in   password=cityslicka
    ${header}   Create dictionary  Content-Type=application/json
    ${res}     Post request     session_user        ${post_url}     data=${my_var}    headers=${header}
    ${status_code}=     Convert To String       ${res.status_code}
    Should Be Equal     ${status_code}      200
    Should Be Equal     ${res.json()["token"]}      QpwL5tke4Pnpja7X4

API Testing Mode Put
    [Documentation]     This Testcase is used to verify API Testing using PUT Request
    [Tags]      API_Testing
    Create Session     session_user      ${base_url}
    ${my_var}   Create Dictionary      name=Gaurav   job=Automation
    ${header}   Create dictionary  Content-Type=application/json
    ${res}     Put request     session_user        ${put_patch_delete_url}     data=${my_var}    headers=${header}
    ${status_code}=     Convert To String       ${res.status_code}
    Should Be Equal     ${status_code}      200
    Log     ${res.json()["updatedAt"]}
    Log     ${res.json()["name"]}
#
API Testing Mode Patch
    [Documentation]     This Testcase is used to verify API Testing using PATCH Request
    [Tags]      API_Testing
    Create Session     session_user      ${base_url}
    ${my_var}   Create Dictionary      name=Krishnesh   job=Engineer
    ${header}   Create dictionary  Content-Type=application/json
    ${res}     Patch request     session_user        ${put_patch_delete_url}     data=${my_var}    headers=${header}
    ${status_code}=     Convert To String       ${res.status_code}
    Should Be Equal     ${status_code}      200
    Log     ${res.json()["updatedAt"]}
    Log     ${res.json()["name"]}

API Testing Mode Delete
    [Documentation]     This Testcase is used to verify API Testing using DELETE Request
    [Tags]      API_Testing
    Create Session     session_user      ${base_url}
    ${res}     Delete request     session_user        ${put_patch_delete_url}
    ${status_code}=     Convert To String       ${res.status_code}
    Should Be Equal     ${status_code}      204
