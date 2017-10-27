-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017 年 10 月 27 日 02:19
-- サーバのバージョン： 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Taxi_fee_search`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `feeTable`
--

CREATE TABLE IF NOT EXISTS `feeTable` (
`id` int(12) NOT NULL,
  `pref` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `distance_hatsu` float NOT NULL,
  `fee_hatsunori` float NOT NULL,
  `fee_rate_dist` float NOT NULL,
  `fee_rate_fee` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `feeTable`
--

INSERT INTO `feeTable` (`id`, `pref`, `distance_hatsu`, `fee_hatsunori`, `fee_rate_dist`, `fee_rate_fee`) VALUES
(1, '北海道', 1.6, 670, 0.302, 80),
(2, '青森県', 1.6, 670, 0.302, 80),
(3, '岩手県', 1.6, 670, 0.302, 80),
(4, '宮城県', 1.6, 670, 0.302, 80),
(5, '秋田県', 1.6, 670, 0.302, 80),
(6, '山形県', 1.6, 670, 0.302, 80),
(7, '福島県', 1.6, 670, 0.302, 80),
(8, '茨城県', 1.6, 670, 0.302, 80),
(9, '栃木県', 1.6, 670, 0.302, 80),
(10, '群馬県', 1.6, 670, 0.302, 80),
(11, '埼玉県', 1.6, 670, 0.302, 80),
(12, '千葉県', 2, 730, 0.289, 90),
(13, '東京都', 1.052, 410, 0.237, 80),
(14, '神奈川県', 2, 730, 0.293, 90),
(15, '新潟県', 1.6, 670, 0.302, 80),
(16, '富山県', 1.6, 670, 0.302, 80),
(17, '石川県', 1.6, 670, 0.302, 80),
(18, '福井県', 1.6, 670, 0.302, 80),
(19, '山梨県', 1.6, 670, 0.302, 80),
(20, '長野県', 1.6, 670, 0.302, 80),
(21, '岐阜県', 1.6, 670, 0.302, 80),
(22, '静岡県', 1.6, 670, 0.302, 80),
(23, '愛知県', 1.6, 670, 0.302, 80),
(24, '三重県', 1.6, 670, 0.302, 80),
(25, '滋賀県', 1.6, 670, 0.302, 80),
(26, '京都府', 1.6, 670, 0.302, 80),
(27, '大阪府', 1.6, 670, 0.302, 80),
(28, '兵庫県', 1.6, 670, 0.302, 80),
(29, '奈良県', 1.6, 670, 0.302, 80),
(30, '和歌山県', 1.6, 670, 0.302, 80),
(31, '鳥取県', 1.6, 670, 0.302, 80),
(32, '島根県', 1.6, 670, 0.302, 80),
(33, '岡山県', 1.6, 670, 0.302, 80),
(34, '広島県', 1.6, 670, 0.302, 80),
(35, '山口県', 1.6, 670, 0.302, 80),
(36, '徳島県', 1.6, 670, 0.302, 80),
(37, '香川県', 1.6, 670, 0.302, 80),
(38, '愛媛県', 1.6, 670, 0.302, 80),
(39, '高知県', 1.6, 670, 0.302, 80),
(40, '福岡県', 1.6, 670, 0.302, 80),
(41, '佐賀県', 1.6, 670, 0.302, 80),
(42, '長崎県', 1.6, 670, 0.302, 80),
(43, '熊本県', 1.6, 670, 0.302, 80),
(44, '大分県', 1.6, 670, 0.302, 80),
(45, '宮崎県', 1.6, 670, 0.302, 80),
(46, '鹿児島県', 1.5, 620, 0.191, 50),
(47, '沖縄県', 1.6, 670, 0.302, 80);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feeTable`
--
ALTER TABLE `feeTable`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feeTable`
--
ALTER TABLE `feeTable`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
