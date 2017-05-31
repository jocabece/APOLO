
<html>
<head>
    <title>Registrar</title>
</head>
<body>
<?php

$dbconn = pg_connect("host=localhost port=5432 dbname=pruebapf user=postgres password=1106")
//mysqli_select_db($link, $bd)
or die ("ERROR EN LA CONEXION");

$nombre = isset($_POST['nombre'])? $_POST['nombre'] : NULL;
$ci = isset($_POST['ci'])? $_POST['ci'] : NULL;
$password = isset($_POST['password'])? $_POST['password'] : NULL;

pg_query( $dbconn,"INSERT into cliente values ('$nombre','$ci','$password')")
or die ("ERROR AL INSERTAR LOS REGISTROS");

pg_close($dbconn);
echo ("DATOS INSERTADOS CORRECTAMENTE");
?>

<form action="Cliente.html" method="post">
    <button type="submit" name="submit" value="1">INICIAR SESION</button>
</form>


</body>
</html>