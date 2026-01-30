{ pkgs }:

pkgs.writeShellScriptBin "check-mullvad" ''
  #!${pkgs.bash}/bin/bash
  
  LOCATION_DATA=$(${pkgs.curl}/bin/curl -sf \
    --max-time 10 \
    --retry 5 \
    --retry-delay 1 \
    --retry-all-errors \
    'http://ip-api.com/json/?fields=city,regionName,countryCode')
    
  if [ $? -eq 0 ]; then
    CITY=$(echo "$LOCATION_DATA" | ${pkgs.jq}/bin/jq -r '.city')
    REGION=$(echo "$LOCATION_DATA" | ${pkgs.jq}/bin/jq -r '.regionName')
    COUNTRY=$(echo "$LOCATION_DATA" | ${pkgs.jq}/bin/jq -r '.countryCode')
    
    LOCATION_STRING="$CITY, $REGION, $COUNTRY"
  else
    LOCATION_STRING="Unknown"
  fi
  
  if command -v mullvad >/dev/null && mullvad status | grep -q "Connected"; then
    echo "🔒 $LOCATION_STRING"
  else
    echo "🔓 $LOCATION_STRING"
  fi
''
