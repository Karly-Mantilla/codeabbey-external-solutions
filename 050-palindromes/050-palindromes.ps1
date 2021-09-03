function check-palindrome
    {
        param([string]$start_string)
        
        # Reverse the word
        $arr_string = $start_string.ToCharArray()
        $arr_reverse = $arr_string
        [array]::Reverse($arr_reverse)
        $reverse_string = -Join($arr_reverse)
        
        # Compare
        $test_strings = $start_string -eq $reverse_string
        IF ($test_strings -eq $True)
            {
                Write-Host $start_string is a palindrome
            }
        Else
            {
                Write-Host $start_string is not a palindrome
            }
    }