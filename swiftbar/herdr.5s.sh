#!/bin/bash
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# Herdr agent status in the menu bar (polls herdr-core every 5s).
# A "done" agent counts as seen once the app's herdr.seen label reaches its turn.

H="$HOME/.local/bin/herdr-core"

# Clicked a menu item: bring Herdr forward and jump to that agent.
if [ "$1" = focus ]; then
  open -a Herdr
  "$HOME/.local/bin/herdr-app" do agent.focus --terminal "$2" >/dev/null
  exit 0
fi

list=$("$H" ls --json 2>/dev/null) || { echo "🐑 –"; exit 0; }

json=$(for t in $(jq -r '.terminals[] | select(.status) | .address' <<<"$list"); do
  "$H" get "$t" --json 2>/dev/null
done | jq -s '[.[] | {
  address,
  where: (.labels.where // .address),
  agent: (.status.app // "agent"),
  status: (if .status.state == "done" and ((.labels["herdr.seen"] // "-1") | tonumber) >= .turn
           then "seen" else .status.state end)
}]')

count() { jq "[.[] | select(.status == \"$1\")] | length" <<<"$json"; }
blocked=$(count blocked); unseen=$(count done); working=$(count working)

title="🐑"
[ "$blocked" -gt 0 ] && title+=" :exclamationmark.circle: $blocked"
[ "$unseen" -gt 0 ] && title+=" :circle.fill: $unseen"
[ "$working" -gt 0 ] && title+=" :hourglass: $working"
echo "$title"

echo "---"
section() { # status, heading
  local rows
  rows=$(jq -r --arg s "$1" --arg me "$0" '.[] | select(.status == $s) |
    "\(.where) (\(.agent)) | bash=\"\($me)\" param1=focus param2=\(.address) terminal=false"' <<<"$json")
  [ -n "$rows" ] && { echo "$2"; echo "$rows"; }
}
section blocked ":exclamationmark.circle: Needs you"
section done ":circle.fill: Finished — not seen yet"
section working ":hourglass: Working"
section seen ":eye: Finished — seen"
section idle ":moon.zzz: Idle"
echo "---"
echo "Open Herdr | bash=open param1=-a param2=Herdr terminal=false"
