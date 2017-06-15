<html>
<head>
    <title>Registrar</title>
</head>
<body>
<?php

$dbconn1 = pg_connect("host=localhost port=5432 dbname=PostgreSQL user=postgres password=123")
//mysqli_select_db($link, $bd)
or die ("ERROR EN LA CONEXION");

$nombre1 = isset($_POST['nombre1'])? $_POST['nombre1'] : NULL;
$password1 = isset($_POST['password1'])? $_POST['password1'] : NULL;

if($nombre1 == "Apolo" AND $password1 == "888"){
    header('Location: Administrador.html');
    }

else {

    header('Location: index.html');


}

pg_close($dbconn1);

?>

</body>
</html>