{ pkgs }:

pkgs.writeShellScriptBin "autoclicker" ''
  PIDFILE="/tmp/autoclicker.pid"

  if [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
      kill "$(cat "$PIDFILE")"
      rm "$PIDFILE"
      notify-send "Autoclicker OFF"
  else
      (
          while true; do
              ydotool click 0xC0
              sleep .6
          done
      ) &
      echo $! > "$PIDFILE"
      notify-send "Autoclicker ON"
  fi
''