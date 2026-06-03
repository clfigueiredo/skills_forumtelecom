---
name: analista-de-redes
description: "Cria criativos estaticos para o curso Analista de Redes da Forum Telecom com direcao de arte dark tech e foco em conversao. Use quando o usuario pedir criativos, posts, artes, imagens promocionais, material de divulgacao, variacoes visuais, carrosseis estaticos ou imagens para vender o curso. Em vez de entregar apenas prompts, esta skill deve analisar os criativos de referencia fornecidos, sintetizar os prompts internamente e gerar as imagens diretamente. O comportamento padrao deve gerar 12 criativos no total: 6 em 1080x1350 e 6 em 1080x1920, sempre com estilos, paletas e densidades de informacao variadas."
---

# Analista de Redes

## Overview

Gerar imagens promocionais para o curso Analista de Redes com base nas referencias visuais do usuario e nas informacoes padrao do curso em `references/curso-info.md`.

Se existir um arquivo de logo em `references/logo.png`, trata-lo como referencia visual obrigatoria para uma versao pequena e integrada do logo em todas as pecas.

Nao entregar lista de prompts como resposta padrao. Construir os prompts internamente e chamar a ferramenta de geracao de imagem diretamente. So mostrar os prompts se o usuario pedir explicitamente.

## Workflow

1. Ler `references/curso-info.md` antes de criar qualquer imagem.
2. Verificar se existe `references/logo.png`.
3. Se o usuario pedir uso obrigatorio de logo e `references/logo.png` nao existir, pedir o arquivo ou o caminho antes de gerar.
4. Se o usuario enviar criativos de referencia, extrair deles a paleta, composicao, hierarquia tipografica, estilo de iluminacao, densidade de informacao e elementos recorrentes.
5. Se o usuario nao enviar referencia visual, usar o estilo padrao dark tech definido no arquivo de referencia.
6. Definir a quantidade e os formatos.
Por padrao, gerar 12 variacoes se o usuario nao especificar outra quantidade:
- 6 criativos em `1080x1350`
- 6 criativos em `1080x1920`
7. Distribuir as variacoes entre estes angulos criativos:
- impacto emocional
- vitrine de beneficios
- profissional em acao
- conteudo tecnico
- oferta irresistivel
- minimalista com pouca informacao
- story vertical para leitura rapida
8. Variar propositalmente a densidade de informacao:
- algumas pecas com headline, marca, preco e CTA apenas
- algumas pecas com beneficios e prova social
- algumas pecas com topicos tecnicos ou bonus
9. Variar propositalmente as paletas e composicoes para evitar repeticao visual.
10. Escrever os prompts em ingles de forma interna, com instrucoes claras de layout, atmosfera, elementos, enquadramento, logo e textos da arte.
11. Se `references/logo.png` existir, usar esse arquivo como referencia visual para recriar um logo pequeno, discreto e integrado naturalmente a composicao, sem caixa, faixa, moldura ou area demarcada.
12. Gerar as imagens diretamente com a ferramenta de imagem, sempre em chamadas separadas: uma chamada por criativo. Nunca pedir varias artes em um unico prompt, para evitar que o gerador crie uma prancha ou collage com todas as pecas.
13. Depois da geracao, medir as dimensoes reais de cada arquivo PNG. Se qualquer arquivo vier fora do tamanho solicitado, criar copias corrigidas em canvas exato (`1080x1350` ou `1080x1920`) antes de entregar. Preservar os originais. Se precisar redirecionar os arquivos finais para uma nova pasta, escolher um nome claro e criar a pasta automaticamente, sem perguntar ao usuario.
14. Entregar uma resposta curta informando quantas variacoes foram geradas, onde estao os arquivos finais e se as dimensoes foram validadas.

## Output Rules

- Quando o usuario nao especificar outro formato, produzir metade das pecas em `1080x1350` e metade em `1080x1920`.
- Cada arquivo final entregue deve ter exatamente o tamanho prometido. Nao confiar apenas no tamanho descrito no prompt; validar o PNG salvo.
- Se o gerador produzir dimensoes aproximadas ou erradas, criar uma pasta de saida com copias corrigidas. Usar canvas exato, ajustar a arte sem cortar texto importante e, quando precisar preencher area, usar fundo estendido/desfocado/escurecido derivado da propria imagem.
- Quando precisar redirecionar ou reorganizar arquivos finais, fazer isso automaticamente em uma pasta com nome descritivo dentro do usuario ou da area de trabalho disponivel. Nao pedir confirmacao para escolher esse destino; apenas informar o caminho final na resposta.
- Preservar o nome da marca `Forum Telecom` e o nome do curso `Analista de Redes`.
- Se existir `references/logo.png`, incluir visualmente uma versao pequena e discreta desse logo em todas as pecas.
- O logo deve parecer parte natural da arte, sem area reservada, sem faixa de marca e sem demarcacao visivel.
- Usar os precos padrao do arquivo de referencia, salvo se o usuario informar outros valores.
- Manter headlines, CTAs e beneficios em portugues do Brasil quando a arte exigir texto legivel.
- Priorizar acentuacao correta em portugues do Brasil em todo texto visivel da arte, como `á`, `é`, `í`, `ó`, `ú`, `ã`, `õ`, `ç`.
- Tratar palavras sem acento como erro de qualidade quando a forma correta em portugues exigir acento.
- Se o gerador de imagem tiver baixa fidelidade em texto, simplificar a quantidade de texto na arte e priorizar hierarquia visual clara.
- Se o usuario pedir adaptacao para outra oferta, modulo, promocao ou campanha, ajustar gancho, beneficios, CTA e destaque visual sem alterar o fluxo principal.
- Variar entre pecas com poucas informacoes e pecas com mais informacoes no mesmo lote.
- Variar as cores entre as pecas do mesmo lote. Nao repetir a mesma paleta em todas.

## Prompt Construction

Ao montar cada prompt internamente:

- Descrever a cena, composicao e atmosfera em ingles.
- Se existir `references/logo.png`, instruir explicitamente a composicao a usar o arquivo apenas como referencia visual para recriar um logo pequeno da marca, preferencialmente no topo ou canto superior, sem distorcer, sem competir com o headline e sem criar uma area exclusiva para ele.
- Incluir os textos que devem aparecer na arte exatamente como escritos quando isso for importante.
- Escrever todo texto visivel da arte em portugues do Brasil com acentuacao correta.
- Especificar o tamanho final exato: `1080x1350` ou `1080x1920`.
- Reforcar que o prompt representa uma unica arte final individual, nao uma grade, prancha, mockup, collage ou conjunto de variacoes.
- Informar elementos visuais recorrentes: racks, switches, cabos RJ45, patch panels, icones de Wi-Fi, escudos, grids, neon green, deep navy, cyan glow.
- Variar os gatilhos de marketing entre urgencia, transformacao, dor, prova social e oportunidade.
- Variar os layouts para evitar pecas quase identicas.
- Alternar paletas como neon green/cyan, orange/teal, red/blue, purple/cyan, green/gold e outras combinacoes coerentes com o nicho tech.
- Alternar entre composicoes limpas e composicoes mais carregadas.

## Default Behavior

Quando o pedido for aberto, assumir:

- 12 criativos no total
- 6 em `1080x1350`
- 6 em `1080x1920`
- curso `Analista de Redes`
- marca `Forum Telecom`
- usar `references/logo.png` como referencia visual em todas as pecas quando o arquivo existir
- visual dark tech com glow neon e variacoes de paleta
- objetivo de conversao para venda direta
- mistura entre criativos com pouca informacao e criativos com mais informacao

## Customization

Aceitar personalizacao para:

- quantidade de criativos
- distribuicao por formato
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
- Considerar o logo uma informacao critica quando o usuario exigir que ele apareca em todas as artes e o arquivo nao estiver disponivel.
- Nao criar demarcacao, placeholder, faixa branca ou bloco separado apenas para acomodar o logo.
- Nao entregar apenas ideias soltas; produzir imagens.
- Nao usar estilos visuais genericos se o usuario tiver fornecido criativos de referencia.
- Nao gerar um lote inteiro com a mesma composicao ou a mesma paleta.
