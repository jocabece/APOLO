<?php
/**
 * Created by PhpStorm.
 * User: IRIS
 * Date: 24/05/2017
 * Time: 8:31
 */
include 'phpqrcode.php';
require_once('CodigoControlV7.php');

$numero_autorizacion = '29040011007';
$numero_factura = '1503';
$nit_cliente = isset($_POST['nit_cliente'])? $_POST['nit_cliente'] : NULL;
$fecha_compra = isset($_POST['fecha_compra'])? $_POST['fecha_compra'] : NULL;
$monto_compra = isset($_POST['monto_compra'])? $_POST['monto_compra'] : NULL;
$clave = '9rCB7Sv4X29d)5k7N%3ab89p-3(5[A';
$data = CodigoControlV7::generar($numero_autorizacion, $numero_factura, $nit_cliente, $fecha_compra, $monto_compra, $clave);

echo $data;

$file = 'jr_qrcode.png';
// El tamaño de la imagen.
$size = 10;
// Capacidad de corrección de errores.
$level = QR_FORMAT_PNG;
echo QRcode::png($data, $file, $level, $size);




