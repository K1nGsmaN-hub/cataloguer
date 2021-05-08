-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 08 2021 г., 18:50
-- Версия сервера: 8.0.23
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `app_archive`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'откл.'),
(2, 'зас.');

-- --------------------------------------------------------

--
-- Структура таблицы `fileTypes`
--

CREATE TABLE `fileTypes` (
  `id` int NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `fileTypes`
--

INSERT INTO `fileTypes` (`id`, `title`) VALUES
(1, 'Тестовый документ'),
(2, 'Таблица Excel'),
(3, 'PDF');

-- --------------------------------------------------------

--
-- Структура таблицы `resources`
--

CREATE TABLE `resources` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `descr` text NOT NULL,
  `edu` varchar(255) NOT NULL,
  `category` int NOT NULL,
  `section` int NOT NULL,
  `work_type` int NOT NULL,
  `file_type` int NOT NULL,
  `specialty` int NOT NULL,
  `theme` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `resources`
--

INSERT INTO `resources` (`id`, `title`, `author`, `descr`, `edu`, `category`, `section`, `work_type`, `file_type`, `specialty`, `theme`) VALUES
(1, 'Методические рекомендации для учителя по использованию ментальной арифметики в начальной школе', 'Кадашникова Анастасия Александровна; Руководитель: Якимова М. В.', 'В работе раскрыты сущности использования ментальной арифметике в начальной школе; подобраны материалы для формирования ментальной арифметике в первом классе;', 'ГБПОУ ИО ИРКПО', 1, 1, 1, 1, 1, 1),
(2, 'Какое-то название', 'Какой-то автор', 'Какое-то описание', 'Какое-то обр. уч-ие', 2, 6, 2, 3, 2, 2),
(3, 'Диплом', 'Илья', 'rewrwe', 'ГБПОУ ИО ИРКПО', 2, 1, 1, 1, 2, 2),
(4, '1dasda', 'dsadsa', '', 'dasdas', 1, 6, 1, 1, 1, 1),
(5, 'dsa', 'dasdsa', '', 'das', 1, 1, 1, 1, 1, 1),
(6, 'das', 'dsa', 'В работе раскрыты сущности использования ментальной арифметике в начальной школе; подобраны материалы для формирования ментальной арифметике в первом классе;', 'dsa', 1, 1, 1, 1, 1, 1),
(7, 'eqw', 'eqw', '', 'eqw', 1, 4, 1, 1, 1, 1),
(8, 'привет', 'Андрей', '', 'болото', 1, 2, 2, 3, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sections`
--

CREATE TABLE `sections` (
  `id` int NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sections`
--

INSERT INTO `sections` (`id`, `title`) VALUES
(1, 'Математика'),
(2, 'Литература'),
(3, 'Русский язык'),
(4, 'Физика'),
(5, 'Химия'),
(6, 'Биология');

-- --------------------------------------------------------

--
-- Структура таблицы `specialties`
--

CREATE TABLE `specialties` (
  `id` int NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `specialties`
--

INSERT INTO `specialties` (`id`, `title`) VALUES
(1, 'Преподавание в начальных классах'),
(2, 'Прикладная информатика');

-- --------------------------------------------------------

--
-- Структура таблицы `theme`
--

CREATE TABLE `theme` (
  `id` int NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `theme`
--

INSERT INTO `theme` (`id`, `title`) VALUES
(1, 'Исследовательская деятельность студентов'),
(2, 'что-то ещё');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `type`) VALUES
(1, 'admin', 'secret', 1),
(2, 'teacher', '123456', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `userTypes`
--

CREATE TABLE `userTypes` (
  `id` int NOT NULL,
  `title` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `userTypes`
--

INSERT INTO `userTypes` (`id`, `title`) VALUES
(1, 'moder'),
(2, 'viewer');

-- --------------------------------------------------------

--
-- Структура таблицы `workTypes`
--

CREATE TABLE `workTypes` (
  `id` int NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `workTypes`
--

INSERT INTO `workTypes` (`id`, `title`) VALUES
(1, 'Выпускная квалификационная работа'),
(2, 'что-то ещё');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fileTypes`
--
ALTER TABLE `fileTypes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `section` (`section`,`work_type`,`file_type`,`specialty`,`theme`),
  ADD KEY `specialty` (`specialty`),
  ADD KEY `file_type` (`file_type`),
  ADD KEY `work_type` (`work_type`),
  ADD KEY `theme` (`theme`);

--
-- Индексы таблицы `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `userTypes`
--
ALTER TABLE `userTypes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `workTypes`
--
ALTER TABLE `workTypes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `fileTypes`
--
ALTER TABLE `fileTypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `theme`
--
ALTER TABLE `theme`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `userTypes`
--
ALTER TABLE `userTypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `workTypes`
--
ALTER TABLE `workTypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `resources_ibfk_2` FOREIGN KEY (`section`) REFERENCES `sections` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `resources_ibfk_3` FOREIGN KEY (`specialty`) REFERENCES `specialties` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `resources_ibfk_4` FOREIGN KEY (`file_type`) REFERENCES `fileTypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `resources_ibfk_5` FOREIGN KEY (`work_type`) REFERENCES `workTypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `resources_ibfk_6` FOREIGN KEY (`theme`) REFERENCES `theme` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type`) REFERENCES `userTypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
