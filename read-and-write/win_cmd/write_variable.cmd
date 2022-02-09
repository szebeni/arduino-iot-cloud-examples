@echo off
call auth.cmd > .\tmp\token.txt
set /p TOKEN= < .\tmp\token.txt
del .\tmp\token.txt

call read_variable.cmd > .\tmp\value.txt
set /p VALUE= < .\tmp\value.txt
del .\tmp\value.txt

set /a VALUE=VALUE+1

curl -s -X PUT "https://api2.arduino.cc/iot/v2/things/%THING%/properties/%VARIABLE%/publish" ^
 --header "Content-Type: application/json" ^
 --header "Authorization: Bearer %TOKEN%" ^
 --data "{\"device_id\": \"%DEVICE_ID%\", \"value\": %VALUE%}"

