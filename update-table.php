<?php
  include("connect.php");
  
  $resources = R::getAll('SELECT * FROM `resources`');

  foreach ($resources as $res) {
    echo "<tr data-id='".$res['id']."'>";
      echo "<td>".$res['title']."</td>";
      echo "<td>".$res['author']."</td>";

      echo "<td>".R::load('categories', $res['category'])->title."</td>";

    echo "</tr>";
  }
?>

