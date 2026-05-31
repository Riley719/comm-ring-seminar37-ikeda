#set text(lang: "ja", font: ("Harano Aji Mincho"), size: 11pt)
#set par(leading: 0.8em)
#show link: underline
#show link: set text(fill: blue)
#set page(numbering: "1 / 1")
#set par(justify: true)
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
TBA

= 参考資料
論文のリンク #link("https://arxiv.org/abs/2605.00463")[#box(sicon(slug: "arxiv", size: 1em, icon-color: "default")) arXiv:2605.00463] \
解説動画のリンク #link("https://www.youtube.com/playlist?list=PLRjQpg-mYYm3b2Wgw5VHd-VB85mEZ0i3z")[#box(sicon(slug: "youtube", size: 1em, icon-color: "default")) https://www.youtube.com/playlist?list=PLRjQpg-mYYm3b2Wgw5VHd-VB85mEZ0i3z]