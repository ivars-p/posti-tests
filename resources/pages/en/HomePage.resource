*** Settings ***
Resource   ../BasePage.resource
Library    String


*** Variables ***
${HOME_PAGE_URL}                 https://www.posti.fi/en
${ProductCardGroupButtonLCTR}    xpath=//*[contains(@class, 'desktop-ctas')]//button[contains(.,'%s')]


*** Keywords ***
Open Home Page
    Open Page    ${HOME_PAGE_URL}

Open Home Page And Accept Cookies
    Open Home Page
    Accept all cookies

Open Product Card Group
    [Arguments]    ${product_card_group_name}
    ${button_locator}=    Replace String    ${ProductCardGroupButtonLCTR}    %s    ${product_card_group_name}
    Wait On Element, Scroll In to View And Click    ${button_locator}