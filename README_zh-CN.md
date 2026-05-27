# Oragent

[![PyPI](https://img.shields.io/pypi/v/oragent)](https://pypi.org/project/oragent/)
[![Python](https://img.shields.io/pypi/pyversions/oragent)](https://pypi.org/project/oragent/)
[![macOS](https://img.shields.io/badge/macOS-supported-000000?logo=apple&logoColor=white)](https://github.com/oragent-ai/oragent/releases/latest)
[![Linux](https://img.shields.io/badge/Linux-supported-FCC624?logo=linux&logoColor=black)](https://pypi.org/project/oragent/)
[![License: Free Use](https://img.shields.io/badge/License-Free%20Use-orange.svg)](LICENSE)

[English](README.md) · **简体中文** · [日本語](README_ja.md) · [한국어](README_ko.md) · [Español](README_es.md) · [Français](README_fr.md) · [Deutsch](README_de.md) · [Português](README_pt.md) · [Русский](README_ru.md)

> 面向 AI 编码 Agent 的 Agent 监督台。一个具备状态感知的驾驶舱，让你看清
> 哪个 agent 在等你，自动处理常规权限请求，保持心流不被打断。

<div align="center">
  <img width="1728" alt="Oragent 驾驶舱" src="assets/dashboard.png" />
</div>

## 🚀 安装

```bash
pipx install oragent
```

运行环境：Python ≥ 3.11、tmux。平台：macOS、Linux。Windows 后续支持。

也可以从 [最新 release](https://github.com/oragent-ai/oragent/releases/latest)
下载 macOS app。

## 🎯 Oragent 是什么

> **LangGraph 让 agent 之间互相对话。Oragent 让你和所有 agent 对话。**

Oragent 是面向独立 AI 编码 agent 会话的 TUI 监督台。它把每个 agent 安排在
独立的 `tmux` pane 里，实时识别每个 pane 的状态（单帧约 6ms），并把你的
注意力路由到当前被阻塞的那个会话。

它不是 LangGraph、AutoGen、CrewAI 那类多 agent 编排框架：agent 之间不
通过 Oragent 互相通信。路由由你一个人来做。心智模型是"一名操作员、多个
agent"，像空中交通管制员，而不是流水线。

## ⚡ 它做什么

1. **读取每个 agent 的状态。** Pane 级别的模式匹配把每个会话归入 7 个状态
   之一，单帧捕获约 6ms。
2. **替你预批那些你本来就会同意的权限。** 每个会话独立的 Auto Pilot 会自动
   回答常规权限请求；真正需要判断的提问仍会回到你手上。
3. **把 WAITING 顶到你注意力的最前面。** 任一会话卡在权限请求时，Oragent
   按 FIFO 队列把焦点切过去，同时发 macOS 通知。

## 🔤 状态字母表

七个状态。没有 DAG，没有 workflow，没有 SDLC gate。

| 字符 | 状态 | 含义 |
| :---: | --- | --- |
| `*` | WORKING | agent 正在产出 |
| `!` | WAITING | 等待操作员授权 |
| `o` | IDLE | 已完成，等待下一条 prompt |
| `a` | AUTO | Auto Pilot 正在替操作员回答 |
| `$` | SHELL | 交互式 shell 会话 |
| `x` | STOPPED | 进程已退出 |
| `?` | UNKNOWN | 重新对账中（瞬态） |

TUI 状态栏和这张表用的是同一套字符，故意如此。

## 🔌 已内置的 plugin

| Plugin | 状态 | 启动命令 |
| --- | :---: | --- |
| Claude Code | 已发布 | `claude` |
| Codex | 已发布 | `codex` |
| Shell | 已发布 | `$SHELL` |
| Aider | 规划中 | |
| Open Claw | 规划中 | |

第三方 plugin 实现公开的 `AgentPlugin` 接口，它们各自的代码可用任意许可证。

## 📦 源码与许可证

Oragent 是闭源软件。对外发行物（PyPI 上的 `oragent` 包，官方 Releases
CDN 上的 `Oragent.app`）就是产品本体，源码树不在发行物里。

软件按 **Oragent Free Use License v1.0** 免费授权：个人使用、组织内部
商业使用都免费，无订阅、无广告、无遥测。再分发、反向工程、对外发布 fork
不在授权范围内。这不是 OSI 认可的开源许可证，也不是自由软件基金会
认定的自由软件许可证。完整条款随每个 release 以 `LICENSE` 文件分发；
易读版的概述见 [oragent.org/terms](https://oragent.org/terms)。

## 🔒 隐私

Oragent 是本地工具。没有注册、没有接收数据的后端、网站不挂统计、TUI 不
发遥测。你的会话内容、prompt、AI 回复、API key、终端内容、截图都留在本机。

Oragent 本身仅对外发起一种网络请求：周期性的 HTTPS GET，只读地拉取
GitHub Pages 上的公开 release manifest；如失败，回退到公共 PyPI metadata。
两者都是版本发现接口，不上传任何使用数据。完整声明见
[oragent.org/privacy](https://oragent.org/privacy)。

## 💛 支持与赞助

Oragent 由一位独立开发者维护。它现在是、将来也是免费的。自愿赞助补偿维护
者的时间，完全选择制：[oragent.org/support](https://oragent.org/support)。

也有三件不花钱的事一样有帮助：给这个仓库点 Star、把
[oragent.org](https://oragent.org) 分享出去、到
[issue tracker](https://github.com/oragent-ai/oragent/issues) 提详细 issue。

## 🔗 相关链接

- 官网：<https://oragent.org>
- PyPI：<https://pypi.org/project/oragent/>
- 最新 release：<https://github.com/oragent-ai/oragent/releases/latest>
- Issue tracker：<https://github.com/oragent-ai/oragent/issues>
- 隐私政策：<https://oragent.org/privacy>
- 服务条款：<https://oragent.org/terms>
- 退款政策：<https://oragent.org/refunds>
- 赞助：<https://oragent.org/support>

## 👤 作者

由 [Shuangrui Chen](https://chenshuangrui.com) 开发维护。
