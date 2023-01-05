let aux f =
  f 1 + f 10

let main x y b =
  aux ((+) x) * aux (fun z -> if b then y + z else y - z)

type lam =
  | Lam1 of int
  | Lam2 of int * bool

let apply (func, z) =
  match func with
  | Lam1 x -> x + z
  | Lam2 (y, b) -> if b then y + z else y - z

let aux_def f = apply (f, 1) + apply (f, 10)

let main_def (x, y, b) = aux_def (Lam1 x) * aux_def (Lam2 (y, b))
