calcRPN :: String -> Int
calcRPN i = crpn (words i) []
    where crpn [] (r:_)      = r
          crpn (x:xs) []     = crpn xs [read x]
          crpn (x:xs) (h:st) = case x of
                                "add" -> crpn xs ((head st+h):tail st)
                                "sub" -> crpn xs ((head st-h):tail st)
                                "mul" -> crpn xs ((head st*h):tail st)
                                "div" -> crpn xs ((div (head st) h):tail st)
                                "mod" -> crpn xs ((mod (head st) h):tail st)
                                "sqrt" -> crpn xs (round (sqrt (fromIntegral h)):st)
                                otherwise -> crpn xs ((read x):h:st)
-- ugly but it just werks