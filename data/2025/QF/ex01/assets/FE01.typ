#import "@preview/cetz:0.5.0"

#let fig() = {
  cetz.canvas({
    import cetz.draw: *
    let w = 0.8
    let h = 1.2
    let gap = 0.12
    let values = ("0", "0", "1", "1", "2", "2", "3", "3", "4", "4", "5", "5")

    for i in range(12) {
      let x = i * (w + gap)

      rect(
        (x, 0),
        (x + w, h),
        radius: 0.08,
        stroke: black,
        fill: white,
      )

      content(
        (x + w / 2, h / 2),
        text(size: 18pt, weight: "bold")[#values.at(i)],
        anchor: "center",
      )
    }
  })
}