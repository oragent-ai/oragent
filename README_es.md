# Oragent

[![PyPI](https://img.shields.io/pypi/v/oragent)](https://pypi.org/project/oragent/)
[![Python](https://img.shields.io/pypi/pyversions/oragent)](https://pypi.org/project/oragent/)
[![macOS](https://img.shields.io/badge/macOS-supported-000000?logo=apple&logoColor=white)](https://github.com/oragent-ai/oragent/releases/latest)
[![Linux](https://img.shields.io/badge/Linux-supported-FCC624?logo=linux&logoColor=black)](https://pypi.org/project/oragent/)
[![License: Free Use](https://img.shields.io/badge/License-Free%20Use-orange.svg)](LICENSE)

[English](README.md) · [简体中文](README_zh-CN.md) · [日本語](README_ja.md) · [한국어](README_ko.md) · **Español** · [Français](README_fr.md) · [Deutsch](README_de.md) · [Português](README_pt.md) · [Русский](README_ru.md)

> Un Agent Supervisor para agentes de codificación con IA. Un cockpit
> consciente del estado para que veas qué agente te necesita,
> automatices los permisos rutinarios y permanezcas en flujo.

<div align="center">
  <img width="1728" alt="Panel de Oragent" src="assets/dashboard.png" />
</div>

## 🚀 Instalación

```bash
pipx install oragent
```

Entorno de ejecución: Python ≥ 3.11, tmux. Plataformas: macOS, Linux.
Windows próximamente.

O descarga la app de macOS desde la
[última release](https://github.com/oragent-ai/oragent/releases/latest).

## 🎯 Qué es Oragent

> **LangGraph hace que los agentes hablen entre sí. Oragent hace que tú
> hables con todos tus agentes.**

Oragent es un supervisor TUI para sesiones independientes de agentes de
codificación con IA. Aloja cada agente en su propio panel de `tmux`,
clasifica el estado de cada panel en tiempo real (~6 ms por captura) y
dirige tu atención hacia la sesión que esté bloqueada en ese momento.

No es un orquestador de múltiples agentes como LangGraph, AutoGen o
CrewAI: los agentes no se comunican entre sí a través de Oragent. Tú
eres el único enrutador. El modelo mental es "un operador, muchos
agentes", como un controlador aéreo, no como una línea de fábrica.

## ⚡ Qué hace

1. **Lee el estado de cada agente.** La coincidencia de patrones a nivel
   de panel clasifica cada sesión en uno de los siete estados. Coste
   típico de captura: ~6 ms.
2. **Pre-aprueba los permisos a los que dirías que sí de todas formas.**
   Auto Pilot por sesión responde automáticamente a los avisos de
   permiso rutinarios. Las decisiones que realmente requieren juicio
   siguen llegándote a ti.
3. **Lleva WAITING al frente de tu atención.** Cuando cualquier sesión
   se bloquea esperando un permiso, Oragent mueve el foco allí mediante
   una cola FIFO, con notificación de macOS.

## 🔤 Alfabeto de estados

Siete estados. Sin DAGs, sin workflows, sin compuertas de SDLC.

| Glifo | Estado | Significado |
| :---: | --- | --- |
| `*` | WORKING | el agente está produciendo salida |
| `!` | WAITING | bloqueado esperando permiso del operador |
| `o` | IDLE | terminado, esperando el próximo prompt |
| `a` | AUTO | Auto Pilot responde por el operador |
| `$` | SHELL | sesión de shell interactiva |
| `x` | STOPPED | proceso terminado |
| `?` | UNKNOWN | reconciliando (transitorio) |

Los mismos glifos en la línea de estado del TUI y en esta tabla, a
propósito.

## 🔌 Plugins incluidos

| Plugin | Estado | Comando |
| --- | :---: | --- |
| Claude Code | publicado | `claude` |
| Codex | publicado | `codex` |
| Shell | publicado | `$SHELL` |
| Aider | planeado | |
| Open Claw | planeado | |

Los plugins de terceros implementan la interfaz pública `AgentPlugin`
y pueden licenciar su propio código como quieran.

## 📦 Código fuente y licencia

Oragent es de código cerrado. La distribución pública (el paquete
`oragent` en PyPI y la build `Oragent.app` en el CDN oficial de
Releases) es el producto; el árbol de código fuente no forma parte
de ella.

El software es gratuito bajo la **Oragent Free Use License v1.0**:
gratis para uso personal y para uso comercial interno, sin cuota, sin
suscripción, sin publicidad, sin telemetría. La redistribución, la
ingeniería inversa y la publicación de forks no están concedidas. No
es una licencia de código abierto aprobada por la OSI ni una licencia
de software libre reconocida por la Free Software Foundation. El texto
completo se incluye con cada release como `LICENSE`; el resumen
legible está en [oragent.org/terms](https://oragent.org/terms).

## 🔒 Privacidad

Oragent es una herramienta local. Sin registro, sin backend que reciba
tus datos, sin analítica en la web, sin telemetría desde el TUI. Tus
sesiones, prompts, respuestas de IA, claves de API, contenido del
terminal y capturas de pantalla se quedan en tu máquina.

La única llamada de red saliente que hace Oragent es una petición
periódica HTTPS GET de solo lectura al manifest público de releases
alojado en GitHub Pages, con caída a los metadatos públicos de PyPI.
Ambos son endpoints de descubrimiento de versión; no se transmite
ningún dato de uso. Declaración completa:
[oragent.org/privacy](https://oragent.org/privacy).

## 💛 Apoyo y financiación

Oragent lo mantiene una persona independiente. Es gratis y seguirá
siéndolo. Las contribuciones voluntarias cubren el tiempo del
mantenedor y son completamente opt-in:
[oragent.org/support](https://oragent.org/support).

Tres cosas gratis que ayudan igual: dale una estrella al repositorio,
comparte [oragent.org](https://oragent.org) y abre issues detallados en
el [issue tracker](https://github.com/oragent-ai/oragent/issues).

## 🔗 Enlaces

- Sitio web: <https://oragent.org>
- PyPI: <https://pypi.org/project/oragent/>
- Última release: <https://github.com/oragent-ai/oragent/releases/latest>
- Issue tracker: <https://github.com/oragent-ai/oragent/issues>
- Privacidad: <https://oragent.org/privacy>
- Términos: <https://oragent.org/terms>
- Reembolsos: <https://oragent.org/refunds>
- Apoyo: <https://oragent.org/support>

## 👤 Autor

Desarrollado por [Shuangrui Chen](https://chenshuangrui.com).
