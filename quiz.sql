-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 23 Eki 2018, 11:54:40
-- Sunucu sürümü: 10.1.35-MariaDB
-- PHP Sürümü: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `quiz`
--
CREATE DATABASE IF NOT EXISTS `quiz` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `quiz`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `options`
--

CREATE TABLE `options` (
  `OptionID` int(50) NOT NULL,
  `OptionName` varchar(255) NOT NULL,
  `QuestionID` int(50) NOT NULL,
  `IsTrue` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `options`
--

INSERT INTO `options` (`OptionID`, `OptionName`, `QuestionID`, `IsTrue`) VALUES
(1, 'Option1', 1, 1),
(2, 'Option2', 1, 0),
(3, 'option3', 1, 0),
(4, 'option4', 1, 0),
(5, 'option1', 2, 1),
(6, 'option2', 2, 0),
(7, 'option3', 2, 0),
(8, 'option4', 2, 0),
(9, 'Option 1', 3, 0),
(10, 'Option 2', 3, 0),
(11, 'Option 3', 3, 1),
(12, 'Option 4', 3, 0),
(13, 'Personal Hypertext Processor', 4, 0),
(14, 'PHP: Hypertext Preprocessor', 4, 1),
(15, 'Private Home Page', 4, 0),
(16, 'Personal Home Page', 4, 0),
(17, '<&>...</&>', 5, 0),
(18, '<?php>...</?>', 5, 0),
(19, '<script>...</script>', 5, 0),
(20, '<?php...?>', 5, 1),
(21, '\"Hello World\";', 6, 0),
(22, 'echo \"Hello World\";', 6, 1),
(23, 'Document.Write(\"Hello World\");', 6, 0),
(24, 'System.Out.println(\"Hello World\")', 6, 0),
(25, '!', 7, 0),
(26, '&', 7, 0),
(27, '$', 7, 1),
(29, '</php>', 8, 0),
(30, '.', 8, 0),
(31, 'New line', 8, 0),
(32, ';', 8, 1),
(33, 'Request.Form;', 9, 0),
(34, '$_GET[];', 9, 1),
(35, 'Request.QueryString;', 9, 0),
(36, '.get()', 9, 0),
(37, '<?php include file=\"time.inc\"; ?>', 10, 0),
(38, '<?php include:\"time.inc\"; ?>', 10, 0),
(39, '<!-- include file=\"time.inc\" -->', 10, 0),
(40, '<?php include \"time.inc\"; ?>', 10, 1),
(41, 'create myFunction()', 11, 0),
(42, 'new_function myFunction()', 11, 0),
(43, 'function myFunction()', 11, 1),
(44, '() => myFunction', 11, 0),
(45, 'fopen(\"time.txt\",\"r\");', 12, 1),
(46, 'open(\"time.txt\",\"read\");', 12, 0),
(47, 'fopen(\"time.txt\",\"r+\");', 12, 0),
(48, 'open(\"time.txt\");', 12, 0),
(49, '$count =+1', 13, 0),
(50, 'count++;', 13, 0),
(51, '++count', 13, 0),
(52, '$count++;', 13, 1),
(53, '<comment>...</comment>', 14, 0),
(54, '/*...*/', 14, 1),
(55, '*...*', 14, 0),
(56, '<!--...-->', 14, 0),
(57, '$my_Var', 15, 0),
(58, '$myVar', 15, 0),
(59, '$my-Var', 15, 1),
(60, '$myvar', 15, 0),
(61, 'setcookie()', 16, 1),
(62, 'createcookie', 16, 0),
(63, 'makecookie()', 16, 0),
(64, 'cookie.set', 16, 0),
(65, '$cars = array[\"Volvo\", \"BMW\", \"Toyota\"];', 17, 0),
(66, '$cars = \"Volvo\", \"BMW\", \"Toyota\";', 17, 0),
(67, '$cars = array(\"Volvo\", \"BMW\", \"Toyota\");', 17, 1),
(68, 'array[] $cars = {\"Volvo\", \"BMW\", \"Toyota\");', 17, 0),
(69, '==', 18, 0),
(70, '!=', 18, 0),
(71, '===', 18, 1),
(72, '=', 18, 0),
(73, '8', 19, 0),
(74, '9', 19, 0),
(75, '10', 19, 0),
(76, '11', 19, 1),
(77, '1', 20, 0),
(78, '2', 20, 1),
(79, '3', 20, 0),
(80, '4', 20, 0),
(81, '732', 21, 0),
(82, '742', 21, 1),
(83, '752', 21, 0),
(84, '762', 21, 0),
(85, 'Quentin Tarantino', 22, 1),
(86, 'Steven Spielberg', 22, 0),
(87, 'Stanley Kubrick', 22, 0),
(88, 'Tim Burton', 22, 0),
(89, 'Table Tennis', 23, 0),
(90, 'Soccer', 23, 0),
(91, 'Sumo Wrestling', 23, 1),
(92, 'Curling', 23, 0),
(93, '60 Minutes', 24, 0),
(94, '80 Minutes', 24, 1),
(95, '90 Minutes', 24, 0),
(96, '120 Minutes', 24, 0),
(97, 'Greece', 25, 1),
(98, 'Spain', 25, 0),
(99, 'USA', 25, 0),
(100, 'Sydney', 25, 0),
(101, '2', 26, 1),
(102, '4', 26, 0),
(103, '6', 26, 0),
(104, '8', 26, 0),
(105, 'Ferrari', 27, 0),
(106, 'McLaren', 27, 0),
(107, 'Sauber', 27, 0),
(108, 'Renault', 27, 1),
(109, 'Tennis', 28, 1),
(110, 'Basketball', 28, 0),
(111, 'Soccer', 28, 0),
(112, 'Golf', 28, 0),
(113, 'Jon Bon Jovi', 29, 0),
(114, 'Robbie Williams', 29, 0),
(115, 'Michael Jackson', 29, 1),
(116, 'Madonna', 29, 0),
(117, 'Bon Scott', 30, 1),
(118, 'Robert Plant', 30, 0),
(119, 'Ian Gillan', 30, 0),
(120, 'Freddy Mercury', 30, 0),
(121, 'Tenor', 31, 0),
(122, 'Baritone', 31, 0),
(123, 'Bass', 31, 1),
(124, 'Soprano', 31, 0),
(125, 'Pink Floyd', 32, 0),
(126, 'The Beatles', 32, 1),
(127, 'Led Zeppelin', 32, 0),
(128, 'Deep Purple', 32, 0),
(129, 'True', 33, 1),
(130, 'False', 33, 0),
(131, 'Option  1', 34, 1),
(132, 'Option  2', 34, 0),
(133, 'Option  3', 34, 0),
(134, 'Option  4', 34, 0),
(135, 'Option  5', 34, 0),
(136, 'Option  6', 34, 0),
(137, 'Option  7', 34, 0),
(138, 'Option  8', 34, 0),
(139, 'Option  9', 34, 0),
(140, 'Option  10', 34, 0),
(141, 'Option  1', 35, 0),
(142, 'Option  2', 35, 1),
(143, 'Option  1', 36, 0),
(144, 'Option  2', 36, 1),
(145, 'Option  3', 36, 0),
(146, 'Option  4', 36, 0),
(147, 'Option  5', 36, 0),
(148, 'Option  6', 36, 0),
(149, 'Option  7', 36, 0),
(150, 'Option  8', 36, 0),
(151, 'Option  9', 36, 0),
(152, 'Option  1', 37, 0),
(153, 'Option  2', 37, 0),
(154, 'Option  3', 37, 0),
(155, 'Option  4', 37, 0),
(156, 'Option  5', 37, 1),
(157, 'Option  1', 38, 0),
(158, 'Option  2', 38, 0),
(159, 'Option  3', 38, 1),
(160, 'Option  4', 38, 0),
(161, 'Option  1', 39, 0),
(162, 'Option  2', 39, 0),
(163, 'Option  3', 39, 0),
(164, 'Option  4', 39, 1),
(165, 'Option  5', 39, 0),
(166, 'Option  6', 39, 0),
(167, 'Option  1', 40, 0),
(168, 'Option  2', 40, 0),
(169, 'Option  3', 40, 1),
(170, 'Option  4', 40, 0),
(171, 'Option  5', 40, 0),
(172, 'Option  6', 40, 0),
(173, 'Option  7', 40, 0),
(174, 'Option  1', 41, 1),
(175, 'Option  2', 41, 0),
(176, 'Option  3', 41, 0),
(177, 'Option  4', 41, 0),
(178, 'Option  5', 41, 0),
(179, 'Option  6', 41, 0),
(180, 'Option  7', 41, 0),
(181, 'Option  8', 41, 0),
(182, 'Option  1', 42, 1),
(183, 'Option  2', 42, 0),
(184, 'Option  1', 43, 1),
(185, 'Option  2', 43, 0),
(186, 'Option  1', 44, 0),
(187, 'Option  2', 44, 0),
(188, 'Option  3', 44, 1),
(189, 'Option  1', 45, 0),
(190, 'Option  2', 45, 0),
(191, 'Option  3', 45, 1),
(192, 'Option  4', 45, 0),
(193, 'Option  5', 45, 0),
(194, 'Option  1', 46, 1),
(195, 'Option  2', 46, 0),
(196, 'Option  1', 47, 0),
(197, 'Option  2', 47, 0),
(198, 'Option  3', 47, 1),
(199, 'Option  4', 47, 0),
(200, 'Option  1', 48, 0),
(201, 'Option  2', 48, 1),
(202, 'Option  1', 49, 0),
(203, 'Option  2', 49, 0),
(204, 'Option  3', 49, 0),
(205, 'Option  4', 49, 0),
(206, 'Option  5', 49, 0),
(207, 'Option  6', 49, 1),
(208, 'Option  7', 49, 0),
(209, 'Option  8', 49, 0),
(210, 'Option  1', 50, 0),
(211, 'Option  2', 50, 1),
(212, 'Option  1', 51, 1),
(213, 'Option  2', 51, 0),
(214, 'Option  1', 52, 0),
(215, 'Option  2', 52, 0),
(216, 'Option  3', 52, 1),
(217, 'Option  1', 53, 0),
(218, 'Option  2', 53, 0),
(219, 'Option  3', 53, 1),
(220, 'Option  4', 53, 0),
(221, 'Option  5', 53, 0),
(222, 'Option  1', 54, 1),
(223, 'Option  2', 54, 0),
(224, 'Option  1', 55, 0),
(225, 'Option  2', 55, 0),
(226, 'Option  3', 55, 1),
(227, 'Option  4', 55, 0),
(228, 'Option  1', 56, 0),
(229, 'Option  2', 56, 1),
(230, 'Option  1', 57, 0),
(231, 'Option  2', 57, 1),
(232, 'Option  3', 57, 0),
(233, 'Option  4', 57, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `questions`
--

CREATE TABLE `questions` (
  `QuestionID` int(50) NOT NULL,
  `QuestionName` varchar(255) NOT NULL,
  `QuizID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `questions`
--

INSERT INTO `questions` (`QuestionID`, `QuestionName`, `QuizID`) VALUES
(1, 'First Question', 1),
(2, 'Second Question', 1),
(3, 'Third Question', 1),
(4, 'What does PHP stand for?', 3),
(5, 'PHP server scripts are surrounded by delimiters, which?', 3),
(6, 'How do you write \"Hello World\" in PHP', 3),
(7, 'All variables in PHP start with which symbol?', 3),
(8, 'What is the correct way to end a PHP statement?', 3),
(9, 'How do you get information from a form that is submitted using the \"get\" method?', 3),
(10, 'What is the correct way to include the file \"time.inc\"?', 3),
(11, 'What is the correct way to create a function in PHP?', 3),
(12, 'What is the correct way to open the file \"time.txt\" as readable?', 3),
(13, 'What is the correct way to add 1 to the $count variable?', 3),
(14, 'What is a correct way to add a comment in PHP?', 3),
(15, 'Which one of these variables has an illegal name?', 3),
(16, 'How do you create a cookie in PHP?', 3),
(17, 'How do you create an array in PHP?', 3),
(18, 'Which operator is used to check if two values are equal and of same data type?', 3),
(19, 'How many oscars did the Titanic movie got?', 4),
(20, 'How many Tomb Raider movies were made?', 4),
(21, 'What is the house number of the Simpsons?', 4),
(22, 'Who is the director of Reservoir Dogs?', 4),
(23, 'What is the national sport in Japan?', 5),
(24, 'How many minutes is a rugby match?', 5),
(25, 'In which country were the first Olympic Games held?', 5),
(26, 'How many players are on each side of the net in beach volleyball?', 5),
(27, 'Which car won Fernando Alonso his first tittle in Formula 1 with?', 5),
(28, 'In which sport can you win the Davis Cup?', 5),
(29, 'Who did win the most Grammy Awards in the 80?', 6),
(30, 'What was the name of AC / DC s lead singer who died in 1980?', 6),
(31, 'What is the lowest male voice?', 6),
(32, 'Which famous group was once known as The Quarrymen?', 6),
(33, 'PHP can be run on Microsoft Windows IIS(Internet Information Server)', 3),
(34, 'Question 1', 2),
(35, 'Question 2', 2),
(36, 'Question 3', 2),
(37, 'Question 4', 2),
(38, 'Question 5', 2),
(39, 'Question 6', 2),
(40, 'Question 7', 2),
(41, 'Question 8', 2),
(42, 'Question 9', 2),
(43, 'Question 10', 2),
(44, 'Question 11', 2),
(45, 'Question 12', 2),
(46, 'Question 13', 2),
(47, 'Question 14', 2),
(48, 'Question 15', 2),
(49, 'Question 16', 2),
(50, 'Question 17', 2),
(51, 'Question 18', 2),
(52, 'Question 19', 2),
(53, 'Question 20', 2),
(54, 'Question 21', 2),
(55, 'Question 22', 2),
(56, 'Question 23', 2),
(57, 'Question 24', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `quizzes`
--

CREATE TABLE `quizzes` (
  `QuizID` int(50) NOT NULL,
  `QuizName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `quizzes`
--

INSERT INTO `quizzes` (`QuizID`, `QuizName`) VALUES
(1, 'Basic Test'),
(2, 'Multiple Choice Test'),
(3, 'PHP'),
(4, 'Movie'),
(5, 'Sports'),
(6, 'Music');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `transaction`
--

CREATE TABLE `transaction` (
  `TransactionID` varchar(20) NOT NULL,
  `UserID` varchar(20) NOT NULL,
  `QuizID` int(11) NOT NULL,
  `Score` int(11) DEFAULT NULL,
  `TransactionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `transaction`
--

INSERT INTO `transaction` (`TransactionID`, `UserID`, `QuizID`, `Score`, `TransactionDate`) VALUES
('5bceebd145e45', '5bceebd1448d1', 1, 66, '2018-10-23 12:37:21');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `transactiondetails`
--

CREATE TABLE `transactiondetails` (
  `TransactionDetailsID` varchar(20) NOT NULL,
  `TransactionID` varchar(20) NOT NULL,
  `UserID` varchar(20) NOT NULL,
  `QuizID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `AnswerID` int(11) NOT NULL,
  `TransactionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsTrue` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `transactiondetails`
--

INSERT INTO `transactiondetails` (`TransactionDetailsID`, `TransactionID`, `UserID`, `QuizID`, `QuestionID`, `AnswerID`, `TransactionDate`, `IsTrue`) VALUES
('5bceebe0ad585', '5bceebd145e45', '5bceebd1448d1', 1, 1, 1, '2018-10-23 12:37:36', 1),
('5bceebecc6bb8', '5bceebd145e45', '5bceebd1448d1', 1, 2, 5, '2018-10-23 12:37:48', 1),
('5bceec0157ff1', '5bceebd145e45', '5bceebd1448d1', 1, 3, 9, '2018-10-23 12:38:09', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `UserID` varchar(50) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `TransactionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`UserID`, `Username`, `TransactionDate`) VALUES
('5bceebd1448d1', 'John Doe', '2018-10-23 12:37:21');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`OptionID`),
  ADD KEY `QuestionID` (`QuestionID`);

--
-- Tablo için indeksler `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`QuestionID`),
  ADD KEY `QuizID` (`QuizID`);

--
-- Tablo için indeksler `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`QuizID`);

--
-- Tablo için indeksler `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `TransactionID` (`TransactionID`);

--
-- Tablo için indeksler `transactiondetails`
--
ALTER TABLE `transactiondetails`
  ADD PRIMARY KEY (`TransactionDetailsID`),
  ADD KEY `TransactionID` (`TransactionID`),
  ADD KEY `TransactionID_2` (`TransactionID`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `options`
--
ALTER TABLE `options`
  MODIFY `OptionID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- Tablo için AUTO_INCREMENT değeri `questions`
--
ALTER TABLE `questions`
  MODIFY `QuestionID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
