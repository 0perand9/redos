{pkgs}:
pkgs.writeShellScriptBin "recording-status" ''
if pgrep -x "wf-recorder" > /dev/null; then
    echo '{"text": "⏺ REC", "class": "recording", "tooltip": "Click to stop recording"}'
else
    echo '{"text": "", "class": "idle"}'
fi
''