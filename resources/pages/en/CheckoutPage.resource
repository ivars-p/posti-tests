*** Settings ***
Resource   ../BasePage.resource


*** Variables ***
${ZIP_CODE_INPUT_FIELD_LCTR}      css=[id="billing-postcode-field"]
${ZIP_CODE_ERROR_MSG_LCTR}        css=[class*="PostcodeMessage"]


*** Keywords ***
Validate Zip Code Input Field
    [Arguments]    ${zip_code}    ${expected_result}
    Wait until element is visible  ${ZIP_CODE_INPUT_FIELD_LCTR}
    Input Text    ${ZIP_CODE_INPUT_FIELD_LCTR}   ${zip_code}
    Run Keyword If    '${expected_result}' == 'Positive'
    ...    Element should not be visible  ${ZIP_CODE_ERROR_MSG_LCTR}
    ...    ELSE IF    '${expected_result}' == 'Negative'
    ...    Element should be visible   ${ZIP_CODE_ERROR_MSG_LCTR}
    ...    ELSE
    ...    Fail    Invalid value for expected_result. Use 'Positive' or 'Negative'.