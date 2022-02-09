@echo off

call auth.cmd > .\tmp\token.txt
set /p TOKEN= < .\tmp\token.txt
del .\tmp\token.txt

curl -s -X GET "https://api2.arduino.cc/iot/v2/things/%THING%/properties/%VARIABLE%" ^
 --header "Content-Type: application/json" ^
 --header "Authorization: Bearer %TOKEN%" | jq ".last_value"

