-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2023 at 10:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `congson1112`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_brand`
--

CREATE TABLE `db_brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_brand`
--

INSERT INTO `db_brand` (`id`, `name`, `slug`, `image`, `parent_id`, `sort_order`, `metakey`, `metadesc`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 'Tesla111', 'xe-1', 'tesla111.jpg', 0, 0, '11111', 'wefvqef', 'svđsv', NULL, '2023-11-16 01:37:24', 1, 1, 1),
(2, 'Audi', 'xe-2', 'logo2.jpg', 0, 0, 'efvcwe', 'wefvqef', '', NULL, NULL, 1, NULL, 1),
(3, 'Toyota1', 'xe-3', 'toyota1.jpg', 0, 0, 'efvcwe', 'wefvqef', '', NULL, '2023-11-16 00:28:15', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_category`
--

CREATE TABLE `db_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_category`
--

INSERT INTO `db_category` (`id`, `name`, `slug`, `image`, `parent_id`, `sort_order`, `metakey`, `metadesc`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 'Mẫu xe sang trọng', 'sang-trong', 'mau-xe-sang-trong1111.jpg', 0, 5, '1111111', 'dasf', '', NULL, '2023-11-16 01:38:19', 1, 1, 1),
(2, 'Mẫu xe thể thao', 'the-thao', 'hinh2.jpg', 0, 4, 'effe', 'wefwef', '', NULL, NULL, 1, NULL, 1),
(3, 'Mẫu xe cổ điển', 'co-dien', 'hinh3.jpg', 0, 5, 'wefw', 'dasf', '', NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_config`
--

CREATE TABLE `db_config` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `zalo` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `metakey` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_config`
--

INSERT INTO `db_config` (`id`, `author`, `email`, `phone`, `zalo`, `facebook`, `address`, `youtube`, `metadesc`, `metakey`, `sort_order`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 'vv', 'vv', 'vv', 'vv', 'vv', 'vv', 'vv', 'vv', 'vv', 0, NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_contact`
--

CREATE TABLE `db_contact` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `replay_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_contact`
--

INSERT INTO `db_contact` (`id`, `user_id`, `name`, `email`, `phone`, `title`, `content`, `sort_order`, `replay_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 1, 'Sơn', 'sơn@email.com', '0981212201', 'hihihi', 'vvvvv', 0, 1, NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_member`
--

CREATE TABLE `db_member` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gioitinh` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_member`
--

INSERT INTO `db_member` (`id`, `name`, `email`, `phone`, `gioitinh`, `username`, `password`, `address`, `image`, `roles`, `sort_order`, `parent_id`, `created_by`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Sơn', 'son@email.com', '0981212201', 'nam', 'congson', '11112', 'achb', 'hinh1.jpg', 'sdcsdv', 0, 0, 1, NULL, NULL, NULL, 1),
(2, 'Lan', 'lan@email.com', '0981212201', 'nu', 'lantruc', '1335', 'achb', 'hinh2.jpg', 'sdcsdv', 0, 0, 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_menu`
--

CREATE TABLE `db_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `table_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `position` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_menu`
--

INSERT INTO `db_menu` (`id`, `name`, `link`, `table_id`, `parent_id`, `position`, `type`, `sort_order`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 'Trang Chủ', '/', 0, 0, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(2, 'Sản Phẩm', 'san-pham', 0, 0, 'mainmenu', 'gegege', 0, NULL, NULL, 1, NULL, 1),
(3, 'Chính sách điều khoản', 'chinh-sach', 0, 0, 'mainmenu', 'gegege', 0, NULL, NULL, 1, NULL, 1),
(4, 'Giới Thiệu', 'gioi-thieu', 0, 0, 'mainmenu', 'gegege', 0, NULL, NULL, 1, NULL, 1),
(5, 'Danh mục sản phẩm', 'danh-muc-san-pham', 0, 0, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(9, 'Liên Hệ', 'lien-he', 0, 0, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(10, 'Chính sách mua hàng', 'chinh-sach-mua-hang', 0, 3, 'mainmenu', 'gegege', 0, NULL, NULL, 1, NULL, 1),
(11, 'Chính sách đổi trả', 'chinh-sach-doi-tra', 0, 3, 'mainmenu', 'gegege', 0, NULL, NULL, 1, NULL, 1),
(12, 'Chính sách vận chuyển', 'chinh-sach-van-chuyen', 0, 3, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(13, 'Mẫu xe cổ điển', 'danh-muc-san-pham/co-dien', 0, 5, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(15, 'Mẫu xe thể thao', 'danh-muc-san-pham/the-thao', 0, 5, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(16, 'Mẫu xe sang trọng', 'danh-muc-san-pham/sang-trong', 0, 5, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(17, 'Xe cổ điển', 'bai-viet-theo-chu-de/xe-co', 0, 40, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(18, 'Giới thiệu xe', 'bai-viet-theo-chu-de/gioi-thieu-xe', 0, 40, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(19, 'Top xe hơi', 'bai-viet-theo-chu-de/top-xe', 0, 40, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(32, 'Chính sách bảo hành', 'chinh-sach-bao-hanh', 0, 3, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(34, 'Bài viết', 'bai-viet', 0, 0, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(35, 'Thương hiệu sản phẩm', 'thuong-hieu-san-pham', 0, 0, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(36, 'Volkswagen', 'thuong-hieu-san-pham/xe-1', 0, 35, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(37, 'Audi', 'thuong-hieu-san-pham/xe-2', 0, 35, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(38, 'Toyota', 'thuong-hieu-san-pham/xe-3', 0, 35, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(40, 'Bài viết theo chủ đề', 'bai-viet-theo-chu-de', 0, 0, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(41, 'Bài viết mới nhất', 'bai-viet-moi-nhat', 0, 34, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1),
(42, 'Tất cả bài viết', 'tat-ca-bai-viet', 0, 34, 'mainmenu', 'sfrgrs', 0, NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_order`
--

CREATE TABLE `db_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_order`
--

INSERT INTO `db_order` (`id`, `user_id`, `name`, `phone`, `email`, `address`, `note`, `sort_order`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(1, 1, 'son', '2894273894', 'achbj@email.com', 'dsbs', 'ssb', 0, NULL, NULL, NULL, 1),
(2, 2, 'lan', '389525', 'lan@email.com', 'vsvs', 'vđv', 0, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_orderdetail`
--

CREATE TABLE `db_orderdetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `sort_ordser` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_post`
--

CREATE TABLE `db_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `detail` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `relay_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_post`
--

INSERT INTO `db_post` (`id`, `topic_id`, `title`, `slug`, `detail`, `image`, `type`, `description`, `relay_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(1, 1, 'Giới thiệu dòng siêu xe cổ điển Volkswagen Beetle', 'post-1', 'Có thể nói, Volkswagen Beetle là mẫu xe ô tô cổ điển lâu đời nhất còn được sản xuất cho đến ngày nay. Ra đời vào tháng 7/1946 sau khi Chiến tranh thế giới thứ II kết thúc, Beetle nhận được sự ủng hộ mạnh mẽ của người dân Đức. Ít người biết rằng, sự ra đời của dòng xe “trứ danh” này là chủ đích của Adolf Hitler.\r\n\r\nHitler yêu cầu Volkswagen có thể sản xuất ra chiếc xe ô tô nhỏ gọn, giá thành rẻ phù hợp với tất cả dân chúng vì đa phần người Đức vào thời điểm đó không có gara và không có đủ tài chính để sở hữu những chiếc xe đắt đỏ. Từ thời điểm ra mắt trở đi, Volkswagen Beetle được đón nhận cả trong và ngoài trước.\r\n\r\nxe ô tô cổ điển\r\nVolkswagen Beetle là mẫu xe ô tô cổ điển được sản xuất từ năm 1946 cho đến 2019\r\n\r\nNếu so sánh với những mẫu xe cùng thời điểm, Volkswagen Beetle có ngoại hình khác biệt với kiểu dáng như bọ cánh cứng được tạo nên từ đường nét bầu bĩnh, mềm mại. Cho đến tận ngày nay, mẫu xe này vẫn có sức hút đặc biệt nhờ kiểu dáng lạ mắt nhưng vẫn đảm bảo được tính ứng dụng cao.\r\n\r\nTrải qua hàng chục năm, kiểu dáng của Volkswagen Beetle vẫn không có quá nhiều thay đổi. Hãng đã tinh chỉnh một số chi tiết để chiếc xe trông hợp thời và tránh “lạc lõng” khi xuất hiện trên phố.\r\n\r\nRất tiếc là vào năm 2019, chiếc Beetle cuối cùng đã xuất xưởng, đồng thời là dấu chấm hết cho dòng xe trứ danh này. Dù vậy, xe Volkswagen Beetle cũ vẫn còn khá nhiều trên thị trường. Ngoài ra, nhiều khả năng Tập đoàn Volkswagen sẽ cho ra mắt Beetle sử dụng động cơ điện trong tương lai gần.', 'xe-o-to-co-dien-1.jpg', 'post', '', 1, NULL, NULL, 0, NULL, 1),
(2, 1, 'Cùng tìm hiểu về dòng xe Mercedes', 'post-2', 'Các dòng xe Mercedes luôn chiếm một vị thế cao trong thị trường siêu xe hạng sang nhờ ngoại hình nổi bật, nội thất tiện nghi và khả năng bứt phá trên mọi địa hình. Vậy làm sao để tìm được mẫu xe Mercedes phù hợp nhất? Hãy để Chợ Xe 365 giới thiệu đến bạn các loại xe Mercedes được ưa chuộng hiện nay!\r\n\r\nCác dòng xe Mercedes đẳng cấp hiện nay\r\nCác dòng xe Mercedes đẳng cấp hiện nay\r\nGiới thiệu về hãng xe Mercedes\r\nNếu bạn là một người yêu xe thì chắc chắn phải biết đến thương hiệu xe sang đến từ Đức – Mercedes. Đây được xem là một trong những hãng xe có niên đại lâu đời nhất trên thế giới. Logo và biểu tượng cũng trải qua nhiều biến đổi nhưng luôn giữ được tính quốc tế, đẳng cấp của thương hiệu này.\r\n\r\nMercedes nổi tiếng với những mẫu xe sang, xịn, xa hoa, lộng lẫy nhưng vẫn đảm bảo chức năng vận hành êm ái trên mọi nẻo đường. Về cơ bản, tất cả các dòng Mercedes đều thuộc phân khúc sang chảnh và được đặt tên theo quy tắc gồm những ký tự A, B, C, E, V, S. Ngoài ra, hãng xe của Đức này còn thiết kế riêng một dòng xe Maybach dành cho phân khúc khách hàng cao cấp, đẳng cấp hơn.\r\n\r\nDù có những đối thủ cạnh tranh đáng gờm như Audi và BMW nhưng Mercedes vẫn đang làm rất tốt trên thị trường siêu xe và giữ vững vị thế của mình. Để làm được điều này phải kể đến những sản phẩm chất lượng đến từng chi tiết, đáp ứng được nhu cầu về thẩm mỹ và động cơ vân hành.\r\n\r\nDanh sách dòng xe Mercedes hiện nay\r\nMercedes-Benz C-Class\r\nMột trong các dòng xe Mercedes tại Việt Nam được ưa chuộng rộng rãi đó là Mercedes Benz C-Class. Phiên bản xe sedan cỡ nhỏ này theo đuổi phong cách thiết kế thanh lịch, hiện đại nhưng vẫn toát lên được vẻ đẹp trẻ trung, năng động không kém.\r\n\r\nMercedes-Benz C-Class vượt mọi địa hình\r\nMercedes-Benz C-Class vượt mọi địa hình\r\nNội thất bên trong xe cũng được đánh giá cao nhờ trang bị các vật dụng cao cấp cùng các hệ thống công nghệ tiên tiến bậc nhất. Khối động cơ bền bỉ mang lại khả năng vận hành và bứt phá trên mọi loại địa hình.\r\n\r\nDưới đây là các dòng xe Mercedes Benz C-Class:\r\n\r\nMercedes-Benz C 300 AMG: 1.969.000.000 VND.\r\nMercedes-Benz C 180 AMG: 1.499.000.000 VND.\r\nMercedes-Benz C 200 Exclusive: 1.699.000.000 VND.\r\nMercedes-Benz E-Class\r\nMercedes Benz E-Class được bình chọn là một trong các mẫu xe Mercedes sang trọng dẫn đầu phân khúc sedan cao cấp và dường như vẫn chưa tìm được đối thủ xứng tầm. Do đó, không ngạc nhiên khi đây là lựa chọn hàng đầu của những doanh nhân trẻ thành đạt.\r\n\r\nMercedes Benz E-Class đẳng cấp, sang trọng\r\nMercedes Benz E-Class đẳng cấp, sang trọng\r\nThiết kế ngoại hình, nội thất tiện nghi và động cơ vận hành đều được chăm chút tỉ mỉ từng công đoạn để đảm bảo người lái và hành khách có một trải nghiệm hành trình tuyệt vời. Tham khảo ngay các loại Mercedes Benz E-Class sau đây:\r\n\r\nMercedes-Benz E 200 Exclusive: 2.310.000.000 VND.\r\nMercedes-Benz E 180: 2.050.000.000 VND.\r\nMercedes-Benz E 300 AMG: 2.950.000.000 VND.\r\nMercedes-Benz S-Class\r\nMercedes Benz S-Class gây ấn tượng bằng sự đổi mới vẻ ngoài rõ rệt trên hai dòng Mercedes-Benz S450 và Mercedes-Benz S450 Luxury. Cụ thể, các mẫu xe Mercedes này đã sử dụng lưới tản nhiệt 3 nan kép sọc đứng màu đen sáng bóng thay vì dùng lưới tản nhiệt 4 nan đơn kiểu cũ.\r\n\r\nMercedes Benz S-Class sở hữu ngoại hình ấn tượng\r\nMercedes Benz S-Class sở hữu ngoại hình ấn tượng\r\nGiá bán tại thị trường Việt khá hợp lý cũng là một điểm cộng đáng khen của dòng xe này. Bạn có thể dễ dàng tìm thấy các phiên bản xe Mercedes Benz S-Class sau đây:\r\n\r\nMercedes-Benz S450 Luxury: 5,549.000.000 VND.\r\nMercedes-Benz S450: 5,059.000.000 VND.\r\nMercedes-Benz A-Class\r\nCác dòng xe Mercedes Benz A-Class ghi điểm trong lòng người tiêu dùng bởi ngoại hình lịch lãm, sang trọng nhưng cũng không kém phần năng động, trẻ trung. Hơn nữa, nội thất cũng được thiết kế mang hơi hướng hiện đại bằng nhiều trang bị tiên tiến bậc nhất, hệ thống động cơ mạnh mẽ tích hợp công nghệ hỗ trợ lái xe thông minh cho phép người lái tăng tốc nhanh chóng một cách an toàn.\r\n\r\nMercedes-Benz A-Class được trang bị tiện nghi mới nhất\r\nMercedes-Benz A-Class được trang bị tiện nghi mới nhất\r\nHiện nay, các dòng xe Mercedes ở Việt Nam được phân phối chính hãng gồm:\r\n\r\nMercedes-AMG A 35 4MATIC : 2.259.000.000 VND.\r\nMercedes GLA 200, Mercedes GLA 45 AMG.\r\nMercedes-Maybach\r\nMaybach là phiên bản xe được phát triển dựa trên dòng S-Class nhưng được cải tiến trên nhiều phương diện để mang lại chiếc xe sang, xịn, đẳng cấp riêng biệt. Chẳng hạn, kích thước xe dáng dài, bề thế hơn, phần đầu và đuôi xe được tập trung thay đổi rõ rệt nhất.\r\n\r\nMercedes Maybach S-Class\r\nMercedes Maybach S-Class\r\nTất cả các dòng xe của Mercedes Maybach đều thuộc phân khúc xe siêu sang, là lựa chọn hoàn hảo dành cho những đại gia, doanh nhân thành đạt. Một số phiên bản Maybach còn được để lên bàn cân với Bentley và Rolls Royce.\r\n\r\nMercedes Maybach được phân phối ở Việt Nam với phiên bản sau:\r\n\r\nMercedes-Maybach S 450 4MATIC: 7.469.000.000 VND.\r\nMercedes-Benz G-Class\r\nNhắc đến phân khúc xe off-road không thể bỏ qua chiếc xe Mercedes Benz G-Class với khả năng bứt phá vượt trội, chinh phục mọi địa hình khó nhằn nhất. Đồng thời, G-Class cũng đang làm rất tốt nhiệm vụ ban đầu của mình như một dòng xe gầm cao, ngoại hình bề thế, trang bị tiện nghi, độ an toàn cao và động cơ vận hành êm ái.\r\n\r\nThiết kế Mercedes Benz G-Class cân mọi loại địa hình\r\nThiết kế Mercedes Benz G-Class cân mọi loại địa hình\r\nCác loại xe Mercedes Benz G-Class được ưa chuộng rộng rãi gồm:\r\n\r\nMercedes-AMG G 63: 10.950.000.000 VND.\r\nMercedes-Benz GLC\r\nGLC là một trong các dòng xe Mercedes Benz thể thao đa dụng hạng sang dẫn đầu doanh số bán hàng trong cùng phân khúc. Mercedes Benz GLC được cho ra mắt vào năm 2015 như một phiên bản thay thế và nâng cấp của Mercedes Benz GLK.\r\n\r\nMercedes Benz GLC trang bị công nghệ lái xe thông minh\r\nMercedes Benz GLC trang bị công nghệ lái xe thông minh\r\nTổng thể ngoại hình khỏe khoắn, trẻ trung và năng động cùng các trang bị nội thất tiện nghi, hệ thống công nghệ hỗ trợ lái xe thông minh được những nhà sản xuất thiết kế khéo léo và chỉn chu. Do đó, không ngạc nhiên gì khi các dòng xe Mercedes Benz GLC luôn là lựa chọn hàng đầu của những khách hàng am hiểu về siêu xe.\r\n\r\nBạn có thể dễ dàng tìm thấy các dòng xe Mercedes Benz GLC sau tại thị trường Việt Nam:\r\n\r\nMercedes-Benz GLC 300 4MATIC Coupe: 3.069.000.000 VND.\r\nMercedes-Benz GLC 200 4 MATIC: 2.099.000.000 VND.\r\nMercedes-Benz GLC 200: 1.799.000.000 VND.\r\nMercedes-Benz GLC 300 4 MATIC: 2.499.000.000 VND.\r\nMercedes-Benz GLE\r\nMột nghiên cứu từ MSN Auto đã chỉ ra rằng doanh thu của Mercedes Benz GLE đứng trong TOP 10 các siêu xe có doanh số cao nhất Mỹ. Cụ thể, vào năm 2017 đã có hơn 54.595 sản phẩm được tiêu thụ rộng rãi trên thị trường.\r\n\r\nMercedes Benz GLC trang bị công nghệ lái xe thông minh\r\nMercedes Benz GLC trang bị công nghệ lái xe thông minh\r\nMercedes Benz GLE – Phiên bản SUV cao cấp, sang trọng\r\n\r\nPhiên bản SUV cao cấp này cũng được nhiều khách hàng Việt Nam đam mê xe yêu thích ngay từ khi vừa đặt chân vào quốc gia này. Nguyên nhân có thể kể đến đó là giá trị thương hiệu, thiết kế vẻ ngoài sang trọng, nội thất cao cấp, hệ thống công nghệ đời mới, hỗ trợ lái xe an toàn,…\r\n\r\nMột số phiên bản xe thuộc dòng xe ô tô Mercedes Benz GLE đó là:\r\n\r\nMercedes-AMG GLE 53 4MATIC+ Coupé: 5.349.000.000 VND.\r\nMercedes-Benz GLE 450 4MATIC: 4.409.000.000 VND.\r\nMercedes-Benz GLS\r\nẤn tượng đầu tiên của Mercedes Benz GLS thu hút người nhìn đó là vẻ ngoài nổi bật, sắc sảo và nam tính. Với chiều dài cơ sở 3075mm, các thông số Dài x Rộng x Cao theo tứ tự là 5130 x 1934 x 1850 (mm), đây được xem là phiên bản SUV có kích thước lớn nhất trong các loại Mercedes cùng phân khúc.\r\n\r\nMercedes Benz GLS sở hữu ngoại hình bề thế\r\nMercedes Benz GLS sở hữu ngoại hình bề thế\r\nMẫu xe nổi tiếng thuộc dòng Mercedes Benz GLS phải kể đến là:\r\n\r\nMercedes-Benz GLS 450 4MATIC: 4.999.000.000 VND.\r\nMercedes Benz GLS 600 4MATIC: 12.500.000 VND.\r\nMercedes-Benz V-Class\r\nMercedes Benz V-Class sở hữu khung gầm xe khá thấp nên thích hợp với những địa hình bằng phẳng, ít gồ ghề của đường phố thành thị. Do đó, phiên bản này là lựa chọn hoàn hảo cho những gia đình và doanh nghiệp giàu có dùng để đưa đón khách VIP, di chuyển trong thành phố.\r\n\r\nMercedes Benz GLS sở hữu ngoại hình bề thế\r\nMercedes Benz GLS sở hữu ngoại hình bề thế\r\nMercedes Benz V-Class tích hợp nhiều trang bị hiện đại\r\n\r\nNgoài ra, chiếc xe MPV đa dụng hạng sang này cũng được đánh giá cao về không gian nội thất rộng rãi bên trong tích hợp cùng nhiều trang bị hiện đại bậc nhất, nhằm mang lại cảm giác thoải mái tối ưu cho người lái và hành khách.\r\n\r\nDưới đây là các dòng xe Mercedes Benz V-Class:\r\n\r\nMercedes-Benz V 250 AMG: 3.232.000.000 VND.\r\nMercedes-Benz V 250 Luxury: 2.662.000.000 VND.\r\nMercedes-Benz GLB 200 AMG\r\nVào năm 2020, thương hiệu xe Mercedes đã cho trình làng chiếc xe Mercedes Benz GLB 200 AMG gây xôn xao trong giới siêu xe. Phiên bản này hội tụ những lợi thế tuyệt vời mà một chiếc SUV hạng sang cần có như động cơ bền bỉ, vận hành mạnh mẽ, ngoại hình sang chảnh, trang bị công nghệ tiên tiến,…\r\n\r\nMercedes Benz GLB 200 AMG chinh phục mọi địa hình\r\nMercedes Benz GLB 200 AMG chinh phục mọi địa hình\r\nHiện nay Mercedes Benz GLB 200 AMG đang được phân phối chính hãng tại Việt Nam với giá 1.999.000.000 VND.\r\n\r\nSport Car\r\nNhư tên gọi của dòng xe này, Sport Car là các mẫu xe Mercedes thể thao được trang bị khối động cơ bền bỉ tạo ra công suất cực đại, cho phép người lái tăng tốc nhanh chóng. Không những thế, vẻ ngoài của những chiếc xe này cũng luôn bắt kịp xu hướng mới với nhiều mẫu đa dạng gồm dòng Coupe 2 cửa, 4 cửa, xe mui trần.\r\n\r\nMercedes-Benz AMG GT nổi bật với ngoại hình cá tính\r\nMercedes-Benz AMG GT nổi bật với ngoại hình cá tính\r\nNếu bạn là một tay chơi xe thể thao yêu thích thể hiện cá tính, sự năng động và trẻ trung của mình thì đừng bỏ qua các loại xe hạng sang dòng Sport Car của Mercedes. Dưới đây là một số mẫu xe Sport Car phổ biến:\r\n\r\nMercedes-Benz GT 53 4MATIC+: 6.299.000.000 VND.\r\nMercedes-Benz GT R: 11.590.000.000 VND.\r\nMercedes-Maybach GLS\r\nMột trong các dòng xe ô tô Mercedes Maybach SUV lần đầu tiên được trình làng tại Việt Nam đó là chiếc Mercedes Maybach GLS. Mẫu xe này đi đầu trong việc trang bị công nghệ tiên tiến, đột phá mới trong thiết kế ngoại nội thất, kể cả sử dụng khối động cơ mạnh mẽ vượt trội để tạo nên những trải nghiệm lái xe tuyệt vời cho người lái.\r\n\r\nMercedes Maybach GLS 600 đẳng cấp, sang chảnh\r\nMercedes Maybach GLS 600 đẳng cấp, sang chảnh\r\nPhiên bản xe Mercedes Maybach GLS 600 4Matic đang được phân phối với giá 11.500.000.000 VND trên thị trường Việt Nam.', 'hinh2.jpg', 'post', '', 2, NULL, NULL, 0, NULL, 1),
(3, 1, 'Top 10 thương hiệu xe nổi tiếng trên thế giới và ý nghĩa logo ', 'post-3', 'Top 10 các thương hiệu xe hơi nổi tiếng nhất thế giới và ý nghĩa logo\r\nTrên thế giới hiện nay có rất nhiều các thương hiệu xe hơi có tiếng. Mỗi hãng xe trên thế giới đều có nhiều loại, thậm chí nhiều màu và nhiều phân khúc. Vậy đó là những hãng xe hơi nào? Bài viết dưới đây, Leon Dio sẽ cùng bạn tìm hiểu về top 10 các thương hiệu xe hơi nổi tiếng thế giới nhé!\r\n\r\nVolvo\r\nTập đoàn Volvo hoạt động chủ yếu trong lĩnh vực sản xuất và phân phối các loại xe bao gồm xe buýt, xe tải, các thiết bị xây dựng khác. Volvo là một trong các thương hiệu xe hơi sản xuất đa quốc gia hiện có trụ sở chính ở Thụy Điển. Tại Việt Nam, Volvo Cars được ủy quyền phân phối chính hãng các dòng xe Sedan và SUV.\r\n\r\ncac-thuong-hieu-xe-hoi-1\r\n\r\nVolkswagen\r\nVolkswagen là một trong các thương hiệu xe hơi lớn nhất thế giới và rất nổi tiếng của Đức. Cái tên Volkswagen là viết tắt của “VW”, hãng xe này gắn liền với hình ảnh của nhà độc tài phát xít Đức Adolf Hitler. Vì khi nhìn vào logo Volkswagen có thể thấy con bọ Volkswagen gắn liền với Hitler. Đây là hãng xe “made in Germany”, là xe của nước Đức và của người dân Đức nhưng ẩn sâu trong đó là phục vụ mục đích chính trị của Hitler.\r\n\r\ncac-thuong-hieu-xe-hoi-2\r\n\r\nThị trường chính của Volkswagen là Châu Âu, tiếp theo là thị trường Trung Quốc. Các hãng xe hơi hạng sang nổi tiếng làm nên tên tuổi của công ty này bao gồm Audi, Porsche, Bentley, SEAT, Bugatti Skoda, Volkswagen và Lamborghini. Ngoài ra, cổ phiếu của nó được niêm yết trên thị trường chứng khoán Tokyo và Đức.\r\n\r\nAudi\r\nKhi nhắc đến những thương hiệu xe hơi nổi tiếng, chúng ta không thể bỏ qua Audi. Thương hiệu này là một trong các thương hiệu xe hơi có lịch sử lâu đời từ cuối thế kỷ XIX đầu thế kỷ XX. Khi nhắc đến Audi, người ta thường nghĩ ngay đến những chiếc Sedan sang trọng và đầy sức hút. Cái tên Audi được dịch theo tiếng Latinh là “Horch” theo tên của người sáng lập August và trong tiếng Đức Audi có nghĩa là “nghe”.\r\n\r\ncac-thuong-hieu-xe-hoi-3\r\n\r\nĐây là một trong những thương hiệu xe hơi nổi tiếng nhất thế giới của Đức chuyên sản xuất ô tô thương hiệu Audi trực thuộc công ty Audi AG. Từ năm 1964, Audi gần như trở thành công ty con của tập đoàn Volkswagen khi đặt trụ sở chính tại Ingolstadt (Bavaria, Đức) với hơn 99,55% cổ phần của Volkswagen. Sau khi tập đoàn mua tài sản của Auto Unico, NSU Motorenwerke AG (NSU) và trở thành một phần của tập đoàn Volkswagen, công ty tiếp tục sử dụng tên Audi.\r\n\r\nToyota\r\nToyota Motor Corporation là một trong các thương hiệu xe hơi đa quốc gia có trụ sở chính tại Nhật Bản và đây cũng là một trong các thương hiệu xe hơi lớn nhất thế giới. Cái tên Toyota được biến tấu từ tên của người sáng lập hãng xe hơi lớn nhất Nhật Bản, “Toyoda”. Xét về độ nhận diện quốc tế, Toyota là nhà sản xuất xe hơi duy nhất trong top 10 công nhận tên BrandZ (là một công cụ được sử dụng để chẩn đoán giá trị thương hiệu). Về logo, sau hơn 7 thập kỷ phát triển ngành công nghiệp xe hơi, Toyota mới chỉ đổi một lần.\r\n\r\ncac-thuong-hieu-xe-hoi-4\r\n\r\nKhông chỉ so sánh với các thương hiệu xe hơi trên thế giới ở thị trường nước ngoài, Toyota hiện chiếm một vị trí quan trọng tại Việt Nam. Minh chứng cho điều đó, hiện nay tại các thành phố lớn như TP.HCM, đâu đâu cũng có thể bắt gặp các mẫu xe Toyota từ xe dịch vụ cho đến xe gia đình.\r\n\r\nMercedes-Benz\r\nKhi nhắc đến các thương hiệu xe hơi nổi tiếng trên thế giới, chúng ta thường nghe đến Mercedes-Benz. Mercedes-Benz là một trong các thương hiệu xe hơi sản xuất xe hơi, xe buýt và xe tải nổi tiếng nhất trên thế giới. Công ty được coi là nhà sản xuất ô tô lâu đời nhất còn tồn tại cho đến ngày nay.\r\n\r\ncac-thuong-hieu-xe-hoi-5\r\n\r\nMercedes-Benz cũng là một trong những hãng tiên phong trong việc giới thiệu nhiều công nghệ và cải tiến an toàn mà sau này đã trở nên phổ biến trên toàn thế giới. Logo ngôi sao ba cánh của một trong những thương hiệu xe hơi đắt nhất thế giới này có ý nghĩa đại diện cho ba yếu tố: Trái đất, biển và bầu trời. Biểu tượng này hiện đã có mặt trên toàn cầu và trở thành một thương hiệu xe hơi nổi tiếng hàng đầu.\r\n\r\nHonda\r\nHonda là một trong các thương hiệu xe hơi, nhà sản xuất động cơ lớn nhất thế giới với hơn 14 triệu chiếc được bán ra hàng năm. Từ năm 2004, công ty bắt đầu sản xuất động cơ diesel vừa êm vừa không lọc để đáp ứng tiêu chuẩn ô nhiễm. Tuy nhiên, có thể nói nền tảng thành công của hãng này chính là từ việc sản xuất xe máy.\r\n\r\ncac-thuong-hieu-xe-hoi-6\r\n\r\nHonda có trụ sở chính tại Tokyo và được niêm yết trên thị trường chứng khoán Tokyo, Thành phố New York, London, Paris, Hoa Kỳ Honda có trụ sở tại Torrance, California (Hoa Kỳ). Honda Canada đã đóng cửa khu vực Scarborough của Toronto, Ontario và chuyển đến trụ sở mới ở Richmond Hill, Ontario vào năm 2008.\r\n\r\nBMW\r\nBMW (Bayerische Motoren Werke AG – Bavarian Mechanical Workshop) là một trong các thương hiệu xe hơi sản xuất ô tô và xe máy quan trọng của Đức. Thương hiệu xe hơi BMW nổi tiếng trên thế giới bởi sự sang trọng, thiết kế thể thao và hiệu suất cao. Trong suốt gần 1 thế kỷ qua, hãng xe BMW, một trong các nhãn hiệu xe ô tô hạng sang này đã thay đổi logo rất nhiều. Dù có nhiều thay đổi nhưng hầu như logo của hãng vẫn giữ nét truyền thống với hình cánh quạt và nền trắng xanh chủ đạo.\r\n\r\ncac-thuong-hieu-xe-hoi-7\r\n\r\nFord\r\nFord Motor Company là một tập đoàn đa quốc gia của nước Mỹ. Đây là một trong các thương hiệu xe hơi và là nhà sản xuất ô tô lớn thứ 5 trên thế giới. Nó được tính theo doanh số bán xe toàn cầu, sau Toyota, General Motors, Volkswagen và Hyundai-Kia. Ford có trụ sở chính tại Dearborn, Michigan, ngoại ô Detroit, được thành lập bởi Henry Ford và các cổ đông vào ngày 16 tháng 6 năm 1903.\r\n\r\ncac-thuong-hieu-xe-hoi-8\r\n\r\nNổi tiếng với Model T đầu tiên của ngành công nghiệp xe hơi, Ford có cổ phần lớn trong Volvo, Jaguar, Land Rover, Mazda, Mercury và Aston Martin. Năm 2019, Ford thiết lập quan hệ đối tác với Volkswagen để phát triển xe thương mại, công nghệ tự lái và xe điện.\r\n\r\nHyundai\r\nHyundai là một trong các thương hiệu xe hơi được sáng lập bởi Chung Ju-Yung. Trong tiếng Hàn, Hyundai có nghĩa là “mới mẻ” hoặc “hiện đại”. Vì vậy, Hyundai là biểu tượng thể hiện xu hướng phát triển của xã hội và tâm lý khách hàng. Ý nghĩa của tên thương hiệu cũng chính là kim chỉ nam xuyên suốt quá trình hình thành và phát triển của Hyundai.\r\n\r\ncac-thuong-hieu-xe-hoi-9\r\n\r\nLogo các thương hiệu xe hơi của Hyundai gồm có một chữ “H” được bao bọc trong vòng hình oval. Chữ “H” vừa là chữ cái đầu của thương hiệu Hyundai, đồng thời cũng là hình ảnh về hai con người đang bắt tay nhau. Trong đó, bên đại diện cho khách hàng, bên còn lại là sản xuất, thể hiện hàm ý về sự đoàn kết, cùng mang lại giá trị tốt đẹp.\r\n\r\nHình oval bên ngoài mang ý nghĩa Hyundai sẽ mở rộng hoạt động của mình ra khắp thế giới. Có thể thấy nhà sáng lập Chung Ju-Yung đã đặt rất nhiều tâm huyết vào thương hiệu này ngay từ cái tên và logo này.\r\n\r\nLamborghini\r\nThương hiệu Ferruccio Lamborghini là một trong các thương hiệu xe hơi được nhiều quý ông yêu thích. Đây là thương hiệu xe hơi nổi tiếng trên thế giới của Ý. Lamborghini từng là kỹ sư trong lực lượng không quân Ý trong Thế chiến thứ 2, với niềm đam mê xe hơi, Lamborghini bắt đầu hiện thực hóa ước mơ chế tạo những chiếc xe tốt nhất.\r\n\r\ncac-thuong-hieu-xe-hoi-10\r\n\r\nNăm 1963, khi đã có trong tay tiềm lực kinh tế dồi dào, Lamborghini quyết định xây dựng nhà máy sản xuất xe hơi tại Saint’ Agata với tên gọi Automobili Lamborghini SpA. Lamborghini là hãng xe biểu tượng cho sức mạnh và tốc độ và hãng xe này đã nhiều lần lập nhiều kỷ lục về tốc độ. Hiện tại, trụ sở chính và địa điểm sản xuất của công ty được đặt tại Sant’ Agata Bolognese, giáp Bologna, thuộc đất nước Ý.\r\n\r\nTất cả các thương hiệu xe hơi mà Leon Dio giới thiệu đến bạn ở bài viết trên  đều là một trong các thương hiệu xe hơi top đầu thế giới. Hy vọng với những chia sẻ trên, Leon Dio đã mang đến cho bạn những nguồn kiến thức bổ ích và hiểu hơn về đẳng cấp của các thương hiệu xe hơi này.', 'hinh3.jpg', 'post', '', 3, NULL, NULL, 0, NULL, 1),
(4, 1, '12 mẫu xe ô tô cổ điển có thiết kế ấn tượng từng nổi tiếng một thời', 'post-4', 'Sự phát triển mạnh mẽ của ngành công nghiệp ô tô được minh chứng bởi sự xuất hiện hàng loạt phiên bản xe ngày càng hiện đại và cạnh tranh khốc liệt. Tuy nhiên, xe ô tô cổ điển vẫn chiếm vị trí nhất định trên thị trường bởi sở hữu những thiết kế độc đáo, đặc biệt gây ấn tượng đối với phái mạnh.\r\nMục lục\r\nĐiểm nổi bật phải kể đến của xe hơi cổ điển chính là sự đa dạng trong thiết kế. Những phiên bản này là nhân chứng cho lịch sử phát triển của ngành công nghiệp ô tô.\r\n\r\n1. Dodge Charger\r\nXe ô tô cổ Dodge Charger được xem là biểu tượng của “xe cơ bắp” Mỹ (hay còn gọi là Muscle car, dùng để chỉ một phân khúc xe thể thao cỡ trung có dung tích động cơ lớn) và trở nên nổi tiếng khi xuất hiện thường xuyên trong nhiều bộ phim như: Fast and Furious, The Dukes of Hazzard,... \r\n\r\nThế hệ đầu tiên của Dodge Charger chính thức ra đời vào năm 1966. Điểm đặc biệt trên phiên bản này là nội thất với bảng điều khiển trung tâm kéo dài từ ghế ngồi phía trước đến phía sau. Thiết kế được lấy cảm hứng từ Chrysler 300 ở những năm 1960 - 1962. Mặc dù Dodge Charger ra đời không phải nhằm mục đích cạnh tranh trực tiếp với hiệu suất của những chiếc xe Pony. Tuy nhiên, việc trang bị động cơ 426 Hemi V8 nổi tiếng của Chrysler đã khiến Dodge Charger trở thành mẫu xe được nhiều người yêu thích.\r\n\r\nNgoài ra, đường viền mui xe và lưới tản nhiệt được làm bằng kim loại nổi, hoàn chỉnh bộ phận đèn pha. Cụm đèn hậu ở phía sau gắn chữ “CHARGER” mạ crôm nổi bật được đánh giá là một trong những thiết kế và tính năng chưa từng thấy trên các dòng xe của Chrysler kể từ những năm 1942. Nội thất được trang bị gồm:\r\n\r\nVô lăng giả vân gỗ.\r\nHàng ghế sau và bệ tỳ tay trung tâm ở phía sau có thể gập được về trước để tạo không gian rộng rãi cho khoang hành lý.\r\nĐèn chiếu sáng, cửa được bọc nhựa Vinyl và trang trí rất thẩm mỹ.\r\nBảng điều khiển không sử dụng bóng đèn thông thường mà thay vào đó là trang bị điện phát quang để thắp sáng.\r\nXe ô tô cổ Dodge Charger sử dụng hộp số tay ba tốc độ và bốn mô hình động cơ. Với những thiết kế và tính năng sở hữu, phiên bản xe này đã thu về cho nhà sản xuất tổng sản lượng lên đến 37.344 chiếc trong lần giới thiệu vào năm 1966. Trong các thế hệ kế tiếp, xe ô tô cổ Dodge Charger đã có nhiều cải tiến mới để phù hợp hơn với nhu cầu sử dụng.\r\n\r\nThiết kế ấn tượng của xe ô tô cổ Dodge Charger\r\nXe ô tô cổ Dodge Charger sở hữu thiết kế ấn tượng (Nguồn: Sưu tầm)\r\n2. Mercedes-Benz 300SL\r\nMercedes-Benz 300SL được hình thành từ một chiếc xe thể thao đua có tên là W194 và không có kế hoạch đưa vào sản xuất hàng loạt. Năm 1951, công ty Daimler-Benz (được thành lập vào năm 1926 do sự hợp nhất của hai công ty ô tô tiên phong của Đức là Daimler-Motoren-Gesellschaft và Benz) quyết định tham gia vào một cuộc thi và kế hoạch sản xuất cũng xuất phát từ mục đích này. Năm 1952, chiếc xe mui kín này đã lập kỷ lục trong các chặng đua lớn, đem đến nhiều thành công ấn tượng. Sau đó, W194 tiếp tục được nâng cấp thành một phiên bản mới là Mercedes-Benz 300SL, được bổ sung thêm hệ thống phun nhiên liệu trực tiếp cơ học, hộp số trục sau và bánh xe 16inch.\r\n\r\nThân xe được làm bằng hợp kim magie Elektron, giúp giảm bớt trọng lượng, đồng thời hỗ trợ di chuyển và tăng tốc tốt hơn. Mercedes-Benz 300SL cũng đã có mặt tại Triển lãm Ô tô Thể thao Quốc tế ở New York vào tháng 2/1954 và nhận được rất nhiều phản hồi tích cực. Một số đặc điểm nổi bật phải kể đến ở Mercedes-Benz 300SL bao gồm:\r\n\r\nThiết kế cửa mở dạng “cánh chim” ấn tượng và tỉ mỉ, đem lại góc mở cửa chính xác cũng như đảm bảo phần bản lề hoạt động một cách trơn tru. \r\nThiết kế thân xe có khả năng giảm lực cản khí động học. \r\nKích thước xe cân đối, kiểu dáng năng động.\r\nHệ thống khung có độ cứng và khả năng chịu lực tốt.\r\nSử dụng động cơ 6 xi lanh, hệ thống phun hướng.\r\nNội thất sang trọng, đem lại cảm giác thoải mái cho người sử dụng.\r\nÔ tô cổ điển Mercedes-Benz 300SL sở hữu kiểu dáng ấn tượng\r\nKiểu dáng ấn tượng và độc đáo của xe Mercedes-Benz 300SL (Nguồn: Sưu tầm)\r\n3. Aston Martin DB5\r\nXe ô tô cổ Aston Martin DB5 được sản xuất vào năm 1963, là một trong những mẫu ô tô xa xỉ của Anh. DB5 là chiếc xe James Bond nổi tiếng trong điện ảnh, cụ thể là bộ phim James Bond Goldfinger. Phiên bản này được thiết kế dựa trên khuôn khổ của dòng DB4 trước đó nhưng có nhiều cải tiến về hệ thống khung gầm. Ngoài ra, DB5 còn mở rộng lên động cơ 4L, tạo ra công suất lớn đạt tới 282 mã lực và 288 lb-ft mô-men xoắn.\r\n\r\nThông số kỹ thuật:\r\n\r\nNguồn cấp nhiên liệu: ba bộ chế hòa khí SU.\r\nCông suất: 282 bhp (286 PS; 210 kW) tại 5.500 vòng/phút, 210 bhp (213 PS; 157 kW) Net.\r\nMô-men xoắn : 288 lb-ft (390Nm) tại 3.850 vòng/phút.\r\nTrọng lượng: 1.502kg (3.311lb).\r\nThiết kế:\r\n\r\nĐộng cơ hoàn toàn bằng nhôm.\r\nTrang bị tiêu chuẩn: Ghế ngả, cửa sổ chỉnh điện, thảm len, bình xăng đôi, bộ làm mát dầu, bánh xe mạ crôm,...\r\nThân xe được làm bằng hợp kim magie, chế tạo theo kỹ thuật tiên tiến. \r\nToàn bộ nội thất bên trong cabin được trang trí bằng da, kể cả bình cứu hỏa.\r\nAston Martin DB5 là phiên bản xe ô tô cổ nổi tiếng\r\nAston Martin DB5 là mẫu xe ô tô cổ nổi tiếng của Anh (Nguồn: Sưu tầm)\r\n4. Shelby AC Cobra\r\nShelby AC Cobra được sản xuất thành công vào năm 1964 bởi Carroll Shelby. Mẫu xe này trở thành phiên bản gây kinh ngạc bởi trang bị động cơ có công suất lớn lên đến 362kW (485 mã lực; 492 PS). Đây là mẫu xe thể thao mạo hiểm nên không được lắp đặt các trang thiết bị đa dạng. Phương tiện không có mái che như các dòng xe hơi thông thường, thay vào đó là một tấm bạt và cửa sổ bên plexiglas để phòng trời mưa. Điểm nổi bật của Shelby AC Cobra là sở hữu động cơ mạnh mẽ, âm thanh gầm rú ấn tượng, tạo nên sự hấp dẫn cho người lái. \r\n\r\nShelby AC Cobra là mẫu xe ô tô thể thao ấn tượng\r\nShelby AC Cobra là mẫu xe thể thao ấn tượng (Nguồn: Sưu tầm)\r\n5. Porsche 356\r\nPorsche 356 xuất hiện vào khoảng những năm 1948 - 1949 trong bộ sưu tập của Porsche Konstruktionen. Mẫu xe thể thao này ban đầu được thiết kế bởi Ferry Porsche, con trai của người đồng sáng lập nhà máy sản xuất ở Áo. Phiên bản ô tô này được sản xuất dựa trên cảm hứng trải nghiệm lái từ Alfa Romeo, BMW và Volkswagen Cabriolet. Tuy nhiên, mục tiêu của Ferry Porsche là tạo ra một mẫu xe nhẹ hơn, mã lực lớn hơn so với ô tô cùng thời. \r\n\r\nSau khi hoàn thành, năm 1948, Porsche 356 đã được tham gia cuộc đua tại Innsbruck và đứng đầu trong phân hạng. Những chiếc xe đầu tiên được bán chủ yếu tại Đức và Áo. Đầu những năm 1950, Porsche 356 trở nên nổi tiếng và chinh phục những người đam mê ô tô bởi khả năng xử lý tốt, trang bị khí động học và sở hữu sức mạnh động cơ vượt trội.\r\n\r\nXe ô tô cổ Porsche 356 có kiểu dáng thanh lịch\r\nKiểu dáng thanh lịch của Porsche 356 (Nguồn: Báo Công an nhân dân)\r\n6. Jaguar E-Type\r\nJaguar E-Type là mẫu xe thể thao được sản xuất bởi Jaguar trong giai đoạn từ năm 1961 - 1975. Phiên bản này lấy cảm hứng từ chiếc xe đua D-Type cùng hãng, đã từng giành chiến thắng trong ba năm liên tiếp (1955 - 1958). Năm 2004, tạp chí Sports Car International đánh giá cao E-Type trong số những chiếc xe thể thao cùng phân khúc trong những năm 1960. Tháng 3/2008, mẫu xe ô tô cổ này lại tiếp tục có trong danh sách The Daily Telegraph. Ngoài ra, E-Type cũng xuất hiện nhiều trong những tập truyện tranh nổi tiếng như Diabolik, phim Austin Powers và các phim truyền hình Mad Men khác.\r\n\r\nPhiên bản này được xem là một biểu tượng của ô tô thế giới. Tốc độ tối đa là 150 dặm/giờ (241km/h). Ngoài ra, kiểu dáng thiết kế cũng rất độc đáo với kết cấu đơn nhất, phanh đĩa, thanh răng, bánh răng và hệ thống treo trước sau đều độc lập.\r\n\r\nJaguar E-Type là mẫu xe ô tô cổ có hiệu suất hoạt động cao\r\nJaguar E-Type được đánh giá cao về hiệu suất hoạt động (Nguồn: Sưu tầm)\r\n7. Boss 429 Mustang \r\nBoss 429 Mustang được công nhận là một trong những mẫu “xe cơ bắp” có giá trị cao và hiếm thấy hiện nay. Năm 1969, phiên bản này được thiết kế với mục tiêu là để cạnh tranh với động cơ 426 Hemi từ Chrysler trong Giải quốc gia Grand của NASCAR. Mẫu xe Boss 429 được chế tạo như một chiếc Mustang Fastback, sản xuất giới hạn để đáp ứng yêu cầu của cuộc thi.\r\n\r\nĐộng cơ của phiên bản này được nâng cấp từ động cơ Ford 385. Cụ thể, Boss 429 Mustang sử dụng động cơ có đầu xi lanh bằng nhôm, với buồng đốt dạng bán cầu. Các đầu này dùng phương pháp tách biệt mạch làm mát cho phần khối và phần đầu nhằm giảm điểm nóng. Năm 1968, Boss 429 bắt đầu được sản xuất tại nhà máy Ford Rouge với nhiều cải tiến mới, đặc biệt là chế tạo động cơ lớn và mạnh mẽ hơn.\r\n\r\nBoss 429 Mustang là mẫu xe cổ điển hiếm có hiện nay\r\nBoss 429 Mustang là mẫu “xe cơ bắp” cổ điển hiếm có hiện nay (Nguồn: Sưu tầm)\r\n8. Volkswagen Beetle\r\nMẫu xe ô tô cổ Volkswagen Beetle được sản xuất bởi Kỹ sư trưởng Ferdinand Porsche và nhóm cộng sự từ 1930 - 1938. Tuy nhiên, do ảnh hưởng của Chiến tranh thế giới thứ hai, những chiếc Beetle dân dụng chỉ thực sự được chế tạo với số lượng đáng kể vào cuối những năm 1940. Phiên bản này sau đó được đặt tên nội bộ là Volkswagen Type 1 và được bán trên thị trường với tên gọi là Volkswagen. Các mô hình kế tiếp lần lượt được gọi là Volkswagen 1200, 1300, 1500, 1302 và 1303. Trong đó ba mô hình trước cho thấy sự dịch chuyển của động cơ, hai mô hình sau có số lấy từ số mã mô hình. \r\n\r\nKiểu dáng độc lạ của mẫu ô tô cổ Volkswagen Beetle\r\nKiểu dáng độc lạ của xe ô tô cổ Volkswagen Beetle (Nguồn: Sưu tầm)\r\n9. Volvo P1800\r\nP1800 trở nên nổi tiếng khi được điều khiển bởi nam diễn viên người Anh Roger Moore trong loạt phim truyền hình The Saint, phát sóng vào năm 1962 - 1969. Ý tưởng ban đầu xuất hiện vào năm 1957 khi Volvo muốn có một chiếc xe thể thao để cạnh tranh với các thương hiệu khác tại thị trường Mỹ và châu Âu. Công việc thiết kế được thực hiện bởi con trai cố vấn kỹ thuật Helmer Petterson - Pelle, dưới sự giám hộ của Pietro Frua. Ba nguyên mẫu đầu tiên được chế tạo từ tháng 9/1957 - 1/1958 và ra mắt vào tháng 9/1958 gồm: P958 - X1, P958 - X2 và P958 - X3.\r\n\r\nTháng 12/1957, Helmer Petterson đã lái chiếc X1 đến Osnabruck và dự định những chiếc xe đầu tiên có thể tung ra thị trường vào tháng 12/1958. Tuy nhiên vào tháng 2/1958, do một vài sự cố từ phía khách hàng, kế hoạch này bị ngưng lại.\r\n\r\nTháng 1/1960, sau nhiều nỗ lực, chiếc xe được giới thiệu trước công chúng lần đầu tiên tại Triển lãm Ô tô Brussels. Tháng 9/1960, mẫu xe P1800 chính thức được bán ra.\r\n\r\nKiểu dáng thiết kế của xe ô tô cổ Volvo P1800\r\nVolvo P1800 được chính thức bán ra thị trường vào năm 1960 (Nguồn: Sưu tầm)\r\n10. McLaren F1\r\nNăm 1985, một doanh nhân người Anh cùng với người bạn đam mê xe đua là Ron Dennis đã thành lập Tập đoàn McLaren. Phiên bản F1 ban đầu chỉ là một mẫu xe trưng bày tại các triển lãm nhưng sau khi được giới thiệu, chiếc xe thể thao này đã chinh phục được những người đam mê xe hơi trên toàn thế giới.\r\n\r\nMẫu xe ô tô cổ này rất hiếm và khó để sở hữu. Từ năm 1992 - 1998, số lượng được sản xuất chỉ là 106 chiếc. F1 có thiết kế ba chỗ ngồi, trong đó ghế lái được đặt ở giữa. Chiếc xe có trọng lượng nhẹ, chỉ khoảng 1.138kg nhờ sản xuất bộ khung bằng sợi carbon. \r\n\r\nThiết kế độc đáo của xe ô tô cổ McLaren F1\r\nMcLaren F1 là xe thể thao được thiết kế và sản xuất bởi Tập đoàn McLaren của Anh (Nguồn: Sưu tầm)\r\n11. Ferrari 308 GTB/GTS\r\nFerrari 308 GTB/GTS được giới thiệu tại Paris Motor Show vào năm 1975 để thay thế cho hai phiên bản là Dino 246 GT và GTS. Dòng xe này sở hữu động cơ V8 F106 AB với bốn bộ chế hòa khí Weber 40DCNF, hai cuộn cảm và bộ đánh lửa cuộn dây đơn. \r\n\r\nĐiểm nổi bật của của 308 GTB/GTS là thiết kế thân xe hoàn toàn bằng nhựa gia cường thủy tinh (GRP) do đó trọng lượng xe rất nhẹ, chỉ khoảng 1.050kg (2.315lb). Đến tháng 6/1977, mẫu xe này được chuyển sang thân thép, dẫn đến trọng lượng tổng thể tăng khoảng thêm khoảng 150kg (331lb). \r\n\r\nThiết kế thân xe bằng nhựa gia cường thủy tinh trên ô tô cổ điển Ferrari 308 GTB/GTS\r\nXe hơi cổ điển Ferrari 308 GTB/GTS sở hữu thân xe bằng nhựa gia cường thủy tinh (Nguồn: Sưu tầm)\r\n12. Austin-Healey 3000\r\nAustin-Healey 3000 là một phiên bản xe thể thao được sản xuất từ năm 1959 - 1967. Thân xe được sản xuất bởi Jensen Motors và tiến hành lắp ráp tại Công trình MG của BMC ở Abingdon, cùng với các mẫu xe MG khác của tập đoàn.\r\n\r\nTrong thời gian sản xuất, Austin-Healey 3000 đã nâng cấp từ một chiếc xe thể thao trở thành một chiếc xe mui trần năng động và độc đáo. Năm 1963, 91,5% trong tổng số 3000 mẫu xe này đã được xuất khẩu, trong đó chủ yếu là đến Bắc Mỹ. Austin-Healey 3000 cũng đã giành được rất nhiều thành công trong các cuộc đua ở châu Âu và ngày nay vẫn còn xuất hiện trong các cuộc thi xe ô tô cổ.\r\n\r\nXe ô tô cổ Austin-Healey 3000 có thiết kế mui trần\r\nThiết kế mui trần ở xe ô tô cổ Austin-Healey 3000 (Nguồn: Sưu tầm)\r\nCó thể nói, xe ô tô cổ điển luôn hấp dẫn bởi thiết kế độc đáo và khác biệt. Những phiên bản này là nhân chứng cho sự phát triển mạnh mẽ của ngành công nghiệp ô tô trên toàn thế giới.', 'hinh4.jpg', 'post', '', 4, NULL, NULL, 0, NULL, 1),
(5, 2, 'Những mẫu xe có thiết kế vuông vức cổ điển', 'post-5', 'Dòng xe này được thịnh hành nhất vào những năm 1980 khi gần như mọi chiếc xe hơi và SUV trên thị trường đều có thiết kế vuông vắn. Và chỉ khi kỹ thuật chế tạo kim loại và khí động học cong ra đời, xu hướng này mới kết thúc.\r\n\r\nTuy nhiên, các mẫu xe có các nếp gấp 90 độ và các tấm thân xe phẳng sắc nét vẫn được nhiều người sử dụng cho tới nay. Dưới đây là những chiếc ô tô hình hộp hàng đầu có thể đến tay người dùng.\r\n\r\nMercedes-Benz G-Class\r\n\r\nNhững mẫu xe có thiết kế vuông vức cổ điển ảnh 1\r\nĐây là chiếc xe chở hành khách mạnh nhất hiện có ở Bắc Mỹ. Bắt nguồn từ những năm 1970, mẫu SUV này sở hữu một thiết kế cố định và hiếm khi được cập nhật. Thế hệ G-Wagon đầu tiên có từ năm 1979 cho đến năm 1992. Sau đó chúng được thay thế bằng một mẫu xe hoàn toàn mới trông gần giống với mẫu SUV cũ. G-Class thế hệ thứ hai đã ngưng sản xuất trong năm 2018. Trong gần 30 năm, chỉ có tổng cộng hai thế hệ G-Class.\r\n\r\nThế hệ mới nhất có thiết kế tròn hơn một chút ở mặt trước nhưng vẫn sở hữu kiểu dáng đặc trưng. Động cơ V8 tạo ra 416 mã lực hoặc động cơ sở hữu 577 mã lực của AMG. Giống như kiểu dáng hình hộp, G-Class chưa bao giờ đánh mất khả năng off-road ở cả hai thế hệ. Mặc dù với mức giá niêm yết lên tới hơn một trăm ngàn USD, chiếc xe vẫn luôn là phương tiện ai cũng muốn lái.\r\n\r\nAdvertisements\r\n\r\nJeep Wrangler\r\n\r\nNhững mẫu xe có thiết kế vuông vức cổ điển ảnh 2\r\nỞ phân khúc SUV địa hình vuông vức có giá cả phải chăng hơn là Jeep Wrangler. Giống như G-Class, Wrangler đã được sản xuất trong một thời gian dài, từ thế chiến thứ hai. Thông qua các hình thức và tên gọi khác nhau, chiếc xe Jeep này luôn mang trên mình tấm kim loại có thể nhận biết ngay lập tức. Ngay cả khi mui xe tròn xuống phần chắn bùn rõ rệt, chiếc SUV vẫn là một khối hộp phẳng từ kính chắn gió về phía sau.\r\n\r\nỞ phiên bản hoàn toàn mới cho năm 2018, Wrangler được trang bị động cơ bốn xi-lanh tăng áp, V6 hoặc thậm chí là động cơ V8 470 mã lực. Bên cạnh đó, Jeep cũng cung cấp phiên bản lai điện. Nó thể hiện khả năng đi địa hình vượt trội so với các đối thủ cùng phân khúc.\r\n\r\nFord Bronco / Bronco Sport\r\n\r\nNhững mẫu xe có thiết kế vuông vức cổ điển ảnh 3\r\nTrong khi Wrangler đã tiếp tục được sản xuất trong vài thập kỷ, Ford Bronco chỉ mới trở lại sau một thời gian dài gián đoạn. Ban đầu được chế tạo vào những năm 1960, Bronco là một chiếc SUV địa hình vuông vức nổi bật cho đến khi dừng sản xuất vào năm 1996. Tuy nhiên vào năm ngoái, mẫu xe \"huyền thoại\" đã trở lại, thừa hưởng thiết kế mang tính biểu tượng của Jeep. Có sẵn dưới dạng hai cửa hoặc bốn cửa, Bronco có nhiều bề mặt phẳng, đặc biệt là khi được trang bị mui cứng có thể tháo rời.\r\n\r\nBổ sung cho chiếc SUV địa hình gồ ghề này là chiếc Bronco Sport nhỏ hơn. Dựa trên phong cách từ người anh em lớn hơn, Bronco Sport có tổng thể ngoại thất tròn trịa hơn một chút. Nhưng khi so sánh với phần còn lại của thị trường crossover nhỏ gọn, nó trông khá hầm hố khi sánh ngang với Nissan Rogue, Honda CR-V hay Hyundai Tucson.\r\n\r\nLand Rover Defender\r\n\r\nNhững mẫu xe có thiết kế vuông vức cổ điển ảnh 4\r\nLand Rover Defender cũng là dòng xe xuất hiện từ rất lâu. Mặc dù tên gọi thực tế là Defender chỉ có từ đầu những năm 1980, mẫu xe đã có từ nhiều thập kỷ trước đó. Trong khi người tiêu dùng tại Bắc Mỹ say mê khả năng của xe Jeep, phần còn lại của thế giới rất hâm mộ sức mạnh như dê núi của Land Rover.\r\n\r\nDefender mới nhất vẫn có sẵn ở dạng hai hoặc bốn cửa và có kiểu dáng khối vuông vắn. Mặc dù được cho là chưa đủ mạnh về khoản off-road, thương hiệu Anh cho phép người tiêu dùng lựa chọn 3 loại động cơ, đặc biệt có động cơ V8 518 mã lực mạnh mẽ.\r\n\r\nChrysler 300\r\n\r\nNhững mẫu xe có thiết kế vuông vức cổ điển ảnh 5\r\nNhư đã đề cập ở trên, sedan cũng từng một thời chủ yếu có thiết kế hình hộp. Chrysler 300 là ví dụ gần nhất với phiên bản trình làng vào năm 2020. Chiếc xe có thiết kế phần đầu xe, mui xe, thùng xe và phía sau phẳng, bớt đi kiểu dáng cong tròn hiện có trong phần lớn các mẫu sedan hiện nay.\r\n\r\nMang phong cách truyền thống của Mỹ, nó được trang bị tiêu chuẩn với hệ dẫn động cầu sau và động cơ V8. Nhưng nếu mong muốn một thứ gì đó hiện đại và hiệu quả hơn, khách hàng sẽ tìm được động cơ V6 tiêu chuẩn có thể kết hợp với hệ dẫn động bốn bánh trên phiên bản tùy chọn.\r\n\r\nGMC Yukon, Chevrolet Tahoe / Suburban\r\n\r\nNhững mẫu xe có thiết kế vuông vức cổ điển ảnh 6\r\nKhông phải tất cả những chiếc SUV hình hộp đều phải là \"chuyên gia off-road\". Khi một chiếc SUV đạt đến kích thước nhất định, tất cả đều hướng đến lợi ích kinh doanh và việc tối đa hóa không gian nội thất được ưu tiên hơn cả phong cách.\r\n\r\nChevrolet Tahoe và Suburban hiện đại, cũng như GMC Yukon, tiếp tục thể hiện sự phù hợp cho những ai cần chở nhiều người và kéo nặng hơn. Để giúp thực hiện nhiệm vụ này, GM đã giới thiệu một tùy chọn động cơ diesel trên những chiếc SUV cho thế hệ này, tạo ra 277 mã lực và mô-men xoắn 460 lb-ft (khoảng 623,6 Nm).\r\n\r\nRivian R1S\r\n\r\nNhững mẫu xe có thiết kế vuông vức cổ điển ảnh 7\r\nSẵn sàng giao hàng vào đầu năm sau, R1S là một chiếc SUV ba hàng ghế được trang bị bốn động cơ điện tạo ra tổng công suất 700 mã lực. Điều này sẽ giúp chiếc SUV cỡ lớn có thể tăng tốc từ 0 đến 96 km/h trong khoảng ba giây. Nó cũng sẽ có khả năng kéo chừng 3,4 tấn. Ngoài ra, những chuyến off-road sẽ trở nên phấn khích hơn khi chiếc xe sử dụng lốp AT tiêu chuẩn và khoảng sáng gầm đáng tự hào.\r\n\r\nKia Soul\r\n\r\nNhững mẫu xe có thiết kế vuông vức cổ điển ảnh 8\r\nKia Soul là một trong những chiếc xe khó phân loại nhất. Nó không thực sự là một chiếc crossover vì thiếu hệ dẫn động 4 bánh tùy chọn và kiểu dáng giống SUV thông thường. Nó không phải là một chiếc hatchback vì nó có trần quá cao và khoảng sáng gầm vượt mức. Với thiết kế hình hộp, Soul là một trong những chiếc xe sở hữu kiểu dáng thú vị hơn so với các đối thủ đang được bán hiện nay. Đèn pha thấp với đèn chạy ban ngày giống như cặp lông mày tạo cho nó một mặt trước độc đáo.\r\n\r\nSoul cũng có thể trở thành một chiếc xế hộp tốc độ cao nhờ tùy chọn động cơ tăng áp 201 mã lực.\r\n\r\nToyota 4Runner\r\n\r\nNhững mẫu xe có thiết kế vuông vức cổ điển ảnh 9\r\nToyota 4Runner có lẽ là mẫu xe có nét tròn trịa nhất trong danh sách này. Dù sở hữu nhiều phần góc cạnh, chiếc xe vẫn có góc nở phía sau hơn một chút và đường mui dốc hơn những cái tên đã được nhắc tới. Mặc dù vậy, chia nhỏ vòm bánh xe là điểm cộng của 4Runner đối với nhiều người.', 'mauxevuong.jpg', 'post', '', 5, NULL, NULL, 0, NULL, 1),
(6, 2, 'Top 10 chiếc xe ô tô được yêu thích nhất hiện nay', 'post-6', '1. Xe ô tô cổ Maserati A6GCS/53\r\nMaserati A6GCS/53 là mẫu ô tô được ra mắt vào những năm 50 của hãng xe sang Maserati, Italy, là mẫu xe siêu tốc từng thể hiện xuất sắc trong cuộc đua 1000 dặm năm 1954 với thời gian cán đích kỷ lục.\r\n\r\nXe ô tô cổ Maserati A6GCS/53\r\n\r\nXe được thiết kế bởi hãng thiết kế ô tô hàng đầu của Ý - Pininfarina và được đánh giá là một trong những chiếc xe hơi tiêu biểu nhất mọi thời đại.\r\n\r\n2. Xe hơi cổ Dodge Charger\r\nDodge Charger chính thức ra đời vào năm 1966 với thế hệ đầu tiên. Xe ô tô cổ Dodge Charger sử dụng hộp số tay ba tốc độ và bốn mô hình động cơ. Với những thiết kế và tính năng sở hữu, phiên bản xe này đã thu về cho nhà sản xuất tổng sản lượng lên đến 37.344 chiếc trong lần giới thiệu vào năm 1966.\r\n\r\nXe hơi cổ Dodge Charger\r\n\r\n \r\n\r\nCharger có khoảng để chân cho hàng ghế sau lên tới 1.016mm, khiến cho mẫu sedan có khả năng vận hành cao này rất phù hợp cho cả một gia đình. So với các đối thủ cạnh tranh, Charger có không gian ngồi rộng rãi hơn hẳn.\r\n\r\nMặc dù động cơ Hemi V8 5,7l của xe được xếp vào loại nhỏ nhưng nó vẫn rất tuyệt. Hiệu suất 370 mã lực và 527Nm giúp xe di chuyển với uy thế không nhỏ còn hộp số tự động tám cấp giúp xe vận hành một cách ổn định.\r\n\r\n►►► Xem thêm: Top 10 siêu xe đắt nhất thế giới với giá triệu đô cực khủng\r\n\r\n3. Xe mui trần cổ điển 1958 Ferrari 250 GT LWB California Spider\r\nĐược mệnh danh là chiếc xe mui trần đẹp nhất từng được tạo ra, 958 Ferrari 250 GT LWB California Spider sở hữu động cơ  Colombo V-12 3 lít công suất 237 mã lực mạnh mẽ gây chú ý đến giới mộ điệu.\r\n\r\n1958 Ferrari 250 GT LWB California Spider\r\n\r\nHơn nữa, 1958 Ferrari 250 GT LWB California Spider có giá nguyên bản chỉ 12.000 USD. Vào năm 2018, một bản sao xuất hiện trong Ferris Bueller’s Day Off được bán với giá hơn 400.000 USD.\r\n\r\n►►► Xem thêm: Khám phá ngay top 10 hãng xe ô tô đắt nhất thế giới mọi thời đại\r\n\r\n4. 1935 Auburn 851 Supercharged Speedster\r\nVô cùng bắt mắt, 1935 Auburn 851 Supercharged Speedster được đánh giá là tinh hoa của những phiên bản xe sản xuất năm 1930 với mui trần theo phong cách Art Deco. Với khối động cơ sức mạnh lên đến 150 mã lực, nhà sản xuất cam đoan rằng chiếc 851 sẽ bứt phá 100 dặm/ giờ khi ra khỏi nhà trưng bày.\r\n\r\n1935 Auburn 851 Supercharged Speedster\r\n\r\nĐồng thời, chiếc xe ô tổ cổ hút mắt này còn sở hữu động cơ 4,5 lít 8 xi-lanh công suất 150 mã lực.Hiện nay, chiếc xe này có giá  650,000 đô la đến 750,000 đô la.\r\n\r\n►►► Xem thêm: TOP 10 đồng hồ chính hãng đẹp nhất 2023, chế độ bảo hành hậu mãi hàng đầu Việt Nam\r\n\r\n5. Porsche 911\r\nHagerty nói: “Có phép thuật vào đầu năm 911. “Đó là một cỗ máy được chế tạo tốt đến kinh ngạc, mang lại một trong những trải nghiệm lái xe trung thực nhất so với bất kỳ chiếc xe thể thao nào từng được chế tạo”. Xe Porsche 911 thể hiện phong cách lái cổ điển ở trạng thái tốt nhất – đặc biệt là trong kỷ nguyên vàng trước khi xe được thiết kế lại năm 1974.\r\n\r\nXe ô tô cổ Porsche 911\r\n\r\nDù là dòng xe cổ 2 cửa, nhưng ngay cả theo tiêu chuẩn ngày nay, những chiếc 911 thế hệ đầu tiên vẫn có rất nhiều mã lực và có thể tự đứng vững trên đường đua. Bạn có thể tìm thấy một chiếc, ngay cả mới tinh, trên eBay.\r\n\r\n►►► Xem thêm: Xe Maybach logo thương hiệu, nội thất, ngoại thất, giá bao nhiêu?\r\n\r\n6. Datsun 240Z\r\nDatsun 240Z bắt đầu cơn sốt xe thể thao Nhật Bản khi nó đến Mỹ vào đầu những năm 1970. Cung cấp nhiều sức mạnh và nội thất dễ chịu với giá không quá cao, Datsun đã mở đường cho Toyota, Honda và Nissan giành được sự chấp nhận của người tiêu dùng Hoa Kỳ trong những thập kỷ tiếp theo.\r\n\r\nXe hơi cổ điển Datsun 240Z\r\n\r\nCác quảng cáo rao vặt từ Hemmings và AutoTrader Classics có nhiều Datsun 240Zs được rao bán.\r\n\r\n►►► Xem thêm: Đây là top 20 thương hiệu xe ô tô lớn nhất và nổi tiếng nhất toàn cầu\r\n\r\n7. Volkswagen Beetle\r\nĐây là mẫu xe hơi cổ điển được sản xuất bởi Kỹ sư trưởng Ferdinand Porsche và nhóm cộng sự từ 1930 - 1938. Nhưng, những chiếc Beetle dân dụng chỉ thực sự được chế tạo với số lượng đáng kể vào cuối những năm 1940. Phiên bản này được bán trên thị trường với tên gọi là Volkswagen.\r\n\r\nXe ô tô Volkswagen Beetle cổ điển\r\n\r\nCác mô hình kế tiếp lần lượt được gọi là Volkswagen 1200, 1300, 1500, 1302 và 1303. Trong đó ba mô hình trước cho thấy sự dịch chuyển của động cơ, hai mô hình sau có số lấy từ số mã mô hình. \r\n\r\n8. Mercedes-Benz 300SL Gullwing\r\nĐược sản xuất vào năm 1954, Mercedes-Benz 300SL Gullwing là thiết kế sáng tạo bậc nhất giúp cho hãng xe Đức đạt được nhiều thành công trên thị trường Mỹ. Xe sử dụng động cơ 3.0 lít 6 xi-lanh thẳng hàng, khả năng công suất tối đa 222 mã lực và đạt tốc độ cực đại 255km/h, đưa Mercedes-Benz 300SL Gullwing lên vị trí “chiếc xe chạy nhanh nhất” khi ấy.\r\n\r\nMercedes-Benz 300SL Gullwing\r\n\r\nĐặc biệt, với khung xe được làm từ kim loại nặng và thiết kế hai chỗ không đủ cho các kiểu cửa truyền thống, Mercedes 300SL Gullwing đã tạo nên bước đột phá về mặt hình ảnh bằng loại cửa xe cánh chim (cửa xe bật lên trên thay vì mở ra theo chiều ngang).\r\n\r\n►►► Xem thêm: Đi tìm top 10 thương hiệu thời trang nổi tiếng nhất thế giới\r\n\r\n9. Jaguar E-Type\r\nEnzo Ferrari từng ghi nhận đây là “chiếc xe đẹp nhất từng được tạo ra”. Một chiếc xe “đẹp mã” gây ấn tượng ngay giây phút đầu tiên chạm mặt bất kì ai, với phong thái đẳng cấp, lịch lãm.\r\n\r\nXe ô tô cổ Jaguar E-Type\r\n\r\nKhông chỉ đẹp mã, E-Type còn được trang bị động cơ dung tích 3,8 lít, công suất 265 mã lực và mô men xoắn 260 Nm, Jaguar E-Type có thể đạt vận tốc tối đa 241 km/h. Vào thời điểm ra đời, E-Type đã trở thành mẫu xe sản xuất đại trà chạy nhanh nhất thế giới.\r\n\r\n10. Xe ô tô cổ Datsun 240Z1971\r\n“Chiếc xe mang phong cách châu Âu, cơ bắp Mỹ, chất lượng Nhật Bản và là sự khao khát của khách hàng trên toàn cầu”, phát biểu của ông Carlos Ghosn, Chủ tịch hiện thời của Nissan.\r\n\r\nXe cổ Nissan Datsun 240Z1971\r\n\r\nDù chỉ đạt tốc độ tối đa trên dưới 200 km/h nhưng ở thời điểm năm 1970, những mẫu xe dưới đây đã trở thành huyền thoại của ngành công nghiệp xe hơi Nhật Bản. Năm 2004, Datsun 240Z đứng top 2 “Xe hơi Thể thao những năm 1970s” (Top Sports Cars of the 1970s) trên bảng xếp hạng “Xe hơi Thể thao Quốc tế” (Sports Car International).', 'xeyeuthich.jpg', 'post', '', 6, NULL, NULL, 0, NULL, 1);
INSERT INTO `db_post` (`id`, `topic_id`, `title`, `slug`, `detail`, `image`, `type`, `description`, `relay_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `status`) VALUES
(7, 2, 'Những mẫu xe thể thao cổ điển', 'post-7', 'Toyota Corolla AE86\r\n\r\nNhững mẫu xe thể thao cổ điển đáng tin cậy nhất - 1\r\n(Ảnh: Hotcars)\r\n\r\nLần đầu tiên xuất hiện, hầu hết mọi người đều chế giễu AE86 là một chiếc xe thể thao. Qua nhiều năm, chiếc xe này đã thay đổi suy nghĩ của nhiều người. Thiết kế bên ngoài tinh tế đã ngụy trang sự thật rằng Toyota Corolla AE86 che giấu một đôi vòng tua cao có công suất 130 mã lực.\r\n\r\nNhờ thân xe nhẹ và hệ dẫn động cầu sau hiệu quả cao, chiếc xe trở thành một trong những chiếc drift nổi tiếng nhất.\r\n\r\nChevrolet Corvette C4\r\n\r\nNếu bạn muốn một chiếc Corvette có thể đánh bại Toyota Camry về độ tin cậy thì C4 Corvette là lựa chọn tốt nhất. C4 Corvette đi trước thời đại về mặt thiết kế khiến nhiều chiếc xe thể thao cổ điển phổ biến ở châu Âu cùng thời trông có vẻ lạc hậu.\r\n\r\nNhững mẫu xe thể thao cổ điển đáng tin cậy nhất - 2\r\n(Ảnh: Hotcars)\r\n\r\n \r\n \r\n \r\nBên dưới mui xe, mọi thứ đã được đơn giản hóa hơn. Nó chứa một động cơ V8 to lớn truyền sức mạnh tới hệ dẫn động cầu sau thông qua hộp số đáng tin cậy. \r\n\r\nMercedes-Benz 560 SL\r\n\r\n560 SL có thể không thấp bằng Porsche hay NSX, nhưng nó vẫn rất nhanh và thú vị khi lái. \r\n\r\nNhững mẫu xe thể thao cổ điển đáng tin cậy nhất - 3\r\n(Ảnh: Hotcars)\r\n\r\nKhông giống như một số mẫu xe Mercedes-Benz không đáng tin cậy của những năm sau đó, kỹ thuật của xe trong thời kỳ này không có đối thủ. Chúng có thể chịu được quãng đường trường dài đến khó tin.\r\n\r\nHonda NSX\r\n\r\nHonda NSX được coi là huyền thoại xe thể thao đường phố, sản xuất trong giai đoạn 1990-2005. Hãng xe Nhật bán mẫu xe này tại Mỹ với tên gọi là Acura NSX từ năm 1991.\r\n\r\nNhững mẫu xe thể thao cổ điển đáng tin cậy nhất - 4\r\n(Ảnh: Hotcars)\r\n\r\nKhi mới ra mắt, giá của nó chỉ bằng một nửa so với các siêu xe khác. Nhưng giá bây giờ cao hơn nhiều, không giống như nhiều xe đã từng đắt nhưng bây giờ lại rẻ. Những chiếc Honda NSX có độ tin cậy cao, không thể so sánh với hầu hết các xe thể thao hiện đại nhưng chúng cũng mang lại khả năng sử dụng tốt, điều chưa từng có ở nhiều siêu xe.\r\n\r\nPorsche 911\r\n\r\nKhông có nhà sản xuất nào khác nhất quán như Porsche trong việc tạo ra hiệu suất đáng tin cậy. Một số người tin rằng 911 là tiêu chuẩn vàng cho những chiếc xe thể thao cổ điển.\r\n\r\nNhững mẫu xe thể thao cổ điển đáng tin cậy nhất - 5\r\n(Ảnh: Hotcars)\r\n\r\nTheo Cơ quan kiểm định nước Đức (TUV), Porsche 911 là chiếc xe có ít lỗi nhất trong số những mẫu xe đã qua sử dụng với thời gian 5 năm, 9 năm và 11 năm.\r\n\r\nDatsun 240Z\r\n\r\nDatsun không còn tồn tại nhưng những người cuồng tín sẽ mãi mãi yêu mến thương hiệu thuộc sở hữu của Nissan vì đã giới thiệu chiếc xe Z mang tính biểu tượng trong thập niên 60.\r\n\r\nNhững mẫu xe thể thao cổ điển đáng tin cậy nhất - 6\r\n(Ảnh: Hotcars)\r\n\r\nDatsun 240Z được thiết kế đẹp mắt, có khả năng xử lý và sức mạnh ngang ngửa với những chiếc xe châu Âu có giá gấp đôi, khiến nó thành công vang dội. Chiếc xe tuyệt vời này là điều dễ hiểu đối với bất kỳ ai muốn một chiếc xe cổ điển đáng tin cậy.', 'xethethaoco.jpg', 'post', '', 7, NULL, NULL, 0, NULL, 1),
(8, 2, 'Những dòng xe ô tô cổ điển giá rẻ bất ngờ', 'post-8', 'Xe ô tô cổ điển là những con xe tồn tại qua những năm tháng lịch sử, có giá trị tiền bạc khi được định giá. Những người chơi xe ô tô cổ thường quan tâm xe ô tô cổ điển giá rẻ không? Những hãng xe cổ nào giá mềm mà chất lượng? Bài viết của chúng tôi sẽ từ từ cỡ rối những nút thắt đó cho bạn.\r\n\r\n1. Các dòng xe ô tô cổ điển giá rẻ nổi đình đám\r\nTop 5 các dòng xe ô tô cổ điển giá rẻ nổi đình đám ở Việt Nam\r\nCác loại xe hơi cổ nổi tiếng trên thế giới\r\n2. Phục chế xe hơi cổ\r\nTrước khi tìm hiểu về những dòng xe ô tô cổ điển giá rẻ bất ngờ thì phải hiểu xe ô tô cổ điển là như thế nào trước? Xe ô tô cổ điển được chia làm 2 loại là classic có tuổi đời từ 30 năm trở lên và loại vintage có tuổi đời từ 50 năm trở lên, tùy thuộc vào các yếu tố để nó được mệnh danh là xe cổ như: dòng xe, máy móc, đồng sơn….\r\n\r\nNhững dòng xe ô tô cổ điển giá rẻ bất ngờ\r\n\r\n Những chiếc xe này được săn đón bởi sự lâu đời và thú vui hoài cổ của những người sành chơi xe. Những năm đầu trào lưu chơi xe cổ thì những mẫu xe này cực kỳ đắt giá. Nhưng vài năm gần đây cụm từ “xe ô tô cổ điển giá rẻ” đã xuất hiện và lưu hành khá phổ biến. Hãy cùng chúng tôi tìm hiểu về loại xe ô tô cổ này.\r\n\r\n1. Các dòng xe ô tô cổ điển giá rẻ nổi đình đám\r\nTop 5 các dòng xe ô tô cổ điển giá rẻ nổi đình đám ở Việt Nam\r\nXe hơi cổ Toyota Corona \r\nXe cổ Toyota Corona \r\n\r\nNhững dân chơi xe cổ sẽ không tốn quá nhiều công sức để tậu cho mình một con Toyota Corona với tuổi đời 54 năm được sản xuất năm 1966. Quay ngược lịch sử ta sẽ thấy vào những năm 90 của thế kỷ trước, thương hiệu mang tên Toyota có những năm tháng thăng hoa, nở rộ tại Việt Nam với dòng xe senda Corona.\r\nCorona mang xứ mệnh của hãng vươn tầm ra nước ngoài, đối đầu trực tiếp với Nissan Bluebird. Sở hữu kích thước tổng thể dài x rộng x cao là 4,110 x 1,550 x 1,420 mm và 971 kg trọng lượng thân.\r\nCả ngoại và nội thất xe đều khá đơn giản như vô lăng 2 chấu hay bảng đồng hồ tốc độ trên taplo. Xe được trang bị đông cơ l4 với dung tích 1.5 lít, công suất cực đại đạt 74 mã lực tại vòng tua máy 5000 vòng/phút và mô men xoắn cực đại 116 N.m ở vòng tua máy 2.600 vòng/phút kết hợp với hộp số tay.\r\n\r\n Xe cổ Toyota Corona \r\n\r\n=> Với những thông số và tuổi đời như vậy trị giá của con xe cổ này là 55 triệu được ví von là xe ô tô cổ điển giá rẻ. \r\n\r\nXe ô tô cổ điển giá rẻ Peugeot 402 Eclipse Décapotable\r\nMột trong những chiếc xe được thiết kế trần cứng có thể gấp gọn lại phía sau, lấy cảm hứng từ những chiếc máy bay năm 1935, đến năm 1937 loại xe này chính thức ra mắt trên thị trường, mẫu xe này vẫn luôn được đánh giá là khá đẹp mắt.\r\n\r\n​Xe ô tô cổ điển giá rẻ Peugeot 402 Eclipse Décapotable\r\nXe hơi cổ Lincoln Continental 1961 \r\nNhững chiếc xe thời xưa luôn có xu hướng thân xe (khoang người) bé hơn đầu xe hay đuôi xe vì công nghệ chưa cho phép thiết kế cao hơn. Nhưng Lincoln Continental 1961 được cho là xe mui trần cổ điển tốt nhất trong lịch sử. Một con xe cổ toát lên sự sang trọng, đồ sộ. Với tuổi thọ chưa hẳn là quá lâu nên những thiết kế lên con xe này có hơi chút hiện đại và được đầu tư nhiều vào mui xếp.\r\n\r\nXe ô tô cổ Lincoln Continental 1961\r\n\r\n=> Đây cũng là dòng xe ô tô cổ điển giá rẻ mà mọi người nên lưu tấm nếu muốn sở hữu xe cổ vừa “sang, sịn, mịn”.\r\n\r\nXe hơi cổ điển La DaLat\r\nLa Dalat là dòng xe do chính người Việt Nam chế tạo ra vào đầu năm 1960 và nhanh chóng trở thành mẫu xe hơi được ưa chuộng và phổ biến trên những cung đường Sài Gòn thời bấy giờ.\r\n=> Giá bán giao động trên thị trường rơi vào khoảng 60 - 80 triệu. Được xem là một trong những mẫu xe hơi cổ điển giá rẻ ở Việt Nam đang được mọi người săn đón nhiều.\r\n\r\nXe cổ La DaLat\r\n\r\nÔ tô cổ Fiat 124 Sport Spider \r\nMẫu xe này có thiết kế khá đơn giản nhưng vẫn rất đẹp. Mẫu xe này là đứa con của Pininfarina danh tiếng của Italia. Ông thiết kế xe theo phong cách tối giản, khỏe khoắn, động cơ mạnh.\r\n\r\nXe cổ Fiat 124 Sport Spider \r\n\r\nCác loại xe hơi cổ nổi tiếng trên thế giới\r\nXe ô tô cổ BMW Z8 \r\nNhắc đến dòng xe ô tô cổ không thể không nhắc đến tác phẩm của Henrik Fisker. Đây là một trong các loại xe hơi cổ nổi tiếng trên thế giới. Vào năm nó được ra đời, Z8 được coi như là siêu phẩm, với phong cách cuốn hút, mạnh mẽ. Lượt săn đón của dòng xe này thời đó dường như đứng đầu. \r\nSở hữu khối động cơ V8 5.0 lít và 500 mã lực cùng hộp số sàn 6 cấp, đạt tốc độ từ 0-97 km/h sau 4,5s trước khi đạt tốc độ tối đa 250 km/h.\r\n\r\nXe ô tô cổ BMW Z8 \r\n\r\nXe Dodge Charger\r\nNhắc đến Dodge Charger ta sẽ nghĩ ngay đến các bộ phim đình đám như Fast and Furious, The Dukes of Hazzard… Trong những bộ phim này xuất hiện rất nhiều xe Dodge Charger.\r\nRa đời lần đầu tiên vào năm 1966 với nội ngoại thất cực kỳ ấn tượng như có bảng điều khiển trung tâm kéo dài từ ghế ngồi phía trước đến phía sau. Được trang bị động cơ 426 Hemi V8 nổi tiếng của Chryler đã khiến Dodge Charger trở thành mẫu xe được nhiều người ưa thích.\r\n Đường viền mui xe và lưới tải nhiệt làm bằng kim loại nổi, bộ phận đèn pha hoàn chỉnh. Sử dụng hộp số tay 3 tốc độ và 4 mô hình động cơ. Ngay từ lần ra mắt đầu tiên hãng đã bán được hơn 37 nghìn chiếc. Chứng tỏ độ thành công của mẫu xe này trên thị trường.\r\n\r\nXe Dodge Charger\r\n\r\nDòng xe ô tô cổ Mercedes - Benz 300SL\r\nNhìn tổng quan qua con xe đã từng đem đến nhiều thành công cho hãng xe nổi tiếng Daimler - Benz. Mercedes - Benz 300SL là dòng được nâng cấp bổ sung thêm hệ thống phun nhiên liệu trực tiếp cơ học, hộp số sau và bánh xe 16inch, thân xe được làm từ hợp kim magie Elektron, làm giảm bớt trọng lượng, tăng tốc độ, êm hơn khi di chuyển. Thiết kế này có một số đặc điểm nổi bật như:\r\n\r\nDòng xe Mercedes - Benz 300SL\r\n\r\n\r\n\r\n+ Thiết kế cửa mở hình cánh chim độc đáo, ấn tượng, đem lại góc mở chính xác và bản lề được đảm bảo hoạt động trơn tru\r\n+ Thân xe có khả năng giảm lực cản khí động cơ\r\n+ Nội thất tỉ mỉ sang trọng đem lại cảm giác thoải mái khi sử dụng\r\n+ Trên đây là một số những dòng xe cổ điển nổi tiếng cả Việt Nam và trên Thế Giới.\r\nVậy việc chơi xe ô tô cổ chỉ đơn thuần là săn đón và mua những chiếc xe ô tô lâu đời đã đủ chưa?\r\n\r\n2. Phục chế xe hơi cổ\r\nĐể có thể trở thành người chơi xe ô tô cổ chính hiệu việc đam mê sưu tầm xe thôi là chưa đủ. Việc phục chế xe hơi cổ là công việc tất yếu để có thể “hồi sinh” một chiếc xe có tuổi đời ít nhất là nửa thế kỷ. Phải phục chế một cách tỉ mỉ cho nó về với hình hài ban đầu vốn có, mang đậm giá trị lịch sử. Những người chơi xe cổ phải đáp ứng được tài chính ổn định cũng như thời gian, công sức phải bỏ ra.\r\nMuốn phục chế xe hơi cổ còn phải nhẫn nại, vì đặc tính của xe cổ là qua thời gian càng lâu thì càng có giá trị. Nhưng cũng vì qua thời gian dài nên sẽ có các bộ phận không thể phục chế được, nên để phục dựng chiếc xe đó cực kỳ khó, cần sự tỉ mỉ cũng như nhẫn nại của người phục chế.\r\n\r\nPhục chế xe hơi cổ\r\n\r\n\r\nChi phí để phục chế lại xe cổ cực kỳ tốn kém và thời gian có thể lên tới 2 – 3 năm mới có thể hoàn thành việc kéo lại tuổi xuân của chiếc xe. Thậm chí, sau khi phục chế xong xe có thể không hoạt động có thể vì lắp sai một bộ phận nào đó. Lại phải tháo xe ra và kiểm tra tỉ từng chi tiết.\r\nThú vui chơi xe ô tô cổ khác hẳn với những dân chơi siêu xe. Những tay chơi siêu xe chỉ cần chọn lựa và bỏ tiền để sở hữu con xe ưng ý. Nhưng những người chơi xe ô tô cổ thì phải hao tổn sức lực và tiền bạc vào việc tái hiện lại xe, phục chế giống như ban đầu.\r\nVậy nên việc săn được xe ô tô cổ điển giá rẻ là mối quan tâm của mọi người. Vì ngoài việc sở hữu được nó thì việc phục chế lại những chiếc xe hơn nửa thế kỷ đó là việc không hề đơn giản. Hi vọng những chia sẻ bổ ích của chúng tôi mang tới cho bạn cái nhìn khách quan về đam mê thầm lặng của những người ghiền xe ô tô cổ.', 'xeco.jpg', 'post', '', 8, NULL, NULL, 0, NULL, 1),
(9, 3, 'Mẫu xe còn khó mua hơn cả Maybach, người giàu cầm trong tay 200 tỷ cũng chưa chắc được sở hữu', 'post-9', 'Mayback vốn đã nổi tiếng đắt đỏ hàng đầu thế giới với sự xuất sắc về mặt kỹ thuật, tay nghề điêu luyện và đầy sang trọng. Thế nhưng, đó vẫn chưa là gì khi so sánh với mẫu xe này.\r\nLĩnh vực ô tô hiệu suất cao và ô tô hạng sang là lĩnh vực đầy mê hoặc, nơi tốc độ, thiết kế và sự khéo léo kết hợp hài hòa để tạo ra những mẫu xế hộp đáng chú ý và đắt tiền nhất. Vài chiếc dưới đây khan hiếm và độc quyền đến mức chỉ có một số người có thể mua được. Trong khi đó, những mẫu khác được coi là tác phẩm nghệ thuật vô giá.\r\n\r\nMercedes-Benz Maybach Exelero\r\nMẫu xe ra mắt lần đầu vào năm 2004 và được nhà sản xuất lốp xe Đức Fulda uỷ quyền để thử nghiệm loại lốp mới Carat Exelero của hãng.\r\n\r\nMercedes đã chế tạo Exelero bằng cách sử dụng động cơ V12 tăng áp kép giống như Maybach, tạo ra công suất 690 mã lực và mô-men xoắn 1.020 Nm. Xe có thể tăng tốc 0-96 km/h trong 4,4 giây, đạt tốc độ tối đa 350km/h.\r\n\r\nThẩm mỹ thiết kế có nhiều khởi sắc và đa dạng. Mui xe thon dài đầy mê hoặc, đường mái thấp quyến rũ và thân xe coupe hai chỗ được chế tạo hoàn hảo để tăng thêm sức hấp dẫn.\r\nVới mức giá 8 triệu USD (hơn 196,5 tỷ đồng), Mercedes-Benz Maybach Exelero đứng vị trí thứ 6 trong danh sách những mẫu xe đắt nhất thế giới do The Richest xếp hạng.\r\n\r\nBugatti Centodieci\r\nVới siêu xe này, Bugatti bày tỏ lòng tôn kính đối với di sản 110 năm tuổi của mình. Từ \'Centodieci\' có nghĩa là 110 trong tiếng Italy. Chiếc xe được trang bị động cơ W16 8,0 lít có khả năng sản sinh công suất đáng kinh ngạc 1600 mã lực. Khả năng tăng tốc 0-100 km/h trong vòng 2,4 giây khiến siêu xe trở thành chiếc Bugatti tăng tốc nhanh nhất trên đường.\r\n\r\nĐược sản xuất vào đầu những năm 1990, thiết kế của xe chịu ảnh hưởng nặng nề từ EB110 mang tính biểu tượng của ông chủ hãng xe Romano Artioli.\r\n\r\nThân xe màu trắng bóng bẩy và dáng xe thấp tạo nên vẻ ngoài mạnh mẽ và hầm hố. Không làm mất đi sự quyến rũ và đặc trưng của EB110, Centodieci được thiết kế để đóng vai trò là sự thể hiện hiện đại về hình dạng và công nghệ.\r\n\r\nSản lượng vẫn khan hiếm vì chỉ có 10 chiếc đặc biệt được sản xuất, đảm bảo tính độc quyền trong khi mỗi chiếc được gắn với giá chào bán là 9 triệu USD (hơn 221 tỷ đồng).\r\nRolls-Royce Sweptail\r\nVị trí thứ 4 gọi tên Sweptail của nhà Rolls-Royce với mức giá 13 triệu USD (tương đương 319,3 tỷ đồng). Vào thời điểm được ra mắt (năm 2017), mức giá 13 triệu USD khiến Sweptail trở thành mẫu xe đắt nhất mọi thời đại.\r\n\r\nSiêu xe độc nhất vô nhị được đặt làm bởi một khách hàng giàu có, người muốn có một chiếc xe độc đáo thể hện được sở thích và phong cách cá nhân.\r\n\r\nMẫu xe mất 4 năm để chế tạo và được ra mắt tại Concorso d\'Eleganza Villa d\'Este 2017 ở Italy. Sweptail được trang bị động cơ V12 dung tích 6,75 lít, sản sinh công suất 453 mã lực và mô-men xoắn cực đại 531 lb-ft. Các tính năng đáng chú ý bao gồm phần đuôi xe rộng rãi, mui xe bằng kính toàn cảnh uốn cong, nội thất trang nhã chỉ có hai chỗ ngồi…\r\n\r\nPagani Zonda HP Barchetta\r\nMột viên ngọc quý khác trong lịch sử ô tô đến từ Pagani. Chiếc Zonda HP Barchetta của thương hiệu này được định giá 17 triệu USD (hơn 417,7 tỷ đồng).\r\n\r\nHoracio Pagani, người sáng lập Pagani Automobilei, đã đặt tên cho phiên bản Zonda này vì chiếc xe được coi là món quà nhân dịp sinh nhật lần thứ 60 của ông. Dựa trên mẫu Zonda nổi tiếng, mẫu xe có một không hai này đã tạo được chỗ đứng trong lòng những người hâm mộ siêu xe trên toàn thế giới\r\n\r\nVới động cơ V12 hút khí tự nhiên dung tích 7,3 lít, xe có công suất 789 mã lực kết hợp mô-men xoắn cực đại 538 lb-ft.\r\n\r\nBugatti La Voiture Noire\r\nChiếc xe ở vị trí \"á quân\" được mô tả là \"chiếc xe màu đen\", có mức giá đáng kinh ngạc 18,7 triệu USD (gần 460 tỷ đồng). Bugatti La Voiture Noire được giới thiệu tại Geneva Motor Show 2019 và là sản phẩm nhằm tri ân Bugatti Type 57 SC Atlantic.\r\n\r\nLà biểu tượng của vẻ đẹp lộng lẫy hiện đại gắn liền với lịch sử, La Voiture Noire ra đời dựa trên nền tảng mẫu xe Chiron lừng danh.\r\n\r\n\"Á quân\" được trang bị động cơ W16 tăng áp kép dung tích 8,0 lít, sản sinh công suất 1.500 mã lực và mô-men xoắn cực đại 1.180 lb-ft. Tốc độ tối đa của xe là 420 km/h và có thể tăng tốc 0-96 km trong vòng 2,4 giây.\r\n\r\nThiết kế độc đáo của chiếc xe có thân màu đen bóng và lớp hoàn thiện bằng sợi carbon tuyệt đẹp. Hãng xe Pháp chỉ sản xuất một chiếc và được một người giấu tên mua.\r\n\r\nRolls-Royce Boat Tail\r\nRolls -Royce Boat Tail được coi là chiếc xe độc nhất và đắt nhất trên thị trường vào năm 2023, với mức giá 28 triệu USD (tương đương 687,8 tỷ đồng). Siêu xe này không được sản xuất hàng loạt như những mẫu xe khác. Thay vào đó, Boat Tail được thiết kế riêng cho từng khách hàng dựa trên sở thích và thông số kỹ thuật riêng.\r\n\r\nLấy cảm hứng từ cả chiếc du thuyền Rolls-Royce Boat Tail và J-Class 1932 mang tính biểu tượng, chiếc xe được trang bị động cơ V12 tăng áp kép, dung tích 6,75 lít có khả năng tạo ra công suất ấn tượng 563 mã lực, mô-men xoắn cực đại 605 lb-ft.\r\n\r\nĐáng chú ý, Boat Tail chỉ đại diện cho một trong ba mẫu xe đặt riêng dành riêng cho những khách hàng khó tính nhất của Rolls-Royce.', 'post9.jpg', 'post', '', 9, NULL, NULL, 0, NULL, 1),
(10, 3, 'Bugatti khoe \'bộ xương\' của siêu phẩm Bolide giá 4,7 triệu USD: Siêu cứng, siêu nhẹ, lật xe không để lại một vết nứt', 'post-10', 'Bolide là siêu xe thuần đua được Bugatti ra mắt vào tháng 10/2020 và hoàn thiện vào tháng 4/2023. Dù sử dụng khung gầm Chiron, Bugatti Bolide sở hữu khả năng vận hành trong trường đua tốt hơn đáng kể nhờ tỷ lệ công suất/trọng lượng chỉ 0,91 kg/kW.\r\n\r\nĐến bộ xương bên dưới lớp áo siêu xe Bugatti 4,3 triệu USD cũng vô cùng ấn tượng - Ảnh 1.\r\nBugatti Bolide có giá bán lên tới 4,7 triệu USD nhưng đã bán hết ngay thời điểm công bố\r\n\r\nBộ khung liền khối làm từ sợi carbon của Bugatti Bolide được ví như một \"kỳ quan công nghệ\". Kết cấu này, theo những gì thương hiệu Pháp công bố vào giữa tháng 9, tốt hơn tới mức tự bản thân nó đã đạt chuẩn đua Le Mans, vốn yêu cầu cao hơn chuẩn an toàn trên ô tô phổ thông.\r\n\r\nĐến bộ xương bên dưới lớp áo siêu xe Bugatti 4,3 triệu USD cũng vô cùng ấn tượng - Ảnh 2.\r\nBugatti cũng hé lộ một số bài thử khó tin mà \"bộ xương\" của Bugatti Bolide phải trải qua. Cụ thể, cột A chịu được lực tương đương 7,5 tấn mà không biến dạng quá 50 mm ở điểm tác động. Ngoài ra, kết cấu 100 mm xung quanh khu vực tác động cũng phải chịu được lực trên.\r\n\r\nMột ví dụ khác là bài thử lật xe với tải trọng lên tới 12 tấn được đặt lên cột B, nhưng bộ khung của Bolide thậm chí không có một vết nứt.\r\n\r\nĐến bộ xương bên dưới lớp áo siêu xe Bugatti 4,3 triệu USD cũng vô cùng ấn tượng - Ảnh 3.\r\nKết cấu bên dưới Bugatti Bolide nhìn như xe đua F1\r\n\r\nTrên Bolide, động cơ W16 8.0L được đặt tiến lên phía trước 60 mm so với vị trí gốc trên Chiron. 1.577 mã lực và 1.600Nm mô-men xoắn sinh ra từ đây được truyền tới cả bốn bánh thông qua hệ dẫn động 2 cầu điều khiển điện tử có khả năng phân bổ lực kéo từng bánh khác nhau.\r\n\r\nChuẩn an toàn của xe đua cũng yêu cầu cabin Bolide có một số thay đổi nhỏ. Hệ thống dây an toàn 6 điểm, bình cứu hỏa, ghế ngồi riêng với hệ thống bảo vệ và cố định đầu người lái là một số ví dụ.\r\n\r\n\r\nĐến bộ xương bên dưới lớp áo siêu xe Bugatti 4,3 triệu USD cũng vô cùng ấn tượng - Ảnh 4.\r\nBugatti Bolide được sản xuất giới hạn 40 xe trên toàn cầu và đã bán hết ngay từ khi công bố dù giá bán lên tới 4,7 triệu USD. Chiếc Bugatti Bolide đầu tiên sẽ được bàn giao tới tay người dùng vào đầu năm 2024.', 'post10.jpg', 'post', '', 10, NULL, NULL, 0, NULL, 1),
(11, 3, 'Ferrari 812 Competitionizione Tailor Made \"độc nhất vô nhị\" sắp được bán đấu giá', 'post-11', '\r\nTại Tuần lễ xe hơi Monterey năm nay, Ferrari đã cho ra mắt chiếc 812 Competizione độc nhất vô nhị sẽ được bán đấu giá tại Ferrari Gala tổ chức tại thành phố New York (Mỹ) vào ngày 17/10 sắp tới.\r\n\r\nDòng xe 812 Competizione vốn đã khá hiếm với chỉ 999 chiếc được cung cấp trên toàn thế giới, vì vậy, mẫu Ferrari 812 Competitionizione Tailor Made có một không hai này chắc chắn sẽ còn đặc biệt hơn cả.\r\n\r\nĐược ủy quyền bởi Ferrari Bắc Mỹ, chiếc xe nổi bật với các họa tiết Nero DS Sketch mờ trên khắp thân xe màu vàng Giallo Tristrato, tạo điểm nhấn cho các chi tiết đáng chú ý của chiếc xe như cánh khí động học chia đôi mui xe, các tấm chắn gió bên và bộ tạo xoáy trên tấm panel phía sau.\r\n\r\nFerrari 812 Competitionizione Tailor Made &quot;độc nhất vô nhị&quot; sắp được bán đấu giá - Ảnh 1.\r\nVề nội thất, chiếc xe tiếp tục mang phong cách thẩm mỹ Sharpie, với các bản phác thảo thiết kế được thêu trên ghế và bảng điều khiển bọc Alcantara màu vàng. Nội thất cũng đi kèm với chất liệu Superfabric trilobal màu đen cho thảm và thành sau của khoang hành khách.\r\n\r\nTrong buổi ra mắt, phía nhà sản xuất ô tô cho biết: “Thách thức chính là tìm kiếm sự cân bằng hoàn hảo giữa việc thực hiện kỹ thuật và duy trì tính sáng tạo cũng như sự khéo léo mang tính nghệ thuật đến từ giám đốc thiết kế của Ferrari, các bản vẽ của Flavio Manzoni, đã mang lại nguồn cảm hứng cho mẫu xe này với các chi tiết độc đáo”.', 'post11.jpg', 'post', '', 11, NULL, NULL, 0, NULL, 1),
(12, 3, 'Bugatti khoe \'bộ xương\' của siêu phẩm Bolide giá 4,7 triệu USD: Siêu cứng, siêu nhẹ, lật xe không để lại một vết nứt', 'post-10', '\r\nLamborghini Lanzador là tên mẫu xe điện đầu tiên của thương hiệu Italia sẽ mở bán sau... nửa thập kỷ nữa.\r\n\r\nTương lai của Lamborghini là xe điện và Lamborghini Lanzador là cái tên đầu tiên trong đội hình kỷ nguyên mới của hãng. Xe vừa ra mắt dưới diện concept trước khi chào sân hoàn chỉnh vào 2028.\r\n\r\nDù còn 5 năm nữa mới ra mắt bản thương mại, thiết kế Lamborghini Lanzador đã mang tính thực tế cao. Xe nằm trong phân khúc SUV/crossover với giao diện 3 cửa 4 ghế ngồi. Thiết kế tổng Lamborghini Lanzador vẫn khá giống siêu xe dù nằm ở phân khúc gầm cao với đầu xe nhọn.\r\n\r\nSUV thứ 2 của Lamborghini sau Urus chính thức chào sân, sẽ là xe điện đầu tiên của hãng - Ảnh 1.\r\nTheo Lamborghini, bộ khung Lanzador được kết hợp từ nhiều siêu phẩm của hãng trong quá khứ như Sesto Elemento, Murcielago hay Countach. Trong khi đó, vị trí lái của xe mượn từ Huracan Sterrato kết hợp với... tàu vũ trụ.\r\n\r\nÂm hưởng không gian có thể cảm nhận rất rõ trong cabin khi khoang lái được làm rành mạch và tối giản nhất có thể. Cả táp lô và cụm điều khiển trung tâm dùng giao diện khung xương đơn giản mà thực tiễn (theo xác nhận từ Lamborghini).\r\n\r\nSUV thứ 2 của Lamborghini sau Urus chính thức chào sân, sẽ là xe điện đầu tiên của hãng - Ảnh 2.\r\nHàng ghế sau có thể gập gọn để tăng không gian để đồ phía sau - yếu tố không nhiều người nghĩ có thể xuất hiện trên xe Lamborghini. Các chất liệu chế tạo cabin hoặc là loại tái chế/thân thiện môi trường, hoặc tới từ Italia.\r\n\r\nSUV thứ 2 của Lamborghini sau Urus chính thức chào sân, sẽ là xe điện đầu tiên của hãng - Ảnh 3.\r\nKhông gian để đồ được chăm chút rất ký trên Lamborghini Lanzador, một điểm vốn không thường quan trọng trên xe thể thao thương hiệu Italia\r\n\r\nHệ thống truyền động xe hoàn toàn không được công bố thông số. Thương hiệu Italia chỉ cho biết mỗi trục lái có 2 mô tơ dẫn động tạo thành hệ dẫn động 2 cầu. Công nghệ phân bổ hướng lực kéo, hệ thống treo chủ động và khí động học đảm bảo khả năng vận hành đa năng mà vẫn mang lại tiện nghi tốt.\r\n\r\nSUV thứ 2 của Lamborghini sau Urus chính thức chào sân, sẽ là xe điện đầu tiên của hãng - Ảnh 4.\r\n\r\nTrước thời điểm Lamborghini Lanzador ra mắt hoàn chỉnh, thương hiệu Italia sẽ mở bán hàng loạt xe hybrid mới bao gồm Urus PHEV, hậu duệ Huracan (2024) và Revuelto (hậu duệ Aventador đã công bố). \r\n\r\nNếu chỉ tính xe điện, sau ngày Lamborghini Lanzador ra mắt vào 2028 sẽ tới lượt bản thuần điện của SUV Lamborghini Urus vào 2029. Thời điểm trên được đánh giá là khi công nghệ truyền động điện đã đủ \"chín\" để đáp ứng tiêu chuẩn vận hành của thương hiệu Italia.', 'post12.jpg', 'post', '', 12, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_postdetail`
--

CREATE TABLE `db_postdetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `detail` mediumtext NOT NULL,
  `relay_id` int(10) UNSIGNED NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_product`
--

CREATE TABLE `db_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `price_sale` double(8,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `detail` mediumtext NOT NULL,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_product`
--

INSERT INTO `db_product` (`id`, `category_id`, `brand_id`, `name`, `slug`, `price`, `price_sale`, `image`, `qty`, `detail`, `metakey`, `metadesc`, `created_by`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(1, 2, 1, 'Lamborghini Veneno', 'xe-1', 100000.00, 90000.00, 'hinh1.jpg', 3, 'dwed', 'wffdsbsfb', 'wff', 1, NULL, '2023-06-30 01:43:15', 1, 1),
(2, 2, 1, 'W Motors Lykan Hypersport1111', 'w-motors-lykan-hypersport1111', 130000.00, 120000.00, 'w-motors-lykan-hypersport1111.jpg', 4, 'efdcwe', 'fwe1', 'fwe', 1, NULL, '2023-11-15 11:28:31', 1, 2),
(3, 2, 1, 'Bugatti Veyron Vivere By Mansory', 'xe-3', 120000.00, 110000.00, 'hinh3.jpg', 3, 'dwed', 'efdhehheh', 'wff', 1, NULL, '2023-06-29 00:08:46', 1, 1),
(4, 2, 1, 'Bugatti Chiron Sport', 'xe-4', 130000.00, 120000.00, 'hinh4.jpg', 4, 'efdcwe', 'wdcf', 'fwe', 1, NULL, NULL, NULL, 1),
(5, 2, 1, 'Ferrari Sergio Pininfarina', 'xe-5', 140000.00, 130000.00, 'hinh5.jpg', 5, 'dwed', 'efd', 'wff', 1, NULL, NULL, NULL, 1),
(6, 3, 2, 'Ford Thunderbird', 'xe-6', 150000.00, 140000.00, 'hinh6.jpg', 6, 'efdcwe', 'wdcf', 'fwe', 1, NULL, NULL, NULL, 1),
(7, 3, 2, 'Maserati A6GCS/53', 'xe-7', 160000.00, 150000.00, 'hinh7.jpg', 7, 'dwed', 'efd', 'wff', 1, NULL, NULL, NULL, 1),
(8, 3, 2, 'BMW 507', 'xe-8', 170000.00, 160000.00, 'hinh8.jpg', 8, 'efdcwe', 'wdcf', 'fwe', 1, NULL, NULL, NULL, 1),
(9, 3, 2, 'Chevrolet Corvette (C1)', 'xe-9', 100000.00, 90000.00, 'hinh9.jpg', 3, 'dwed', 'wffdsbsfb', 'wff', 1, NULL, '2023-06-30 01:43:15', 1, 1),
(10, 3, 2, 'Dodge Charger 1969', 'xe-10', 130000.00, 120000.00, 'hinh10.jpg', 4, 'efdcwe', 'fwej', 'fwe', 1, NULL, '2023-06-29 00:40:04', 1, 1),
(11, 1, 3, 'Rolls-Royce Phantom VIII', 'xe-11', 120000.00, 110000.00, 'hinh11.jpg', 3, 'dwed', 'efdhehheh', 'wff', 1, NULL, '2023-06-29 00:08:46', 1, 1),
(12, 1, 3, 'Bentley Mulsanne', 'xe-12', 130000.00, 120000.00, 'hinh12.jpg', 4, 'efdcwe', 'wdcf', 'fwe', 1, NULL, NULL, NULL, 1),
(13, 1, 3, 'Maybach S650', 'xe-13', 140000.00, 130000.00, 'hinh13.jpg', 5, 'dwed', 'efd', 'wff', 1, NULL, NULL, NULL, 1),
(14, 1, 3, 'Range Rover SV Autobiograph', 'xe-14', 150000.00, 140000.00, 'hinh14.jpg', 6, 'efdcwe', 'wdcf', 'fwe', 1, NULL, NULL, NULL, 1),
(15, 1, 3, 'Rolls-Royce Cullinan', 'xe-15', 160000.00, 150000.00, 'hinh15.jpg', 7, 'dwed', 'efd', 'wff', 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_productsale`
--

CREATE TABLE `db_productsale` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `pricesale` double NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `date_begin` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_productstore`
--

CREATE TABLE `db_productstore` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_singlepage`
--

CREATE TABLE `db_singlepage` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_singlepage`
--

INSERT INTO `db_singlepage` (`id`, `name`, `link`, `slug`, `sort_order`, `created_by`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(2, 'Sản Phẩm', 'san-pham', 'san-pham', 0, 1, NULL, NULL, NULL, 2),
(3, 'Liên Hệ', 'lien-he', 'lien-he', 0, 1, NULL, NULL, NULL, 2),
(4, 'Giới Thiệu', 'gioi-thieu', 'gioi-thieu', 0, 1, NULL, NULL, NULL, 2),
(5, 'Chính sách mua hàng', 'chinh-sach-mua-hang', 'chinh-sach-mua-hang', 0, 1, NULL, NULL, NULL, 2),
(6, 'Chính sách đổi trả', 'chinh-sach-doi-tra', 'chinh-sach-doi-tra', 0, 1, NULL, NULL, NULL, 2),
(7, 'Chính sách vận chuyển', 'chinh-sach-van-chuyen', 'chinh-sach-van-chuyen', 0, 1, NULL, NULL, NULL, 2),
(8, 'Chính sách bảo hành', 'chinh-sach-bao-hanh', 'chinh-sach-bao-hanh', 0, 1, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `db_slider`
--

CREATE TABLE `db_slider` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `position` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_slider`
--

INSERT INTO `db_slider` (`id`, `name`, `link`, `sort_order`, `position`, `image`, `parent_id`, `created_by`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'slider1q', 'vsd', 1, 'slider', '.jpg', 2, 1, NULL, '2023-11-16 00:40:16', 1, 2),
(2, 'slider2', 'dfb', 0, 'slider2', 'slider2.jpg', 0, 1, NULL, NULL, NULL, 1),
(3, 'slider3', 'vsd', 0, 'slider', 'slider3.jpg', 0, 1, NULL, NULL, NULL, 1),
(4, 'slider4', 'dfb', 0, 'slider', 'slider4.jpg', 0, 1, NULL, NULL, NULL, 1),
(5, 'slider5', 'dfb', 0, 'slider', 'slider5.jpg', 0, 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_topic`
--

CREATE TABLE `db_topic` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(1000) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_topic`
--

INSERT INTO `db_topic` (`id`, `name`, `slug`, `parent_id`, `metakey`, `metadesc`, `sort_order`, `description`, `created_by`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Xe cổ điển', 'xe-co', 0, 'tdjhgd', 'hghgd', 0, '', 1, NULL, NULL, NULL, 1),
(2, 'Giới thiệu xe', 'gioi-thieu-xe', 0, 'tdjhgd', 'hghgd', 0, '', 1, NULL, NULL, NULL, 1),
(3, 'Top xe hơi', 'top-xe', 0, 'tdjhgd', 'hghgd', 0, '', 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_user`
--

CREATE TABLE `db_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `roles` varchar(255) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_user`
--

INSERT INTO `db_user` (`id`, `name`, `email`, `phone`, `username`, `password`, `address`, `gender`, `image`, `roles`, `created_by`, `created_at`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Trịnh Công Sơn111111', 'trinhcongson@email.com', '09812122001', 'trinhcongson', '11122001', 'fvbssfvb', '', '.jpg', 'tdjtt', 1, NULL, '2023-11-16 00:41:17', 1, 1),
(2, 'Nguyễn Thị Ngọc', 'trinhcongson@email.com', '09812122001', 'trinhcongson', '11122001', 'fvbssfvb', '', 'avt1.jpg', 'tdjtt', 1, NULL, NULL, NULL, 1),
(3, 'Nguyễn Thị Lan', 'trinhcongson@email.com', '09812122001', 'trinhcongson', '11122001', 'fvbssfvb', '', 'avt2.jpg', 'tdjtt', 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_05_31_020455_create_brand_table', 1),
(3, '2023_05_31_020639_create_category_table', 1),
(4, '2023_05_31_020729_create_contact_table', 1),
(5, '2023_05_31_121342_create_menu_table', 1),
(6, '2023_05_31_121355_create_order_table', 1),
(7, '2023_05_31_121505_create_orderdetail_table', 1),
(8, '2023_05_31_121515_create_product_table', 1),
(9, '2023_05_31_121523_create_post_table', 1),
(10, '2023_05_31_121534_create_slider_table', 1),
(11, '2023_05_31_121543_create_topic_table', 1),
(12, '2023_05_31_121602_create_user_table', 1),
(13, '2023_06_29_213224_create_postdetail_table', 1),
(14, '2023_06_29_213303_create_singlepage_table', 1),
(15, '2023_06_29_213331_create_member_table', 1),
(16, '2023_10_24_114722_create_productsale_table', 1),
(17, '2023_10_24_114855_create_config_table', 1),
(18, '2023_10_24_115012_create_productstore_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_brand`
--
ALTER TABLE `db_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_category`
--
ALTER TABLE `db_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_config`
--
ALTER TABLE `db_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_contact`
--
ALTER TABLE `db_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_member`
--
ALTER TABLE `db_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_menu`
--
ALTER TABLE `db_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_order`
--
ALTER TABLE `db_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_post`
--
ALTER TABLE `db_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_postdetail`
--
ALTER TABLE `db_postdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_product`
--
ALTER TABLE `db_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_productsale`
--
ALTER TABLE `db_productsale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_productstore`
--
ALTER TABLE `db_productstore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_singlepage`
--
ALTER TABLE `db_singlepage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_slider`
--
ALTER TABLE `db_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_topic`
--
ALTER TABLE `db_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_brand`
--
ALTER TABLE `db_brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `db_config`
--
ALTER TABLE `db_config`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_contact`
--
ALTER TABLE `db_contact`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_member`
--
ALTER TABLE `db_member`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_menu`
--
ALTER TABLE `db_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `db_order`
--
ALTER TABLE `db_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_post`
--
ALTER TABLE `db_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `db_postdetail`
--
ALTER TABLE `db_postdetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_product`
--
ALTER TABLE `db_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `db_productsale`
--
ALTER TABLE `db_productsale`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_productstore`
--
ALTER TABLE `db_productstore`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_singlepage`
--
ALTER TABLE `db_singlepage`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `db_slider`
--
ALTER TABLE `db_slider`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_topic`
--
ALTER TABLE `db_topic`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_user`
--
ALTER TABLE `db_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
