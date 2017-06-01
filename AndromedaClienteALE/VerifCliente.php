
<html>
<head>
    <title>Registrar</title>
</head>
<body>
<?php

$dbconn = pg_connect("host=localhost port=5432 dbname=pruebapf user=postgres password=123");
//mysqli_select_db($link, $bd)
echo "conectado"
or die ("ERROR EN LA CONEXION");

$nombre = isset($_POST['nombre'])? $_POST['nombre'] : NULL;
$ci = isset($_POST['ci'])? $_POST['ci'] : NULL;
$password = isset($_POST['password'])? $_POST['password'] : NULL;

$row=pg_query ("SELECT * from cliente WHERE nombre = '$nombre' AND password = '$password'");


if(pg_fetch_array($row)==1){
    header ('Producto.html');
}
else{
    echo "No se pudo conectar al Servidor";
}

pg_close($dbconn);

?>