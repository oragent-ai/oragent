# Security policy

## Reporting a vulnerability

**Please do not open a public issue for security problems.** Use one
of the private channels below instead. Public issues for security
bugs give attackers a head start on every Oragent user before a fix
ships.

1. **GitHub private vulnerability reporting** (preferred). Open a
   private advisory at
   <https://github.com/oragent-ai/oragent/security/advisories/new>.
   This routes straight to the maintainer and stays confidential
   until a fix is published.

2. **Email**. Use the contact address on
   [chenshuangrui.com](https://chenshuangrui.com).

Please include:

- Oragent version (`oragent --version`).
- Operating system, terminal emulator, and tmux version.
- A minimal reproduction if you have one.
- What an attacker could achieve if the issue were exploited (data
  exfiltration, code execution, privilege escalation, denial of
  service, etc.).

We aim to acknowledge receipt within 3 business days.

## What's in scope

Oragent runs locally and does not phone home (see
[oragent.org/privacy](https://oragent.org/privacy)). The realistic
attack surface is:

- Code paths that read external agent output and could be tricked into
  running unintended shell commands, pasting into the wrong pane, or
  bypassing the operator's review.
- The auto-update channel (release manifest fetch and binary
  verification) being abused to deliver a malicious payload.
- The pre-approve and Auto Pilot logic being escalated to auto-answer
  a permission prompt the operator never intended to delegate.
- Local privilege issues in the macOS `Oragent.app` bundle and its
  signed/notarized launch path.

## What's out of scope

- Bugs in Claude Code, Codex, OpenAI, Anthropic, or any other tool
  Oragent supervises. Report those to their respective maintainers.
- The closed-source posture itself, or requests to publish the source
  tree. See [oragent.org/terms](https://oragent.org/terms).
- "Oragent doesn't sandbox the agent" is by design. Oragent is a
  supervisor, not a sandbox; the agents run on your machine with the
  credentials and access you gave them.

## Disclosure

Once a fix is shipped to PyPI and (where applicable) to the macOS
Releases CDN, the advisory is published with credit to the reporter,
unless the reporter prefers to stay anonymous.
