<?php
  include("connect.php");

  $resource = R::load('resources', $_GET['id']);
  echo json_encode($resource);
?>