//#import "@preview/cetz:0.5.0"

#let fig() = {

  let addition_codee(lignes, resultat) = {
  let n = calc.max(
    resultat.len(),
    ..lignes.map(l => l.len()),
  )

  let pad(l) = {
    let m = n - l.len()
    (("",) * m) + l
  }

  table(
    columns: n + 1,
    align: center,
    stroke: none,
    inset: 4pt,

    ..lignes.enumerate().map(((i, l)) => {
      let op = if i == lignes.len() - 1 { "+" } else { "" }
      (op,) + pad(l)
    }).flatten(),

    table.hline(stroke: black + 0.8pt),

    ..(("",) + pad(resultat)),
  )
}

// Exemple exo 8
addition_codee(
  (
    ("P", "L", "A", "Y"),
    ("L", "A"),
  ),
  ("2", "0", "2", "5"),
)
  
}