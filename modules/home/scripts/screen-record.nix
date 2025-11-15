{ pkgs }:
pkgs.writeShellScriptBin "screen-record" ''
  STATUS_FILE="/tmp/wf-recorder-status"

  if pgrep -x "wf-recorder" > /dev/null; then
      pkill -INT wf-recorder
      rm -f "$STATUS_FILE"
      notify-send "Recording stopped" "Video saved to ~/Videos/"
  else
      wf-recorder -g "$(slurp)" -f ~/Videos/recording-$(date +%Y%m%d-%H%M%S).mp4 &
      echo "recording" > "$STATUS_FILE"
      notify-send "Recording started" "Select region to record"
  fi
''
