<?php
  session_start();
  if (isset($_SESSION['user_type'])) {
    echo 1;
  } else {
    echo 0;
  }
?>