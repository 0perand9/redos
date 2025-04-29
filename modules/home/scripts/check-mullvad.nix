{ pkgs, ... }:
pkgs.writeShellScriptBin "check-mullvad" ''

    #!${pkgs.bash}/bin/bash

    # Primary method: Check Mullvad CLI status
    if command -v mullvad >/dev/null && mullvad status | grep -q "Connected"; then
      # Get additional connection details for tooltip
      MULLVAD_STATUS=$(mullvad status)
      SERVER=$(echo "$MULLVAD_STATUS" | grep -o "Relay: *.*" | sed 's/Relay: *//')
      LOCATION=$(echo "$MULLVAD_STATUS" | grep -o "Visible location: *.*" | sed 's/Visible location: *//')
      
      # Output for Waybar
      echo "🔒"
      echo "🔒"
      echo "Connected to $SERVER ($LOCATION)"
      exit 0
    fi

    # Fallback method: Not connected
    echo "🔓"
    echo "🔓"
    echo "Not connected to Mullvad VPN"
    ``;