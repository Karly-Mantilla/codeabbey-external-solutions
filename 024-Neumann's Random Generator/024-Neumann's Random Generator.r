# $ lintr::lint('bridamo98.r')

format_input <- function(input) {
  formatted_input <- unlist(lapply
    ((unlist(strsplit(input, " "))), as.integer))
  return(formatted_input)
}

find_nxt_rand_number <- function(number) {
    large_num <- as.character(number * number)
    size_pad <- 8 - nchar(large_num)
    pad <- paste(replicate(size_pad, "0"), collapse = "")
    pad_num <- paste (pad, large_num, sep = "")
    res <- as.integer(substr(pad_num, 3, 6))
    return(res)
}

find_index_for_loop <- function(number, rand_numbers, i=0) {
  if((number %in% rand_numbers) & (i > 0)) {
      return(i)
  }
  else {
      nxt_rand_number <- find_nxt_rand_number(number)
      find_index_for_loop(nxt_rand_number, (append
        (rand_numbers, number)), i + 1)
  }
}

solve_all <- function(input, result = c(), i=1) {
    if (i > length(input)) {
        return(result)
    }
    else {
        index_for_loop <-
          find_index_for_loop(input[i], (append(c(), input[i])))
        solve_all(input, (append(result, index_for_loop)), i + 1)
    }
}

main <- function() {
    input <- readLines("stdin")
    formatted_input <- format_input(input[2])
    result <- solve_all(formatted_input)
    print(result)
}

main()

# $ cat DATA.lst | Rscript bridamo98.r
# [1]   77386  440366 1038645  785728  809727  792139 1001087  708771  676606
# [10] 1286978 1423888