*** Settings ***
Resource   ../BasePage.resource
Library    ../../../libraries/SeleniumHelper.py
Library    SeleniumLibrary


*** Variables ***
${PRODUCT_LIST_ITEM_LCTR}       css=[class*=ProductList__ListItem-]
${PRODUCT_LIST_ITEM_NAME_LCTR}  css=[class*="ProductCardstyle__StyledHeadlineAndLabel"] [class*="ProductCardstyle__StyledHeadline"]
${ADD_TO_CART_BTN_LCTR}         css=[aria-label="Add to cart"]
${LOAD_MORE_BTN_LCTR}           css=[data-testid="load-more-button"]


*** Keywords ***
Search Product List Item By Name
    [Arguments]    ${elements_name}
    ${rez}=     Search List Item By Name  ${elements_name}  ${PRODUCT_LIST_ITEM_LCTR}   ${PRODUCT_LIST_ITEM_NAME_LCTR}
    RETURN  ${rez}

Search And Add To Cart Product List Item By Name
    [Arguments]    ${product_name}
    ${status}=    Set Variable    FAIL
    WHILE    "${status}" == "FAIL"
        ${status}    ${element}=    Run keyword and ignore error    Search Product List Item By Name    ${product_name}
        Run Keyword If    "${status}" == 'PASS'   Add To Cart Product List Item  ${element}
        ...    ELSE    Click Load More Button
    END

Click Load More Button
    Wait On Element, Scroll In to View And Click    ${LOAD_MORE_BTN_LCTR}

Add To Cart Product List Item
    [Arguments]    ${product_list_item_element}
    ${add_to_cart_btn}=   Get WebElements Child  ${product_list_item_element}   ${ADD_TO_CART_BTN_LCTR}
    Wait until element is enabled    ${add_to_cart_btn}
    Wait On Element, Scroll In to View And Click    ${add_to_cart_btn}
