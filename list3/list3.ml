(*
// Zadanie 1
// z�o�ono�� czasowa liniowa O(n), gdzie n jest d�ugo�ci� listy wej�ciowej
// z�o�ono�� pamieciowa liniowa O(n), gdzie n jest d�ugo�ci� listy wej�ciowej
*)
let rec splitBySign list =
    if list = [] then
        ([], [])
    else
        let (lower, higher) = splitBySign (List.tl list) in
        if List.hd list < 0 then
            ((List.hd list) :: lower, higher)
        else if List.hd list mod 2 = 1 then
            (lower, (List.hd list) :: higher)
        else
            (lower, higher);;

splitBySign [-3; -6; 7; -9; 13];;
splitBySign [];;
splitBySign [1; 2; -1; -2; -3; 3; 4; -4; -5; 5];;

(*
// Zadanie 2
// z�o�ono�� czasowa liniowa O(n), gdzie n jest d�ugo�ci� listy wej�ciowej
// z�o�ono�� pami�ciowa sta�a O(1)
*)
let listLength list =
    let rec calculateLength list i =
        if list = [] then i
        else calculateLength (List.tl list) (i + 1)

    in calculateLength list 0;;

listLength [5; 4; 3; 2];;
listLength ["A"; "B"; "C"];;
listLength [];;


(*
// Zadanie 3
// z�o�ono�� czasowa liniowa O(n), gdzie n jest d�ugo�ci� listy wej�ciowej
// z�o�ono�� pami�ciowa liniowa O(n), gdzie n jest d�ugo�ci� kr�tszej listy wej�ciowej
*)

let rec joinLists listA listB =
    match(listA, listB) with
        ([], _) -> listB
        | (_, _) ->
            List.hd listA :: joinLists listB (List.tl listA);;

joinLists [5; 4; 3; 2] [1; 2; 3; 4; 5; 6];;
joinLists [] [];;
joinLists [] [5; 4; 3; 2; 1];;
joinLists [5; 4; 3; 2; 1] [];;
