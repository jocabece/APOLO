<?php

$dbconn = pg_connect("host=localhost port=5432 dbname=PostgreSQL user=postgres password=123")
or die ("Error en la Conexion");

$nombreusuario = ($_POST['nombreusuario']);
$password= $_POST['password'];
//$ci = $_POST['ci'];


//query para ver si existe el email
$query1=pg_query($dbconn,"SELECT * from usuario where nombreusuario='$nombreusuario' and password='$password'");
if(pg_num_rows($query1) > 0) {
    echo "<script>alert('Existe contraseña')</script>";
    header('Location: Producto.html');

} //Si existe el email pero no corresponde la contrasena
else {
    echo "<script>alert('El usuario o la contrasena no es correcto')</script>";
    header("Location: Cliente.html");
}









