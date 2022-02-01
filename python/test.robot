*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    os

*** Variables ***
${base_url}    https://reqres.in/
#${}

*** Test Cases ***
#TC1 - GET
#    create session    mysession    ${base_url}
#    ${resp}=    Get on Session    mysession    api/users
#    ${status_code}=    convert to string    ${resp.status_code}
#    should be equal  ${status_code}  200
#    log to console  ${resp.json()}
#    log to console    ${status_code}
#
#TC2 - POST
#    create session    mysession    ${base_url}
#    ${body}    create dictionary    name=test1 job=testjob
#    ${headers}    create dictionary    Content-Type=application/json
#    ${resp}    post request    mysession    api/users    data=${body}    headers=${headers}
#    ${status_code}=    convert to string    ${resp.status_code}
#    should be equal  ${status_code}  201
#    log to console  ${resp.content}
#    log to console    ${status_code}
#
#TC3 - PUT
#    create session    mysession    ${base_url}
#    ${body}    create dictionary    name=test1 job=testjob
#    ${headers}    create dictionary    Content-Type=application/json
#    ${resp}    put request    mysession    api/users2    data=${body}    headers=${headers}
#    ${status_code}=    convert to string    ${resp.status_code}
#    should be equal  ${status_code}  200
#    log to console  ${resp.content}
#    log to console    ${status_code}
#
#TC4 - PATCH
#    create session    mysession    ${base_url}
#    ${body}    create dictionary    name=test1 job=testjob
#    ${headers}    create dictionary    Content-Type=application/json
#    ${resp}    patch request    mysession    api/users2    data=${body}    headers=${headers}
#    ${status_code}=    convert to string    ${resp.status_code}
#    should be equal  ${status_code}  200
#    log to console  ${resp.content}
#    log to console    ${status_code}
#
#TC5 - Delete
#    create session    mysession    ${base_url}
#    ${body}    create dictionary    name=test1 job=testjob
#    ${headers}    create dictionary    Content-Type=application/json
#    ${resp}    delete request    mysession    api/users2    data=${body}    headers=${headers}
#    ${status_code}=    convert to string    ${resp.status_code}
#    should be equal  ${status_code}  204
#    log to console  ${resp.content}
#    log to console    ${status_code}

TC5 - Basic Authentication
    ${auth}    create list    test    test
    create session    mysession    ${base_url}    auth=${auth}
    ${resp}=    Get on Session    mysession    api/users
    log to console    ${resp.status_code}
    log to console    ${resp.content}







#    ${j}  set variable    ${resp.json()}
#    ${f}    get value from json  ${j}    $.page
#    log to console    ${f[0]}