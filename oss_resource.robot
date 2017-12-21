*** Settings ***
Library                 AppiumLibrary

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     7.0
${DEVICE_NAME}          emulator-5554
${APP}                  ${CURDIR}\\app\\app-debug-staging-investor.apk
${PACKAGE_NAME}         com.cartenz.oss
${username}             depa.panjie@mailinator.com
${password}             111111

*** Keywords ***
Open the app
    Open Application        ${REMOTE_URL}  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}  deviceName=${DEVICE_NAME}  app=${APP}  automationName=appium  appPackage=${PACKAGE_NAME}
    Click Element           id=button1
    Click Element           xpath=//android.widget.Button[@text='ALLOW']
    Click Element           xpath=//android.widget.Button[@text='ALLOW']
    Click Element           xpath=//android.widget.Button[@text='ALLOW']
    Click Element           xpath=//android.widget.Button[@text='ALLOW']
    Click Element           xpath=//android.widget.Button[@text='ALLOW']

Login the app
    Input Text              xpath=//android.widget.EditText[@text='Email']              ${username}
    Input Text              xpath=//android.widget.EditText[@text='Password']           ${password}
    Click Element           id=btnLogin

View notification
    Wait Until Page Contains Element    id=iv_action_right
    Click Element                       id=iv_action_right
    Wait Until Page Contains Element    id=tvDateTime
    Page Should Contain Element         id=tvDateTime

View profile
    Click Element                       id=iv_action_left
    Click Element                       xpath=//android.widget.RelativeLayout[@index='1']
    Page Should Contain Element         id=iv_user

Close the app
    Close All Applications