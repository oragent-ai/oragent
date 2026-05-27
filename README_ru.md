# Oragent

[![PyPI](https://img.shields.io/pypi/v/oragent)](https://pypi.org/project/oragent/)
[![Python](https://img.shields.io/pypi/pyversions/oragent)](https://pypi.org/project/oragent/)
[![macOS](https://img.shields.io/badge/macOS-supported-000000?logo=apple&logoColor=white)](https://github.com/oragent-ai/oragent/releases/latest)
[![Linux](https://img.shields.io/badge/Linux-supported-FCC624?logo=linux&logoColor=black)](https://pypi.org/project/oragent/)
[![License: Free Use](https://img.shields.io/badge/License-Free%20Use-orange.svg)](LICENSE)

[English](README.md) · [简体中文](README_zh-CN.md) · [日本語](README_ja.md) · [한국어](README_ko.md) · [Español](README_es.md) · [Français](README_fr.md) · [Deutsch](README_de.md) · [Português](README_pt.md) · **Русский**

> Agent Supervisor для AI-агентов разработки. Cockpit с отслеживанием
> состояний, чтобы видеть, какой агент ждёт вашего внимания,
> автоматически обрабатывать рутинные запросы разрешений и оставаться
> в потоке.

<div align="center">
  <img width="1728" alt="Дашборд Oragent" src="assets/dashboard.png" />
</div>

## 🚀 Установка

```bash
pipx install oragent
```

Runtime: Python ≥ 3.11, tmux. Платформы: macOS, Linux. Windows на
очереди.

Или скачайте приложение для macOS из
[последнего релиза](https://github.com/oragent-ai/oragent/releases/latest).

## 🎯 Что такое Oragent

> **LangGraph даёт агентам говорить друг с другом. Oragent даёт вам
> говорить со всеми вашими агентами.**

Oragent — TUI-супервайзер для независимых сессий AI-агентов
разработки. Он размещает каждого агента в собственной панели `tmux`,
классифицирует состояние каждой панели в реальном времени (~6 мс на
захват) и направляет ваше внимание на сессию, которая сейчас
заблокирована.

Это не мульти-агентный оркестратор как LangGraph, AutoGen или CrewAI:
агенты не общаются друг с другом через Oragent. Маршрутизатор — это
вы один. Ментальная модель — «один оператор, много агентов», скорее
авиадиспетчер, чем заводской конвейер.

## ⚡ Что он делает

1. **Читает состояние каждого агента.** Сопоставление шаблонов на
   уровне панели классифицирует каждую сессию в одно из семи
   состояний. Типичная стоимость захвата — ~6 мс.
2. **Заранее одобряет разрешения, на которые вы бы и так согласились.**
   Auto Pilot на каждую сессию автоматически отвечает на рутинные
   запросы разрешений. Решения, требующие настоящего суждения,
   по-прежнему доходят до вас.
3. **Выводит WAITING на передний план вашего внимания.** Когда любая
   сессия блокируется на разрешении, Oragent переводит туда фокус по
   FIFO-очереди и шлёт macOS-уведомление.

## 🔤 Алфавит состояний

Семь состояний. Никаких DAG, никаких workflow, никаких SDLC-гейтов.

| Глиф | Состояние | Смысл |
| :---: | --- | --- |
| `*` | WORKING | агент выдаёт вывод |
| `!` | WAITING | заблокирован, ждёт разрешения оператора |
| `o` | IDLE | завершён, ждёт следующего prompt |
| `a` | AUTO | Auto Pilot отвечает за оператора |
| `$` | SHELL | интерактивная shell-сессия |
| `x` | STOPPED | процесс завершён |
| `?` | UNKNOWN | сверка (временное состояние) |

Те же глифы в строке состояния TUI и в этой таблице — намеренно.

## 🔌 Встроенные плагины

| Plugin | Статус | Команда |
| --- | :---: | --- |
| Claude Code | выпущен | `claude` |
| Codex | выпущен | `codex` |
| Shell | выпущен | `$SHELL` |
| Aider | планируется | |
| Open Claw | планируется | |

Сторонние плагины реализуют публичный интерфейс `AgentPlugin` и могут
лицензировать собственный код как пожелают.

## 📦 Исходный код и лицензия

Oragent — программное обеспечение с закрытым исходным кодом.
Опубликованный дистрибутив (пакет `oragent` на PyPI и сборка
`Oragent.app` на официальном CDN Releases) и есть продукт; дерево
исходных кодов в дистрибутив не входит.

ПО распространяется бесплатно по **Oragent Free Use License v1.0**:
бесплатно для личного использования и внутреннего коммерческого
использования, без подписки, без рекламы, без телеметрии. Право на
перераспространение, обратную разработку и публикацию форков не
предоставляется. Это не одобренная OSI open-source лицензия и не
лицензия свободного ПО, признанная Free Software Foundation. Полный
текст поставляется с каждым релизом как файл `LICENSE`; читаемая
сводка — на [oragent.org/terms](https://oragent.org/terms).

## 🔒 Приватность

Oragent — локальный инструмент. Никаких регистраций, никакого
бэкенда, принимающего ваши данные, никакой аналитики на сайте,
никакой телеметрии из TUI. Ваши сессии, prompt-ы, ответы ИИ, API-ключи,
содержимое терминала и скриншоты остаются на вашей машине.

Единственный исходящий сетевой вызов, который делает сам Oragent, —
периодический read-only HTTPS GET к публичному манифесту релизов на
GitHub Pages, с откатом на публичные метаданные PyPI. Оба — конечные
точки обнаружения версии; никакие данные об использовании не
передаются. Полный текст:
[oragent.org/privacy](https://oragent.org/privacy).

## 💛 Поддержка и финансирование

Oragent поддерживает один независимый разработчик. Сейчас и в
дальнейшем — бесплатно. Добровольные взносы покрывают время
мейнтейнера и полностью добровольны:
[oragent.org/support](https://oragent.org/support).

Три бесплатных способа помочь не хуже: поставить звезду этому
репозиторию, поделиться [oragent.org](https://oragent.org) и завести
подробные issue в
[issue tracker](https://github.com/oragent-ai/oragent/issues).

## 🔗 Ссылки

- Сайт: <https://oragent.org>
- PyPI: <https://pypi.org/project/oragent/>
- Последний релиз: <https://github.com/oragent-ai/oragent/releases/latest>
- Issue tracker: <https://github.com/oragent-ai/oragent/issues>
- Приватность: <https://oragent.org/privacy>
- Условия: <https://oragent.org/terms>
- Возвраты: <https://oragent.org/refunds>
- Поддержать: <https://oragent.org/support>

## 👤 Автор

Разработано [Shuangrui Chen](https://chenshuangrui.com).
