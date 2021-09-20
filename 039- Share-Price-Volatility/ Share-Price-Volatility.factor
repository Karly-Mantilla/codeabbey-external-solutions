! Written in Factor.
! https://factorcode.org

USING: arrays assocs io kernel math math.parser math.statistics
sequences splitting ;
IN: code-abbey.share-price-volatility

: volatile? ( seq -- ? )
    [ mean 100 / 4 * ] [ population-std <= ] bi ;

: problem39 ( input-str -- )
    "\n" split
    [ " " split1 " " split [ string>number ] map 2array ] map
    [ nip volatile? ] assoc-filter keys " " join print ;