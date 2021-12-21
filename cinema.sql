-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 16 2021 г., 14:56
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cinema`
--

-- --------------------------------------------------------

--
-- Структура таблицы `agelimits`
--

CREATE TABLE `agelimits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `AgeLimit` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `agelimits`
--

INSERT INTO `agelimits` (`id`, `AgeLimit`) VALUES
(1, 'G'),
(2, 'PG'),
(3, 'PG-13'),
(4, 'R'),
(5, 'NC-17');

-- --------------------------------------------------------

--
-- Структура таблицы `autors`
--

CREATE TABLE `autors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Surname` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `autors`
--

INSERT INTO `autors` (`id`, `Name`, `Surname`) VALUES
(1, 'Hayao ', 'Miyazaki'),
(2, 'Makoto ', 'Shinkai'),
(3, 'David ', 'Heiman'),
(4, 'George ', 'Lucas'),
(5, 'James ', 'Cameron'),
(6, 'Guy', 'Ritchie'),
(7, 'Hideaki', 'Anno'),
(8, 'Billy ', 'Wilder'),
(9, 'Stanley ', 'Kubrick'),
(10, 'Quentin', 'Jerome Tarantino');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Surname` varchar(40) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Adress` varchar(40) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Login` varchar(16) NOT NULL,
  `Password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `Name`, `Surname`, `PhoneNumber`, `Adress`, `DateOfBirth`, `Login`, `Password`) VALUES
(1, 'Todd ', 'Howard', '+380637097356', ' Pennsylvania, USA', '1971-04-25', 'BuySkyrim', 'PlzBuySkyrim'),
(2, 'Chris ', 'Avellone', '+380637097355', ' Virginia, USA', '1971-09-27', 'IHATeTODD', 'PlzNotBuySkyrim'),
(3, 'Vlad', 'Bulakh', '+380637097357', 'Chernihiv, Ukraine', '2001-09-08', 'Brotchen', '12345LolImBrotchen'),
(4, 'Slava', 'Karpenko', '+380637097358', 'Chernihiv, Ukraine', '2000-10-11', 'SuicideBOi', 'IhatewalkToSTU'),
(5, 'Kolya', 'Bushnin', '+380979129041', 'Chernihiv, Ukraine', '2001-03-02', 'MadnessTeapot', 'ihatebdlol'),
(6, 'Vika', 'Godun', '+380 98 007 07 ', 'Chernihiv, Ukraine', '2001-02-18', 'lilu_sunny', 'shitshit'),
(7, 'Rostislav', 'Denisenko', '+380 66 433 38 ', 'Chernihiv, Ukraine', '2001-11-17', 'Droll', '2352t32523421'),
(8, 'Dima', 'RvanaiySvinina', '+380 952342422', 'Chernihiv, Ukraine', '1999-08-09', 'meeeeeet', 'FRESHMEEEET'),
(9, 'Madness', 'Teapot', '+380979723239', 'Chernihiv, Ukraine', '2001-03-02', 'teapotofmad', 'kolya231223'),
(10, 'Serhii', 'Gonta', '+380 63 203 23 ', 'Chernihiv, Ukraine', '1993-08-11', 'VanWanderer', 'whatthefoxsay?'),
(11, ' Test', 'Test', '2222222', '222222', '0002-02-22', '2', '2');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `CountryName` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `CountryName`) VALUES
(1, 'UK'),
(2, 'USA'),
(3, 'Japan'),
(4, 'Ukraine'),
(5, 'Scotland'),
(6, 'France'),
(7, 'Greece'),
(8, 'Spain'),
(9, 'Poland '),
(10, 'Turkey');

-- --------------------------------------------------------

--
-- Структура таблицы `films`
--

CREATE TABLE `films` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Genre_ID` bigint(20) UNSIGNED NOT NULL,
  `DateOfRelease` date DEFAULT NULL,
  `Autor_ID` bigint(20) UNSIGNED NOT NULL,
  `AgeLimit_ID` bigint(20) UNSIGNED NOT NULL,
  `TranslateType_ID` bigint(20) UNSIGNED NOT NULL,
  `Country_ID` bigint(20) UNSIGNED NOT NULL,
  `InStock` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `films`
--

INSERT INTO `films` (`id`, `Name`, `Genre_ID`, `DateOfRelease`, `Autor_ID`, `AgeLimit_ID`, `TranslateType_ID`, `Country_ID`, `InStock`) VALUES
(1, 'Avatar', 6, '2009-12-17', 5, 3, 3, 2, 1),
(2, 'Harry Potter and the Philosopher\'s Stone', 6, '2001-11-04', 3, 2, 1, 1, 1),
(3, 'Star Wars: Episode III', 2, '2005-05-15', 4, 1, 2, 2, 0),
(4, 'Your Name', 2, '2016-01-26', 2, 4, 1, 3, 1),
(5, 'My Neighbor Totoro', 3, '1988-04-18', 1, 5, 3, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `GenreName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`id`, `GenreName`) VALUES
(1, 'Action'),
(2, 'Drama '),
(3, 'Comedy'),
(4, 'Horror'),
(5, 'Sport'),
(6, 'Fantasy'),
(7, ' biographical'),
(8, 'thriller'),
(9, 'documentary'),
(10, 'Western');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Client_ID` bigint(20) UNSIGNED NOT NULL,
  `Film_ID` bigint(20) UNSIGNED NOT NULL,
  `TimeOfOrder` time NOT NULL,
  `Price` decimal(10,0) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `Client_ID`, `Film_ID`, `TimeOfOrder`, `Price`) VALUES
(1, 3, 4, '02:00:00', '90'),
(2, 5, 5, '02:00:00', '90'),
(3, 4, 1, '03:00:00', '90'),
(4, 1, 2, '03:00:00', '90'),
(5, 2, 3, '04:00:00', '110'),
(6, 10, 3, '05:00:00', '25'),
(7, 6, 1, '05:00:00', '30'),
(8, 7, 2, '00:00:01', '50'),
(9, 9, 4, '23:00:00', '40'),
(10, 8, 2, '03:00:00', '10');

-- --------------------------------------------------------

--
-- Структура таблицы `translatetypes`
--

CREATE TABLE `translatetypes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `TypeName` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `translatetypes`
--

INSERT INTO `translatetypes` (`id`, `TypeName`) VALUES
(1, 'subtitles'),
(2, 'voice-over'),
(3, 'dubbing');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `agelimits`
--
ALTER TABLE `agelimits`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `autors`
--
ALTER TABLE `autors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Country_ID` (`Country_ID`),
  ADD KEY `TranslateType_ID` (`TranslateType_ID`),
  ADD KEY `AgeLimit_ID` (`AgeLimit_ID`),
  ADD KEY `Autor_ID` (`Autor_ID`),
  ADD KEY `Genre_ID` (`Genre_ID`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Client_ID` (`Client_ID`),
  ADD KEY `Film_ID` (`Film_ID`);

--
-- Индексы таблицы `translatetypes`
--
ALTER TABLE `translatetypes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `agelimits`
--
ALTER TABLE `agelimits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `autors`
--
ALTER TABLE `autors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `films`
--
ALTER TABLE `films`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `translatetypes`
--
ALTER TABLE `translatetypes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`AgeLimit_ID`) REFERENCES `agelimits` (`id`),
  ADD CONSTRAINT `films_ibfk_2` FOREIGN KEY (`Genre_ID`) REFERENCES `genres` (`id`),
  ADD CONSTRAINT `films_ibfk_3` FOREIGN KEY (`Autor_ID`) REFERENCES `autors` (`id`),
  ADD CONSTRAINT `films_ibfk_4` FOREIGN KEY (`Country_ID`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `films_ibfk_5` FOREIGN KEY (`TranslateType_ID`) REFERENCES `translatetypes` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Film_ID`) REFERENCES `films` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
