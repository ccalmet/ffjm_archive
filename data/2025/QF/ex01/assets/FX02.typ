#import "@preview/cetz:0.5.0"

#let fig() = {
  cetz.canvas({
    import cetz.draw: *

    let w = 0.8
    let h = 1.2
    let gap = 0.12
    let values = ("0", "0", "1", "1", "2", "2", "3", "3", "4", "4", "5", "5")

    // indices des cartes à rayer : 0, 2, 2, 5
    // ici on barre une occurrence de 0, les deux 2, et une occurrence de 5
    let rayees = (0, 2, 3, 4, 5, 10)

    for i in range(12) {
      let x = i * (w + gap)

      // carte
      rect(
        (x, 0),
        (x + w, h),
        radius: 0.08,
        stroke: black,
        fill: white,
      )

      // chiffre
      content(
        (x + w / 2, h / 2),
        text(size: 18pt, weight: "bold")[#values.at(i)],
        anchor: "center",
      )

      // croix si carte rayée
      if rayees.contains(i) {
        line((x, 0), (x + w, h), stroke: red + 1pt)
        line((x, h), (x + w, 0), stroke: red + 1pt)
      }
    }
  })
}