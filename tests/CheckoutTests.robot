*** Settings ***
Documentation   Validation of checkout features functionality
Resource        ../resources/pages/en/HomePage.resource
Resource        ../resources/pages/en/ProductsPage.resource
Resource        ../resources/pages/en/CartPage.resource
Resource        ../resources/pages/en/CheckoutPage.resource


*** Variables ***
@{VALID_ZIP_CODES}    00100    20100    33100    90100    15100
@{INVALID_ZIP_CODES}  1234     001000   A1234    12 34    123456


*** Test Cases ***
POSTI-0001: Validation of a Finnish postal code - l0
    [Tags]    l0    checkout    POSTI-0001
    Open Home Page And Accept Cookies
    Open Product Card Group    All stamps and envelopes from the online store
    ${tab2}    Switch Window    NEW
    Search And Add To Cart Product List Item By Name    Blossoming Friendship
    Open Cart Page and Continue to Checkout
        FOR    ${zip_code}    IN    @{VALID_ZIP_CODES}
            Validate Zip Code Input Field    ${zip_code}    Positive
        END
        FOR    ${zip_code}    IN    @{INVALID_ZIP_CODES}
            Validate Zip Code Input Field    ${zip_code}    Negative
        END

POSTI-0002: Validate that the total and delivery fees are calculated correctly - l1
    [Tags]    l1    checkout    POSTI-0002
    Open Home Page And Accept Cookies
    Open Product Card Group                                             All stamps and envelopes from the online store
    ${tab2}    Switch Window                                            NEW
    Search And Add To Cart Product List Item By Name                    Blossoming Friendship
    Open Cart Page
    Validate Cart Product List Item Is Present By Name                  Blossoming Friendship
    Validate Cart Summary: Subtotal, Delivery fee, Total, Incl. VAT     23.00 €   5.00 €    28.00 €  0.97 €
    Open Stamps Page
    Search And Add To Cart Product List Item By Name                    Winter light
    Open Cart Page
    Validate Cart Product List Item Is Present By Name                  Blossoming Friendship
    Validate Cart Product List Item Is Present By Name                  Winter light
    Validate Cart Summary: Subtotal, Delivery fee, Total, Incl. VAT     46.00 €   0.00 €    0.00 €  0.00 €