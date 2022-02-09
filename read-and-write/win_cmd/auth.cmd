@echo off

call secrets.cmd

curl ^
 -s ^
 --request POST ^
 --url "https://api2.arduino.cc/iot/v1/clients/token" ^
 --header "content-type: application/x-www-form-urlencoded" ^
 --data "grant_type=client_credentials" ^
 --data "client_id=%CLIENT_ID%" ^
 --data "client_secret=%CLIENT_SECRET%" ^
 --data "audience=https://api2.arduino.cc/iot" | jq ".access_token"
