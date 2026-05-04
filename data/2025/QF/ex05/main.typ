#set text(lang: "fr")
#set par(justify: true)

#let meta = toml("meta.toml")

// FIGURE WRAPPER ----------------
#let figure(id) = {
  let figs = meta.assets.figures
  let fig = figs.filter(f => f.id == id).at(0)

  if fig.type == "image" {
    image("assets/" + fig.fichier)
  } else if fig.type == "cetz" {
    import "assets/" + fig.fichier: fig
    fig()
  }
}

// FORMAT ----------------
#let join(arr) = arr.join(", ")

// IMPORT ----------------
#import "enonce.typ": enonce
#import "solution.typ": solution
#import "explication.typ": explication

// MISE EN PAGE ----------------
#set page(width: 210mm, height: 297mm, margin: 2cm)
#set text(lang: "fr")

// EN-TÊTE ----------------
#block[
  *Source :* #upper(meta.meta.concours) 
  édition #meta.meta.edition — #meta.meta.annee 
   — #meta.meta.etape
   — Exercice #meta.exercice.numero (#meta.meta.categorie)
]

#v(1em)

//  CONTENU ----------------
= #meta.exercice.nom

#enonce(figure)

#v(1em)

== Réponse

#solution

#v(1em)

== Explication

#explication(figure)

#v(1.5em)

// TAGS ----------------
#block[
== Tags
  Thème(s) : #join(meta.tags.themes) \
  Notion(s) : #join(meta.tags.notions) \
  Technique(s) : #join(meta.tags.techniques) \
//  Compétences : #join(meta.tags.competences) \
  Niveau : #join(meta.tags.niveau)
]