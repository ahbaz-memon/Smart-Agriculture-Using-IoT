-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2020 at 08:26 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ddms`
--

-- --------------------------------------------------------

--
-- Table structure for table `consumes`
--

CREATE TABLE `consumes` (
  `ssn` int(11) NOT NULL,
  `drug_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consumes`
--

INSERT INTO `consumes` (`ssn`, `drug_id`) VALUES
(1, 200),
(1, 228),
(2, 150),
(2, 201),
(3, 200),
(3, 201),
(3, 223),
(4, 600),
(4, 565),
(4, 322),
(5, 250),
(6, 228),
(6, 322),
(7, 264),
(8, 201),
(8, 228),
(9, 565),
(9, 322),
(10, 150),
(10, 200),
(10, 201),
(10, 600);

--
-- Triggers `consumes`
--
DELIMITER $$
CREATE TRIGGER `loggin` AFTER INSERT ON `consumes` FOR EACH ROW BEGIN
INSERT into userdata VALUES(id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `consumption_reason`
--

CREATE TABLE `consumption_reason` (
  `ssn` int(11) DEFAULT NULL,
  `period` int(11) NOT NULL,
  `tone` char(10) DEFAULT 'neutral',
  `reason` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consumption_reason`
--

INSERT INTO `consumption_reason` (`ssn`, `period`, `tone`, `reason`) VALUES
(1, 2, 'sad', 'A'),
(2, 3, 'neutral', 'B'),
(3, 5, 'angry', 'C'),
(4, 1, 'neutral', 'D'),
(5, 4, 'neutral', 'E'),
(5, 7, 'fun', 'F'),
(6, 3, 'sad', 'G'),
(7, 2, 'neutral', 'H'),
(8, 5, 'sad', 'I'),
(9, 4, 'happy', 'J'),
(10, 2, 'angry', 'K');

-- --------------------------------------------------------

--
-- Table structure for table `drug_addict`
--

CREATE TABLE `drug_addict` (
  `ssn` int(11) NOT NULL,
  `fname` char(15) DEFAULT '',
  `lname` char(15) DEFAULT '',
  `dob` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `rehab_id` int(11) DEFAULT NULL,
  `admit_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drug_addict`
--

INSERT INTO `drug_addict` (`ssn`, `fname`, `lname`, `dob`, `address`, `rehab_id`, `admit_date`) VALUES
(1, 'tracey', 'mitchell', '1979-10-19', 'new york', 107, '1991-03-09'),
(2, 'aiden', 'helton', '1950-01-01', 'canada', 103, '1975-06-29'),
(3, 'bradd', 'pitman', '1945-09-17', 'california', 108, '1978-05-19'),
(4, 'abbey', 'zorzi', '1991-05-06', 'washington', 100, '2008-07-02'),
(5, 'matthew', 'mckinney', '1987-03-15', 'new york', 101, '2004-12-14'),
(6, 'chelsea', 'heptig', '1984-05-09', 'bolivia', 108, '2006-02-03'),
(7, 'jeremy', 'traylor', '1989-06-10', 'chile', 104, '2003-07-06'),
(8, 'maery', 'lonaio', '1996-08-19', 'cuba', 105, '2011-03-19'),
(9, 'mark', 'bauer', '1980-08-21', 'california', 102, '1996-05-18'),
(10, 'jordan', 'cole', '2000-04-10', 'washington', 109, '2013-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `drug_data`
--

CREATE TABLE `drug_data` (
  `drug_id` int(11) NOT NULL,
  `name` char(15) DEFAULT '',
  `trigger_time` int(11) DEFAULT NULL,
  `poison_name` char(15) DEFAULT '',
  `poison_concentration` int(11) NOT NULL
) ;

--
-- Dumping data for table `drug_data`
--

INSERT INTO `drug_data` (`drug_id`, `name`, `trigger_time`, `poison_name`, `poison_concentration`) VALUES
(150, 'MDMA', 3600, 'DMS', 40),
(200, 'alcohol', 1200, 'acetaldehyde', 10),
(201, 'oxycodone', 4400, 'oxycotin', 23),
(223, 'vicodin', 7200, 'hydrocodone', 5),
(228, 'heroin', 45, 'morphine sub.', 86),
(250, 'xanax', 1600, 'benzodiazepine', 53),
(264, 'steroid', 18000, 'AAS', 81),
(322, 'marijana', 12500, 'THC', 65),
(565, 'opiates', 7200, 'hydrodone', 25),
(600, 'caffeine', 144000, 'xanthine', 98);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ssn` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 5,
  `comment` varchar(500) DEFAULT ' '
) ;

-- --------------------------------------------------------

--
-- Table structure for table `has_database`
--

CREATE TABLE `has_database` (
  `drug_id` int(11) DEFAULT NULL,
  `rehab_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `has_database`
--

INSERT INTO `has_database` (`drug_id`, `rehab_id`) VALUES
(150, 100),
(200, 100),
(201, 100),
(223, 100),
(228, 100),
(250, 100),
(264, 100),
(322, 100),
(565, 100),
(600, 100),
(150, 101),
(200, 101),
(201, 101),
(223, 101),
(228, 101),
(250, 101),
(264, 101),
(322, 101),
(565, 101),
(600, 101),
(150, 102),
(200, 102),
(201, 102),
(223, 102),
(228, 102),
(250, 102),
(264, 102),
(322, 102),
(565, 102),
(600, 102),
(150, 103),
(200, 103),
(201, 103),
(223, 103),
(228, 103),
(250, 103),
(264, 103),
(322, 103),
(565, 103),
(600, 103),
(150, 104),
(200, 104),
(201, 104),
(223, 104),
(228, 104),
(250, 104),
(264, 104),
(322, 104),
(565, 104),
(600, 104),
(150, 105),
(200, 105),
(201, 105),
(223, 105),
(228, 105),
(250, 105),
(264, 105),
(322, 105),
(565, 105),
(600, 105),
(150, 106),
(200, 106),
(201, 106),
(223, 106),
(228, 106),
(250, 106),
(264, 106),
(322, 106),
(565, 106),
(150, 107),
(200, 107),
(201, 107),
(223, 107),
(228, 107),
(250, 107),
(264, 107),
(322, 107),
(565, 107),
(600, 107),
(150, 108),
(200, 108),
(201, 108),
(223, 108),
(228, 108),
(250, 108),
(264, 108),
(322, 108),
(565, 108),
(600, 108),
(150, 109),
(200, 109),
(201, 109),
(223, 109),
(228, 109),
(250, 109),
(264, 109),
(322, 109),
(565, 109),
(600, 109);

-- --------------------------------------------------------

--
-- Table structure for table `has_effects`
--

CREATE TABLE `has_effects` (
  `drug_id` int(11) DEFAULT NULL,
  `s_id` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `has_effects`
--

INSERT INTO `has_effects` (`drug_id`, `s_id`) VALUES
(150, 'b'),
(150, 'c'),
(200, 'b'),
(200, 'j'),
(201, 'a'),
(201, 'e'),
(201, 'f'),
(223, 'j'),
(223, 'i'),
(228, 'a'),
(228, 'g'),
(228, 'j'),
(250, 'h'),
(250, 'c'),
(264, 'a'),
(264, 'j'),
(322, 'g'),
(322, 'h'),
(322, 'j'),
(565, 'j'),
(565, 'g'),
(600, 'e');

-- --------------------------------------------------------

--
-- Table structure for table `manual`
--

CREATE TABLE `manual` (
  `drug_id` int(11) DEFAULT NULL,
  `component` varchar(100) DEFAULT NULL,
  `temperature` int(11) DEFAULT NULL,
  `pressure` decimal(4,2) DEFAULT NULL,
  `concentration` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `manual`
--

INSERT INTO `manual` (`drug_id`, `component`, `temperature`, `pressure`, `concentration`) VALUES
(150, '3,4-Methylenedioxymethamphetamine', 111, '0.05', 70),
(200, 'ethanol', 286, '0.06', 10),
(201, '4, 5α-epoxy-14-hydroxy-3-methoxy-17-methylmorphinan-6-one hydrochloride', 295, '1.00', 20),
(223, '4,5α-epoxy-3-methoxy-17-methylmorphinan-6-one tartrate (1:1) hydrate (2:5)', 293, '1.00', 17),
(228, '3-heptanone, 6-(dimethylamino)- 4,4-diphenyl-, hydrochloride', 296, '1.00', 20),
(250, '8-chloro-1-methyl-6-phenyl-4H-[1,2,4]triazolo[4,3-a][1,4]benzodiazepine', 296, '1.00', 17),
(264, 'C87H130N14O21', 281, '0.50', 90),
(322, '(6aS,10aS)-6,6,9-trimethyl-3-pentyl-6a,7,8,10a-tetrahydrobenzo[c]chromen-1-ol', 323, '1.00', 60),
(600, '1,3,7-trimethylpurine-2,6-dione', 298, '1.00', 1),
(565, 'C17H19NO3.H2O', 311, '1.50', 40);

-- --------------------------------------------------------

--
-- Table structure for table `rehab_centre`
--

CREATE TABLE `rehab_centre` (
  `rehab_id` int(11) NOT NULL,
  `name` char(15) DEFAULT '',
  `foundation_date` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rehab_centre`
--

INSERT INTO `rehab_centre` (`rehab_id`, `name`, `foundation_date`, `address`) VALUES
(100, 'hazeelden', '1960-09-06', 'nationwide'),
(101, 'caron found.', '1968-04-20', 'wernersville'),
(102, 'assana recovery', '1970-05-10', 'costa mesa'),
(103, 'ocean breeze', '1970-05-30', 'florida'),
(104, 'benchmark rec.', '1980-06-15', 'austin'),
(105, 'pheonix house', '1967-07-10', 'new york'),
(106, 'judes recovery', '1962-08-01', 'atlanta'),
(107, 'timber line', '1950-11-22', 'lemond'),
(108, 'revo ranch', '1971-12-03', 'mansfield'),
(109, 'deer hollow', '1978-10-09', 'salt lake city texas');

-- --------------------------------------------------------

--
-- Table structure for table `rehab_doctor`
--

CREATE TABLE `rehab_doctor` (
  `ssn` int(11) NOT NULL,
  `fname` char(15) DEFAULT '',
  `lname` char(15) DEFAULT '',
  `designation` char(15) DEFAULT '',
  `salary` int(11) DEFAULT 0,
  `contact` varchar(50) DEFAULT NULL,
  `hired_date` date DEFAULT NULL,
  `rehab_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rehab_doctor`
--

INSERT INTO `rehab_doctor` (`ssn`, `fname`, `lname`, `designation`, `salary`, `contact`, `hired_date`, `rehab_id`) VALUES
(23, 'sarah', 'padran', 'metalist', 1500, 'sarah@pheonix.com', '1977-04-19', 105),
(52, 'debra', 'don', 'psycologist', 3500, 'debra@timberline.com', '1971-09-12', 107),
(58, 'carl', 'grushkin', 'physician', 2000, 'carl@caronfoundation.com', '1980-06-16', 101),
(62, 'joseph', 'church', 'mentalist', 2500, 'joseph@judesrecovery.com', '1970-08-11', 106),
(78, 'gerald', 'bushman', 'musculoskeletal', 5000, 'gerald@assanarecovery.com', '1989-02-14', 102),
(89, 'robert', 'adler', 'psychologist', 3000, 'robertalder@haselden.com', '1970-09-29', 100),
(92, 'eyal', 'isaac', 'physician', 1200, 'eyalissac@ocenbreeze.com', '1990-02-14', 103),
(94, 'michael', 'bryant', 'bariatric', 4000, 'michael@benchmark.com', '1992-09-28', 104),
(95, 'mark', 'borcherd', 'neurologist', 2000, 'markborcherd@deerhollow.com', '1992-10-20', 109),
(99, 'danielle', 'borut', 'spinalogist', 1500, 'danielle@revoranch.com', '1982-10-25', 108);

-- --------------------------------------------------------

--
-- Table structure for table `side_effects`
--

CREATE TABLE `side_effects` (
  `s_id` varchar(5) NOT NULL,
  `disease` char(15) DEFAULT '',
  `cure_procedure` char(15) DEFAULT '',
  `target_organ` char(15) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `side_effects`
--

INSERT INTO `side_effects` (`s_id`, `disease`, `cure_procedure`, `target_organ`) VALUES
('a', 'heart disease', 'thized durotics', 'heart veins'),
('b', 'liver disease', 'silymerin', 'liver bladder'),
('c', 'HBP', 'thized durotics', 'heart aorta'),
('d', 'kidney', 'EPO', 'kedney cortex'),
('e', 'breathing', 'bronchilst', 'lungs'),
('f', 'chronic cough', 'corticotoid', 'lungs'),
('g', 'hallucination', 'nuplazid', 'brain'),
('h', 'hypertrichosis', 'minoxidine', 'skin layer'),
('i', 'itching seda.', 'prunritus', 'skin layer'),
('j', 'neuro. disorder', 'nurofoam', 'CNS');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `id` int(50) NOT NULL,
  `pswd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `pswd`) VALUES
(0, '1234'),
(1, '123'),
(2, '123'),
(3, '123'),
(4, '123'),
(5, '123'),
(6, '123'),
(7, '123'),
(8, '123'),
(9, '123'),
(10, '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consumes`
--
ALTER TABLE `consumes`
  ADD KEY `fk_cons_dd` (`drug_id`),
  ADD KEY `ssn` (`ssn`) USING BTREE;

--
-- Indexes for table `consumption_reason`
--
ALTER TABLE `consumption_reason`
  ADD KEY `fk_da` (`ssn`);

--
-- Indexes for table `drug_addict`
--
ALTER TABLE `drug_addict`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `fk_rel_admit` (`rehab_id`);

--
-- Indexes for table `drug_data`
--
ALTER TABLE `drug_data`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD KEY `fk_da_fe` (`ssn`);

--
-- Indexes for table `has_database`
--
ALTER TABLE `has_database`
  ADD KEY `fk_hd_dd` (`drug_id`),
  ADD KEY `fk_hd_rc` (`rehab_id`);

--
-- Indexes for table `has_effects`
--
ALTER TABLE `has_effects`
  ADD KEY `fk_he_dd` (`drug_id`),
  ADD KEY `fk_he_se` (`s_id`);

--
-- Indexes for table `manual`
--
ALTER TABLE `manual`
  ADD KEY `fk_dd` (`drug_id`);

--
-- Indexes for table `rehab_centre`
--
ALTER TABLE `rehab_centre`
  ADD PRIMARY KEY (`rehab_id`);

--
-- Indexes for table `rehab_doctor`
--
ALTER TABLE `rehab_doctor`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `fk_hire_rd` (`rehab_id`);

--
-- Indexes for table `side_effects`
--
ALTER TABLE `side_effects`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consumes`
--
ALTER TABLE `consumes`
  ADD CONSTRAINT `fk_cons_da` FOREIGN KEY (`ssn`) REFERENCES `drug_addict` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cons_dd` FOREIGN KEY (`drug_id`) REFERENCES `drug_data` (`drug_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `consumption_reason`
--
ALTER TABLE `consumption_reason`
  ADD CONSTRAINT `fk_da` FOREIGN KEY (`ssn`) REFERENCES `drug_addict` (`ssn`) ON UPDATE CASCADE;

--
-- Constraints for table `drug_addict`
--
ALTER TABLE `drug_addict`
  ADD CONSTRAINT `fk_rel_admit` FOREIGN KEY (`rehab_id`) REFERENCES `rehab_centre` (`rehab_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_da_fe` FOREIGN KEY (`ssn`) REFERENCES `drug_addict` (`ssn`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `has_database`
--
ALTER TABLE `has_database`
  ADD CONSTRAINT `fk_hd_dd` FOREIGN KEY (`drug_id`) REFERENCES `drug_data` (`drug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hd_rc` FOREIGN KEY (`rehab_id`) REFERENCES `rehab_centre` (`rehab_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `has_effects`
--
ALTER TABLE `has_effects`
  ADD CONSTRAINT `fk_he_dd` FOREIGN KEY (`drug_id`) REFERENCES `drug_data` (`drug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_he_se` FOREIGN KEY (`s_id`) REFERENCES `side_effects` (`s_id`);

--
-- Constraints for table `manual`
--
ALTER TABLE `manual`
  ADD CONSTRAINT `fk_dd` FOREIGN KEY (`drug_id`) REFERENCES `drug_data` (`drug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rehab_doctor`
--
ALTER TABLE `rehab_doctor`
  ADD CONSTRAINT `fk_hire_rd` FOREIGN KEY (`rehab_id`) REFERENCES `rehab_centre` (`rehab_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
