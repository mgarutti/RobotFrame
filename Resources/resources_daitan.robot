*** Settings ***

Documentation  Resources for the Daitan website robot.

*** Variables ***

${BROWSER}  chrome
${DAITAN_SEARCH}   Daitan Group
${GOOGLE_URL}   http://www.google.com.br
${SEARCH_BAR}   //input[@id='lst-ib']
${SEARCH_BUTTON}    //input[@value='Pesquisa Google']
${SEARCH_RESULTS}   //div[7]/div[3]/div[10]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/h3[1]
${DELAY_TIME}   2
${MENU_WHY_DAITAN}  //*[@id="menu-item-35"]/a
${MENU_INDUSTRIES}  //*[@id="menu-item-31"]/a
${MENU_SERVICES}    //*[@id="menu-item-30"]/a
${MENU_CLIENTS}     //*[@id="menu-item-29"]/a
${MENU_RESOURCES}   //*[@id="menu-item-28"]/a
${MENU_ABOUT}       //*[@id="menu-item-27"]/a
${MENU_CONTACT}     //*[@id="menu-item-26"]/a
${SUBSCRIBE}    //a[contains(text(),'Subscribe Now')]
${ENTER_KEY}                   \\13
${EMAIL_LOC}   //input[@placeholder='Your email address']
${FIRST_NAME_LOC}   //input[@placeholder='First Name']
${LAST_NAME_LOC}    //input[@placeholder='Last Name']
${COMPANY_LOC}      //input[@placeholder='Company']
${HELP_LOC}         MMERGE5
${PHONE_LOC}    //input[@placeholder='Phone']
${RADIO_YES}     MMERGE6
${RADIO_VALUE}    Yes Please
${FORM_PAGE}    http://www.daitangroup.com/form-page/



*** Keywords ***

Setting Browser
    Open Browser    ${GOOGLE_URL}     ${BROWSER}    #<webpage> and <browser>
    Maximize Browser Window

Search For Page
    Element Should Be Visible   ${SEARCH_BAR}
    Click Element  ${SEARCH_BAR}
    Input Text  ${SEARCH_BAR}   ${DAITAN_SEARCH}
    Wait Until Page Contains Element   ${SEARCH_BAR}
    Press Key    ${SEARCH_BAR}  ${ENTER_KEY}
    Set Selenium Speed  ${DELAY_TIME}
    Wait Until Element Contains  ${SEARCH_RESULTS}      ${DAITAN_SEARCH}    timeout=50.0


Open Website

    Click Element   ${SEARCH_RESULTS}
    #Click Link  ${MENU_WHY_DAITAN}
    #Click Link  ${MENU_INDUSTRIES}
    #Click Link  ${MENU_SERVICES}
    #Click Link  ${MENU_CLIENTS}
    #Click Link  ${MENU_RESOURCES}
    #Click Link  ${MENU_ABOUT}
    Click Link  ${MENU_CONTACT}
    Click Element    ${SUBSCRIBE}
    Select Window   NEW


Fill The Form

    Wait Until Page Contains Element    ${EMAIL_LOC}    timeout=50.0
    ${EMAIL}=   Email
    ${FIRST_NAME}=    First Name
    ${LAST_NAME}=    Last Name
    ${COMPANY}=     Word
    ${PHONE}=    Phone Number
    ${HELP}=    Word
    Input Text  ${EMAIL_LOC}   ${EMAIL}
    Input Text  ${FIRST_NAME_LOC}   ${FIRST_NAME}
    Input Text  ${LAST_NAME_LOC}    ${LAST_NAME}
    Input Text  ${COMPANY_LOC}    ${COMPANY}
    Input Text  ${PHONE_LOC}    ${PHONE}
    Select Radio Button     ${RADIO_YES}    ${RADIO_VALUE}
    Input Text  ${HELP_LOC}     ${HELP}
    Close Browser


