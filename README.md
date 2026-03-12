# 정책자금 랜딩페이지 (데모)

폴더: C:\Users\korea\randing

## 실행

로컬 실행
- Windows: `start-landing.bat`
- Linux/mac: `bash start-landing.sh`
- 브라우저: http://localhost:4173

## 공개 URL(ngrok)

권장 순서:
1. ngrok 설치
   - https://ngrok.com/download
2. 계정 토큰 설정
   - `ngrok config add-authtoken <YOUR_TOKEN>`
3. 실행
   - `run-public.bat`
   - 또는 `run-public.sh`

스크립트는 `ngrok`을 우선으로 시도하고, 없으면 `localtunnel`로 자동 전환합니다.
