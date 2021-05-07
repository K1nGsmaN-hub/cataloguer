<?php
  // Подключаем автозагрузчик composer
  require_once __DIR__.'/vendor/autoload.php';
  
  // Создаём псевдоним для указанного класса
  class_alias('\RedBeanPHP\R', '\R');
  
  /**
   * Подключаемся к базе данных
   * Последний (4-й) параметр по умолчанию выставлен в FALSE
   * Если нужно применить заморозку таблиц в БД (отменить создание на лету),
   * то нужно данный параметр выставить в TRUE
   * или так: R::freeze(true);
   */
  R::setup('mysql:host=localhost;dbname=app_archive','root', '1234', false);
  
  // Проверка подключения к БД
  if(!R::testConnection()) die('No DB connection!');
  
  // R::ext('xdispense', function( $type ){
  //   return R::getRedBean()->dispense( $type );
  // });
  // Использовать так:
  // $test = R::xdispense('test_table');
?>