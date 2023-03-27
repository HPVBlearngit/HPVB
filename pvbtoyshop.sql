-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 06:46 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pvbtoyshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `toy_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `created_date`, `quantity`, `toy_id`, `user_id`) VALUES
(134, '2022-12-03 00:44:05', 1, 1, 2),
(183, '2022-12-07 09:50:40', 2, 1, 8),
(184, '2022-12-09 01:41:08', 1, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `cat_img` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cat_img`, `category`, `description`) VALUES
(1, 'https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/8/26/photo-1-16614974872951335207654.jpg', 'Kamen Rider', NULL),
(2, 'https://www.crunchyroll.com/imgsrv/display/thumbnail/1200x675/catalog/crunchyroll/36bdc5ea4443cd8e42f22ec7d3884cbb.jpeg', 'Dragon Ball', NULL),
(3, 'https://znews-photo.zingcdn.me/w660/Uploaded/piqbzcvo/2021_03_08/Xtrafondos.jpg', 'Jujustu Kaisen', NULL),
(4, 'https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/7/11/unnamed-15944654517091172750128.png', 'Naruto', NULL),
(5, 'https://znews-photo.zingcdn.me/w860/Uploaded/vnaits/2022_07_29/marvel_cinematic_universe_order_1601976266_1_.jpg', 'Marvel', NULL),
(6, 'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/139460/Originals/Ng%C6%B0%E1%BB%9Di%20%C4%90%C3%A0n%20%C3%94ng%20Th%C3%A9p%20-%20Man%20Of%20Steel%20(2013).jpg', 'DC', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percent` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `create_at`, `description`, `modified_at`, `name`, `percent`) VALUES
(1, NULL, 'One Year Memory', NULL, 'One Year Memory', 10);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `is_paid` bit(1) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `is_delivery` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `create_at`, `is_paid`, `total`, `user_id`, `delivery_date`, `is_delivery`) VALUES
(8, '2022-12-02 15:21:36', b'1', 3780000, 1, '2022-12-10 01:53:20', b'0'),
(9, '2022-12-02 15:22:30', b'1', 2700000, 1, NULL, b'0'),
(14, '2022-12-05 14:34:16', b'1', 1500000, 1, '2022-12-10 08:23:05', b'0'),
(15, '2022-12-07 16:25:34', b'1', 10560000, 1, '2022-12-10 09:50:43', b'1'),
(16, '2022-12-09 01:42:54', b'1', 1890000, 1, '2022-12-10 09:50:46', b'0'),
(17, '2022-12-10 12:52:11', b'1', 4500000, 1, '2022-12-10 12:53:57', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `invoice_id` bigint(20) NOT NULL,
  `toy_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice_detail`
--

INSERT INTO `invoice_detail` (`invoice_id`, `toy_id`, `quantity`) VALUES
(8, 1, 1),
(8, 11, 1),
(9, 14, 2),
(14, 2, 1),
(15, 1, 1),
(15, 2, 2),
(15, 11, 3),
(16, 1, 1),
(17, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(3, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `create_at`, `token`, `user_id`) VALUES
(1, '2022-11-18 10:54:52', 'bbb18a8b-fd06-4acc-b73d-9a03e04fb54e', 1),
(8, '2022-12-03 02:20:00', '606879fc-9022-4f09-b52b-6ecc99a1da59', 8),
(7, '2022-12-03 02:17:39', '76bf6f0a-f311-487c-831f-00b167b18ecd', 7),
(12, '2022-12-03 10:04:02', 'c10d52c6-2302-437c-9662-2f37830caeb8', 12),
(15, '2022-12-09 01:34:42', '337e75d4-c7e4-4f4b-b74f-ac1fd8c97422', 15);

-- --------------------------------------------------------

--
-- Table structure for table `toy`
--

CREATE TABLE `toy` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty_in_stock` int(11) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `discount_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toy`
--

INSERT INTO `toy` (`id`, `sku`, `create_at`, `description`, `modified_at`, `name`, `price`, `qty_in_stock`, `brand_id`, `category_id`, `discount_id`) VALUES
(1, 'S011202201', '2022-11-14 19:25:01', 'Product like-new, fullbox, hard joint, condition 99%', '2022-11-14 19:25:01', 'SHF Kamen Rider W', 2100000, 3, 1, 1, 1),
(2, 'S011202201', '2022-11-15 18:05:46', 'Product like-new, fullbox, hard joint, condition 99%', '2022-11-15 18:05:46', 'SHF Kamen Rider Drive', 1500000, 3, 1, 1, NULL),
(11, NULL, '2022-11-26 13:26:07', 'Like New 99%', '2022-11-26 13:26:07', 'SHF Kamen Rider Decade Complete', 2100000, 3, 1, 1, 1),
(12, NULL, '2022-11-26 13:34:08', 'like new 99%', '2022-11-26 13:34:08', 'SHF Kamen Rider Ghost', 1500000, 3, 1, 1, 1),
(13, NULL, '2022-11-26 14:04:41', 'Like new 99%', '2022-11-26 14:04:41', 'SHF Kamen Rider Kuuga Rising Ultimate\r\n', 2100000, 3, 1, 1, NULL),
(14, NULL, '2022-11-26 14:19:23', 'Like New 99%', '2022-11-26 14:19:23', 'SHF Kamen Rider Blade', 1500000, 3, 1, 1, 1),
(15, NULL, '2022-11-26 14:22:06', 'Like New 99%', '2022-11-26 14:22:06', 'SHF Kamen Rider Kabuto', 2200000, 3, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `toy_brand`
--

CREATE TABLE `toy_brand` (
  `id` bigint(20) NOT NULL,
  `brand` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toy_brand`
--

INSERT INTO `toy_brand` (`id`, `brand`) VALUES
(1, 'Bandai Namco'),
(2, 'Amazing Yamaguchi'),
(3, 'Mcfarlane Toys'),
(4, 'Hasbro');

-- --------------------------------------------------------

--
-- Table structure for table `toy_images`
--

CREATE TABLE `toy_images` (
  `id` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `toy_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toy_images`
--

INSERT INTO `toy_images` (`id`, `image_url`, `toy_id`) VALUES
(1, 'https://www.1999.co.jp/itbig86/10863035p.jpg', 1),
(2, 'https://www.1999.co.jp/itbig86/10863035a.jpg', 1),
(3, 'https://www.1999.co.jp/itbig86/10863035a2.jpg', 1),
(4, 'https://www.1999.co.jp/itbig86/10863035a6.jpg', 1),
(5, 'https://www.1999.co.jp/itbig32/10323384p.jpg', 2),
(6, 'https://www.1999.co.jp/itbig32/10323384a.jpg', 2),
(7, 'https://www.1999.co.jp/itbig32/10323384a2.jpg', 2),
(8, 'https://www.1999.co.jp/itbig32/10323384a3.jpg', 2),
(9, 'http://mysite.vn/shop/toquocnghi/UserFiles/314894606_1857176874615173_676429501498156501_n_16180454874182.jpg', 11),
(10, 'http://mysite.vn/shop/toquocnghi/UserFiles/N2547491001001_007_452471012957759.jpg', 11),
(11, 'http://mysite.vn/shop/toquocnghi/UserFiles/N2547491001001_006_129334755396502.jpg', 11),
(12, 'http://mysite.vn/shop/toquocnghi/UserFiles/N2547491001001_005_821051743229408.jpg', 11),
(13, 'https://www.1999.co.jp/itbig36/10360810p.jpg', 12),
(14, 'https://www.1999.co.jp/itbig36/10360810a.jpg', 12),
(15, 'https://www.1999.co.jp/itbig36/10360810a2.jpg', 12),
(16, 'https://www.1999.co.jp/itbig36/10360810a4.jpg', 12),
(17, 'http://mysite.vn//Shop/toquocnghi/Product/Large/SHF-KAMEN-RIDER-KUUGA-RISING-ULTIMATE-DARK-EYES-VER_06052016115941.jpg', 13),
(18, 'http://mysite.vn/shop/toquocnghi/UserFiles/93200707_10467573087417.jpg', 13),
(21, 'https://www.1999.co.jp/itbig22/10227286p.jpg', 14),
(22, 'https://www.1999.co.jp/itbig22/10227286a.jpg', 14),
(23, 'https://www.1999.co.jp/itbig22/10227286a2.jpg', 14),
(24, 'https://www.1999.co.jp/itbig22/10227286a3.jpg', 14),
(25, 'https://www.1999.co.jp/itbig25/10252032p.jpg', 15),
(26, 'https://www.1999.co.jp/itbig25/10252032a.jpg', 15),
(27, 'https://www.1999.co.jp/itbig25/10252032a2.jpg', 15),
(28, 'https://www.1999.co.jp/itbig25/10252032a3.jpg', 15);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `address`, `email`, `last_name`, `password`, `phone`, `profile_picture`, `role_id`) VALUES
(1, 'Bao', 'c1/11g Xa Binh Hung, Huyen Binh Chanh, Quan 8', 'vbao964@gmail.com', 'Vo', '2F39154AAFA833E3EBBFFC1E5CEBC948', '0812162399', 'https://thumbs.dreamstime.com/z/businessman-icon-image-male-avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg', 3),
(8, 'The', 'san bay', 'phuoc1234@gmail.com', 'Phuoc', 'E10ADC3949BA59ABBE56E057F20F883E', '098765432', 'https://thumbs.dreamstime.com/z/businessman-icon-image-male-avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg', 3),
(7, 'The ', 'quan 10', 'phuoc123@gmail.com', 'Phuoc', 'E10ADC3949BA59ABBE56E057F20F883E', '0123456789', 'https://thumbs.dreamstime.com/z/businessman-icon-image-male-avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg', 3),
(12, 'Vu', 'quan 10', 'vu123@gmail.com', 'De', 'E10ADC3949BA59ABBE56E057F20F883E', '08761243', 'https://thumbs.dreamstime.com/z/businessman-icon-image-male-avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg', 3),
(15, 'Bao', 'c1/11g Xa Binh Hung, Huyen Binh Chanh, Quan 8', 'admin', 'vo', '21232F297A57A5A743894A0E4A801FC3', '0812162399', 'https://thumbs.dreamstime.com/z/businessman-icon-image-male-avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3qokrmqrsq2q7x8rrf8ywl88g` (`toy_id`),
  ADD KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjunvl5maki3unqdvljk31kns3` (`user_id`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`invoice_id`,`toy_id`),
  ADD KEY `FKpkxm7r0l4t3n64ag1dqw3o8pl` (`toy_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgh73xiagbl0no2bm4i7q29isu` (`user_id`);

--
-- Indexes for table `toy`
--
ALTER TABLE `toy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7de5p0lvapwf563f5l0yeiyo7` (`brand_id`),
  ADD KEY `FKltv56liet7g3lynf0xmpb8h9i` (`category_id`),
  ADD KEY `FKc523ochv9gdrfuojhxf5ggr65` (`discount_id`);

--
-- Indexes for table `toy_brand`
--
ALTER TABLE `toy_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toy_images`
--
ALTER TABLE `toy_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK64yhrvwlwl2cqyps1ytgwgscg` (`toy_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `toy`
--
ALTER TABLE `toy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `toy_brand`
--
ALTER TABLE `toy_brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `toy_images`
--
ALTER TABLE `toy_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
