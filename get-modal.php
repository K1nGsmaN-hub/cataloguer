<?php
  include("connect.php");
  
  $categories = R::getAll('SELECT * FROM `categories`');
  $sections = R::getAll('SELECT * FROM `sections`');
  $workTypes = R::getAll('SELECT * FROM `workTypes`');
  $fileTypes = R::getAll('SELECT * FROM `fileTypes`');
  $specialties = R::getAll('SELECT * FROM `specialties`');
  $theme = R::getAll('SELECT * FROM `theme`');
?>

<div class="modal-window">
      <button class="close">&times;</button>
      <form>
        <input type="text" id="modal-id" hidden>
        <div class="field">
          <p>Наименование</p>
          <input type="text" id="modal-title">
        </div>
        <div class="field">
          <p>Автор</p>
          <input type="text" id="modal-author">
        </div>
        <div class="field">
          <p>Описание</p>
          <textarea id="modal-descr"></textarea>
        </div>
        <div class="field">
          <p>Обр. уч-ие</p>
          <input type="text" id="modal-edu">
        </div>
        <div class="field">
          <p>Категория</p>
          <select id="modal-category">
            <?php
              foreach ($categories as $categ) {
                echo '<option value="'.$categ['id'].'">'.$categ['title'].'</option>';
              }
            ?>
          </select>
        </div>
        <div class="field">
          <p>Раздел</p>
          <select id="modal-section">
            <?php
              foreach ($sections as $sect) {
                echo '<option value="'.$sect['id'].'">'.$sect['title'].'</option>';
              }
            ?>
          </select>
        </div>
        <div class="field">
          <p>Вид</p>
          <select id="modal-work">
            <?php
              foreach ($workTypes as $wt) {
                echo '<option value="'.$wt['id'].'">'.$wt['title'].'</option>';
              }
            ?>
          </select>
        </div>
        <div class="field">
          <p>Тип</p>
          <select id="modal-file">
            <?php
              foreach ($fileTypes as $ft) {
                echo '<option value="'.$ft['id'].'">'.$ft['title'].'</option>';
              }
            ?>
          </select>
        </div>
        <div class="field">
          <p>Специальность</p>
          <select id="modal-specialty">
            <?php
              foreach ($specialties as $spec) {
                echo '<option value="'.$spec['id'].'">'.$spec['title'].'</option>';
              }
            ?>
          </select>
        </div>
        <div class="field">
          <p>Тематика</p>
          <select id="modal-theme">
            <?php
              foreach ($theme as $them) {
                echo '<option value="'.$them['id'].'">'.$them['title'].'</option>';
              }
            ?>
          </select>
        </div>

        <button class="modal-update" type="submit">Обновить</button>
        <button class="modal-create" type="submit">Создать</button>
      </form>
    </div>