let aux (i, f) = f i

let main (i, js) =
  let rec walk = function
    | [] -> []
    | j :: js -> (aux (i, ((+) j))) :: walk js
  in walk js

