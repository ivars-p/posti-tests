Test automation project for web-application: 'https://www.posti.fi'
=======================================

The following tests are automated:
----------------------------------


POSTI-0001: Validation of a Finnish postal code - l0

POSTI-0002: Validate that the total and delivery fees are calculated correctly - l1

Requirements
-------------
- Python 
- Browser on which to execute tests 'chrome' preferably
- Installed chromedriver on the machine based on the chrome version
- Installed allure framework on the machine

Quick start
-------------

1. Install all required dependencies located in requirements.txt file running comand.

```python
pip3 install -r requirements.txt 
```

2. Run the test automation suit generating report in ./report folder. { By default, tests are executed using chrome in parallel mode using "4" threads }
```python
pabot --testlevelsplit --processes 4 --listener allure_robotframework:./report ./tests/CheckoutTests.robot
```

3. Serve the created report with the following command
```python
allure serve ./report
```
![plot](.//report.png)

Troubleshooting
---------------

There can be as scenario where chromedriver is not up-to-date with the current chrome version, follow this link for update.
[Chromedriver for testing](https://googlechromelabs.github.io/chrome-for-testing/)

Possible improvements
---------------
- Improve the way data is passed to the test cases - for cucumber there is data tables, would like to create smthing similar.
- Introduce some sort of soft assertions' mechanism.
- Shorten test scenarios a bit, I think they might be a bit to complex.