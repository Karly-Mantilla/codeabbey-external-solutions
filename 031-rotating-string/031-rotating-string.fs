module main

    let turn (y:int)=
        let mutable line_list = ""
        let mutable c = 0
        while c < y do
            let mutable line = stdin.ReadLine()
            let mutable index = line.Substring(0,2).Replace(" ","")|>int
            let mutable word = line.Substring(2).Replace(" ","")
            let mutable l = word.Length
            if index < 0 then
                l<-l-(index * -1)
                let mutable cut = word.Substring(l)
                word<-word.Replace(cut,"")
                line_list <-line_list + cut+word+" "
            if index > 0 then
                let mutable cut = word.Substring(index)
                word<-word.Replace(cut,"")
                line_list <- line_list + cut+word+" "
            c<-c+1
        printf "%A" line_list

    let main =
        let mutable nd = stdin.ReadLine()|> int
        turn  nd