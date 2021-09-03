Clear-Host

$NewGame = "True" #This variable controls the game
$UserReply = 0 #
$UserChoice = "" #This variable will hold the letter choice of the user
$RanNum = 0 #This variable will be used to generate a random number for the computer's choice
$CompChoice = "" #This variable will be the converted integer to a letter representing the computer's choice
$AmountPlayed = 0 #Keeps track of how many games the user has played during the session
$Wins = 0 #Keeps track of the User's wins
$Losses = 0 #Keeps track of the User's losses
$Ties = 0 #Keeps track of the User's ties

Write-Host "     Welcome to the"
Write-Host "Rock, Paper, Scissors Game!" 
Write-Host "   WIT Operating Systems"
Write-Host "                          "
Write-Host "Press Enter to Continue"
 
Read-Host

while($NewGame -ne "False") {
    $RanNum = Get-Random -Minimum 1 -Maximum 4 #Generate a new number between 1 and 3
    if ($RanNum -eq 1) {
    $CompChoice = "Rock"
    }
    if ($RanNum -eq 2) {
    $CompChoice = "Paper"
    }
    if ($RanNum -eq 3) {
    $CompChoice = "Scissors"
    }

    While ($UserReply -eq "") {

    Clear-Host

    Write-Host "Enter one of the following options"
    Write-Host "-----------------------------------"
    Write-Host "                                   "
    Write-Host "R is for Rock"
    Write-Host "P is for Paper"
    Write-Host "S is for Scissors"  
    Write-Host "Q is for Quit"
    Write-Host "                                   "
    Write-Host "-----------------------------------"

    $UserReply = Read-Host "Make a move"
    }

    if($UserReply -eq "Q") {
    Clear-Host
    Write-Host "                                                       "
    Write-Host "Game over. Thanks for playing Rock, Paper Scissors."
    Write-Host "                                                       "
    Write-Host "Press enter to view game statistics and quit the game."
    Read-Host

    Clear-Host

    Write-Host "Game Statistics"
    Write-Host "------------------------------"
    Write-Host "Number of games played: $AmountPlayed"
    Write-Host "Number of games won: $Wins"
    Write-Host "Number of games lost: $Losses"
    Write-Host "Number of games tied: $Ties"
    Write-Host " ------------------------------"
    Write-Host "Press Enter to continue."

    Read-Host

    $NewGame = "False"
    continue
    }

    elseif(($UserReply -ne "R") -and ($UserReply -ne "P") -and ($UserReply -ne "S") -and ($UserReply -ne "D")) {
    Clear-Host
    Write-Host "Invalid input. Please try again."
    Read-Host
    $UserReply = ""
    continue
    }


    if ($UserReply -eq "R") {
    $UserChoice = "Rock"
    }
    if ($UserReply -eq "P") {
    $UserChoice = "Paper"
    }
    if ($UserReply -eq "S") {
    $UserChoice = "Scissors"
    }
    if ($UserReply -eq "D") {
    $UserChoice = "Dynamite"
    }

    Clear-Host

    Write-Host "Results:"
    Write-Host "-----------------------------------"
    Write-Host "                                   "
    Write-Host "The computer picked: $CompChoice"
    Write-Host "You picked: $UserChoice"
    Write-Host "                                   "
    Write-Host "-----------------------------------"

    $AmountPlayed += 1

Switch ($CompChoice) {

"Rock" {
    if ($UserChoice -eq "Rock") {
    $Ties += 1
    Write-Host "Tie!"
    }
    if ($UserChoice -eq "Paper") {
    $Wins += 1
    Write-Host "You Win!"
    }
    if ($UserChoice -eq "Scissors") {
    $Losses += 1
    Write-Host "Computer Wins!"
    }
    if ($UserChoice -eq "Dynamite") {
    $Wins += 1
    Write-Host "You always win with DYNAMITE!!!"
    }
  }
"Paper" {
    if ($UserChoice -eq "Paper") {
    $Ties += 1
    Write-Host "Tie!"
    }
    if ($UserChoice -eq "Rock") {
    $Losses += 1
    Write-Host "Computer Wins!"
    }
    if ($UserChoice -eq "Scissors") {
    $Wins += 1
    Write-Host "You Win!"
    }
    if ($UserChoice -eq "Dynamite") {
    $Wins += 1
    Write-Host "You always win with DYNAMITE!!!"
    }
  }
"Scissors" {
    if ($UserChoice -eq "Scissors") {
    $Ties += 1
    Write-Host "Tie!"
    }
    if ($UserChoice -eq "Rock") {
    $Wins += 1
    Write-Host "You Win!"
    }
    if($UserChoice -eq "Paper") {
    $Losses += 1
    Write-Host "Computer Wins!"
    }
    if ($UserChoice -eq "Dynamite") {
    $Wins += 1
    Write-Host "You always win with DYNAMITE!!!"
    }
  }
}

Read-Host

$UserReply = 0 #Reset all variables
$UserChoice = "" 
$RanNum = 0 
$CompChoice = ""

Clear-Host

Write-Host "Game Statistics"
Write-Host "------------------------------"
Write-Host "Number of games played: $AmountPlayed"
Write-Host "Number of games won: $Wins"
Write-Host "Number of games lost: $Losses"
Write-Host "Number of games tied: $Ties"
Write-Host " ------------------------------"
Write-Host "Press Enter to continue."

Read-Host

}
