{ pkgs }:
pkgs.writeShellScriptBin "screen-record" ''
  PATH=${pkgs.libnotify}/bin:${pkgs.wf-recorder}/bin:${pkgs.slurp}/bin:${pkgs.coreutils}/bin:${pkgs.wl-clipboard}/bin:$PATH
  
  STATUS_FILE="/tmp/wf-recorder-status"
  VIDEO_FILE="$HOME/Videos/recording-$(date +%Y%m%d-%H%M%S).mp4"
  
  if pgrep -x "wf-recorder" > /dev/null; then
      pkill -INT wf-recorder
      rm -f "$STATUS_FILE"
      # Wait a moment for the file to finish writing
      sleep 0.5
      # Copy the most recent video to clipboard
      LATEST=$(ls -t ~/Videos/recording-*.mp4 | head -1)
      wl-copy < "$LATEST"
      notify-send "Recording stopped" "Video copied to clipboard"
  else
      wf-recorder -g "$(slurp)" -f "$VIDEO_FILE" &
      echo "recording" > "$STATUS_FILE"
      notify-send "Recording started" "Select region to record"
  fi
''