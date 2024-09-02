-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2024 at 03:34 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olshop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:16:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"role-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:11:\"role-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:9:\"role-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"role-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"product-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"product-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"product-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:14:\"product-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:9:\"user-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:11:\"user-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:9:\"user-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:11:\"user-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:13:\"category-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:15:\"category-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:13:\"category-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:15:\"category-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:4:\"User\";s:1:\"c\";s:3:\"web\";}}}', 1725287587);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', 'Kategori untuk semua jenis makanan', NULL, '2024-08-30 19:10:32', '2024-08-30 19:10:32'),
(2, 'Minuman', 'Kategori untuk semua jenis minuman', NULL, '2024-08-30 19:10:32', '2024-08-30 19:10:32'),
(3, 'Jajanan', 'Kategori untuk semua jenis minuman', NULL, '2024-08-30 19:10:32', '2024-08-30 19:10:32'),
(4, 'Makanan Ringan', 'Subkategori untuk makanan ringan', 1, '2024-08-30 19:10:32', '2024-08-30 19:10:32'),
(5, 'Makanan Cepat Saji', 'Subkategori untuk makanan cepat saji', 1, '2024-08-30 19:10:32', '2024-08-30 19:10:32'),
(6, 'Minuman Soda', 'Subkategori untuk minuman soda', 2, '2024-08-30 19:10:32', '2024-08-30 19:10:32'),
(7, 'Minuman Energi', 'Subkategori untuk minuman energi', 2, '2024-08-30 19:10:32', '2024-08-30 19:10:32'),
(8, 'Minuman Dingin', 'Subkategori untuk minuman dingin', 2, '2024-08-30 19:10:32', '2024-08-30 19:10:32'),
(9, 'Ciki - Ciki', 'Subkategori untuk ciki', 3, '2024-08-30 19:10:32', '2024-08-30 19:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_08_29_123556_create_permission_tables', 1),
(5, '2024_08_29_181918_create_orders_table', 1),
(6, '2024_08_30_154719_create_categories_table', 1),
(7, '2024_08_30_154757_create_products_table', 1),
(8, '2024_08_30_183846_create_transactions_table', 1),
(9, '2024_08_31_143121_create_transactions_table', 2),
(10, '2024_08_31_202023_create_order_status_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `produk_id` int NOT NULL,
  `total_harga` int NOT NULL,
  `status` enum('pending','processed','shipped') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('pending','success','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `status_pesanan` enum('not_shipped','shipped') COLLATE utf8mb4_unicode_ci DEFAULT 'not_shipped',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(2, 'role-create', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(3, 'role-edit', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(4, 'role-delete', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(5, 'product-list', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(6, 'product-create', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(7, 'product-edit', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(8, 'product-delete', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(9, 'user-list', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(10, 'user-create', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(11, 'user-edit', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(12, 'user-delete', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(13, 'category-list', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(14, 'category-create', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(15, 'category-edit', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25'),
(16, 'category-delete', 'web', '2024-08-30 19:10:25', '2024-08-30 19:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `detail`, `price`, `stock`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Burger', 'Burger dengan daging sapi dan sayuran segar.', '30000.00', 30, 'https://www.pixelstalk.net/wp-content/uploads/2016/08/Fast-food-backgrounds-free-download.jpg', 5, '2024-08-30 19:10:36', '2024-08-30 19:10:36'),
(2, 'Hot Dog', 'Hot dog dengan saus dan mustard.', '25000.00', 40, '20240901045907.jpg', 5, '2024-08-30 19:10:37', '2024-08-31 21:59:07'),
(3, 'French Fries', 'Kentang goreng renyah.', '15000.00', 50, '20240901145935.png', 5, '2024-08-30 19:10:37', '2024-09-01 07:59:35'),
(4, 'Soda Cola', 'Minuman bersoda cola.', '10000.00', 60, 'https://cdn.idntimes.com/content-images/post/20181025/2017-03-22-post-58d2284515776-750d152134b703d6d260b475ebbaa0ef.jpg', 6, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(5, 'Orange Soda', 'Minuman bersoda rasa jeruk.', '12000.00', 55, 'https://cdn-brilio-net.akamaized.net/news/2018/04/28/142148/769798-1000xauto-5-minuman-dingin.jpg', 6, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(6, 'Energy Drink', 'Minuman energi untuk menyegarkan badan.', '15000.00', 40, '20240831195025.jpg', 7, '2024-08-30 19:10:37', '2024-08-31 12:50:25'),
(7, 'Vitamin Water', 'Minuman vitamin dengan rasa buah.', '20000.00', 45, 'https://www.diabetes.co.uk/wp-content/uploads/2019/01/iStock-680111050.jpg', 7, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(8, 'Iced Coffee', 'Kopi dingin dengan es batu.', '25000.00', 30, 'https://www.trippers.id/wp-content/uploads/2020/01/kopi-dingin.jpeg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(9, 'Lemonade', 'Minuman lemon dingin.', '15000.00', 50, 'https://cdn-idntimes.com/content-images/community/2018/10/es-kuwut1-784cec59dfe036da16cdeeab4809c742.jpg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(10, 'Chips', 'Cemilan keripik gurih.', '20000.00', 35, 'https://www.travelordietrying.com/wp-content/uploads/2019/11/8.-thai-chicken-green-curry_t20_b8BnNg.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(11, 'Candy', 'Permen manis dengan berbagai rasa.', '10000.00', 60, 'https://www.thespruceeats.com/thmb/GxBFK8FjELXLZdpOx5dB2nDRXUA=/2040x1470/filters:fill(auto,1)/GettyImages-182061573-c99e36ed248a4aabb6bda4e57263fd7d.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(12, 'Chocolate Bar', 'Batang coklat dengan rasa kacang.', '30000.00', 50, 'https://cdn.idntimes.com/content-images/community/2019/05/img-20190506-201911-503f89ccb0e841ecc3d0c51ac99c82be.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(13, 'Mie Goreng', 'Mie goreng dengan sayuran.', '25000.00', 45, 'https://i.pinimg.com/originals/95/a7/97/95a797f4a9e75115e16496a973e413f9.jpg', 5, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(14, 'Fried Chicken', 'Ayam goreng dengan rempah.', '35000.00', 20, 'https://www.travelordietrying.com/wp-content/uploads/2019/11/8.-thai-chicken-green-curry_t20_b8BnNg.jpg', 5, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(15, 'Coffe Ice Cream', 'Es krim rasa kopi.', '20000.00', 30, 'https://cdn-idntimes.com/content-images/community/2018/10/es-kuwut1-784cec59dfe036da16cdeeab4809c742.jpg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(16, 'Green Tea', 'Teh hijau dingin.', '15000.00', 35, 'https://media.suara.com/pictures/653x366/2022/03/24/73731-ilustrasi-minuman-dingin-pexelscom.jpg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(17, 'Berry Smoothie', 'Smoothie berry segar.', '25000.00', 40, 'https://cdn-brilio-net.akamaized.net/news/2018/04/28/142148/769799-1000xauto-5-minuman-dingin.jpg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(18, 'Fruit Juice', 'Jus buah segar.', '18000.00', 55, 'https://2.bp.blogspot.com/-lXLOHGBHYvc/W2UtQesWOxI/AAAAAAAAAUc/FOrHL4LAOPgIXxo04OfIVqS6Wdtkni6XwCEwYBhgL/s1600/resep-minuman-dingin.png', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(19, 'Tortilla Chips', 'Keripik tortilla dengan salsa.', '22000.00', 25, 'https://www.naturefresh.ca/wp-content/uploads/Plate.png', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(20, 'Snack Mix', 'Campuran berbagai cemilan.', '25000.00', 30, 'https://static.fanpage.it/wp-content/uploads/sites/22/2020/06/iStock-1155240408.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(21, 'Lemon Iced Tea', 'Teh es lemon.', '15000.00', 40, '20240831190617.jpg', 8, '2024-08-30 19:10:37', '2024-08-31 12:06:17'),
(22, 'Fruit Punch', 'Punch buah segar.', '20000.00', 35, 'https://www.trippers.id/wp-content/uploads/2020/01/kopi-dingin.jpeg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(23, 'Energy Booster', 'Minuman energi dengan rasa buah.', '22000.00', 45, 'https://cdn-brilio-net.akamaized.net/news/2018/04/28/142148/769798-1000xauto-5-minuman-dingin.jpg', 7, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(24, 'Ice Lemon Tea', 'Teh lemon dingin dengan es.', '17000.00', 40, 'https://media.suara.com/pictures/653x366/2022/03/24/73731-ilustrasi-minuman-dingin-pexelscom.jpg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(25, 'Energy Shot', 'Shot energi kecil.', '18000.00', 50, 'https://www.diabetes.co.uk/wp-content/uploads/2019/01/iStock-680111050.jpg', 7, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(26, 'Coke', 'Minuman cola klasik.', '12000.00', 60, 'https://cdn-brilio-net.akamaized.net/news/2018/04/28/142148/769798-1000xauto-5-minuman-dingin.jpg', 6, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(27, 'Sprite', 'Minuman lemon-lime.', '10000.00', 65, 'https://cdn-idntimes.com/content-images/community/2019/05/img-20190506-201919-24f003a99903beee0441afa29b795648.jpg', 6, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(28, 'Mineral Water', 'Air mineral segar.', '8000.00', 100, 'https://i.pinimg.com/originals/c9/32/d6/c932d6d07e57bdb90530918e94b74ac3.jpg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(29, 'Chocolate Chip Cookies', 'Kue coklat chip.', '20000.00', 30, 'https://cdn-idntimes.com/content-images/community/2019/05/img-20190506-201911-503f89ccb0e841ecc3d0c51ac99c82be.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(30, 'Cinnamon Rolls', 'Roti gulung kayu manis.', '25000.00', 25, 'https://cdn-idntimes.com/content-images/community/2019/05/img-20190506-201916-03d54364744b2bc9e2548f8f280af1f3.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(31, 'Gummy Bears', 'Gummy bear dengan berbagai rasa.', '12000.00', 50, 'https://cdn-idntimes.com/content-images/community/2019/05/img-20190506-201919-24f003a99903beee0441afa29b795648.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(32, 'Barbeque Chips', 'Keripik barbeque dengan rasa smoky.', '15000.00', 40, 'https://cdn-idntimes.com/content-images/community/2019/05/img-20190506-201919-24f003a99903beee0441afa29b795648.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(33, 'Cheese Balls', 'Cemilan bola keju.', '18000.00', 35, 'https://cdn-brilio-net.akamaized.net/news/2018/04/28/142148/769799-1000xauto-5-minuman-dingin.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(34, 'Ice Cream Sandwich', 'Sandwich es krim dengan rasa vanila.', '22000.00', 30, 'https://cdn-idntimes.com/content-images/community/2018/10/es-kuwut1-784cec59dfe036da16cdeeab4809c742.jpg', 9, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(35, 'Soda Lemon', 'Soda rasa lemon.', '13000.00', 50, 'https://cdn-idntimes.com/content-images/community/2019/05/img-20190506-201916-03d54364744b2bc9e2548f8f280af1f3.jpg', 6, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(36, 'Root Beer', 'Minuman root beer dengan rasa unik.', '14000.00', 45, 'https://cdn-idntimes.com/content-images/community/2018/10/es-kuwut1-784cec59dfe036da16cdeeab4809c742.jpg', 6, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(37, 'Ginger Ale', 'Minuman ginger ale dengan rasa jahe.', '16000.00', 40, 'https://cdn-brilio-net.akamaized.net/news/2018/04/28/142148/769798-1000xauto-5-minuman-dingin.jpg', 6, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(38, 'Smoothie Bowl', 'Smoothie bowl dengan topping granola.', '28000.00', 30, 'https://www.naturefresh.ca/wp-content/uploads/Plate.png', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(39, 'Milkshake', 'Milkshake dengan rasa coklat.', '22000.00', 35, 'https://i.pinimg.com/originals/95/a7/97/95a797f4a9e75115e16496a973e413f9.jpg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(40, 'Cold Brew Coffee', 'Kopi dingin dengan rasa robusta.', '27000.00', 25, 'https://cdn-idntimes.com/content-images/community/2019/05/img-20190506-201911-503f89ccb0e841ecc3d0c51ac99c82be.jpg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(41, 'Chocolate Smoothie', 'Smoothie coklat dengan rasa rich.', '23000.00', 40, 'https://cdn-idntimes.com/content-images/community/2018/10/es-kuwut1-784cec59dfe036da16cdeeab4809c742.jpg', 8, '2024-08-30 19:10:37', '2024-08-30 19:10:37'),
(42, 'seblak', 'level 1', '5000.00', 1, '20240831195001.jpg', 5, '2024-08-31 12:50:01', '2024-08-31 12:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2024-08-30 19:10:29', '2024-08-30 19:10:29'),
(2, 'User', 'web', '2024-08-31 12:02:34', '2024-08-31 12:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rVR3OpiATsKs6gppP70T6iJn5YCicls8RQ0nP3fx', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSm8zMjJ0VHhWWmhtNmxjOEJFS29BSlR5aDFRem9Zb2VlODVHNkZjViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG9wP2NhdGVnb3J5PU1ha2FuYW4lMjBDZXBhdCUyMFNhamkiO31zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MjUyMDA4MDY7fX0=', 1725202836);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `status` enum('pending','success','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `snap_token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `profile_image`, `gender`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Alif zufahmi Yusuf', 'admin@gmail.com', '1725192249.jpg', 'Male', 'kawali', NULL, '$2y$12$tyHU.LVmO6EboVDd5IDFuuea3MDdPfNb1wV2mpL8nqXulGJIRR7.C', NULL, '2024-08-30 19:10:29', '2024-09-01 05:04:10'),
(2, 'Dzikri', 'user@gmail.com', '1725192173.jpg', 'Male', 'hayawang', NULL, '$2y$12$AHvKOq0SPf.8v8CFxyKckudxjzIEk8fdldzsHFzuUSCkKr8305iya', NULL, '2024-09-01 04:54:33', '2024-09-01 05:02:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_status_transaction_id_foreign` (`transaction_id`),
  ADD KEY `order_status_user_id_foreign` (`user_id`),
  ADD KEY `order_status_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_status`
--
ALTER TABLE `order_status`
  ADD CONSTRAINT `order_status_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_status_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_status_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
