*** Settings ***
Resource   ../BasePage.resource
Library    String


*** Variables ***
${CART_LIST_ITEM_LCTR}             css=[class*="CartItemsList__ListItem"]
${CART_LIST_ITEM_NAME_LCTR}        css=[id="cart-item-name"]
${CART_SUMMARY_SUB_TOTAL_LCTR}     css=[id="cart-totals-subtotal-value"]
${CART_SUMMARY_DELIVERY_FEE_LCTR}  css=[id="cart-totals-shipping-value"]
${CART_SUMMARY_TOTAL_LCTR}         css=[id="cart-totals-total-value"]
${CART_SUMMARY_VAT_LCTR}           css=[id="cart-totals-tax-value"]
${CART_CHECKOUT_BTN_LCTR}          css=[data-testid="checkout"]


*** Keywords ***
Validate Cart Product List Item Is Present By Name
    [Arguments]    ${elements_name}
    Wait until element is enabled    ${CART_CHECKOUT_BTN_LCTR}
    ${rez}=    Search List Item By Name  ${elements_name}  ${CART_LIST_ITEM_LCTR}   ${CART_LIST_ITEM_NAME_LCTR}
    RETURN    ${rez}

Validate Cart Summary: Subtotal, Delivery fee, Total, Incl. VAT
    [Arguments]    ${subtotal_expected}    ${delivery_fee_expected}    ${total_expected}   ${incl_vat_expected}
    Wait until element is enabled    ${CART_CHECKOUT_BTN_LCTR}
    ${subtotal_actual}=    Get WebElements Text From Locator    ${CART_SUMMARY_SUB_TOTAL_LCTR}
    ${delivery_fee_actual}=     Get WebElements Text From Locator    ${CART_SUMMARY_DELIVERY_FEE_LCTR}
    ${total_actual}=     Get WebElements Text From Locator    ${CART_SUMMARY_TOTAL_LCTR}
    ${incl_vat_actual}=     Get WebElements Text From Locator    ${CART_SUMMARY_VAT_LCTR}

    Should be equal    ${subtotal_actual}   ${subtotal_expected}
    Should be equal    ${delivery_fee_actual}   ${delivery_fee_expected}
    Should be equal    ${total_actual}   ${total_actual}
    Should be equal    ${incl_vat_actual}   ${incl_vat_actual}

Open Cart Page and Continue to Checkout
    Open Cart Page
    Wait until element is enabled    ${CART_CHECKOUT_BTN_LCTR}
    Click element   ${CART_CHECKOUT_BTN_LCTR}