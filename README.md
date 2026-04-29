# Fórum Telecom — Pacote de Skills para Agentes de IA

Pacote de **8 skills profissionais** para automação e operações em provedores de internet, compatível com **OpenClaw** e **Claude Agent SDK** (mesmo arquivo, dois runtimes).

> Construído por Cristiano Figueiredo / Fórum Telecom.

---

## O que tem dentro

| Skill | Para que serve | Equipamentos / Ferramentas |
|---|---|---|
| `mikrotik-ops` | RouterOS — BGP, firewall, queues, CGNAT, BRAS PPPoE, CAPsMAN | RouterBoard, CCR, CRS, hAP, RouterOS 6/7 |
| `cisco-ops` | Roteadores e switches Cisco | IOS, IOS-XR, IOS-XE, NX-OS |
| `huawei-ne-ops` | Roteadores de borda Huawei VRP | NE40E, NE8000, ME60, NetEngine V8 |
| `olt-fiberhome-ops` | OLTs FiberHome GPON | AN5516-04/06, AN5116, AN6000 |
| `olt-huawei-ops` | OLTs Huawei GPON | MA5800, MA5680T, MA5683T, MA5608T |
| `proxmox-ops` | Virtualização Proxmox VE | Cluster, VMs, CTs, ZFS, Ceph, replicação |
| `docker-ops` | Containers e stacks | Docker, Compose, Swarm, Traefik, healthchecks |
| `zabbix-ops` | Monitoramento + criação de templates respeitando rate limit | Zabbix 6.x/7.x, hosts, templates, problems, mass-import |

Cada skill segue o **mesmo workflow obrigatório** que o agente respeita:

```
1. Identify   → entender o pedido e validar contexto
2. Snapshot   → coletar estado atual antes de qualquer mudança
3. Apply      → aplicar com confirmação humana literal pra ops destrutivas
4. Validate   → verificar que a mudança fez efeito esperado
5. Report     → relatar em markdown estruturado
```

E **toda operação destrutiva** (apagar regra, derrubar BGP, reload, deletar VM, etc.) exige confirmação literal do usuário no formato `CONFIRMO <comando>` — paráfrases são recusadas.

---

## Estrutura do pacote

```
forum-telecom-skills/
├── README.md                          ← este arquivo
├── skills-overview.html               ← visão geral visual
└── skills/
    ├── mikrotik-ops/
    │   ├── SKILL.md
    │   └── references/
    │       ├── routeros-v6-vs-v7.md
    │       └── safe-templates.rsc
    ├── cisco-ops/
    │   ├── SKILL.md
    │   └── references/
    │       ├── ios-vs-iosxr-vs-nxos.md
    │       └── safe-templates.txt
    ├── huawei-ne-ops/
    │   ├── SKILL.md
    │   └── references/
    │       ├── vrp-cheatsheet.md
    │       └── safe-templates.cfg
    ├── olt-fiberhome-ops/
    │   ├── SKILL.md
    │   └── references/
    │       ├── troubleshooting-onu.md
    │       └── provisionamento.txt
    ├── olt-huawei-ops/
    │   ├── SKILL.md
    │   └── references/
    │       ├── troubleshooting-ont.md
    │       └── provisionamento.txt
    ├── proxmox-ops/
    │   ├── SKILL.md
    │   └── references/
    │       ├── vm-ct-operations.md
    │       └── cluster-troubleshooting.md
    ├── docker-ops/
    │   ├── SKILL.md
    │   └── references/
    │       ├── compose-patterns.md
    │       └── troubleshooting.md
    └── zabbix-ops/
        ├── SKILL.md
        └── references/
            ├── api-patterns.md
            └── template-creation-rate-limit.md
```

O `SKILL.md` é o **playbook principal** (curto, sempre carregado). Os arquivos em `references/` são **carregados sob demanda** quando o agente precisa de contexto profundo.

---

## Por que dual-compatible?

O frontmatter de cada `SKILL.md` é assim:

```yaml
---
name: mikrotik-ops
description: Senior MikroTik RouterOS network engineer...
metadata: { "openclaw": { "emoji": "🛜", "requires": { "anyBins": ["ssh"], "env": ["MIKROTIK_HOST"] } } }
---
```

- **OpenClaw** lê o bloco `metadata.openclaw` e usa pra gating (só ativa a skill se o binário e a env var existirem).
- **Claude Agent SDK** ignora silenciosamente o `metadata.openclaw` (não é parte do spec dele) e usa só `name` + `description`.

Resultado: **o mesmo arquivo funciona nos dois runtimes sem modificação**.

---

## Instalação

### Opção A — OpenClaw

Pré-requisito: `openclaw` instalado e rodando.

```bash
# 1. Copiar pacote para o workspace de skills do OpenClaw
cp -r skills/* ~/.openclaw/workspace/skills/

# 2. Reiniciar o gateway pra carregar
openclaw gateway restart

# 3. Verificar que carregou
openclaw skills list
```

Configurar variáveis de ambiente (no shell ou em `~/.openclaw/env`):

```bash
# MikroTik
export MIKROTIK_HOST="192.168.88.1"
export MIKROTIK_USER="admin"
export MIKROTIK_PASS="..."  # ou usar SSH key

# Cisco
export CISCO_HOST="10.0.0.1"
export CISCO_USER="admin"

# Huawei NE
export HUAWEI_HOST="10.0.0.2"
export HUAWEI_USER="admin"

# OLT FiberHome
export FH_OLT_HOST="10.0.1.10"
export FH_OLT_USER="GEPON"
export FH_OLT_PASS="GEPON"

# OLT Huawei
export HW_OLT_HOST="10.0.1.20"
export HW_OLT_USER="root"
export HW_OLT_PASS="admin"

# Proxmox
export PVE_HOST="pve.forumtelecom.tools"
export PVE_TOKEN="..."  # API token

# Docker (local ou remoto)
export DOCKER_HOST="unix:///var/run/docker.sock"
# ou TCP: export DOCKER_HOST="tcp://docker.forumtelecom.tools:2376"

# Zabbix
export ZABBIX_URL="https://zabbix.forumtelecom.tools/api_jsonrpc.php"
export ZABBIX_TOKEN="..."
```

### Opção B — Claude Agent SDK

Pré-requisito: Python 3.10+ e `claude-agent-sdk` instalado.

```bash
pip install claude-agent-sdk
```

#### Filesystem skills (recomendado)

Aponte o agente para o diretório `skills/`:

```python
import asyncio
from claude_agent_sdk import query, ClaudeAgentOptions

async def main():
    options = ClaudeAgentOptions(
        system_prompt="Você é o NetAgent da Fórum Telecom. Use as skills disponíveis.",
        setting_sources=["project"],  # carrega skills do diretório
        cwd="/path/to/forum-telecom-skills",  # raiz do projeto
        allowed_tools=["Bash", "Read", "Write", "Edit"],
        permission_mode="default",  # exige confirmação pra ops destrutivas
    )

    async for message in query(
        prompt="Liste os peers BGP do meu MikroTik de borda",
        options=options,
    ):
        print(message)

asyncio.run(main())
```

#### Skills programáticas

Se preferir injetar conteúdo direto (sem filesystem):

```python
from pathlib import Path
from claude_agent_sdk import ClaudeAgentOptions

skill_path = Path("./skills/mikrotik-ops/SKILL.md")
skill_content = skill_path.read_text()

options = ClaudeAgentOptions(
    system_prompt=f"""Você é o NetAgent da Fórum Telecom.

# Skill ativa: mikrotik-ops
{skill_content}
""",
    allowed_tools=["Bash"],
)
```

---

## Uso no NetAgent

Como o NetAgent já roda Claude Agent SDK, a integração é direta:

```python
# netagent/agents/network_agent.py
from claude_agent_sdk import query, ClaudeAgentOptions

class NetworkAgent:
    def __init__(self):
        self.options = ClaudeAgentOptions(
            system_prompt="Você é o NetworkAgent. Diagnostica e opera redes.",
            setting_sources=["project"],
            cwd="/app/skills",  # monta o pacote forum-telecom-skills/skills aqui
            allowed_tools=["Bash", "Read", "WebSearch"],
            permission_mode="default",
        )

    async def handle(self, user_message: str):
        async for msg in query(prompt=user_message, options=self.options):
            yield msg
```

E no Docker Compose do NetAgent:

```yaml
services:
  network-agent:
    volumes:
      - ./forum-telecom-skills/skills:/app/skills:ro
    environment:
      - MIKROTIK_HOST=${MIKROTIK_HOST}
      - ZABBIX_URL=${ZABBIX_URL}
      # ...
```

---

## Customização

Cada skill é **um arquivo markdown** — você lê, entende, edita. Sem mágica.

- **Adicionar novo comando perigoso** que precisa de confirmação? Edite a seção `Confirmation pattern` do SKILL.md.
- **Adicionar template seguro** (ex: nova ACL, nova queue tree)? Coloque em `references/safe-templates.rsc`.
- **Adicionar novo padrão operacional**? Adicione na seção `Casos típicos de provedor (deep)` do SKILL.md.

---

## Limitações conhecidas

1. **Skills são abertas, não fechadas.** O LLM pode completar comandos não listados explicitamente. Se você precisa garantir que *só* comandos pré-aprovados rodem, migre da skill para um **plugin com tools tipadas** (ex: `mikrotik_get_bgp_peers()` como função Python).

2. **Confirmação humana depende do runtime.** No OpenClaw, é gerenciada pelo gateway. No Claude Agent SDK, você implementa via `permission_callback` ou `permission_mode="ask"`.

3. **Templates em `references/` são pontos de partida.** Sempre revise e adapte ao seu ambiente antes de aplicar em produção.

4. **Rate limit Zabbix:** a skill `zabbix-ops` documenta os limites práticos da API JSON-RPC para criação de templates em massa. Respeite as recomendações de batch size + throttle.

---

## Referências

- [OpenClaw Docs](https://docs.openclaw.ai)
- [Claude Agent SDK](https://docs.claude.com/en/api/agent-sdk/overview)
- [AgentSkills Spec (Anthropic)](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills)

---

## Licença

MIT — use, modifique, distribua. Atribuição apreciada mas não obrigatória.

---

**Fórum Telecom** — educação e ferramentas para profissionais de redes.
[forumtelecom.com.br](https://forumtelecom.com.br)
