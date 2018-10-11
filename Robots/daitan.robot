*** Settings ***

Library    Selenium2Library
Library       FakerLibrary
Suite Setup    Setting Browser
Suite Teardown    Close All Browsers
Resource    resources.robot


*** Test Cases ***

Searching for Daitan
#This test case will search for Daitan's web page on Google.
    Search For Page

Navigating on Webpage
#This test case will open the Daitan website and navigate through the menus.
    Open Website
    Fill The Form

