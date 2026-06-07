#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"
pkill -f 'static_dashboard_server.py' || true
nohup /usr/bin/python3 "$PROJECT_ROOT/runtime/static_dashboard_server.py" >/tmp/morning-newspaper-8510.log 2>&1 &
echo $! > /tmp/morning-newspaper-8510.pid
echo "started 8510 server pid=$(cat /tmp/morning-newspaper-8510.pid)"
