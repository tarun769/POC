*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    ../Common_Lib/testclassA.py
Library    ../Common_Lib/func.py
Library    ../Common_Lib/testclassB.py
Variables    ../Common_Lib/variables.py

Suite Setup     open browser    ${url}    ${browser}
Suite Teardown    close browser

*** Variables ***
${file_path}    Common_Lib/data.json


*** Test Cases ***
TC1 - login
    [Documentation]    This testcase verifies the successful login and navigates to services page.
    [Tags]      Python_Integration
    maximize browser window
    input text    ${id_for_email}    driving@biz.com
    input text    ${id_for_password}    test01
    click element    ${id_for_sign_in}
    wait until page contains    Dashboard
    click element    ${id_for_services}
    wait until page contains    Price

TC2 - using function without keyword
    [Documentation]    This testcase extracts only digits from price section.
    [Tags]      Python_Integration
    ${t1}=    get text    ${xpath_for_prices1}
    ${t2}=    get text    ${xpath_for_prices2}
    ${n1}=    price_extraction    ${t1}
    ${n2}=    price_extraction    ${t2}
    set global variable  ${n1}
    set global variable  ${n2}

TC3 - using class with keyword
    [Documentation]    This testcase returns the subtracted values.
    [Tags]      Python_Integration
    ${output}  subtract values    ${n1}    ${n2}
    log to console    ${output}

TC4 - using function with keyword
    [Documentation]    This testcase reads the json data and create new service.
    [Tags]      Python_Integration
    ${output}    func.read file    ${file_path}
    ${service}    Get from dictionary    ${output}    service
    ${code}    Get from dictionary    ${output}    code
    ${price}    Get from dictionary    ${output}    price
    click element    ${id_for_new_service}
    page should contain    New Service
    input text    ${id_for_service_name}    ${service}
    input text    ${id_for_service_code}    ${code}
    input text    ${id_for_service_price}    ${price}
    click element    (//input[@type='checkbox']/../span)[2]
    click element    ${id_for_create}
    page should contain    ${service}
