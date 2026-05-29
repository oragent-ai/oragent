# Oragent

[![Website](https://img.shields.io/badge/Website-oragent.org-FF8800)](https://oragent.org)
[![PyPI](https://img.shields.io/pypi/v/oragent)](https://pypi.org/project/oragent/)
[![Python](https://img.shields.io/pypi/pyversions/oragent)](https://pypi.org/project/oragent/)
[![macOS](https://img.shields.io/badge/macOS-supported-000000?logo=apple&logoColor=white)](https://github.com/oragent-ai/oragent/releases/latest)
[![Linux](https://img.shields.io/badge/Linux-supported-FCC624?logo=linux&logoColor=black)](https://pypi.org/project/oragent/)
[![License: Free Use](https://img.shields.io/badge/License-Free%20Use-orange.svg)](LICENSE)

[English](README.md) · [简体中文](README_zh-CN.md) · [日本語](README_ja.md) · **한국어** · [Español](README_es.md) · [Français](README_fr.md) · [Deutsch](README_de.md) · [Português](README_pt.md) · [Русский](README_ru.md)

> AI 코딩 Agent를 위한 Agent Supervisor. 상태 인식 기반 콕핏으로 어떤
> 에이전트가 당신을 기다리고 있는지 한눈에 보고, 반복적인 권한 승인을
> 자동 처리하며, 몰입 상태를 유지합니다.

🌐 **<https://oragent.org>**

<div align="center">
  <img width="1728" alt="Oragent 대시보드" src="assets/dashboard.png" />
</div>

## 🚀 설치

```bash
pipx install oragent
```

런타임: Python ≥ 3.11, tmux. 플랫폼: macOS, Linux. Windows 곧 지원.

또는 [최신 릴리스](https://github.com/oragent-ai/oragent/releases/latest)
에서 macOS 앱을 다운로드할 수 있습니다.

## 🎯 Oragent란

> **LangGraph는 에이전트끼리 대화하게 합니다. Oragent는 당신이 모든
> 에이전트와 대화하게 합니다.**

Oragent는 독립적인 AI 코딩 agent 세션을 위한 TUI 슈퍼바이저입니다. 각
agent를 자체 `tmux` pane에 배치하고, 모든 pane의 상태를 실시간(캡처당
약 6ms)으로 분류하며, 현재 막혀 있는 세션으로 당신의 주의를 이끕니다.

LangGraph, AutoGen, CrewAI 같은 다중 에이전트 오케스트레이터가 아닙
니다. 에이전트들은 Oragent를 통해 서로 통신하지 않습니다. 라우터는
당신 한 사람이며, 멘탈 모델은 "한 명의 운영자, 여러 명의 에이전트",
공장 생산 라인보다는 항공 관제사에 가깝습니다.

## ⚡ 무엇을 하는가

1. **각 agent의 상태를 읽습니다.** Pane 수준의 패턴 매칭으로 모든 세션을
   7가지 상태 중 하나로 분류합니다. 일반적인 캡처 비용은 약 6ms입니다.
2. **어차피 승인할 권한은 미리 승인합니다.** 세션별 Auto Pilot이 정형화된
   권한 프롬프트에 자동으로 응답합니다. 진짜 판단이 필요한 건 여전히 당신
   에게 옵니다.
3. **WAITING을 주의의 최전선으로 보냅니다.** 어떤 세션이든 권한 대기에
   걸리면 Oragent가 FIFO 큐로 포커스를 옮기고 macOS 알림을 발행합니다.

## 🔤 상태 알파벳

일곱 가지 상태. DAG 없음, 워크플로 없음, SDLC 게이트 없음.

| 글리프 | 상태 | 의미 |
| :---: | --- | --- |
| `*` | WORKING | agent가 출력 중 |
| `!` | WAITING | 운영자 승인 대기 |
| `o` | IDLE | 완료, 다음 prompt 대기 |
| `a` | AUTO | Auto Pilot이 운영자 대신 응답 중 |
| `$` | SHELL | 대화형 shell 세션 |
| `x` | STOPPED | 프로세스 종료 |
| `?` | UNKNOWN | 재조정 중(일시적) |

TUI 상태 라인과 이 표에서 같은 글리프를 의도적으로 사용합니다.

## 🔌 기본 제공 플러그인

| Plugin | 상태 | 명령어 |
| --- | :---: | --- |
| Claude Code | 출시 | `claude` |
| Codex | 출시 | `codex` |
| Shell | 출시 | `$SHELL` |
| Aider | 예정 | |
| Open Claw | 예정 | |

서드파티 플러그인은 공개된 `AgentPlugin` 인터페이스를 구현하며, 자신들의
코드는 원하는 라이선스를 사용할 수 있습니다.

## 📦 소스와 라이선스

Oragent는 클로즈드 소스입니다. 공개 배포물(PyPI의 `oragent` 패키지와
공식 Releases CDN의 `Oragent.app` 빌드)이 곧 제품이며, 소스 트리는
배포물에 포함되지 않습니다.

소프트웨어는 **Oragent Free Use License v1.0**에 따라 무료로 제공됩니다.
개인 및 조직 내부 상업적 사용 모두 무료, 구독 없음, 광고 없음, 텔레메트리
없음. 재배포, 리버스 엔지니어링, 포크 공개는 허용되지 않습니다. OSI 인증
오픈 소스 라이선스가 아니며, 자유 소프트웨어 재단의 자유 소프트웨어
라이선스도 아닙니다. 전문은 각 릴리스에 `LICENSE`로 동봉되며, 요약은
[oragent.org/terms](https://oragent.org/terms)에 있습니다.

## 🔒 프라이버시

Oragent는 로컬 도구입니다. 가입 없음, 데이터를 수신하는 백엔드 없음,
웹사이트에 분석 태그 없음, TUI 텔레메트리 없음. 세션, 프롬프트, AI 응답,
API 키, 터미널 내용, 스크린샷은 모두 당신의 머신에 머뭅니다.

Oragent 자체가 만드는 외부 통신은 한 종류뿐입니다. GitHub Pages에 호스팅
된 공개 릴리스 manifest를 주기적으로 HTTPS GET으로 읽고, 실패 시 공개
PyPI 메타데이터로 폴백합니다. 둘 다 버전 탐지 엔드포인트이며 사용 데이터
는 전송되지 않습니다. 전문은 [oragent.org/privacy](https://oragent.org/privacy)
에서 확인하세요.

## 💛 후원과 지원

Oragent는 독립 개발자 한 명이 유지합니다. 지금도, 앞으로도 무료입니다.
자발적 후원은 메인테이너의 시간을 보전하는 것이며 완전히 선택입니다:
[oragent.org/support](https://oragent.org/support).

무료지만 똑같이 도움이 되는 세 가지: 이 저장소에 스타 누르기,
[oragent.org](https://oragent.org) 공유하기,
[이슈 트래커](https://github.com/oragent-ai/oragent/issues)
에 자세한 이슈 남기기.

## 🔗 링크

- 홈페이지: <https://oragent.org>
- PyPI: <https://pypi.org/project/oragent/>
- 최신 릴리스: <https://github.com/oragent-ai/oragent/releases/latest>
- 이슈 트래커: <https://github.com/oragent-ai/oragent/issues>
- 프라이버시: <https://oragent.org/privacy>
- 약관: <https://oragent.org/terms>
- 환불: <https://oragent.org/refunds>
- 후원: <https://oragent.org/support>

## 👤 저자

[Shuangrui Chen](https://chenshuangrui.com)이 개발하고 유지합니다.
