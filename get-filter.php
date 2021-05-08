<?php
  include("connect.php");
  
  $sections = R::getAll('SELECT * FROM `sections`');
  $workTypes = R::getAll('SELECT * FROM `workTypes`');
  $fileTypes = R::getAll('SELECT * FROM `fileTypes`');
?>

<select id="filter-section">
  <option value="empty" selected>Все разделы</option>
  <?php
    foreach ($sections as $sect) {
      echo '<option value="'.$sect['id'].'">'.$sect['title'].'</option>';
    }
  ?>
</select>
<select id="filter-wt">
  <option value="empty" selected>Все виды</option>
  <?php
    foreach ($workTypes as $wt) {
      echo '<option value="'.$wt['id'].'">'.$wt['title'].'</option>';
    }
  ?>
</select>
<select id="filter-ft">
  <option value="empty" selected>Все типы</option>
  <?php
    foreach ($fileTypes as $ft) {
      echo '<option value="'.$ft['id'].'">'.$ft['title'].'</option>';
    }
  ?>
</select>