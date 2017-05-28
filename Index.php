<html>
<head>
    <title>      FACTURACION </title>
</head>
<body>
<h1>             FACTURA</h1>
<form action="GeneracionCC.php" method="post">
    <label for="nit_cliente">NIT</label><br />
    <input id="nit_cliente" type="text" name="nit_cliente" value="" /><br /><br />
    <label for="fecha_compra">Fecha:</label><br />
    <input id="fecha_compra" type="text" name="fecha_compra" value="" /><br /><br />
    <label for="monto_compra">Monto</label><br />
    <input id="monto_compra" type="text" name="monto_compra" value="" /><br /><br />
    <button type="submit" name="submit" value="1">Facturar</button>
</form>
</body>
</html>

