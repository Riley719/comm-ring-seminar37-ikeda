#set text(lang: "ja", font: ("Harano Aji Mincho"), size: 11pt)
#set par(leading: 0.8em)
#show link: underline
#show link: set text(fill: blue)
#set page(numbering: "1 / 1")
#set par(justify: true, first-line-indent: (amount: 1em, all: true))
#show math.equation: set block(breakable: true)
#let title = "On Krull's Dimension Theorem for Certain Graded Rings and Its Applications"
#show title: set align(center)
#show title: set text(weight: "black", size: 2em, font: ("Times New Roman"))
#let author = "池田 吏来　（東京科学大M2）"
#show author: set align(center)
#show author: set text(size: 1em, font: ("Harano Aji Mincho"))
#set heading(numbering: (..args) => {
  let nums = args.pos() // 引数の位置引数を`array`として取得
  if nums.len() == 1 { // 階層総数が1しかない，即ち最高階層
    return numbering("1. ", ..nums)
  } else {
    return numbering("1.1. ", ..nums)
  }
})
#let heading_font(body) = {
  // font: (日本語文字を含まないフォント, 日本語文字を含むフォント)
  set text(font: ("Harano Aji Mincho"))
  body
}
#show heading: heading_font
#show strong: set text(font: ("Harano Aji Mincho"))
#import "@preview/statementsp:0.1.1": *
#show heading: reset-counter(statementnum, levels: 1)
#import "@preview/sicons:16.0.0": *

#let Hom = "Hom"
#let varinjlim = math.op(
  context {
    let lim = $lim$
    let s = measure(lim)
    let w = s.width
    let h = s.height
    let arrow = math.stretch($->$, size: w)
    let offset = 0.7em
    
    box(width: w, height: h + offset, baseline: h)[
      #align(top)[#lim]
      #place(top + center, dy: h - 0.15em, arrow)
    ]
  },
  limits: true
)

#let pfsp(
  title: "(" + text[$p r o o f$] + ")",
  body
) = [
  #title \ #body #h(1fr) $qed$
]

#newstatementsp(
  box-name: "Exer",
  box-display: "Ex", 
  title-color: rgb("#000000"), 
  box-color: rgb("#cccccc")
)
#newstatementsp(
  box-name: "lem",
  box-display: "補題",
  title-color: black,
  box-color: rgb("CCCCFF")
)
#newstatementsp(
  box-name: "th",
  box-display: "Theorem",
  title-color: black,
  box-color: rgb("FFCCCC")
)

#title
#author



= 概要

本資料は第37回可換環論セミナー（千葉大学）における2026年６月４日(木)10:00～10:40の池田 吏来（東京科学大M2）による発表の事前報告書である。本発表はarXiv:2605.00463に基づく。分野は可換環、特に次数付き環の次元論である。

計算機代数であり、自然な次数付き環の構造を持つイニシャル代数は、ネーター環になるとは限らない。したがって、Krullの次元定理の次数環バージョンであるSmokeの次元定理を適用し、イニシャル代数に関する次元論を展開することはできない。そこで、発表者はイニシャル代数の次元を捉えるために、Smokeの次元定理を一般化した。

本発表では、次数付き環に対するさまざまな次元の定義、イニシャル代数の紹介、そして発表者の主張する次元定理を説明する。最後に、主定理に関する例と問題を紹介して終わる。

= 参考資料
#[
  #set par(first-line-indent: 0pt)
  #box(baseline: 15%, sicon(slug: "arxiv", size: 1em, icon-color: "default")) 論文のリンク \
  #link("https://arxiv.org/abs/2605.00463")[https://arxiv.org/abs/2605.00463]

  #box(baseline: 15%, sicon(slug: "youtube", size: 1em, icon-color: "default")) 解説動画のリンク \
  #link("https://www.youtube.com/playlist?list=PLRjQpg-mYYm3b2Wgw5VHd-VB85mEZ0i3z")[https://www.youtube.com/playlist?list=PLRjQpg-mYYm3b2Wgw5VHd-VB85mEZ0i3z]

  #box(baseline: 15%, sicon(slug: "github", size: 1em, icon-color: "default")) 事前報告書置き場 \
  #link("https://github.com/Riley719/comm-ring-seminar37-ikeda")[https://github.com/Riley719/comm-ring-seminar37-ikeda]
]

= 板書

当日の発表は基本的に次に示す13枚の板書に沿って行う予定である。

#align(center)[
  #grid(
    columns: 2,           // 2列で配置（3列にする場合は 3 に変更してください）
    gutter: 10pt,         // 画像（枠線）同士の隙間
    ..range(1, 14).map(p => 
      rect(
        stroke: 0.5pt + black, // 黒い実線の枠
        inset: 0pt,            // 枠線と画像の間の余白をなくす
        image("bansyo.pdf", page: p, width: 100%) // 枠に合わせて幅を指定
      )
    )
  )
]