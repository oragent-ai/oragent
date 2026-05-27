# Oragent

[![PyPI](https://img.shields.io/pypi/v/oragent)](https://pypi.org/project/oragent/)
[![Python](https://img.shields.io/pypi/pyversions/oragent)](https://pypi.org/project/oragent/)
[![macOS](https://img.shields.io/badge/macOS-supported-000000?logo=apple&logoColor=white)](https://github.com/oragent-ai/oragent/releases/latest)
[![Linux](https://img.shields.io/badge/Linux-supported-FCC624?logo=linux&logoColor=black)](https://pypi.org/project/oragent/)
[![License: Free Use](https://img.shields.io/badge/License-Free%20Use-orange.svg)](LICENSE)

[English](README.md) · [简体中文](README_zh-CN.md) · [日本語](README_ja.md) · [한국어](README_ko.md) · [Español](README_es.md) · [Français](README_fr.md) · [Deutsch](README_de.md) · **Português** · [Русский](README_ru.md)

> Um Agent Supervisor para agentes de codificação com IA. Um cockpit
> ciente do estado para você ver qual agente precisa de você,
> automatizar permissões rotineiras e permanecer em fluxo.

<div align="center">
  <img width="1728" alt="Painel do Oragent" src="assets/dashboard.png" />
</div>

## 🚀 Instalação

```bash
pipx install oragent
```

Runtime: Python ≥ 3.11, tmux. Plataformas: macOS, Linux. Windows em
breve.

Ou baixe o app macOS na
[release mais recente](https://github.com/oragent-ai/oragent/releases/latest).

## 🎯 O que é o Oragent

> **LangGraph faz os agentes conversarem entre si. Oragent faz você
> conversar com todos os seus agentes.**

Oragent é um supervisor TUI para sessões independentes de agentes de
codificação com IA. Ele hospeda cada agente em seu próprio painel
`tmux`, classifica o estado de cada painel em tempo real (~6 ms por
captura) e direciona sua atenção para a sessão atualmente bloqueada.

Não é um orquestrador multi-agente como LangGraph, AutoGen ou CrewAI:
agentes não conversam entre si através do Oragent. Você é o único
roteador. O modelo mental é "um operador, muitos agentes", como um
controlador de tráfego aéreo, não uma linha de fábrica.

## ⚡ O que ele faz

1. **Lê o estado de cada agente.** A correspondência de padrões no
   nível do painel classifica cada sessão em um dos sete estados. Custo
   típico de captura: ~6 ms.
2. **Pré-aprova as permissões que você diria sim de qualquer forma.**
   O Auto Pilot por sessão responde automaticamente aos prompts de
   permissão de rotina. Decisões que realmente exigem julgamento
   continuam chegando até você.
3. **Coloca o WAITING na frente da sua atenção.** Quando qualquer
   sessão bloqueia esperando uma permissão, o Oragent move o foco para
   lá via fila FIFO, com notificação do macOS.

## 🔤 Alfabeto de estados

Sete estados. Sem DAGs, sem workflows, sem portões de SDLC.

| Glifo | Estado | Significado |
| :---: | --- | --- |
| `*` | WORKING | o agente está produzindo saída |
| `!` | WAITING | bloqueado aguardando permissão do operador |
| `o` | IDLE | finalizado, aguardando próximo prompt |
| `a` | AUTO | Auto Pilot respondendo pelo operador |
| `$` | SHELL | sessão shell interativa |
| `x` | STOPPED | processo encerrado |
| `?` | UNKNOWN | reconciliando (transitório) |

Os mesmos glifos na linha de status do TUI e nesta tabela, de
propósito.

## 🔌 Plugins inclusos

| Plugin | Status | Comando |
| --- | :---: | --- |
| Claude Code | publicado | `claude` |
| Codex | publicado | `codex` |
| Shell | publicado | `$SHELL` |
| Aider | planejado | |
| Open Claw | planejado | |

Plugins de terceiros implementam a interface pública `AgentPlugin` e
podem licenciar seu próprio código como quiserem.

## 📦 Código-fonte e licença

Oragent é de código fechado. A distribuição publicada (o pacote
`oragent` no PyPI e a build `Oragent.app` no CDN oficial de Releases)
é o produto; a árvore de código-fonte não faz parte dela.

O software é gratuito sob a **Oragent Free Use License v1.0**:
gratuito para uso pessoal e uso comercial interno, sem mensalidade,
sem assinatura, sem anúncios, sem telemetria. Redistribuição,
engenharia reversa e publicação de forks não são concedidas. Não é uma
licença open source aprovada pela OSI nem uma licença de software
livre reconhecida pela Free Software Foundation. O texto completo é
distribuído com cada release como `LICENSE`; o resumo legível está em
[oragent.org/terms](https://oragent.org/terms).

## 🔒 Privacidade

Oragent é uma ferramenta local. Sem cadastro, sem backend que receba
seus dados, sem analytics no site, sem telemetria da TUI. Suas
sessões, prompts, respostas de IA, chaves de API, conteúdo do terminal
e capturas de tela ficam na sua máquina.

A única chamada de rede de saída que o Oragent faz é um HTTPS GET
periódico em modo somente leitura ao manifest público de releases
hospedado no GitHub Pages, com fallback para os metadados públicos do
PyPI. Ambos são endpoints de descoberta de versão; nenhum dado de uso
é transmitido. Declaração completa:
[oragent.org/privacy](https://oragent.org/privacy).

## 💛 Apoio e financiamento

Oragent é mantido por um desenvolvedor independente. É e continuará
gratuito. Contribuições voluntárias cobrem o tempo do mantenedor e são
totalmente opt-in:
[oragent.org/support](https://oragent.org/support).

Três coisas gratuitas que ajudam igual: dar estrela neste repositório,
compartilhar [oragent.org](https://oragent.org) e abrir issues
detalhadas no
[issue tracker](https://github.com/oragent-ai/oragent/issues).

## 🔗 Links

- Site: <https://oragent.org>
- PyPI: <https://pypi.org/project/oragent/>
- Release mais recente: <https://github.com/oragent-ai/oragent/releases/latest>
- Issue tracker: <https://github.com/oragent-ai/oragent/issues>
- Privacidade: <https://oragent.org/privacy>
- Termos: <https://oragent.org/terms>
- Reembolsos: <https://oragent.org/refunds>
- Apoio: <https://oragent.org/support>

## 👤 Autor

Desenvolvido por [Shuangrui Chen](https://chenshuangrui.com).
