@echo off
:: Create capture task
schtasks /CREATE  /TN "WC-Cap" /XML "%ProgramFiles(x86)%\WC\WC-Cap.xml" /F
:: Create compress and send task
schtasks /CREATE /TN "WC-Send" /XML "%ProgramFiles(x86)%\WC\WC-Send.xml" /F