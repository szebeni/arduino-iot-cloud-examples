source secrets.sh
TOKEN=$(./auth.sh)

curl -s -X GET "https://api2.arduino.cc/iot/v2/things/$THING/properties/$VARIABLE" \
 --header "Content-Type: application/json" \
 --header "Authorization: Bearer $TOKEN" | jq '.last_value'

