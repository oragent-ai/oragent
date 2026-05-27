# Oragent

[![PyPI](https://img.shields.io/pypi/v/oragent)](https://pypi.org/project/oragent/)
[![Python](https://img.shields.io/pypi/pyversions/oragent)](https://pypi.org/project/oragent/)
[![macOS](https://img.shields.io/badge/macOS-supported-000000?logo=apple&logoColor=white)](https://github.com/oragent-ai/oragent/releases/latest)
[![Linux](https://img.shields.io/badge/Linux-supported-FCC624?logo=linux&logoColor=black)](https://pypi.org/project/oragent/)
[![License: Free Use](https://img.shields.io/badge/License-Free%20Use-orange.svg)](LICENSE)

[English](README.md) · [简体中文](README_zh-CN.md) · [日本語](README_ja.md) · [한국어](README_ko.md) · [Español](README_es.md) · **Français** · [Deutsch](README_de.md) · [Português](README_pt.md) · [Русский](README_ru.md)

> Un Agent Supervisor pour vos agents IA de codage. Un cockpit conscient
> d'état pour voir quel agent a besoin de vous, gérer automatiquement
> les permissions routinières et rester dans le flux.

<div align="center">
  <img width="1728" alt="Tableau de bord Oragent" src="assets/dashboard.png" />
</div>

## 🚀 Installation

```bash
pipx install oragent
```

Runtime : Python ≥ 3.11, tmux. Plateformes : macOS, Linux. Windows
prochainement.

Ou téléchargez l'application macOS depuis la
[dernière release](https://github.com/oragent-ai/oragent/releases/latest).

## 🎯 Ce qu'est Oragent

> **LangGraph fait dialoguer les agents entre eux. Oragent vous laisse
> dialoguer avec tous vos agents.**

Oragent est un superviseur TUI pour les sessions indépendantes
d'agents IA de codage. Il héberge chaque agent dans son propre pane
`tmux`, classifie l'état de chaque pane en temps réel (~6 ms par
capture) et oriente votre attention vers la session actuellement
bloquée.

Ce n'est pas un orchestrateur multi-agents comme LangGraph, AutoGen ou
CrewAI : les agents ne communiquent pas entre eux via Oragent. C'est
vous le seul routeur. Le modèle mental est « un opérateur, plusieurs
agents », comme un contrôleur aérien, pas une chaîne de production.

## ⚡ Ce qu'il fait

1. **Lit l'état de chaque agent.** La reconnaissance de motifs au niveau
   du pane classe chaque session dans l'un des sept états. Coût typique
   d'une capture : ~6 ms.
2. **Préapprouve les permissions auxquelles vous diriez oui de toute
   façon.** L'Auto Pilot par session répond automatiquement aux
   demandes de permission routinières. Les vrais choix qui demandent un
   jugement arrivent toujours jusqu'à vous.
3. **Place WAITING au premier plan de votre attention.** Quand une
   session se bloque sur une permission, Oragent y déplace le focus via
   une file FIFO, avec notification macOS.

## 🔤 Alphabet des états

Sept états. Pas de DAG, pas de workflow, pas de gates SDLC.

| Glyphe | État | Signification |
| :---: | --- | --- |
| `*` | WORKING | l'agent produit de la sortie |
| `!` | WAITING | en attente d'une permission de l'opérateur |
| `o` | IDLE | terminé, en attente du prochain prompt |
| `a` | AUTO | Auto Pilot répond à la place de l'opérateur |
| `$` | SHELL | session shell interactive |
| `x` | STOPPED | processus terminé |
| `?` | UNKNOWN | réconciliation en cours (transitoire) |

Les mêmes glyphes dans la barre d'état du TUI et dans ce tableau,
volontairement.

## 🔌 Plugins fournis

| Plugin | État | Commande |
| --- | :---: | --- |
| Claude Code | publié | `claude` |
| Codex | publié | `codex` |
| Shell | publié | `$SHELL` |
| Aider | prévu | |
| Open Claw | prévu | |

Les plugins tiers implémentent l'interface publique `AgentPlugin` et
peuvent licencier leur propre code comme ils le souhaitent.

## 📦 Code source et licence

Oragent est à code fermé. La distribution publiée (le paquet `oragent`
sur PyPI et la build `Oragent.app` sur le CDN officiel des Releases)
constitue le produit ; l'arbre de code source n'en fait pas partie.

Le logiciel est gratuit sous la **Oragent Free Use License v1.0** :
gratuit pour un usage personnel et pour un usage commercial interne,
sans frais, sans abonnement, sans publicité, sans télémétrie. La
redistribution, la rétro-ingénierie et la publication de forks ne sont
pas accordées. Ce n'est pas une licence open source approuvée par
l'OSI, ni une licence de logiciel libre reconnue par la Free Software
Foundation. Le texte complet est livré avec chaque release sous forme
de fichier `LICENSE` ; le résumé lisible est sur
[oragent.org/terms](https://oragent.org/terms).

## 🔒 Vie privée

Oragent est un outil local. Pas d'inscription, pas de backend qui
reçoit vos données, pas d'analytics sur le site, pas de télémétrie
depuis le TUI. Vos sessions, prompts, réponses IA, clés d'API, contenu
du terminal et captures d'écran restent sur votre machine.

Le seul appel réseau sortant qu'Oragent fait lui-même est une requête
HTTPS GET périodique en lecture seule vers le manifest public des
releases hébergé sur GitHub Pages, avec un repli vers les métadonnées
publiques de PyPI. Les deux sont des points de découverte de version ;
aucune donnée d'usage n'est transmise. Énoncé complet :
[oragent.org/privacy](https://oragent.org/privacy).

## 💛 Soutien et financement

Oragent est maintenu par un développeur indépendant. Il est et restera
gratuit. Les contributions volontaires couvrent le temps du mainteneur
et sont entièrement opt-in :
[oragent.org/support](https://oragent.org/support).

Trois choses gratuites qui aident tout autant : mettre une étoile à ce
dépôt, partager [oragent.org](https://oragent.org) et déposer des
issues détaillées sur le
[traceur d'issues](https://github.com/oragent-ai/oragent/issues).

## 🔗 Liens

- Site web : <https://oragent.org>
- PyPI : <https://pypi.org/project/oragent/>
- Dernière release : <https://github.com/oragent-ai/oragent/releases/latest>
- Traceur d'issues : <https://github.com/oragent-ai/oragent/issues>
- Vie privée : <https://oragent.org/privacy>
- Conditions : <https://oragent.org/terms>
- Remboursements : <https://oragent.org/refunds>
- Soutien : <https://oragent.org/support>

## 👤 Auteur

Développé par [Shuangrui Chen](https://chenshuangrui.com).
