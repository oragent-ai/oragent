# Oragent

[![Website](https://img.shields.io/badge/Website-oragent.org-FF8800)](https://oragent.org)
[![PyPI](https://img.shields.io/pypi/v/oragent)](https://pypi.org/project/oragent/)
[![Python](https://img.shields.io/pypi/pyversions/oragent)](https://pypi.org/project/oragent/)
[![macOS](https://img.shields.io/badge/macOS-supported-000000?logo=apple&logoColor=white)](https://github.com/oragent-ai/oragent/releases/latest)
[![Linux](https://img.shields.io/badge/Linux-supported-FCC624?logo=linux&logoColor=black)](https://pypi.org/project/oragent/)
[![License: Free Use](https://img.shields.io/badge/License-Free%20Use-orange.svg)](LICENSE)

[English](README.md) · [简体中文](README_zh-CN.md) · [日本語](README_ja.md) · [한국어](README_ko.md) · [Español](README_es.md) · [Français](README_fr.md) · **Deutsch** · [Português](README_pt.md) · [Русский](README_ru.md)

> Ein Agent Supervisor für KI-Coding-Agents. Ein zustandsbewusstes
> Cockpit, in dem du siehst, welcher Agent dich braucht,
> Routine-Berechtigungen automatisch handhabst und im Flow bleibst.

🌐 **<https://oragent.org>**

<div align="center">
  <img width="1728" alt="Oragent Dashboard" src="assets/dashboard.png" />
</div>

## 🚀 Installation

```bash
pipx install oragent
```

Runtime: Python ≥ 3.11, tmux. Plattformen: macOS, Linux. Windows
folgt.

Oder lade die macOS-App aus dem
[neuesten Release](https://github.com/oragent-ai/oragent/releases/latest)
herunter.

## 🎯 Was Oragent ist

> **LangGraph lässt Agents miteinander sprechen. Oragent lässt dich mit
> all deinen Agents sprechen.**

Oragent ist ein TUI-Supervisor für unabhängige KI-Coding-Agent-Sessions.
Es bringt jeden Agent in einem eigenen `tmux`-Pane unter, klassifiziert
den Zustand jedes Panes in Echtzeit (~6 ms pro Capture) und lenkt deine
Aufmerksamkeit auf die gerade blockierte Session.

Es ist kein Multi-Agent-Orchestrator wie LangGraph, AutoGen oder
CrewAI: Agents kommunizieren nicht über Oragent miteinander. Du bist
der einzige Router. Das Mentalmodell lautet „ein Operator, viele
Agents", eher Fluglotse als Fließband.

## ⚡ Was es macht

1. **Liest den Zustand jedes Agents.** Pattern-Matching auf Pane-Ebene
   klassifiziert jede Session in einen von sieben Zuständen. Typische
   Capture-Kosten: ~6 ms.
2. **Genehmigt vorab, was du sowieso freigeben würdest.** Pro Session
   beantwortet Auto Pilot routinemäßige Berechtigungs-Prompts automatisch.
   Echte Ermessensentscheidungen kommen weiterhin bei dir an.
3. **Bringt WAITING in den Vordergrund deiner Aufmerksamkeit.** Wenn
   eine Session auf eine Berechtigung wartet, schiebt Oragent den Fokus
   per FIFO-Warteschlange dorthin und löst eine macOS-Benachrichtigung
   aus.

## 🔤 Status-Alphabet

Sieben Zustände. Keine DAGs, keine Workflows, keine SDLC-Gates.

| Glyph | Zustand | Bedeutung |
| :---: | --- | --- |
| `*` | WORKING | Agent produziert Ausgabe |
| `!` | WAITING | wartet auf Freigabe durch den Operator |
| `o` | IDLE | fertig, wartet auf den nächsten Prompt |
| `a` | AUTO | Auto Pilot antwortet für den Operator |
| `$` | SHELL | interaktive Shell-Session |
| `x` | STOPPED | Prozess beendet |
| `?` | UNKNOWN | wird abgeglichen (vorübergehend) |

Dieselben Glyphen in der TUI-Statuszeile und in dieser Tabelle, mit
Absicht.

## 🔌 Mitgelieferte Plugins

| Plugin | Status | Befehl |
| --- | :---: | --- |
| Claude Code | veröffentlicht | `claude` |
| Codex | veröffentlicht | `codex` |
| Shell | veröffentlicht | `$SHELL` |
| Aider | geplant | |
| Open Claw | geplant | |

Drittanbieter-Plugins implementieren das öffentliche `AgentPlugin`-
Interface und können ihren eigenen Code unter beliebiger Lizenz
veröffentlichen.

## 📦 Quellcode und Lizenz

Oragent ist Closed Source. Die veröffentlichte Distribution (das
`oragent`-Paket auf PyPI und der `Oragent.app`-Build auf dem offiziellen
Releases-CDN) ist das Produkt; der Quellbaum gehört nicht dazu.

Die Software ist unter der **Oragent Free Use License v1.0** kostenlos:
kostenfrei für private Nutzung und interne kommerzielle Nutzung, keine
Gebühr, kein Abo, keine Werbung, keine Telemetrie. Weiterverteilung,
Reverse Engineering und das Veröffentlichen von Forks werden nicht
gewährt. Dies ist keine OSI-zertifizierte Open-Source-Lizenz und keine
von der Free Software Foundation anerkannte Freie-Software-Lizenz. Der
volle Text liegt jedem Release als `LICENSE` bei; eine lesbare
Zusammenfassung steht unter
[oragent.org/terms](https://oragent.org/terms).

## 🔒 Datenschutz

Oragent ist ein lokales Werkzeug. Keine Anmeldung, kein Backend, das
deine Daten empfängt, keine Analytics auf der Website, keine Telemetrie
aus der TUI. Deine Sessions, Prompts, KI-Antworten, API-Schlüssel,
Terminal-Inhalte und Screenshots bleiben auf deiner Maschine.

Der einzige ausgehende Netzwerkaufruf, den Oragent selbst macht, ist
ein periodischer Read-only-HTTPS-GET gegen das öffentliche Release-
Manifest auf GitHub Pages, mit Fallback auf die öffentlichen
PyPI-Metadaten. Beides sind Versions-Discovery-Endpunkte; es werden
keine Nutzungsdaten übertragen. Vollständige Erklärung:
[oragent.org/privacy](https://oragent.org/privacy).

## 💛 Unterstützung und Finanzierung

Oragent wird von einem unabhängigen Entwickler gepflegt. Es ist
kostenlos und bleibt es. Freiwillige Beiträge decken die Zeit des
Maintainers und sind komplett opt-in:
[oragent.org/support](https://oragent.org/support).

Drei Dinge helfen genauso, ohne Geld: dieses Repository starren,
[oragent.org](https://oragent.org) teilen und detaillierte Issues im
[Issue-Tracker](https://github.com/oragent-ai/oragent/issues) eröffnen.

## 🔗 Links

- Webseite: <https://oragent.org>
- PyPI: <https://pypi.org/project/oragent/>
- Neuestes Release: <https://github.com/oragent-ai/oragent/releases/latest>
- Issue-Tracker: <https://github.com/oragent-ai/oragent/issues>
- Datenschutz: <https://oragent.org/privacy>
- Nutzungsbedingungen: <https://oragent.org/terms>
- Rückerstattungen: <https://oragent.org/refunds>
- Unterstützen: <https://oragent.org/support>

## 👤 Autor

Entwickelt von [Shuangrui Chen](https://chenshuangrui.com).
