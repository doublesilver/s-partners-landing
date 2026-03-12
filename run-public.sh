#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

echo "[1/2] 로컬 서버 기동"
python3 -m http.server 4173 > /tmp/policy-fund-page.log 2>&1 &
sleep 2

echo "[2/2] ngrok 우선 시도"
if command -v ngrok >/dev/null 2>&1; then
  ngrok http 4173
else
  echo "ngrok 미설치 또는 실행 불가. localtunnel로 대체"
  npx -y localtunnel --port 4173
fi
