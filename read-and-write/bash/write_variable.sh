source secrets.sh
TOKEN=$(./auth.sh)

VALUE=$(./read_variable.sh)
VALUE=$((VALUE+1))

curl -s -X PUT "https://api2.arduino.cc/iot/v2/things/$THING/properties/$VARIABLE/publish" \
 --header "Content-Type: application/json" \
 --header "Authorization: Bearer $TOKEN" \
 --data "{\"device_id\": \"$DEVICE_ID\", \"value\": $VALUE}"