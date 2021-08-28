$mainCarte = @()

Function calculTotal {
   $valeur=0
   for ($i = 0 ; $i -le $mainCarte.Length ; $i++) {
        $valeur = $valeur + $mainCarte[$i]
      }
        return $valeur
}

Function pigerCarte {
   return Get-Random -InputObject (2,3,4,5,6,7,8,9,10,10,10,10,11) -Count 1
}

Function verifier_11 {
    for ($i=0; $i -le $mainCarte.Length ; $i++) {
        if ($mainCarte[$i] -eq 11){return $vrai}
    }
    return $faux
}

Function enleve_10 {
    for ($i = 0 ; $i -lt $mainCarte.Length ; $i++) {
        if ($mainCarte[$i] -eq 11) {
            $mainCarte[$i] = 1
            break
        } 
    }   
}

$mainCarte += pigerCarte
$mainCarte += pigerCarte

if ((calculTotal) -gt 21 -and ((verifier_11) -eq $vrai )){
    enleve_10
    $reponse = Read-Host "Voulez vous piger une autre carte (o/n) ?"
}


Write-Host "Voici la valeur de vos cartes : $maincarte"
Write-Host "Voici le total de vos cartes :" (calculTotal)

$reponse="o"

while ($reponse -eq "o") {

    if ((calculTotal) -lt 21 -and  $mainCarte.Length -eq 5) {
    
        Write-Host "---------Vous avez perdu ! Bicycle ---------"
        $reponse="n"

    }
    elseif ((calculTotal) -eq 21 -and $mainCarte.Length -eq 2){
        
        Write-Host "---------BlackJack ! Vous avez gagné---------"
        $reponse="n"

    }
    elseif ((calculTotal) -eq 21) {
   
        Write-Host "---------Vous avez gagnez !---------"
        $reponse="n"

    }
    elseif ((calculTotal) -lt 21) {
        
        if((Read-Host "Voulez vous piger une autre carte (o/n) ? ") -ne "o"){
            break
         }

        $mainCarte += pigerCarte
        Write-Host "Voici la valeur de vos cartes : $mainCarte"

                
        if ((calculTotal) -gt 21 -and ((verifier_11) -eq $vrai)) {
              enleve_10          

        }
        if ((calculTotal) -gt 21 -and ((verifier_11) -eq $faux )) {
            
            Write-Host "--------- Vous avez perdu ! ---------"
            $reponse="n"
            
        }
        Write-Host "Voici le total de vos cartes :" (calculTotal)
           
     }elseif ((calculTotal) -gt 21 -and ((verifier_11) -eq $faux )) {
        Write-Host "--------- Vous avez perdu ! ---------"
        $reponse="n"
  
    }
}

Write-Host " **************** Merci d'avoir joué ! **************** "