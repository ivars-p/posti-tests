*** Settings ***
Library    SeleniumLibrary
Library    ../../libraries/SeleniumHelper.py


*** Variables ***
${BROWSER}                      Chrome
${TIMEOUT}                      30s
${ACCEPT_ALL_COOKIES_LCTR}      css=[id="onetrust-accept-btn-handler"]
${OPEN_CART_BTN_LCTR}           css=[data-testid="cart-button"]
${STAMPS_NAVIGATION_BTN}        css=[href="/en/category/stamps"]


*** Keywords ***
Open Page
    [Arguments]    ${URL}
    Open Browser    ${URL}    ${BROWSER}

Wait On Element And Scroll In to View
    [Arguments]    ${element}
    Wait until page contains element    ${element}  ${TIMEOUT}
    Scroll Element Into View    ${element}

Wait On Element, Scroll In to View And Click
    [Arguments]    ${element}
    Wait until page contains element    ${element}  ${TIMEOUT}
    Scroll Element Into View    ${element}
    Click Element    ${element}

Accept all cookies
    Wait On Element, Scroll In to View And Click    ${ACCEPT_ALL_COOKIES_LCTR}

Open Cart Page
    Wait On Element, Scroll In to View And Click    ${OPEN_CART_BTN_LCTR}

Open Stamps Page
    Wait On Element, Scroll In to View And Click    ${STAMPS_NAVIGATION_BTN}

Get WebElements Text From Locator
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    ${txt}=    Get Text    ${element}
    RETURN    ${txt}

Search List Item By Name
    [Arguments]    ${elements_name}    ${parent_locator}    ${child_txt_locator}
    @{elements}=    Get WebElements    ${parent_locator}
    FOR    ${element}    IN    @{elements}
        ${child_element_txt}=    Get WebElements Child  ${element}  ${child_txt_locator}
        ${text}=    Get Text    ${child_element_txt}
        IF    "${text}" == "${elements_name}"
            RETURN    ${element}
        END
    END
    Fail    List item with name "${elements_name}" was not found
