<?php
  include("connect.php");
  session_start();
  
  $codedData = trim(file_get_contents("php://input"));
  $data = json_decode($codedData, true);

  $user = R::findOne('users', 'login = :login AND password = :password', [
    'login' => $data['login'],
    'password' => $data['password']
  ]);

  if (isset($user['id'])) {
    $userType = R::load('userTypes', $user['type']);

    $_SESSION['user_type'] = $userType['title'];

    echo json_encode(['status' => 'seccessful']);
  } else {
    echo json_encode(['status' => 'failed']);
  }
?>