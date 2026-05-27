# Oragent

[![PyPI](https://img.shields.io/pypi/v/oragent)](https://pypi.org/project/oragent/)
[![Python](https://img.shields.io/pypi/pyversions/oragent)](https://pypi.org/project/oragent/)
[![macOS](https://img.shields.io/badge/macOS-supported-000000?logo=apple&logoColor=white)](https://github.com/oragent-ai/oragent/releases/latest)
[![Linux](https://img.shields.io/badge/Linux-supported-FCC624?logo=linux&logoColor=black)](https://pypi.org/project/oragent/)
[![License: Free Use](https://img.shields.io/badge/License-Free%20Use-orange.svg)](LICENSE)

[English](README.md) · [简体中文](README_zh-CN.md) · **日本語** · [한국어](README_ko.md) · [Español](README_es.md) · [Français](README_fr.md) · [Deutsch](README_de.md) · [Português](README_pt.md) · [Русский](README_ru.md)

> AI コーディング Agent のための Agent スーパーバイザー。状態を把握できる
> コックピットで、どの agent があなたを待っているかが一目で分かり、
> 定型的な権限承認を自動化し、フローを途切れさせません。

<div align="center">
  <img width="1728" alt="Oragent ダッシュボード" src="assets/dashboard.png" />
</div>

## 🚀 インストール

```bash
pipx install oragent
```

ランタイム：Python ≥ 3.11、tmux。プラットフォーム：macOS、Linux。
Windows は次に対応予定。

または [最新リリース](https://github.com/oragent-ai/oragent/releases/latest)
から macOS アプリをダウンロードできます。

## 🎯 Oragent とは

> **LangGraph はエージェント同士を会話させる。Oragent はあなたがすべての
> エージェントと会話できるようにする。**

Oragent は独立した AI コーディング agent セッションのための TUI 監督台
です。各 agent を専用の `tmux` ペインに配置し、すべてのペインの状態を
リアルタイム（1 回のキャプチャでおよそ 6ms）で分類し、現在ブロックされて
いるセッションへあなたの注意を誘導します。

LangGraph、AutoGen、CrewAI のようなマルチエージェント・オーケストレーター
ではありません。Oragent を介してエージェント同士が通信することはなく、
ルーターはあなた一人です。メンタルモデルは「ひとりのオペレーターと
多数のエージェント」、工場のラインではなく航空管制官に近い形です。

## ⚡ 何をするか

1. **各 agent の状態を読み取る。** ペイン単位のパターンマッチで、各セッ
   ションを 7 つの状態のいずれかに分類します。1 回のキャプチャはおよそ
   6ms です。
2. **どうせ承認するはずの権限は事前に承認する。** セッションごとの Auto
   Pilot が定型の権限プロンプトに自動応答します。本当に判断が必要な
   ものはそのままあなたに届きます。
3. **WAITING をあなたの注意の最前面へ。** いずれかのセッションが権限
   待ちになると、FIFO キューでフォーカスを移し、macOS 通知を発行します。

## 🔤 ステータスアルファベット

7 つの状態。DAG なし、ワークフローなし、SDLC ゲートなし。

| グリフ | 状態 | 意味 |
| :---: | --- | --- |
| `*` | WORKING | agent が出力中 |
| `!` | WAITING | オペレーターの承認待ち |
| `o` | IDLE | 完了、次の prompt を待機 |
| `a` | AUTO | Auto Pilot がオペレーターの代わりに応答中 |
| `$` | SHELL | 対話型 shell セッション |
| `x` | STOPPED | プロセス終了 |
| `?` | UNKNOWN | 再照合中（一時的） |

TUI のステータスラインとこの表で同じグリフを意図的に使っています。

## 🔌 同梱プラグイン

| Plugin | 状態 | コマンド |
| --- | :---: | --- |
| Claude Code | リリース済み | `claude` |
| Codex | リリース済み | `codex` |
| Shell | リリース済み | `$SHELL` |
| Aider | 予定 | |
| Open Claw | 予定 | |

サードパーティのプラグインは公開された `AgentPlugin` インターフェースを
実装します。そのコード自体のライセンスは作者が自由に選べます。

## 📦 ソースコードとライセンス

Oragent はクローズドソースです。公開配布物（PyPI 上の `oragent` パッケージ、
公式 Releases CDN 上の `Oragent.app`）が製品そのものであり、ソースツリー
は配布物に含まれません。

ソフトウェアは **Oragent Free Use License v1.0** のもと無償で提供されます。
個人利用、組織内部での商用利用ともに無料、サブスクリプションなし、広告
なし、テレメトリなし。再配布、リバースエンジニアリング、フォークの公開は
許諾されません。OSI 認定のオープンソースライセンスでも、Free Software
Foundation のフリーソフトウェアライセンスでもありません。全文は各リリース
に `LICENSE` として同梱され、要約は [oragent.org/terms](https://oragent.org/terms)
にあります。

## 🔒 プライバシー

Oragent はローカルツールです。サインアップなし、データを受け取るバックエ
ンドなし、ウェブサイトに解析タグなし、TUI からのテレメトリなし。セッショ
ン内容、prompt、AI の応答、API キー、ターミナル内容、スクリーンショット
はすべてあなたのマシン上に留まります。

Oragent 自身が行う外向き通信は 1 種類だけで、GitHub Pages 上の公開
release manifest を定期的に HTTPS GET で読み取り、失敗時は公開 PyPI
メタデータにフォールバックします。どちらもバージョン検出用エンドポ
イントであり、利用データは一切送信されません。全文は
[oragent.org/privacy](https://oragent.org/privacy) を参照してください。

## 💛 サポートと資金

Oragent は独立した開発者ひとりが維持しています。今も、これからも無料
です。任意の支援はメンテナーの時間を補うもので、完全に opt-in です：
[oragent.org/support](https://oragent.org/support)。

無料で同じくらい助かることが 3 つあります：このリポジトリにスターを
付ける、[oragent.org](https://oragent.org) を共有する、
[issue tracker](https://github.com/oragent-ai/oragent/issues)
に詳しい issue を立てる。

## 🔗 リンク

- ホームページ：<https://oragent.org>
- PyPI：<https://pypi.org/project/oragent/>
- 最新リリース：<https://github.com/oragent-ai/oragent/releases/latest>
- Issue tracker：<https://github.com/oragent-ai/oragent/issues>
- プライバシー：<https://oragent.org/privacy>
- 利用規約：<https://oragent.org/terms>
- 返金：<https://oragent.org/refunds>
- サポート：<https://oragent.org/support>

## 👤 作者

[Shuangrui Chen](https://chenshuangrui.com) が開発・維持しています。
