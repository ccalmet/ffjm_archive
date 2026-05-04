#import "@preview/cetz:0.5.0"

#let fig() = {
  cetz.canvas({
    import cetz.draw: *
    scale(0.8)
    
    // ---------------- PARAMÈTRES PLATEAUX ----------------
    let plateau_y = -0.1
    let plateau_w = 4.8
    let gap = 1.2

    let gauche_c = -(plateau_w + gap) / 2
    let droite_c = (plateau_w + gap) / 2

    // ---------------- PLATEAUX ----------------
    line(
      (gauche_c - plateau_w / 2, plateau_y),
      (gauche_c + plateau_w / 2, plateau_y),
      stroke: black + 1pt,
    )

    line(
      (droite_c - plateau_w / 2, plateau_y),
      (droite_c + plateau_w / 2, plateau_y),
      stroke: black + 1pt,
    )

    // ---------------- FLÈCHE ----------------
    let h = 2.4
    line((0, 0), (0, h), stroke: black + 1pt)
    line((0, h), (-0.2, h - 0.3))
    line((0, h), (0.2, h - 0.3))

    // ---------------- BOUTEILLES ----------------
    let bouteille_vide(x, y, col) = {
      let x0 = x
      let x1 = x + 0.22
      let x2 = x + 0.66
      let x3 = x + 0.88

      let y0 = y
      let y1 = y + 3.2
      let y2 = y + 3.5

      line((x0, y0), (x0, y1), stroke: col)
      line((x0, y1), (x1, y1), stroke: col)
      line((x1, y1), (x1, y2), stroke: col)
      line((x1, y2), (x2, y2), stroke: col)
      line((x2, y2), (x2, y1), stroke: col)
      line((x2, y1), (x3, y1), stroke: col)
      line((x3, y1), (x3, y0), stroke: col)
      line((x3, y0), (x0, y0), stroke: col)
    }

    let bouteille_demie(x, y, col) = {
      bouteille_vide(x, y, col)

      let xL = x + 0.05
      let xR = x + 0.83
      let yB = y + 0.08
      let yH = y + 1.6

      rect((xL, yB), (xR, yH), fill: luma(230), stroke: none)

      // surface de l’eau en noir
      line((xL, yH), (xR, yH), stroke: black + 0.7pt)
    }

    // ---------------- POSITIONNEMENT ----------------
    let bw = 0.88
    let b_gap = 0.2
    let y_b = plateau_y + 0.05

    let groupe_w = 4 * bw + 3 * b_gap
    let start_g = gauche_c - groupe_w / 2

    // gauche : 4 bouteilles (la 1re en bleu)
    bouteille_vide(start_g, y_b, blue)
    bouteille_vide(start_g + bw + b_gap, y_b, black)
    bouteille_vide(start_g + 2 * (bw + b_gap), y_b, black)
    bouteille_vide(start_g + 3 * (bw + b_gap), y_b, black)

    // droite : bouteille demi-pleine (contour bleu)
    let start_d = droite_c - bw / 2
    bouteille_demie(start_d, y_b, blue)
  })
}