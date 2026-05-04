#let explication(figure) = [

Au-delà d'une approche par tâtonnement, suffisante pour cet exercice, on peut proposer une approche un peu plus construite :

Les groupes de 3 cases successives doivent être tels que le nombre écrit dans l'une des cases soit la somme des deux autres. Les seuls groupes de 3 cases successives possibles sont :
$ 1 + 2 = 3 #h(2em) 1 + 3 = 4 #h(2em) 1 + 4 = 5 #h(2em) #h(2em) 2 + 3 = 5 #h(2em) 2 + 5 = 7 #h(2em) 3 + 4 = 7 $

Le nombre le plus à droite devant être plus grand que le nombre le plus à gauche, on peut commencer par essayer de placer le 7 tout à droite, ce qui laisse _a priori_ plus de latitude pour placer les autres nombres. 

Par exemple comme ceci (hypothèse 1) :

#figure("FX01")

Au vu des groupes de 3 cases listés ci-dessus, on est alors contraint de placer le 1 dans la case qui précède le 3, puis le 2 dans la case qui précède le 1, et on n'a plus de possibilité pour compléter la première case. L'hypothèse 1 doit donc être rejetée.

Avec le même raisonnement, on élimine aussi la succession 4-3-7 pour les 3 cases les plus à droite.

Toujours dans l'idée d'avoir le nombre 7 tout à droite, on peut partir sur l'hypothèse 2 ci-dessous :

#figure("FX02")

On est alors contraint de placer le 3 avant le 2, puis le 1 avant le 3, et enfin le 4 dans la première case. 

La succession 4 1 3 2 5 7 convient donc. Cet exercice n'ayant qu'une solution, l'exercice est résolu.



]




