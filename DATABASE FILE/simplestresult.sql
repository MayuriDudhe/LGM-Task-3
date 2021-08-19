

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE TABLE `admin_login` (
  `userid` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;



INSERT INTO `admin_login` (`userid`, `password`) VALUES
('admin', 'D00F5D5217896FB7FD601412CB890830');


CREATE TABLE `class` (
  `name` varchar(30) NOT NULL,
  `id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `class` (`name`, `id`) VALUES
('Seven', 7),
('Eight', 8),
('Nine', 9),
('Ten', 10),
('Demo Class', 88);


CREATE TABLE `result` (
  `name` varchar(30) NOT NULL,
  `rno` int(3) NOT NULL,
  `class` varchar(30) NOT NULL,
  `p1` int(3) NOT NULL,
  `p2` int(3) NOT NULL,
  `p3` int(3) NOT NULL,
  `p4` int(3) NOT NULL,
  `p5` int(3) NOT NULL,
  `marks` int(3) NOT NULL,
  `percentage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `result` (`name`, `rno`, `class`, `p1`, `p2`, `p3`, `p4`, `p5`, `marks`, `percentage`) VALUES
('Ananya Nair', 10, 'Demo Class', 61, 49, 50, 55, 70, 285, 57),
('Shikha', 5, 'Nine', 71, 50, 59, 65, 75, 320, 64),
('Kim Taehyung', 11, 'Eight', 50, 50, 50, 50, 49, 249, 49.8),
('Aryan V', 21, 'Ten', 72, 68, 82, 59, 76, 357, 71.4),
('Serra', 19, 'Ten', 71, 78, 73, 82, 85, 389, 77.8);

CREATE TABLE `students` (
  `name` varchar(30) NOT NULL,
  `rno` int(3) NOT NULL,
  `class_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `students` (`name`, `rno`, `class_name`) VALUES
('Ananya Nair', 10, 'Demo Class'),
('Carol Davis', 5, 'Eight'),
('Kim Taehyung', 11, 'Eight'),
('James Peterson', 9, 'Nine'),
('Jeanne Palmer', 2, 'Nine'),
('Shikha', 5, 'Nine'),
('Lucia Muff', 12, 'Nine'),
('Rod Glover', 11, 'Nine'),
('Bran David', 15, 'Seven'),
('Miguel Tracy', 8, 'Seven'),
('Stacy', 9, 'Seven'),
('Aryan V', 21, 'Ten'),
('Serra', 19, 'Ten');

ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`userid`);

ALTER TABLE `class`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `result`
  ADD KEY `class` (`class`),
  ADD KEY `name` (`name`,`rno`);


ALTER TABLE `students`
  ADD PRIMARY KEY (`name`,`rno`),
  ADD KEY `class_name` (`class_name`);


ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`class`) REFERENCES `class` (`name`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`name`,`rno`) REFERENCES `students` (`name`, `rno`);


ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_name`) REFERENCES `class` (`name`);
