
<html>
<head>
    <title>NuevoProducto</title>
</head>
<body>
<?php

$dbconn = pg_connect("host=localhost port=5432 dbname=PostgreSQL user=postgres password=123")
//mysqli_select_db($link, $bd)
or die ("ERROR EN LA CONEXION");

$data = file_get_contents('cerveza.jpg');
$imagen = pg_escape_bytea($data);
$nombreproducto = isset($_POST['nombreproducto'])? $_POST['nombreproducto'] : NULL;
$descripcion = isset($_POST['descripcion'])? $_POST['descripcion'] : NULL;
$cantidad = isset($_POST['cantidad'])? $_POST['cantidad'] : NULL;
$categoria = isset($_POST['categoria'])? $_POST['categoria'] : NULL;
$preciocompra = isset($_POST['preciocompra'])? $_POST['preciocompra'] : NULL;
$precioventa = isset($_POST['precioventa'])? $_POST['precioventa'] : NULL;
$stockminimo = isset($_POST['stockminimo'])? $_POST['stockminimo'] : NULL;
$proveedor = isset($_POST['proveedor'])? $_POST['proveedor'] : NULL;


    echo pg_query( $dbconn,"INSERT into producto values ('117','11','$preciocompra','$precioventa','$cantidad','$imagen','$descripcion','$nombreproducto')")
        or die ("ERROR AL INSERTAR LOS REGISTROS");
    echo ("DATOS INSERTADOS CORRECTAMENTE");
    ?>
<form action="Inventario.php" method="post">
    <button type="submit" name="submit" value="1">IR AL INVENTARIO</button>
</form>
<?php

pg_close($dbconn);

?>

</body>
</html>