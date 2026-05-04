#import "@preview/cetz:0.5.0"

#let fig() = {
  cetz.canvas({
    import cetz.draw: *

    circle((0, 0), radius:1)
    circle((1, 0), radius:1)
    line((-2,0),(3,-0.5))

  })
}