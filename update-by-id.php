<?php
  include("connect.php");

  $codedData = trim(file_get_contents("php://input"));
  $data = json_decode($codedData, true);

  if ($_GET['do'] === 'create') {
    $resource = R::dispense('resources');
  }

  if ($_GET['do'] === 'update') {
    $resource = R::load('resources', $data['id']);
  }

  $resource->title = $data['title'];
  $resource->author = $data['author'];
  $resource->descr = $data['descr'];
  $resource->edu = $data['edu'];
  $resource->category = $data['category'];
  $resource->section = $data['section'];
  $resource->specialty = $data['specialty'];
  $resource->work_type = $data['work_type'];
  $resource->file_type = $data['file_type'];
  $resource->theme = $data['theme'];

  R::store($resource);
?>