---
name: comunidade-forum-telecom
description: "Cria criativos estaticos promocionais para a Comunidade Forum Telecom, com foco em conversao, autoridade, networking, suporte tecnico, carreira em redes e senso de pertencimento. Use quando o usuario pedir criativos, posts, artes, imagens promocionais, stories, anuncios, carrosseis estaticos ou material de divulgacao para a comunidade Forum Telecom. Em vez de entregar apenas prompts, esta skill deve ler as informacoes da comunidade, sintetizar os prompts internamente e gerar as imagens diretamente. O comportamento padrao deve gerar 12 criativos no total: 6 em 1080x1350 e 6 em 1080x1920, sempre como artes completas, sem area reservada para video, com estilos, paletas e densidades de informacao variadas."
---

# Comunidade Forum Telecom

## Overview

Gerar imagens promocionais estaticas completas para a Comunidade Forum Telecom com base nas referencias visuais do usuario e nas informacoes padrao em `references/brand-info.md`.

Nao entregar lista de prompts como resposta padrao. Construir os prompts internamente e chamar a ferramenta de geracao de imagem diretamente. So mostrar os prompts se o usuario pedir explicitamente.

## Workflow

1. Ler `references/brand-info.md` antes de criar qualquer imagem.
2. Se o usuario enviar criativos de referencia, extrair deles paleta, composicao, hierarquia tipografica, estilo de iluminacao, densidade de informacao e elementos recorrentes.
3. Se o usuario nao enviar referencia visual, usar o estilo dark tech definido no arquivo de referencia.
4. Definir quantidade e formatos.
Por padrao, gerar 12 variacoes se o usuario nao especificar outra quantidade:
- 6 criativos em `1080x1350`
- 6 criativos em `1080x1920`
5. Tratar cada peca como criativo estatico completo:
- nao reservar espaco central para video
- usar toda a tela como composicao promocional final
- integrar texto, elementos de comunidade, redes, dashboards, suporte e infraestrutura
- evitar grandes areas pretas vazias sem funcao visual
6. Distribuir as variacoes entre estes angulos criativos:
- pertencimento a uma comunidade tecnica
- networking com profissionais de redes
- suporte e troca de experiencia
- evolucao de carreira em telecom e infraestrutura
- conteudos, aulas, lives ou materiais exclusivos
- oportunidade e urgencia de entrada
- minimalista com pouca informacao
7. Variar propositalmente a densidade de informacao:
- algumas pecas com headline, marca e CTA apenas
- algumas pecas com beneficios curtos
- algumas pecas com prova social, networking ou autoridade
8. Variar paletas e composicoes para evitar repeticao visual.
9. Escrever os prompts em ingles de forma interna, com instrucoes claras de layout, atmosfera, elementos, enquadramento e textos da arte.
10. Gerar as imagens diretamente com a ferramenta de imagem, sempre em chamadas separadas: uma chamada por criativo. Nunca pedir varias artes em um unico prompt, para evitar que o gerador crie uma prancha ou collage com todas as pecas.
11. Depois da geracao, medir as dimensoes reais de cada arquivo PNG. Se qualquer arquivo vier fora do tamanho solicitado, criar copias corrigidas em canvas exato (`1080x1350` ou `1080x1920`) antes de entregar. Preservar os originais. Se precisar redirecionar os arquivos finais para uma nova pasta, escolher um nome claro e criar a pasta automaticamente, sem perguntar ao usuario.
12. Entregar resposta curta informando quantas variacoes foram geradas, onde estao os arquivos finais e se as dimensoes foram validadas.

## Output Rules

- Quando o usuario nao especificar outro formato, produzir metade das pecas em `1080x1350` e metade em `1080x1920`.
- Cada arquivo final entregue deve ter exatamente o tamanho prometido. Nao confiar apenas no tamanho descrito no prompt; validar o PNG salvo.
- Se o gerador produzir dimensoes aproximadas ou erradas, criar uma pasta de saida com copias corrigidas. Usar canvas exato, ajustar a arte sem cortar texto importante e, quando precisar preencher area, usar fundo estendido/desfocado/escurecido derivado da propria imagem.
- Quando precisar redirecionar ou reorganizar arquivos finais, fazer isso automaticamente em uma pasta com nome descritivo dentro do usuario ou da area de trabalho disponivel. Nao pedir confirmacao para escolher esse destino; apenas informar o caminho final na resposta.
- Preservar o nome da marca `Forum Telecom` e o termo `Comunidade Forum Telecom`.
- Manter headlines, CTAs e beneficios em portugues do Brasil quando a arte exigir texto legivel.
- Priorizar acentuacao correta em portugues do Brasil em todo texto visivel da arte.
- Usar o canvas inteiro como arte final, sem area preta central reservada.
- Se o gerador de imagem tiver baixa fidelidade em texto, simplificar a quantidade de texto e priorizar hierarquia visual clara.
- Se o usuario pedir uma campanha especifica, ajustar gancho, beneficios, CTA e destaque visual sem alterar o fluxo principal.
- Variar entre pecas com poucas informacoes e pecas com mais informacoes no mesmo lote.
- Variar as cores entre as pecas do mesmo lote. Nao repetir a mesma paleta em todas.

## Prompt Construction

Ao montar cada prompt internamente:

- Descrever cena, composicao e atmosfera em ingles.
- Incluir os textos que devem aparecer na arte exatamente como escritos quando isso for importante.
- Escrever todo texto visivel da arte em portugues do Brasil com acentuacao correta.
- Especificar o tamanho final exato: `1080x1350` ou `1080x1920`.
- Reforcar que o prompt representa uma unica arte final individual, nao uma grade, prancha, mockup, collage ou conjunto de variacoes.
- Informar que a composicao deve ser uma arte estatica completa, sem area reservada para video.
- Usar elementos visuais recorrentes: comunidade tecnica, profissionais de rede, NOC, servidores, racks, fibra optica, roteadores, switches, Wi-Fi, dashboards, alertas, topologias, mapas de rede, chat, forum, mentoria, aulas, lives, suporte e glow UI.
- Variar gatilhos de marketing entre pertencimento, autoridade, transformacao, oportunidade, suporte, networking e urgencia.
- Variar layouts para evitar pecas quase identicas.
- Alternar paletas como green/cyan, orange/teal, purple/cyan, red/blue, green/gold e graphite/silver.
- Alternar estilos visuais como dark tech premium, NOC futurista, cyber clean, comunidade profissional e dashboard editorial.
- Alternar entre composicoes minimalistas e composicoes moderadamente informativas.

## Default Behavior

Quando o pedido for aberto, assumir:

- 12 criativos no total
- 6 em `1080x1350`
- 6 em `1080x1920`
- marca `Forum Telecom`
- oferta `Comunidade Forum Telecom`
- visual dark tech com variacoes de paleta e estilo
- criativos estaticos completos, sem espaco central para video
- objetivo de conversao para entrada na comunidade
- mistura entre criativos com pouca informacao e criativos com mais informacao

## Customization

Aceitar personalizacao para:

- quantidade de criativos
- distribuicao por formato
- campanha de lancamento, lista de espera, ultimo dia, promocao ou convite aberto
- preco, plano ou oferta
- CTA especifico
- estilo visual diferente
- quantidade de informacao por criativo
- paleta de cores por criativo
- publico especifico
- foco em networking, suporte, mentoria, carreira, ISP, redes ou infraestrutura

## Constraints

- Nao responder com uma aula de design.
- Nao pedir confirmacao desnecessaria antes de gerar, exceto se faltar informacao critica.
- Nao entregar apenas ideias soltas; produzir imagens.
- Nao usar estilos visuais genericos se o usuario tiver fornecido criativos de referencia.
- Nao gerar um lote inteiro com a mesma composicao ou a mesma paleta.
- Nao criar promessas especificas de resultado financeiro, emprego garantido ou certificacao se o usuario nao informar isso.
