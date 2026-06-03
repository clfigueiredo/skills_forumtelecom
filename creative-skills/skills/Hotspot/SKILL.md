---
name: hotspot
description: "Cria criativos estaticos promocionais completos para o curso Hotspot da Forum Telecom, com foco em conversao, variacao de paletas e estilos visuais. Use quando o usuario pedir criativos, posts, artes, imagens promocionais, stories, anuncios ou material de divulgacao para o curso Hotspot. Em vez de entregar apenas prompts, esta skill deve analisar os criativos de referencia fornecidos, sintetizar os prompts internamente e gerar as imagens diretamente. O comportamento padrao deve gerar 12 criativos no total: 6 em 1080x1350 e 6 em 1080x1920, sempre como artes completas sem area reservada para video, com estilos, paletas e densidades de informacao variadas."
---

# Hotspot

## Overview

Gerar imagens promocionais completas para o curso Hotspot da Forum Telecom com base nas referencias visuais do usuario e nas informacoes padrao do curso em `references/curso-info.md`.

Nao entregar lista de prompts como resposta padrao. Construir os prompts internamente e chamar a ferramenta de geracao de imagem diretamente. So mostrar os prompts se o usuario pedir explicitamente.

## Workflow

1. Ler `references/curso-info.md` antes de criar qualquer imagem.
2. Se o usuario enviar criativos de referencia, extrair deles a paleta, composicao, hierarquia tipografica, estilo de iluminacao, densidade de informacao e elementos recorrentes.
3. Se o usuario nao enviar referencia visual, usar o estilo padrao tech definido no arquivo de referencia.
4. Definir a quantidade e os formatos.
Por padrao, gerar 12 variacoes se o usuario nao especificar outra quantidade:
- 6 criativos em `1080x1350`
- 6 criativos em `1080x1920`
5. Tratar cada peca como arte completa:
- preencher a composicao inteira com conteudo visual e hierarquia de campanha
- nao reservar area central para video
- nao criar buracos pretos, molduras vazias ou areas removiveis por mascara
- usar o centro da arte para headline, produto, beneficio, personagem, dashboard ou elemento visual principal
6. Distribuir as variacoes entre estes angulos criativos:
- impacto emocional
- vitrine de beneficios
- profissional em acao
- conteudo tecnico
- oferta irresistivel
- minimalista com pouca informacao
- story vertical para leitura rapida
7. Variar propositalmente a densidade de informacao:
- algumas pecas com headline, marca, preco e CTA apenas
- algumas pecas com beneficios e prova social
- algumas pecas com topicos tecnicos, bonus e integracoes
8. Variar propositalmente as paletas e composicoes para evitar repeticao visual.
9. Escrever os prompts em ingles de forma interna, com instrucoes claras de layout, atmosfera, elementos, enquadramento e textos da arte.
10. Gerar as imagens diretamente com a ferramenta de imagem, sempre em chamadas separadas: uma chamada por criativo. Nunca pedir varias artes em um unico prompt, para evitar que o gerador crie uma prancha ou collage com todas as pecas.
11. Depois da geracao, medir as dimensoes reais de cada arquivo PNG. Se qualquer arquivo vier fora do tamanho solicitado, criar copias corrigidas em canvas exato (`1080x1350` ou `1080x1920`) antes de entregar. Preservar os originais. Se precisar redirecionar os arquivos finais para uma nova pasta, escolher um nome claro e criar a pasta automaticamente, sem perguntar ao usuario.
12. Entregar uma resposta curta informando quantas variacoes foram geradas, onde estao os arquivos finais e se as dimensoes foram validadas.

## Output Rules

- Quando o usuario nao especificar outro formato, produzir metade das pecas em `1080x1350` e metade em `1080x1920`.
- Cada arquivo final entregue deve ter exatamente o tamanho prometido. Nao confiar apenas no tamanho descrito no prompt; validar o PNG salvo.
- Se o gerador produzir dimensoes aproximadas ou erradas, criar uma pasta de saida com copias corrigidas. Usar canvas exato e ajustar a arte sem cortar texto importante.
- Quando precisar redirecionar ou reorganizar arquivos finais, fazer isso automaticamente em uma pasta com nome descritivo dentro do usuario ou da area de trabalho disponivel. Nao pedir confirmacao para escolher esse destino; apenas informar o caminho final na resposta.
- Preservar o nome da marca `Forum Telecom` e o nome do curso `Hotspot`.
- Usar os precos padrao do arquivo de referencia, salvo se o usuario informar outros valores.
- Manter headlines, CTAs e beneficios em portugues do Brasil quando a arte exigir texto legivel.
- Priorizar acentuacao correta em portugues do Brasil em todo texto visivel da arte, como `á`, `é`, `í`, `ó`, `ú`, `ã`, `õ`, `ç`.
- Tratar palavras sem acento como erro de qualidade quando a forma correta em portugues exigir acento.
- Usar a area central como parte ativa da composicao, sem reservar espaco para video.
- Se o gerador de imagem tiver baixa fidelidade em texto, simplificar a quantidade de texto na arte e priorizar hierarquia visual clara.
- Se o usuario pedir adaptacao para outra oferta, modulo, promocao ou campanha, ajustar gancho, beneficios, CTA e destaque visual sem alterar o fluxo principal.
- Variar entre pecas com poucas informacoes e pecas com mais informacoes no mesmo lote.
- Variar as cores entre as pecas do mesmo lote. Nao repetir a mesma paleta em todas.

## Prompt Construction

Ao montar cada prompt internamente:

- Descrever a cena, composicao e atmosfera em ingles.
- Incluir os textos que devem aparecer na arte exatamente como escritos quando isso for importante.
- Escrever todo texto visivel da arte em portugues do Brasil com acentuacao correta.
- Especificar o tamanho final exato: `1080x1350` ou `1080x1920`.
- Reforcar que o prompt representa uma unica arte final individual, nao uma grade, prancha, mockup, collage ou conjunto de variacoes.
- Reforcar que a arte deve ocupar o canvas inteiro, sem area reservada para video, moldura vazia ou retangulo preto central.
- Informar elementos visuais recorrentes: MikroTik, hotspot, login page, portal cativo, Wi-Fi, dashboard, PIX, WhatsApp, FreeRADIUS, servidores, UI futurista, glow, grids, elementos web e redes.
- Variar os gatilhos de marketing entre urgencia, transformacao, dor, prova social e oportunidade.
- Variar os layouts para evitar pecas quase identicas.
- Alternar paletas como neon green/cyan, orange/teal, red/blue, purple/cyan, green/gold e outras combinacoes coerentes com o nicho tech.
- Alternar estilos visuais como tech, cyberpunk, anime tech, dashboard futurista e premium clean.
- Alternar entre composicoes limpas e composicoes mais carregadas.

## Default Behavior

Quando o pedido for aberto, assumir:

- 12 criativos no total
- 6 em `1080x1350`
- 6 em `1080x1920`
- curso `Hotspot`
- marca `Forum Telecom`
- visual tech com variacoes de paleta e estilo
- arte completa sem espaco central para video
- objetivo de conversao para venda direta
- mistura entre criativos com pouca informacao e criativos com mais informacao

## Customization

Aceitar personalizacao para:

- quantidade de criativos
- distribuicao por formato
- distribuicao dos elementos principais na composicao
- preco e oferta
- foco em modulo especifico
- CTA especifico
- estilo visual diferente
- quantidade de informacao por criativo
- paleta de cores por criativo
- publico especifico
- campanha sazonal ou promocional

## Constraints

- Nao responder com uma aula de design.
- Nao pedir confirmacao desnecessaria antes de gerar, exceto se faltar informacao critica.
- Nao entregar apenas ideias soltas; produzir imagens.
- Nao usar estilos visuais genericos se o usuario tiver fornecido criativos de referencia.
- Nao gerar um lote inteiro com a mesma composicao ou a mesma paleta.
