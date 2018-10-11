*** Settings ***

Documentation  Resources for the form filling robot.
Library  Selenium2Library
Library  FakerLibrary   locale=pt_BR
Library  String

*** Variables ***

${BROWSER}    chrome
${FORM_WEB}   https://formsmarts.com/html-form-example
${SUBJECT_LOC}      //div[1]/form[1]/select[1]
${INPUT_LOCATOR}    //input[@placeholder='$$']
${TEXT_LOCATOR}     //div[1]/form[1]/textarea[$$]
${BTN_LOCATOR}      //input[@type='$$']
${TABLE_LOCATOR}    //table/tbody/tr[$$]/td[1]


*** Keywords ***

Setting Browser
   Open Browser    ${FORM_WEB}     ${BROWSER}    #<webpage> and <browser>
   Maximize Browser Window

Complete Form
    Set Selenium Speed  0.5
    Select Frame    xpath=//iframe
    #Wait Until Element Is Visible   ${FIRST_NAME_LOC}    timeout=30.0
    ${FIRST_NAME}=   First Name
    ${LAST_NAME}=    Last Name
    ${EMAIL}=   Free Email
    ${INQUIRY}=    Word
    ${SUBJECT}=     Random Int  1    3
    ${SUBJECT}=     Convert To String   ${SUBJECT}
    Set Global Variable     ${FIRST_NAME}
    Set Global Variable     ${LAST_NAME}
    Set Global Variable     ${EMAIL}
    Set Global Variable     ${INQUIRY}
    Set Global Variable     ${SUBJECT}
    ${NEW_INPUT_LOCATOR}=    String Replace    ${INPUT_LOCATOR}    Your first name
    Input Text      ${NEW_INPUT_LOCATOR}     ${FIRST_NAME}
    ${NEW_INPUT_LOCATOR}=    String Replace    ${INPUT_LOCATOR}    Your last name
    Input Text  ${NEW_INPUT_LOCATOR}    ${LAST_NAME}
    ${NEW_INPUT_LOCATOR}=    String Replace    ${INPUT_LOCATOR}    Your email address
    Input Text  ${NEW_INPUT_LOCATOR}        ${EMAIL}
    Select From List By Index    ${SUBJECT_LOC}    ${SUBJECT}
    ${SUBJECT}=     Get Selected List Label   ${SUBJECT_LOC}
    ${SUBJECT}=     Convert To String   ${SUBJECT}
    Set Global Variable     ${SUBJECT}
    ${NEW_TEXT_LOCATOR}=    String Replace    ${TEXT_LOCATOR}    1
    Input Text  ${NEW_TEXT_LOCATOR}    ${INQUIRY}
    ${NEW_BTN_LOCATOR}=     String replace    ${BTN_LOCATOR}    submit
    Click Button   ${NEW_BTN_LOCATOR}

Validate Form
    ${NEW_TABLE_LOCATOR}=     String replace    ${TABLE_LOCATOR}    1
    Table Should Contain   ${NEW_TABLE_LOCATOR}    ${FIRST_NAME}
    ${NEW_TABLE_LOCATOR}=     String replace    ${TABLE_LOCATOR}    2
    Table Should Contain   ${NEW_TABLE_LOCATOR}    ${LAST_NAME}
    ${NEW_TABLE_LOCATOR}=     String replace    ${TABLE_LOCATOR}    3
    Table Should Contain   ${NEW_TABLE_LOCATOR}     ${EMAIL}
    ${NEW_TABLE_LOCATOR}=     String replace    ${TABLE_LOCATOR}    4
    Table Should Contain   ${NEW_TABLE_LOCATOR}     ${SUBJECT}
    ${NEW_TABLE_LOCATOR}=     String replace    ${TABLE_LOCATOR}    5
    Table Should Contain   ${NEW_TABLE_LOCATOR}     ${INQUIRY}

String Replace
    [Documentation]    Replaces the ocurrences of '$$' for the respective strings.
    [Arguments]     ${template_string}      @{replacement_strings}

    :FOR    ${string}    IN    @{replacement_strings}
    \   ${template_string} =   Replace String     ${template_string}    $$     ${string}     count=1

    [Return]    ${template_string}

