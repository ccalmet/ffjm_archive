#let explication(figure) = [

#let ok = text(fill: green)[✓]
#let no = text(fill: red)[✗]
  
L'information "C'est Bertrand qui veut devenir dentiste" permet de cocher la case correspondante dans le tableau ci-dessous, et de rayer le reste de la ligne et de la colonne de la case cochée :

#table(
  columns: 5,
  align: center,
  stroke: 0.7pt,
  inset: 6pt,

  // en-tête
  [], [archéologue], [bibliothécaire], [cardiologue], [dentiste],

  // lignes
  [Annabelle], [], [], [], [#text(fill: red)[#no]],
  [Bertrand], 
    [#text(fill: red)[#no]], 
    [#text(fill: red)[#no]], 
    [#text(fill: red)[#no]], 
    [#text(fill: green)[#ok]],
  [Clarisse], [], [], [], [#text(fill: red)[✗]],
  [Damien], [], [], [], [#text(fill: red)[✗]],
)

Les informations "Annabelle ne se destine pas à un métier commençant par la même lettre que son prénom" et "Annabelle ne voudrait surtout pas travailler dans le domaine médical" permet de rayer dans sa ligne du tableau les métiers archéologue et cardiologue, et par élimination de déterminer le métier auquel Annabelle se destine : bibliothécaire. On peut enfin rayer les cases restantes dans la colonne "bibliothécaire" :

#table(
  columns: 5,
  align: center,
  stroke: 0.7pt,
  inset: 6pt,

  // en-tête
  [], [archéologue], [bibliothécaire], [cardiologue], [dentiste],

  // lignes
  [Annabelle], [#no], [#ok], [#no], [#no],

  [Bertrand], [#no], [#no], [#no], [#ok],

  [Clarisse], [], [#no], [], [#no],

  [Damien], [], [#no], [], [#no],
)

L'information "Une seule personne se destine au métier commençant par la même lettre que son prénom" permet de déterminer que Clarisse veut devenir cardiologue : en effet, entre Clarisse et Damien, Clarisse est la seule pour qui le métier commençant par la même lettre que son prénom est encore disponible. On peut alors éliminer de nouvelles cases, et il ne reste plus que le métier d'archéologue pour Damien :

#table(
  columns: 5,
  align: center,
  stroke: 0.7pt,
  inset: 6pt,

  // en-tête
  [], [archéologue], [bibliothécaire], [cardiologue], [dentiste],

  // lignes
  [Annabelle], [#no], [#ok], [#no], [#no],

  [Bertrand], [#no], [#no], [#no], [#ok],

  [Clarisse], [#no], [#no], [#ok], [#no],

  [Damien], [#ok], [#no], [#no], [#no],
)

]
