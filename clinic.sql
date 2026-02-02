-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 02, 2026 at 09:05 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `notes` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `patient_id`, `doctor_id`, `date`, `time`, `status`, `notes`, `created`, `modified`) VALUES
(1, 1, 1, 1, '2026-02-10', '10:00:00', 1, 'Regular check-up', '2026-02-02 16:59:01', '2026-02-02 16:59:01'),
(2, 2, 1, 2, '2026-02-11', '14:30:00', 1, 'Headache consultation', '2026-02-02 16:59:01', '2026-02-02 16:59:01'),
(3, 3, 2, 1, '2026-02-12', '09:15:00', 1, 'Fever and flu', '2026-02-02 16:59:01', '2026-02-02 16:59:01');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int UNSIGNED NOT NULL,
  `transaction` char(36) NOT NULL,
  `type` varchar(7) NOT NULL,
  `primary_key` int UNSIGNED DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `parent_source` varchar(255) DEFAULT NULL,
  `original` mediumtext,
  `changed` mediumtext,
  `meta` mediumtext,
  `status` int NOT NULL DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `transaction`, `type`, `primary_key`, `source`, `parent_source`, `original`, `changed`, `meta`, `status`, `slug`, `created`) VALUES
(1, '687cc72c-92c5-4229-9f75-273a021ac780', 'create', 1, 'doctors', NULL, '[]', '{\"id\":1,\"fullname\":\"Mizan Marsh\",\"specialization\":1,\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-11 23:24:07'),
(2, 'eb30fd9f-3ec6-4f9d-b390-513a221536ad', 'create', 1, 'patients', NULL, '[]', '{\"id\":1,\"fullname\":\"Joanne \",\"ic\":\"041227-12-1061\",\"email\":\"izzad21075@gmail.com\",\"street1\":\"D-2-026-1B\",\"street2\":\"JALAN LP 8\\/2\",\"postcode\":43300,\"city\":\"Shah Alam\",\"state\":\"Selangor\"}', '{\"a_name\":\"Add\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/patients\\/add\",\"slug\":1}', 1, NULL, '2026-01-11 23:24:37'),
(3, '74d08c2c-afd6-4ca9-8eee-1592337353a7', 'create', 1, 'appointments', NULL, '[]', '{\"id\":1,\"user_id\":1,\"patient_id\":1,\"doctor_id\":1,\"date\":\"2026-01-12\",\"time\":\"12:30:00\",\"notes\":\"NO\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-11 23:27:13'),
(4, 'd397e963-bdb4-40db-b09d-e29695727a57', 'create', 2, 'appointments', NULL, '[]', '{\"id\":2,\"user_id\":1,\"patient_id\":1,\"doctor_id\":1,\"date\":\"2026-01-12\",\"time\":\"10:00:00\",\"notes\":\"tiada\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-12 09:53:52'),
(5, '2b78ae00-3c7b-42f1-a46a-9c58b3129ab5', 'update', 1, 'patients', NULL, '{\"state\":\"Selangor\"}', '{\"state\":\"KEDAH\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/patients\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-12 09:56:23'),
(6, '09c48696-4dc4-43fd-99d6-535b216cc9c0', 'update', 1, 'doctors', NULL, '{\"status\":1}', '{\"status\":3}', '{\"a_name\":\"Edit\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/doctors\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-12 13:25:01'),
(7, '27d789cd-c386-454e-b39d-9e43f7d2195e', 'update', 1, 'doctors', NULL, '{\"status\":3}', '{\"status\":4}', '{\"a_name\":\"Edit\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/doctors\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-12 13:25:10'),
(8, 'e7adcf93-617e-4480-a37b-8e3b1527da07', 'update', 1, 'patients', NULL, '{\"phone\":0}', '{\"phone\":null}', '{\"a_name\":\"Edit\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/patients\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-12 13:25:47'),
(9, '55663633-16f7-4f99-bdab-0c8e2d34b86d', 'update', 1, 'patients', NULL, '{\"phone\":0}', '{\"phone\":null}', '{\"a_name\":\"Edit\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/patients\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-12 13:27:21'),
(10, '9da7d636-0ea0-4ece-9734-4f6fdfc959c8', 'update', 1, 'patients', NULL, '{\"phone\":\"\"}', '{\"phone\":\"012-292-7276\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/patients\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-12 13:31:02'),
(11, 'be2e195c-2770-415d-ae02-11d26aed9035', 'update', 1, 'doctors', NULL, '{\"status\":4}', '{\"status\":3}', '{\"a_name\":\"Edit\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/doctors\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-12 13:33:28'),
(12, '587fbc83-0662-4c5c-81c0-c879349e670c', 'create', 2, 'users', NULL, '[]', '{\"id\":2,\"fullname\":\"izzad\",\"password\":\"$2y$10$UhhMlT\\/iD89HCmKs.hFQ1eE97NR3ENbSrqf0\\/2ZA7R2camQwy51kC\",\"email\":\"izzad21075@gmail.com\",\"slug\":\"izzad\"}', '[]', 1, NULL, '2026-01-12 16:30:34'),
(13, 'c45523c2-1f36-4cae-ac30-86adc1c36d0a', 'update', 1, 'doctors', NULL, '{\"status\":3}', '{\"status\":2}', '{\"a_name\":\"Edit\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/doctors\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-13 12:49:41'),
(14, '787d8091-5d1a-4406-8c7c-0617792f9c31', 'update', 1, 'patients', NULL, '{\"ic\":\"041227-12-1061\"}', '{\"ic\":\"041227-12-1133\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/patients\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-13 14:00:47'),
(15, '88727820-2713-4ced-abda-4505ba87ad68', 'create', 3, 'users', NULL, '[]', '{\"id\":3,\"fullname\":\"hakim\",\"password\":\"$2y$10$zC1oFGYlXLLcPDJh9D2x5.IPJwfvh7O0TUT1\\/CJpXPQ2gh6hvtDfm\",\"email\":\"hakim@gmail.com\",\"slug\":\"hakim\"}', '[]', 1, NULL, '2026-01-27 11:38:16'),
(16, 'c695883d-5e47-404b-bf73-616d2629b382', 'create', 2, 'patients', NULL, '[]', '{\"id\":2,\"user_id\":3,\"fullname\":\"MOHAMAD IZZAD HAKIMI SHAHRUL AZLAN\",\"ic\":\"044331-12-2333\",\"phone\":\"011-641-9122\",\"email\":\"hakimi@gmail.com\",\"street1\":\"D-2-026-1B JALAN LP 7\\/2 T\",\"street2\":\"333\",\"postcode\":43300,\"city\":\"SERI KEMBANGAN\",\"state\":\"PERLIS\"}', '[]', 1, NULL, '2026-01-27 12:27:35'),
(17, 'aed23216-5321-4032-bccd-a3119d93e394', 'create', 3, 'patients', NULL, '[]', '{\"id\":3,\"user_id\":2,\"fullname\":\"aerolina\",\"ic\":\"041227-12-1167\",\"phone\":\"011-111-1111\",\"email\":\"izzad21075@gmail.com\",\"street1\":\"D-2-026-1B\",\"street2\":\"JALAN LP 8\\/2\",\"postcode\":39000,\"city\":\"SERI\",\"state\":\"SELANGOR\"}', '[]', 1, NULL, '2026-01-27 12:29:23'),
(18, '3f437593-5709-47cf-982c-94a8dcb6fbfa', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"street2\":\"333\"}', '{\"user_id\":3,\"street2\":\"jalan\"}', '[]', 1, NULL, '2026-01-27 15:35:46'),
(19, 'dfec9e4c-0362-4ed6-8db1-8545d00c19a9', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"street1\":\"D-2-026-1B JALAN LP 7\\/2 T\",\"street2\":\"jalan\"}', '{\"user_id\":3,\"street1\":\"D-2-026-1B JALAN LP 7\\/2 \",\"street2\":\"TAMAN LESTARI PERDANA\"}', '[]', 1, NULL, '2026-01-27 15:55:00'),
(20, '27861064-1224-4505-8041-fa2352ab0575', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":1}', '{\"user_id\":3,\"status\":0}', '[]', 1, NULL, '2026-01-27 16:19:48'),
(21, '57d5a713-5b5d-44f0-ba7b-409b1c9c365f', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":0}', '{\"user_id\":3,\"status\":1}', '[]', 1, NULL, '2026-01-27 16:20:51'),
(22, 'e4279bbb-178d-46ae-b516-904c3077b9e3', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":1}', '{\"user_id\":3,\"status\":2}', '[]', 1, NULL, '2026-01-27 16:22:06'),
(23, '36df2c7d-2e6a-48cf-8c6c-8ff50ed73ce2', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":2}', '{\"user_id\":3,\"status\":0}', '[]', 1, NULL, '2026-01-27 16:31:15'),
(24, '237d2177-1ef7-4271-ad17-2d05fd666d7b', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":0}', '{\"user_id\":3,\"status\":1}', '[]', 1, NULL, '2026-01-27 16:31:42'),
(25, '5b01f005-545a-41cb-8c8f-cf95e168449c', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":1}', '{\"user_id\":3,\"status\":0}', '[]', 1, NULL, '2026-01-27 16:32:37'),
(26, '7b8883b9-51e5-4e7c-92f3-9d59f9afe80c', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":0}', '{\"user_id\":3,\"status\":1}', '[]', 1, NULL, '2026-01-27 16:33:03'),
(27, 'e8ce3a7e-9bae-4b11-b9b6-f44b18979e3e', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":1}', '{\"user_id\":3,\"status\":0}', '[]', 1, NULL, '2026-01-27 16:35:49'),
(28, 'a5e006fb-a3bf-44d9-bd95-042bdea78c29', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":0}', '{\"user_id\":3,\"status\":1}', '[]', 1, NULL, '2026-01-27 16:57:39'),
(29, 'bd58a368-0b48-4b1c-aac6-b56c9bd765ba', 'update', 2, 'patients', NULL, '{\"user_id\":3,\"status\":1}', '{\"user_id\":3,\"status\":0}', '[]', 1, NULL, '2026-01-27 16:57:52'),
(30, '6f75f241-4826-4c41-a8a1-312927cf8c13', 'create', 4, 'patients', NULL, '[]', '{\"id\":4,\"user_id\":3,\"fullname\":\"IZZAD\",\"ic\":\"033211-23-2332\",\"phone\":\"015-255-3537\",\"email\":\"hakim@gmail.com\",\"street1\":\"D-2027221\",\"street2\":\"ASS\",\"postcode\":43211,\"city\":\"SERI KEMBANGAN\",\"state\":\"KUALA LUMPUR\",\"status\":1}', '[]', 1, NULL, '2026-01-27 17:24:47'),
(31, '71b38670-9b16-4fc1-8c9a-f532c0977756', 'delete', 4, 'patients', NULL, NULL, NULL, '[]', 1, NULL, '2026-01-27 17:31:45'),
(32, 'b798b4a6-b7ab-4c2a-a9fa-2aa890eb4fbb', 'create', 5, 'patients', NULL, '[]', '{\"id\":5,\"user_id\":3,\"fullname\":\"Ss\",\"ic\":\"111111-11-1111\",\"phone\":\"111-111-1111\",\"email\":\"hakim@gmail.com\",\"street1\":\"qq\",\"street2\":\"qqq\",\"postcode\":43211,\"city\":\"SHAH ALAM\",\"state\":\"LABUAN\",\"status\":1}', '[]', 1, NULL, '2026-01-27 17:49:57'),
(33, 'b2c21bec-2d17-4ad5-bad8-49fca09620e9', 'create', 1, 'treatments', NULL, '[]', '{\"id\":1,\"patient_id\":2,\"doctor_id\":1,\"start_date\":\"2026-01-28\",\"end_date\":\"2026-01-28\",\"duration\":1,\"sickness\":\"Fever and Flue\",\"notes\":\"This patient have one day mc\"}', '{\"a_name\":\"Add\",\"c_name\":\"Treatments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/treatments\\/add\",\"slug\":1}', 1, NULL, '2026-01-27 18:51:46'),
(34, '235741b3-051e-472d-b12b-13560d81167f', 'create', 6, 'patients', NULL, '[]', '{\"id\":6,\"user_id\":1,\"fullname\":\"Akhmal\",\"ic\":\"033211-23-2332\",\"phone\":\"011-111-1111\",\"email\":\"hakim@gmail.com\",\"street1\":\"D-2-026-1B\",\"street2\":\"JALAN LP 8\\/2\",\"postcode\":43211,\"city\":\"SHAH ALAM\",\"state\":\"PUTRAJAYA\",\"status\":1}', '[]', 1, NULL, '2026-01-28 01:00:21'),
(35, '7bf1bf5f-31ed-44c7-a3dd-6c11464e9d7f', 'create', 2, 'doctors', NULL, '[]', '{\"id\":2,\"fullname\":\"izzad\",\"specialization\":1,\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-29 10:28:02'),
(36, '437ab76a-7288-46bc-847f-5f89f75b08df', 'update', 1, 'doctors', NULL, '{\"status\":2}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/doctors\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-29 11:59:13'),
(37, '65ac4620-95f7-4962-b55a-6290400e1ba5', 'update', 1, 'patients', NULL, '{\"state\":\"KEDAH\"}', '{\"state\":\"MELAKA\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/patients\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-29 13:57:28'),
(38, '8250e060-e1b6-4545-b2e9-b849bf8016d2', 'update', 1, 'appointments', NULL, '{\"date\":\"2026-01-12\"}', '{\"date\":\"2026-01-30\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/appointments\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-29 14:56:34'),
(39, 'ccf99c9f-a8c6-463e-988d-2712a392f884', 'create', 3, 'appointments', NULL, '[]', '{\"id\":3,\"user_id\":2,\"patient_id\":2,\"doctor_id\":2,\"date\":\"2026-01-29\",\"time\":\"16:30:00\",\"notes\":\"FEVER\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-29 15:30:24'),
(40, '0e569b5d-c875-4208-9aa4-e370f5c3f508', 'delete', 1, 'appointments', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/appointments\\/delete\\/1\",\"slug\":1}', 1, NULL, '2026-01-29 15:30:37'),
(41, '8384f184-1e0a-4ac4-9fdc-54b1c6edf173', 'update', 1, 'treatments', NULL, '{\"end_date\":\"2026-01-28\",\"duration\":1}', '{\"end_date\":\"2026-01-30\",\"duration\":2}', '{\"a_name\":\"Edit\",\"c_name\":\"Treatments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/treatments\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-29 17:21:20'),
(42, 'b97212f8-8d7b-4717-9bea-763a7e3a25c6', 'create', 2, 'treatments', NULL, '[]', '{\"id\":2,\"patient_id\":2,\"doctor_id\":1,\"start_date\":\"2026-01-30\",\"end_date\":\"2026-01-31\",\"duration\":1,\"sickness\":\"CANCER\",\"notes\":\"HAHA\"}', '{\"a_name\":\"Add\",\"c_name\":\"Treatments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/treatments\\/add\",\"slug\":1}', 1, NULL, '2026-01-29 17:42:01'),
(43, 'f6ef47d0-f180-40bc-9683-b6d1f15da616', 'update', 1, 'treatments', NULL, '{\"end_date\":\"2026-01-30\",\"duration\":2}', '{\"end_date\":\"2026-01-28\",\"duration\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Treatments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/treatments\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-29 17:45:40'),
(44, '76bdab6b-b74d-4173-bc58-26b12dcf9e2c', 'create', 4, 'appointments', NULL, '[]', '{\"id\":4,\"user_id\":2,\"patient_id\":1,\"doctor_id\":2,\"date\":\"2026-01-29\",\"time\":\"20:30:00\",\"notes\":\"No\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-29 18:30:25'),
(45, '36e8afa1-c9e3-4aff-9c46-a364e6873804', 'create', 5, 'appointments', NULL, '[]', '{\"id\":5,\"user_id\":2,\"patient_id\":1,\"doctor_id\":1,\"date\":\"2026-01-30\",\"time\":\"19:30:00\",\"notes\":\"q\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-29 18:32:03'),
(46, 'd3b7386c-6be2-4338-a6da-c21d0a12f881', 'create', 6, 'appointments', NULL, '[]', '{\"id\":6,\"user_id\":2,\"patient_id\":1,\"doctor_id\":1,\"date\":\"2026-01-31\",\"time\":\"12:15:00\",\"notes\":\"no\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-29 22:06:46'),
(47, '02d942c9-75a5-4dba-8b0b-c5d5b45a1835', 'update', 4, 'appointments', NULL, '{\"status\":1}', '{\"status\":2}', '[]', 1, NULL, '2026-01-29 23:19:17'),
(48, '95cd0cd1-a1cf-4bf7-a358-669c2d48ddc4', 'update', 4, 'appointments', NULL, '{\"status\":2}', '{\"status\":1}', '[]', 1, NULL, '2026-01-29 23:33:55'),
(49, '7e3a06b8-6ec8-4855-8c71-a22b6cb940ac', 'create', 7, 'appointments', NULL, '[]', '{\"id\":7,\"user_id\":2,\"patient_id\":1,\"doctor_id\":1,\"date\":\"2026-01-30\",\"time\":\"12:00:00\",\"status\":1,\"notes\":\"s\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/appointments\\/add\",\"user_id\":2}', 1, NULL, '2026-01-30 00:16:07'),
(50, '9d9292e0-751b-4662-b10f-0304052bd93e', 'create', 8, 'appointments', NULL, '[]', '{\"id\":8,\"user_id\":2,\"patient_id\":1,\"doctor_id\":2,\"date\":\"2026-02-02\",\"time\":\"12:00:00\",\"status\":1,\"notes\":\"tiada\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/appointments\\/add\",\"user_id\":2}', 1, NULL, '2026-01-30 00:19:01'),
(51, 'a3c7aafd-7de0-4039-b67a-6349826e47d8', 'delete', 8, 'appointments', NULL, NULL, NULL, '[]', 1, NULL, '2026-01-30 00:19:16'),
(52, 'a8e7c984-6a03-4974-b718-365037948869', 'update', 3, 'patients', NULL, '{\"user_id\":2,\"status\":1}', '{\"user_id\":2,\"status\":2}', '[]', 1, NULL, '2026-01-30 00:40:21'),
(53, '87b59d9d-2b1c-49c8-a806-7717b816f74e', 'create', 9, 'appointments', NULL, '[]', '{\"id\":9,\"user_id\":2,\"patient_id\":3,\"doctor_id\":1,\"date\":\"2026-01-30\",\"time\":\"12:00:00\",\"status\":1,\"notes\":\"k\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/appointments\\/add\",\"user_id\":2}', 1, NULL, '2026-01-30 00:40:39'),
(54, '31af9e5b-b3e6-4bb6-9786-63f9c3985151', 'update', 3, 'patients', NULL, '{\"user_id\":2,\"fullname\":\"aerolina\"}', '{\"user_id\":2,\"fullname\":\"Aerolina\"}', '[]', 1, NULL, '2026-01-30 01:27:02'),
(55, '04398ab4-04f4-408e-9dcb-a2cd8ff8526e', 'update', 2, 'users', NULL, '{\"avatar\":null,\"avatar_dir\":null}', '{\"avatar\":\"Screenshot 2026-01-15 093327.png\",\"avatar_dir\":\"webroot\\\\files\\\\Users\\\\avatar\\\\izzad\"}', '[]', 1, NULL, '2026-01-30 01:30:02'),
(56, '6ada5a7e-3348-4f78-a415-990e97233194', 'create', 10, 'appointments', NULL, '[]', '{\"id\":10,\"user_id\":2,\"patient_id\":1,\"doctor_id\":1,\"date\":\"2026-01-30\",\"time\":\"14:00:00\",\"status\":1,\"notes\":\"a\"}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/appointments\\/add\",\"user_id\":2}', 1, NULL, '2026-01-30 02:00:16'),
(57, 'da52d073-e6f0-4a0e-8bdf-782c53af8ad3', 'delete', 6, 'appointments', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/clinic\\/admin\\/appointments\\/delete\\/6\",\"slug\":1}', 1, NULL, '2026-01-30 08:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `ticket` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `note_admin` text,
  `ip` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `is_replied` tinyint(1) NOT NULL,
  `respond_date_time` datetime DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `specialization` int NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `fullname`, `specialization`, `status`, `created`, `modified`) VALUES
(1, 'Dr. Mizan Marsh', 1, 1, '2026-02-02 16:56:04', '2026-02-02 16:56:04'),
(2, 'Dr. Sarah Lee', 1, 1, '2026-02-02 16:56:04', '2026-02-02 16:56:04'),
(3, 'Dr. Amir Hakim', 1, 1, '2026-02-02 16:56:04', '2026-02-02 16:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int NOT NULL,
  `category` varchar(100) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `category`, `question`, `answer`, `slug`, `status`, `created`, `modified`) VALUES
(1, 'General', 'General Questions 1', 'General Answer 1', 'General-Questions-1', 1, '2022-11-13 15:41:26', '2022-11-13 16:31:14'),
(2, 'Account', 'Account Questions 1', 'Account Answer 1', 'Account-Questions-1', 1, '2022-11-13 15:43:15', '2022-11-13 15:43:15'),
(3, 'Other', 'Other Questions 1', 'Other Answer 1', 'Other-Questions-1', 1, '2022-11-13 15:43:34', '2022-11-13 15:43:34'),
(6, 'General', 'General Questions 2', 'General Answer 2', 'General-Questions-2', 0, '2022-11-13 16:54:25', '2024-06-25 13:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rght` int DEFAULT NULL,
  `level` int DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `auth` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `divider_before` tinyint(1) DEFAULT '0',
  `parent_separator` tinyint(1) DEFAULT NULL,
  `division` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `lft`, `rght`, `level`, `icon`, `controller`, `action`, `target`, `name`, `url`, `prefix`, `auth`, `admin`, `active`, `disabled`, `divider_before`, `parent_separator`, `division`) VALUES
(1, NULL, 1, 2, 0, '<i class=\"fa-solid fa-code\"></i>', 'Dashboards', 'Index', NULL, 'Dashboard', '', '', 1, 0, 1, 0, 0, 0, 0),
(2, NULL, 3, 4, 0, '<i class=\"fa-regular fa-circle-question\"></i>', 'Faqs', '', NULL, 'FAQs', '', '', 0, 0, 1, 0, 0, NULL, 0),
(3, NULL, 5, 6, 0, '<i class=\"fa-regular fa-message\"></i>', 'Contacts', 'Add', NULL, 'Contact Us', '', '', 0, 0, 1, NULL, 0, NULL, 0),
(4, NULL, 7, 14, 0, '<i class=\"fa-solid fa-circle-info\"></i>', 'Pages', 'manual', NULL, 'Documentation', '', '', 0, 0, 1, 0, 0, 1, 0),
(5, NULL, 15, 16, 0, '', '', '', NULL, 'Administrator', '', NULL, 0, 1, 1, NULL, 0, NULL, 1),
(6, NULL, 17, 18, 0, '<i class=\"fa-solid fa-gear\"></i>', 'Settings', 'Update', 'recrud', 'System Configuration', '', 'Admin', 1, 1, 1, NULL, 0, 0, 0),
(7, NULL, 19, 20, 0, '<i class=\"fa-solid fa-users-viewfinder\"></i>', 'Users', 'Index', NULL, 'User Management', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(8, NULL, 21, 22, 0, '<i class=\"fa-solid fa-bars\"></i>', 'Menus', 'Index', NULL, 'Menu Management', '', 'Admin', 1, 1, 1, NULL, 0, 0, 0),
(9, NULL, 23, 24, 0, '<i class=\"menu-icon fa-solid fa-list-check\"></i>', 'Todos', 'Index', NULL, 'Todo List', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(10, NULL, 25, 26, 0, '<i class=\"fa-regular fa-message\"></i>', 'Contacts', 'Index', NULL, 'Contact', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(11, NULL, 27, 28, 0, '<i class=\"menu-icon fa-solid fa-timeline\"></i>', 'AuditLogs', 'Index', NULL, 'Audit Trail', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(12, NULL, 29, 30, 0, '<i class=\"menu-icon fa-regular fa-circle-question\"></i>', 'Faqs', 'Index', NULL, 'FAQs', '', 'Admin', 1, 1, 1, NULL, 0, 0, 0),
(13, 4, 10, 11, 1, '<i class=\"fa-solid fa-code\"></i>', '', '', NULL, 'Code The Pixel', 'https://codethepixel.com/', '', 0, 0, 1, NULL, 0, 0, 0),
(14, 4, 8, 9, 1, '<i class=\"fa-regular fa-file-code\"></i>', 'Pages', 'manual', NULL, 'User Manual', '', '', 0, 0, 1, NULL, 0, 0, 0),
(15, 4, 12, 13, 1, '<i class=\"fa-brands fa-github\"></i>', '', '', NULL, 'Re-CRUD Github', 'https://github.com/Asyraf-wa/recrud', '', 0, 0, 1, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `ic` varchar(14) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `street1` varchar(25) NOT NULL,
  `street2` varchar(25) NOT NULL,
  `postcode` int NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `fullname`, `ic`, `phone`, `email`, `street1`, `street2`, `postcode`, `city`, `state`, `created`, `modified`, `status`) VALUES
(1, 2, 'Izzad Hakimi', '041227-12-1133', '012-2927276', 'izzad21075@gmail.com', 'Jalan LP 8/2', 'Seri Kembangan', 43300, 'Seri Kembangan', 'Selangor', '2026-02-02 16:57:33', '2026-02-02 16:57:33', 1),
(2, 3, 'Nur Aina', '000101-10-1010', '011-6419122', 'aina@gmail.com', 'Jalan Bunga Raya', 'Kajang', 43000, 'Kajang', 'Selangor', '2026-02-02 16:57:33', '2026-02-02 16:57:33', 1),
(3, 2, 'Ahmad Firdaus', '980312-08-4432', '013-8892334', 'firdaus@gmail.com', 'No 5', 'Jalan Merpati', 43000, 'Kajang', 'Selangor', '2026-02-02 17:05:15', '2026-02-02 17:05:15', 1),
(4, 3, 'Siti Nur Aisyah', '990722-10-7788', '014-5566778', 'aina@gmail.com', 'No 12', 'Jalan Mawar', 43300, 'Seri Kembangan', 'Selangor', '2026-02-02 17:05:15', '2026-02-02 17:05:15', 1),
(5, 2, 'Muhammad Aiman', '030101-14-9988', '017-2233445', 'aiman@gmail.com', 'No 88', 'Jalan Kenanga', 43200, 'Cheras', 'Selangor', '2026-02-02 17:05:15', '2026-02-02 17:05:15', 1),
(6, 2, 'Nur Farah Izzati', '020505-05-5566', '018-4455667', 'farah@gmail.com', 'No 3A', 'Jalan Dahlia', 43000, 'Kajang', 'Selangor', '2026-02-02 17:05:15', '2026-02-02 17:05:15', 1),
(7, 3, 'Daniel Hakim', '950911-10-2211', '016-9988776', 'aina@gmail.com', 'No 21', 'Jalan Teratai', 43300, 'Seri Kembangan', 'Selangor', '2026-02-02 17:05:15', '2026-02-02 17:05:15', 1),
(8, 3, 'Aisyah Hana', '040430-10-3344', '019-5566889', 'aina@gmail.com', 'No 7', 'Jalan Melur', 43200, 'Cheras', 'Selangor', '2026-02-02 17:05:15', '2026-02-02 17:05:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20241029053753, 'Initial', '2026-01-11 12:45:31', '2026-01-11 12:45:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` char(36) NOT NULL,
  `system_name` varchar(255) NOT NULL,
  `system_abbr` varchar(255) NOT NULL,
  `system_slogan` varchar(255) NOT NULL,
  `organization_name` varchar(255) NOT NULL,
  `domain_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `notification_email` varchar(50) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_subject` varchar(255) NOT NULL,
  `meta_copyright` varchar(255) NOT NULL,
  `meta_desc` varchar(255) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `author` varchar(255) NOT NULL,
  `site_status` tinyint(1) NOT NULL,
  `user_reg` tinyint(1) NOT NULL,
  `config_2` tinyint(1) NOT NULL,
  `config_3` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL,
  `private_key_from_recaptcha` varchar(255) DEFAULT NULL,
  `public_key_from_recaptcha` varchar(255) DEFAULT NULL,
  `banned_username` text,
  `telegram_bot_token` varchar(255) DEFAULT NULL,
  `telegram_chatid` varchar(255) DEFAULT NULL,
  `hcaptcha_sitekey` varchar(255) DEFAULT NULL,
  `hcaptcha_secretkey` varchar(255) DEFAULT NULL,
  `notification` text NOT NULL,
  `notification_status` tinyint(1) NOT NULL,
  `notification_date` date DEFAULT NULL,
  `ribbon_title` varchar(20) NOT NULL,
  `ribbon_link` varchar(255) NOT NULL,
  `ribbon_status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `system_name`, `system_abbr`, `system_slogan`, `organization_name`, `domain_name`, `email`, `notification_email`, `meta_title`, `meta_keyword`, `meta_subject`, `meta_copyright`, `meta_desc`, `timezone`, `author`, `site_status`, `user_reg`, `config_2`, `config_3`, `version`, `private_key_from_recaptcha`, `public_key_from_recaptcha`, `banned_username`, `telegram_bot_token`, `telegram_chatid`, `hcaptcha_sitekey`, `hcaptcha_secretkey`, `notification`, `notification_status`, `notification_date`, `ribbon_title`, `ribbon_link`, `ribbon_status`, `created`, `modified`) VALUES
('recrud', 'Code The Pixel', 'Re-CRUD', 'Code The Experiences', 'Code The Pixel Inc.', 'codethepixel.com', 'noreply@codethepixel.com', 'noreply@codethepixel.com', 'Re-CRUD', 'Re-CRUD, CakePHP, Learning, CRUD', 'Re-CRUD', 'Re-CRUD', 'Re-CRUD', 'Asia/Kuala_Lumpur', 'Re-CRUD', 0, 0, 0, 0, '1.1', '', '', NULL, '', '', '', '', '<p><strong>Server maintenance</strong> is scheduled to be executed on Jan 1, 2023, from 1.00 am to 4.00 am. An intermittent connection is expected during the server maintenance period.</p>', 0, '2022-11-07', 'Code The Pixel', 'https://codethepixel.com', 0, '2020-04-08 20:56:04', '2024-07-08 20:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `urgency` varchar(255) NOT NULL COMMENT 'high, medium, low',
  `task` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `note` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending' COMMENT 'Pending, In Progress, Completed, Canceled',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `user_id`, `urgency`, `task`, `description`, `note`, `status`, `created`, `modified`) VALUES
('a02daac9-27e3-49ea-8090-927e60f9e255', '1', 'High', 'task 4 desc', '<p>task 4 desc</p>', '<p>task 4 desc</p>', 'In Progress', '2024-05-31 13:48:26', '2024-05-31 13:48:31'),
('a8618f9e-a3f7-4e7a-8a3f-05a5323cd5af', '1', 'High', 'task 1', '<p>task 1 desc</p>', '<p>task 1 desc</p>', 'Completed', '2024-05-31 13:45:22', '2024-05-31 13:45:40'),
('c892f026-c6f8-4353-82c2-75f49c0f5d6b', '1', 'Medium', 'Task 3 - Develop the To Do Task and render in Dashboard', '<p>task 3 desc</p>', '<p>task 3 desc</p>', 'Pending', '2024-05-31 13:48:06', '2024-05-31 13:48:06'),
('eda46e51-555a-4309-a28b-d0835bf4f4b2', '1', 'Low', 'task 2', '<p>task 2 desc</p>', '<p>task 2 desc</p>', 'Canceled', '2024-05-31 13:46:12', '2024-05-31 13:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `duration` int NOT NULL,
  `sickness` varchar(255) NOT NULL,
  `notes` text,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`id`, `patient_id`, `doctor_id`, `start_date`, `end_date`, `duration`, `sickness`, `notes`, `created`, `modified`, `status`) VALUES
(1, 1, 1, '2026-02-10', '2026-02-10', 1, 'Fever', 'MC issued for 1 day', '2026-02-02 16:59:55', '2026-02-02 16:59:55', 1),
(2, 2, 2, '2026-02-11', '2026-02-12', 2, 'Migraine', 'Rest advised, medication prescribed', '2026-02-02 16:59:55', '2026-02-02 16:59:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user_group_id` int DEFAULT '3',
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `avatar_dir` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_created_at` datetime NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '	is_active',
  `is_email_verified` int NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `created_by` int DEFAULT NULL COMMENT 'user_id',
  `modified_by` int DEFAULT NULL COMMENT 'user_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_group_id`, `fullname`, `password`, `email`, `avatar`, `avatar_dir`, `token`, `token_created_at`, `status`, `is_email_verified`, `last_login`, `ip_address`, `slug`, `created`, `modified`, `created_by`, `modified_by`) VALUES
(1, 1, 'Administrator', '$2y$10$OrUKHzNQUic6dFqSuG9QBeDzMbbwPz1BQXKgBKPcQyMTNdv3Z22xe', 'admin@localhost.com', '', '', NULL, '2024-07-10 20:30:04', '1', 1, '2026-02-02 17:00:18', '::1', 'Administrator', '2022-10-26 02:54:19', '2024-07-08 21:08:15', NULL, NULL),
(2, 3, 'izzad', '$2y$10$UhhMlT/iD89HCmKs.hFQ1eE97NR3ENbSrqf0/2ZA7R2camQwy51kC', 'izzad21075@gmail.com', 'Screenshot 2026-01-15 093327.png', 'webroot\\files\\Users\\avatar\\izzad', NULL, '0000-00-00 00:00:00', '0', 0, '2026-01-30 07:43:50', '::1', 'izzad', '2026-01-12 16:30:34', '2026-01-30 01:30:00', NULL, NULL),
(3, 3, 'aina', '$2y$10$zC1oFGYlXLLcPDJh9D2x5.IPJwfvh7O0TUT1/CJpXPQ2gh6hvtDfm', 'aina@gmail.com', NULL, NULL, NULL, '0000-00-00 00:00:00', '0', 0, '2026-02-02 17:00:56', '::1', 'hakim', '2026-01-27 11:38:16', '2026-01-27 11:38:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `description`, `created`, `modified`) VALUES
(1, 'Admin', 'Admninistrator', '2021-01-23 13:21:29', '2021-01-23 13:21:29'),
(2, 'Mod', 'Moderator', '2021-01-23 13:21:29', '2021-01-23 13:21:29'),
(3, 'User', 'Normal User', '2021-01-23 13:21:29', '2021-01-23 13:21:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `useragent` varchar(256) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id`, `user_id`, `action`, `useragent`, `os`, `ip`, `host`, `referrer`, `status`, `created`, `modified`) VALUES
(1, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-11 20:46:56', '2026-01-11 20:46:56'),
(2, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/', 1, '2026-01-11 21:04:56', '2026-01-11 21:04:56'),
(3, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-11 21:21:18', '2026-01-11 21:21:18'),
(4, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-11 21:22:14', '2026-01-11 21:22:14'),
(5, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-11 23:23:44', '2026-01-11 23:23:44'),
(6, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 09:51:55', '2026-01-12 09:51:55'),
(7, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:30:56', '2026-01-12 16:30:56'),
(8, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:31:09', '2026-01-12 16:31:09'),
(9, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:41:15', '2026-01-12 16:41:15'),
(10, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:41:22', '2026-01-12 16:41:22'),
(11, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:41:42', '2026-01-12 16:41:42'),
(12, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:52:02', '2026-01-12 16:52:02'),
(13, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:52:10', '2026-01-12 16:52:10'),
(14, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:52:15', '2026-01-12 16:52:15'),
(15, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:52:39', '2026-01-12 16:52:39'),
(16, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:52:48', '2026-01-12 16:52:48'),
(17, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:56:06', '2026-01-12 16:56:06'),
(18, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-12 16:58:03', '2026-01-12 16:58:03'),
(19, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 07:32:41', '2026-01-13 07:32:41'),
(20, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 07:32:49', '2026-01-13 07:32:49'),
(21, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 07:33:32', '2026-01-13 07:33:32'),
(22, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 07:42:41', '2026-01-13 07:42:41'),
(23, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 07:45:36', '2026-01-13 07:45:36'),
(24, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 07:46:11', '2026-01-13 07:46:11'),
(25, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 07:53:41', '2026-01-13 07:53:41'),
(26, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 07:54:09', '2026-01-13 07:54:09'),
(27, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/', 1, '2026-01-13 07:57:01', '2026-01-13 07:57:01'),
(28, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 07:57:56', '2026-01-13 07:57:56'),
(29, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/appointments', 1, '2026-01-13 08:31:59', '2026-01-13 08:31:59'),
(30, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 08:32:22', '2026-01-13 08:32:22'),
(31, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/dashboard', 1, '2026-01-13 12:44:54', '2026-01-13 12:44:54'),
(32, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 12:47:55', '2026-01-13 12:47:55'),
(33, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 12:50:18', '2026-01-13 12:50:18'),
(34, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/dashboard', 1, '2026-01-13 12:51:32', '2026-01-13 12:51:32'),
(35, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 12:51:36', '2026-01-13 12:51:36'),
(36, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 13:34:19', '2026-01-13 13:34:19'),
(37, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 13:34:31', '2026-01-13 13:34:31'),
(38, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 13:47:57', '2026-01-13 13:47:57'),
(39, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 14:01:15', '2026-01-13 14:01:15'),
(40, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/dashboard', 1, '2026-01-13 14:04:42', '2026-01-13 14:04:42'),
(41, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-13 14:07:25', '2026-01-13 14:07:25'),
(42, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-22 08:57:16', '2026-01-22 08:57:16'),
(43, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-22 08:57:21', '2026-01-22 08:57:21'),
(44, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-26 15:07:28', '2026-01-26 15:07:28'),
(45, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-26 15:17:43', '2026-01-26 15:17:43'),
(46, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 10:39:49', '2026-01-27 10:39:49'),
(47, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 10:39:55', '2026-01-27 10:39:55'),
(48, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 11:11:59', '2026-01-27 11:11:59'),
(49, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 11:12:16', '2026-01-27 11:12:16'),
(50, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 11:12:44', '2026-01-27 11:12:44'),
(51, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 11:37:33', '2026-01-27 11:37:33'),
(52, 3, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 11:38:33', '2026-01-27 11:38:33'),
(53, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/patients', 1, '2026-01-27 14:21:41', '2026-01-27 14:21:41'),
(54, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 14:21:46', '2026-01-27 14:21:46'),
(55, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 14:21:58', '2026-01-27 14:21:58'),
(56, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/', 1, '2026-01-27 14:22:32', '2026-01-27 14:22:32'),
(57, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 14:22:35', '2026-01-27 14:22:35'),
(58, 3, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/patients', 1, '2026-01-27 14:22:44', '2026-01-27 14:22:44'),
(59, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 14:22:55', '2026-01-27 14:22:55'),
(60, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/patients', 1, '2026-01-27 14:28:18', '2026-01-27 14:28:18'),
(61, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 14:28:31', '2026-01-27 14:28:31'),
(62, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/patients', 1, '2026-01-27 14:42:04', '2026-01-27 14:42:04'),
(63, 3, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-27 14:42:48', '2026-01-27 14:42:48'),
(64, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-28 00:05:02', '2026-01-28 00:05:02'),
(65, 3, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/appointments/add', 1, '2026-01-28 00:08:07', '2026-01-28 00:08:07'),
(66, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-28 00:08:41', '2026-01-28 00:08:41'),
(67, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 09:31:39', '2026-01-29 09:31:39'),
(68, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 10:44:30', '2026-01-29 10:44:30'),
(69, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 18:20:23', '2026-01-29 18:20:23'),
(70, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 18:27:24', '2026-01-29 18:27:24'),
(71, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/appointments/add', 1, '2026-01-29 18:29:32', '2026-01-29 18:29:32'),
(72, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 18:29:45', '2026-01-29 18:29:45'),
(73, 3, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 18:33:00', '2026-01-29 18:33:00'),
(74, 3, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/patients', 1, '2026-01-29 18:59:36', '2026-01-29 18:59:36'),
(75, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 18:59:55', '2026-01-29 18:59:55'),
(76, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 21:48:25', '2026-01-29 21:48:25'),
(77, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 22:05:38', '2026-01-29 22:05:38'),
(78, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/appointments', 1, '2026-01-29 22:05:51', '2026-01-29 22:05:51'),
(79, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-29 22:06:10', '2026-01-29 22:06:10'),
(80, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-30 07:43:49', '2026-01-30 07:43:49'),
(81, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-30 07:52:39', '2026-01-30 07:52:39'),
(82, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/patients', 1, '2026-01-30 11:01:53', '2026-01-30 11:01:53'),
(83, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-30 19:37:16', '2026-01-30 19:37:16'),
(84, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-01-30 20:11:26', '2026-01-30 20:11:26'),
(85, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-02-02 17:00:18', '2026-02-02 17:00:18'),
(86, 3, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', NULL, 1, '2026-02-02 17:00:56', '2026-02-02 17:00:56'),
(87, 3, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 26200 (Windows 11)', '::1', 'LAPTOP-O049H32K', 'http://localhost/clinic/patients', 1, '2026-02-02 17:05:33', '2026-02-02 17:05:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction` (`transaction`),
  ADD KEY `type` (`type`),
  ADD KEY `primary_key` (`primary_key`),
  ADD KEY `source` (`source`),
  ADD KEY `parent_source` (`parent_source`),
  ADD KEY `created` (`created`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lft` (`lft`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `treatments`
--
ALTER TABLE `treatments`
  ADD CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `treatments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
