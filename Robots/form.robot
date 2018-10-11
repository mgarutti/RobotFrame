*** Settings ***

Documentation  Filling and retrieving data from web forms.
Suite Setup    Setting Browser
Suite Teardown    Close All Browsers
Resource    resources_form.robot



*** Test Cases ***

Completing The Form
#This test case will fulfill all the information, then submit the form.
    Complete Form

Validating The Form
#This test case will check the information provided on the "Completing Form" test case.
    Validate Form
