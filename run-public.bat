@echo off
cd /d %~dp0

start "policy-fund" /B python -m http.server 4173

timeout /t 2 /nobreak > nul
echo [1/2] 로컬 서버 기동 완료 (http://localhost:4173)

echo [2/2] ngrok 우선 시도
where ngrok >nul 2>nul
if %ERRORLEVEL%==0 (
  ngrok http 4173
  exit /b 0
)

echo ngrok 미설치 또는 실행 실패. localtunnel로 대체
npx -y localtunnel --port 4173
