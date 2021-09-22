<?php
session_start();
if(!isset($_SESSION['resultBin']) || !isset($_SESSION['resultHexa']))
{
  $_SESSION['resultHexa']='';
  $_SESSION['resultBin']='';
}
if(!isset($_SESSION['userData']))
{
  $_SESSION['userData']='';
 
}

?>

<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  	<title>My Trad</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  </head>
  <body>

    <p class="blocPrincipale">
      <label for="ameliorer">Texte</label><br />
      <textarea name="txt"  rows="10" cols="100" id="txt"><?php echo $_SESSION['userData'];  ?></textarea>
    </p>

    <p class="blocPrincipale">
      <label for="ameliorer">Binaire</label><br />
      <textarea name="bine" readonly="readonly"  rows="10" cols="100" id="bin"><?php echo $_SESSION['resultBin'];   ?></textarea>
    </p>

    <br>
   
    <div class="blocPrincipale2">
      <label for="ameliorer">Hexadécimal</label><br />
      <textarea name="bine" readonly="readonly"  rows="10" cols="100" id="hexa" ><?php echo $_SESSION['resultHexa'];   ?></textarea>
    </div>

    <script type="text/javascript">
      $("#txt").keyup(function(){
        $.ajax({
           url : 'trad.php', 
           type : 'post',
           data : {txt:document.getElementById("txt").value},
           dataType: "json",
           success :function(data) {
            $("#bin").html(data.binaire);
            $("#hexa").html(data.hexa);
           }
         });
      });
    </script>

  </body>
</html>
