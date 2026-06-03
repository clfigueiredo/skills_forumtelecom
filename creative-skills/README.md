# Forum Telecom - Creative Skills

Pacote das skills de criativos usadas para gerar artes promocionais dos cursos e ofertas da Forum Telecom.

## Skills incluidas

- `Analista de redes`
- `comunidade-forum-telecom`
- `Fortigate`
- `Hotspot`
- `Zabbix`

Cada pasta contem o `SKILL.md`, o arquivo `agents/openai.yaml` e as referencias necessarias em `references/`.

## Instalacao no Codex

### Windows PowerShell

Na raiz do repositorio:

```powershell
.\creative-skills\install.ps1
```

### macOS/Linux/Git Bash

Na raiz do repositorio:

```bash
bash creative-skills/install.sh
```

## Instalacao manual

Copie todas as pastas de `creative-skills/skills/` para a pasta de skills do Codex:

```text
~/.codex/skills/
```

No Windows, o caminho normalmente e:

```text
C:\Users\<seu-usuario>\.codex\skills\
```

Depois de copiar, reinicie o Codex para recarregar a lista de skills.

## Estrutura

```text
creative-skills/
  README.md
  install.ps1
  install.sh
  skills/
    Analista de redes/
    comunidade-forum-telecom/
    Fortigate/
    Hotspot/
    Zabbix/
```

## Observacoes

- Para sair igual ao ambiente original, mantenha a estrutura das pastas exatamente como esta.
- A skill `Analista de redes` inclui `references/logo.png` e `references/Criativos de referencia.jpeg`; esses arquivos fazem parte do pacote e devem ser mantidos.
- As skills foram empacotadas sem alterar os arquivos locais originais.
