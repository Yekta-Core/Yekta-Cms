-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.9-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping data for table menu: ~26 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
Replace INTO `menu` (`id`, `name`, `link`, `side`, `rank`, `specific_rank`, `order`, `permission`) VALUES
	(1, '{"Persian":"صفحه اصلی","(English (US":"Home"}', 'news', 'top', 1, 0, 1, NULL),
	(2, '{"Persian":"ساخت اکانت جدید","(English (US":"Register"}', 'register', 'top', 1, 1, 2, '2'),
	(5, '{"Persian":"ورود","(English (US":"Sign in"}', 'login', 'top', 1, 1, 6, '5'),
	(6, '{"Persian":"پنل کاربری","(English (US":"User panel"}', 'ucp', 'top', 2, 0, 7, '6'),
	(7, '{"Persian":"صفحه اصلی","(English (US":"Home"}', 'news', 'side', 1, 0, 8, NULL),
	(8, '{"Persian":"ساخت اکانت جدید","(English (US":"Register"}', 'register', 'side', 1, 1, 9, '8'),
	(9, '{"Persian":"آموزش اتصال به سرور","(English (US":"How to connect"}', 'page/connect', 'side', 1, 0, 19, NULL),
	(11, '{"Persian":"ورود","(English (US":"Sign in"}', 'login', 'side', 1, 1, 13, '11'),
	(13, '{"Persian":"پنل کاربری","(English (US":"User panel"}', 'ucp', 'side', 2, 0, 10, '13'),
	(16, '{"Persian":"بازیکنان آنلاین","(English (US":"Online players"}', 'online', 'top', 1, 0, 5, NULL),
	(17, '{"Persian":"نمایش بازیکنان آنلاین","(English (US":"Online players"}', 'online', 'side', 1, 0, 17, NULL),
	(18, '{"Persian":"آرموری","(English (US":"Armory"}', 'armory', 'top', 1, 0, 20, NULL),
	(19, '{"Persian":"پیام خصوصی","(English (US":"Private messages"}', 'messages', 'side', 2, 0, 21, '19'),
	(20, '{"Persian":"آپدیت و بروزرسانی","(English (US":"Changelog"}', 'changelog', 'side', 1, 0, 100, NULL),
	(21, '{"Persian":"ورود به کنترل پنل مدیریت","(English (US":"Admin panel"}', 'admin', 'side', 5, 0, 16, '21'),
	(100, '{"Persian":"خروج","(English (US":"Log out"}', 'logout', 'side', 2, 0, 113, '100'),
	(101, '{"Persian":"خروج","(English (US":"Log out"}', 'logout', 'top', 2, 0, 113, '101'),
	(103, '{"Persian":"انتقال هیرو به اکانت دیگر","(English (US":"Character Transfer"}', 'character_transfer', 'side', 1, 0, 102, NULL),
	(104, '{"Persian":"شارژ حساب کاربری","(English (US":"Donate"}', 'donate', 'side', 1, 0, 18, NULL),
	(105, '{"Persian":"پنل رای و امتیاز","(English (US":"Vote"}', 'vote', 'top', 1, 0, 107, NULL),
	(106, '{"Persian":"انتقال هیرو به شهر جدید","(English (US":"Teleporter"}', 'teleport', 'side', 1, 0, 108, NULL),
	(107, '{"Persian":"ابزار ویرایش کاراکتر","(English (US":"Character Tools"}', 'character_tools', 'side', 1, 0, 109, NULL),
	(108, '{"Persian":"تبدیل تایم پلی به امتیاز","(English (US":"Play Time"}', 'playtime', 'side', 1, 0, 110, NULL),
	(109, '{"Persian":"مرکز حراجی","(English (US":"Auction House"}', 'auctionhouse', 'side', 1, 0, 111, NULL),
	(111, '{"Persian":"آزاد سازی هیرو","(English (US":"Unban Character"}', 'unban_char', 'side', 1, 0, 105, NULL),
	(112, '{"Persian":"آزاد سازی اکانت","(English (US":"Unban Account"}', 'unban', 'side', 1, 0, 104, NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
