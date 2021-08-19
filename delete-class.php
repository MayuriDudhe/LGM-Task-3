<?php

session_start();

include ("init.php");
                                     
if (isset($_GET['id']))
{
    $id=$_GET['id'];
    $deleteQuery="DELETE FROM class where id=$id"; 
    mysqli_query($conn, $deleteQuery);

    echo "<script>window.location = 'manage_classes.php';</script>";
} else {
    echo "ERR!";
}

?>