#import "@preview/cetz:0.5.0"

#let fig() = {
  cetz.canvas({
    import cetz.draw: *

    let s = 1
    let nums = (
      (9, 12, 15, 2),
      (6, 7, 4, 5),
      (3, 10, 11, 8),
      (0, 13, 14, 1),
    )

    // --- cases + numéros ---
    for r in range(4) {
      for c in range(4) {
        let x = c * s
        let y = (3 - r) * s

        rect((x, y), (x + s, y + s), stroke: black + 0.8pt)

        content(
          (x + s / 2, y + s / 2),
          text(size: 10pt)[#nums.at(r).at(c)],
          anchor: "center",
        )
      }
    }

    let door = 0.22

    // --- portes intérieures (effacement pur, sans re-tracer en noir) ---

    // verticales
    for c in range(1, 4) {
      for r in range(4) {
        let x = c * s
        let y = r * s + s / 2

        line((x, y - door), (x, y + door), stroke: white + 3pt)
      }
    }

    // horizontales
    for c in range(4) {
      for r in range(1, 4) {
        let x = c * s + s / 2
        let y = r * s

        line((x - door, y), (x + door, y), stroke: white + 3pt)
      }
    }

    // --- ouvertures extérieures (entrée / sortie) ---

    // entrée (case 0, en bas à gauche)
    line((0, 0.5 - door), (0, 0.5 + door), stroke: white + 3pt)

    // sortie (case 1, en bas à droite)
    line((4, 0.5 - door), (4, 0.5 + door), stroke: white + 3pt)

    // --- flèches ---

    // entrée
    line((-0.7, 0.5), (0, 0.5), stroke: black + 0.8pt)
    line((0, 0.5), (-0.2, 0.65), stroke: black + 0.8pt)
    line((0, 0.5), (-0.2, 0.35), stroke: black + 0.8pt)
    content((-0.8, 0.5), text(size: 8pt)[Entrée], anchor: "east")

    // sortie
    line((4, 0.5), (4.7, 0.5), stroke: black + 0.8pt)
    line((4.7, 0.5), (4.5, 0.65), stroke: black + 0.8pt)
    line((4.7, 0.5), (4.5, 0.35), stroke: black + 0.8pt)
    content((4.8, 0.5), text(size: 8pt)[Sortie], anchor: "west")
  })
}