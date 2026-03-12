# S PARTNERS — 정책자금 상담 랜딩페이지

> 소상공인 · 중소기업 대상 정책자금 상담 신청을 위한 모바일 중심 반응형 랜딩페이지

<p align="center">
  <strong>Live</strong>:
  <a href="https://s-partners.vercel.app">s-partners.vercel.app</a>
</p>

<p align="center">
  <strong>Repository</strong>:
  <a href="https://github.com/doublesilver/s-partners-landing">github.com/doublesilver/s-partners-landing</a>
</p>

---

## Overview

S PARTNERS는 소상공인과 중소기업을 대상으로 정책자금 상담 신청을 받기 위한 정적 랜딩페이지입니다.  
대표 사진과 상담 흐름을 중심으로 신뢰감을 주는 화면을 구성했고, 모바일 사용성을 우선으로 설계했습니다.

백엔드 없이 **Vanilla HTML/CSS/JS**만으로 제작했으며,  
문의 접수는 **FormSubmit**을 통해 이메일로 전달되고, 배포는 **Vercel**에서 Git 연동으로 자동화됩니다.

---

## Architecture

```text
┌────────────────────────────────────────────────────────────┐
│                    GitHub Repository                        │
│              doublesilver/s-partners-landing               │
└────────────────────────────┬───────────────────────────────┘
                             │ git push
                             ▼
┌────────────────────────────────────────────────────────────┐
│                        Vercel CDN                          │
│                                                            │
│   index.html  ─  thanks.html  ─  representative photos     │
│   static landing page  ─  responsive UI  ─  clean URL      │
└────────────────────────────┬───────────────────────────────┘
                             │ form submit (AJAX / POST)
                             ▼
┌────────────────────────────────────────────────────────────┐
│                        FormSubmit                           │
│                                                            │
│   Form endpoint  ─  email relay  ─  activation flow         │
└────────────────────────────┬───────────────────────────────┘
                             │ email delivery
                             ▼
┌────────────────────────────────────────────────────────────┐
│                    korea5410@gmail.com                      │
│                                                            │
│   상담 신청 메일 수신  ─  한글 필드명 표 형태 전송         │
└────────────────────────────────────────────────────────────┘
```

---

## Tech Stack

| Layer | Technology | Note |
|-------|-----------|------|
| **Frontend** | HTML5, CSS3, Vanilla JS | 프레임워크 없이 정적 페이지로 구현 |
| **UI** | Responsive Layout | 모바일 우선, 데스크탑 대응 |
| **Form Delivery** | FormSubmit | 백엔드 없이 이메일 전송 |
| **Hosting** | Vercel | Git push 기반 자동 배포 |
| **Version Control** | GitHub | 원격 저장소 및 README 포트폴리오 관리 |

---

## Features

### Landing Experience

```text
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│   Hero       │───▶│ 상담 방향     │───▶│ 지원 범위     │
│              │    │              │    │              │
│ • 대표 사진   │    │ • 방향 정리   │    │ • 운전자금    │
│ • 핵심 메시지 │    │ • 문제 정의   │    │ • 시설자금    │
│ • CTA        │    │ • 접근 방식   │    │ • 창업자금    │
└──────────────┘    └──────────────┘    │ • 보증연계    │
                                         │ • 정부지원금  │
                                         └──────────────┘

┌──────────────┐    ┌──────────────┐
│ 대표 소개     │───▶│ 상담 신청 폼  │
│              │    │              │
│ • 대표 메시지 │    │ • 한글 친화 폼 │
│ • 진행 절차   │    │ • 이메일 전송  │
│ • 신뢰 중심   │    │ • 완료 페이지   │
└──────────────┘    └──────────────┘
```

| Feature | Description |
|---------|-------------|
| **모바일 중심 레이아웃** | 첫 화면부터 CTA까지 모바일 읽기 흐름에 맞춰 설계 |
| **프리미엄 컨설팅 톤** | 과한 세일즈 느낌 대신 절제된 색감과 타이포로 신뢰감 강화 |
| **대표 사진 중심 히어로** | 실사 기반 신뢰 형성에 집중한 첫 화면 구성 |
| **정책자금 범위 안내** | 운전자금, 시설자금, 창업자금, 보증연계, 정부지원금 상담 범위 제공 |
| **한글 친화 폼 UX** | 문구, 플레이스홀더, 버튼 문구를 한국어 사용자 기준으로 정리 |
| **한글 메일 필드명** | 수신 이메일에 `상호명`, `대표자명`, `문의내용` 등 한글 항목명으로 전달 |
| **완료 페이지 분리** | 제출 완료 후 `thanks.html`로 이동해 접수 완료 경험 제공 |

---

## Project Structure

```text
s-partners-landing/
├── index.html              # 메인 랜딩 페이지
├── thanks.html             # 신청 완료 페이지
├── README.md               # 포트폴리오형 프로젝트 문서
├── start-landing.bat       # Windows 로컬 정적 서버 실행
├── start-landing.sh        # Linux/macOS 로컬 정적 서버 실행
├── run-public.bat          # 공개 URL 실행 스크립트
├── run-public.sh           # 공개 URL 실행 스크립트
├── 대표자사진1.jpg         # 메인 히어로 대표 사진
├── 대표자사진2.jpg         # 대표 소개 섹션 사진
└── 대표프로필사진.jpg      # 보조 프로필 이미지
```

---

## Form Flow

| Step | Description |
|------|-------------|
| `1` | 사용자가 `index.html`에서 상담 신청 폼 작성 |
| `2` | 프론트엔드가 `FormSubmit` AJAX 엔드포인트로 데이터 전송 |
| `3` | FormSubmit이 `korea5410@gmail.com`으로 신청 메일 발송 |
| `4` | 성공 시 `thanks.html`로 이동 |

### Email Payload

수신 메일에는 아래 항목이 모두 한글로 전달됩니다.

- `상호명`
- `대표자명`
- `사업자구분`
- `연락처`
- `업종`
- `연매출규모`
- `상담희망자금`
- `문의내용`
- `개인정보동의`

---

## Design Decisions

| Decision | Rationale |
|----------|-----------|
| **모바일 우선 설계** | 실제 랜딩 유입의 대부분이 모바일일 가능성을 고려해 첫 화면과 폼 UX를 모바일 중심으로 구성 |
| **백엔드 미사용** | 빠른 구축과 운영 단순화를 위해 정적 페이지 + 이메일 전송 서비스 구조 채택 |
| **실사 기반 신뢰 형성** | 성과 수치 공개 대신 대표 실사진과 상담 흐름 중심으로 신뢰감을 형성 |
| **한글 UX 최적화** | 폼 문구, 버튼, 메일 필드명을 모두 한국어 중심으로 정리해 실제 상담 전환에 유리하게 구성 |
| **프리미엄 톤 조정** | 과한 장식보다 짙은 본문색, 절제된 포인트 컬러, 넓은 여백으로 컨설팅 브랜드 톤 강화 |

---

## Deployment

### Production

```bash
# Git push → Vercel 자동 배포
git push origin main
```

### Current Production URL

```text
https://s-partners.vercel.app
```

### Form Delivery

```text
Form endpoint: https://formsubmit.co/ajax/korea5410@gmail.com
Recipient: korea5410@gmail.com
```

---

## Local Development

```bash
# 1. Clone
git clone https://github.com/doublesilver/s-partners-landing.git
cd s-partners-landing

# 2. Run static server
python3 -m http.server 4173 --directory .

# 3. Open in browser
http://localhost:4173
```

Windows에서는 아래 스크립트로도 실행할 수 있습니다.

```bash
start-landing.bat
```

---

## Notes

- 이 프로젝트는 정적 랜딩페이지이므로 별도 백엔드 서버를 사용하지 않습니다.
- 운영 전에는 `FormSubmit` 수신 이메일 활성화가 필요합니다.
- 자동화 테스트는 별도 구성하지 않았으며, 현재 범위는 UI/폼 흐름 중심의 정적 프로젝트입니다.

---

## License

Private — All rights reserved.
