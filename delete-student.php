<?php

session_start();

include ("init.php");
                                     
if (isset($_GET['rno']))
{
    $rno=$_GET['rno'];
    $deleteQuery="DELETE FROM students where rno=$rno"; 
    mysqli_query($conn, $deleteQuery);

    echo "<script>window.location = 'manage_students.php';</script>";
} else {
    echo "ERR!";
}

?>