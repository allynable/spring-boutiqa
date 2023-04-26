-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 09:18 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boutiqa`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_login` (IN `p_username_or_email` VARCHAR(50), IN `p_password` VARCHAR(50), OUT `p_count` INT)   SELECT COUNT(*) INTO p_count FROM user WHERE (username = p_username_or_email OR email = p_username_or_email) AND password = p_password$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_consumer` ()   BEGIN
SELECT c.consumer_id, ut.user_type_name, u.first_name, u.last_name, u.email, u.username, u.password, u.phone_number, u.date_of_birth, u.gender, u.created_at, a.address_line1, a.address_line2, a.city, a.state, a.country, ca.cart_id
FROM CONSUMER c
INNER JOIN user u on c.user_id = u.user_id
INNER JOIN usertype ut on u.user_type_id = ut.user_type_id
INNER JOIN address a on c.address_id = a.address_id
INNER JOIN  cart ca on c.cart_id = ca.cart_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_line1`, `address_line2`, `city`, `state`, `country`, `zip_code`) VALUES
(1, '123 Main Street', '', 'Makati', 'Metro Manila', 'Philippines', '1000'),
(2, 'Blk 7 Lot 2', 'Brgy. San Miguel', 'San Pablo City', 'Laguna', 'Philippines', '4000'),
(3, 'Unit 2003', 'Avida', 'Cebu City', 'Cebu', 'Philippines', '6000'),
(4, '11 Lacson Street', '10 Floor, ABC Building', 'Bacolod City', 'Negros Occidental', 'Philippines', '6100'),
(5, '11 Lacson Street', '10 Floor, ABC Building', 'Bacolod City', 'Negros Occidental', 'Philippines', '6100'),
(6, '123 Lizares Street', 'Liberted', 'Bacolod', 'Negros Occidental', 'Philippines', '6100'),
(9, '123 Sample Street', '', 'Sample City', 'Sample State', 'Sample Country', '1000'),
(10, 'asdasdasd', '', 'asdasdasd', 'asdasdasd', 'asdasdasdas', 'dasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulkemail`
--

CREATE TABLE `bulkemail` (
  `bulk_email_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulkemailrecipient`
--

CREATE TABLE `bulkemailrecipient` (
  `bulk_email_recipient_id` int(11) NOT NULL,
  `bulk_email_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`) VALUES
(1),
(2),
(3),
(4),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(23),
(24),
(26),
(27),
(28),
(29),
(30),
(31),
(33);

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `cart_item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Clothing'),
(2, 'Electronics'),
(3, 'Home and Garden'),
(4, 'Sports and Outdoors'),
(5, 'Beauty and Personal Care'),
(6, 'Toys and Games'),
(7, 'Automotive'),
(8, 'Pet Supplies'),
(9, 'Health and Wellness');

-- --------------------------------------------------------

--
-- Table structure for table `consumer`
--

CREATE TABLE `consumer` (
  `consumer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `cart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumer`
--

INSERT INTO `consumer` (`consumer_id`, `user_id`, `address_id`, `cart_id`) VALUES
(1, 1, NULL, 1),
(2, 2, NULL, 2),
(14, 14, NULL, 14),
(18, 18, NULL, 18),
(19, 19, NULL, 19),
(20, 20, NULL, 20),
(21, 21, 5, 21),
(22, 22, 6, 23),
(23, 23, NULL, 24),
(25, 25, NULL, 26),
(26, 26, NULL, 30),
(27, 27, NULL, 31),
(29, 32, NULL, 33);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `seller_id`, `product_name`, `product_description`, `price`, `stock`) VALUES
(1, 2, 'Polo Shirt', 'Cotton T-Shirt for men, available in different sizes and colors.', '499.00', 100),
(2, 3, 'Smart TV', '50-inch LED Smart TV with Wi-Fi connectivity and 4K Ultra HD resolution.', '34999.00', 10),
(3, 3, 'Bluetooth Speaker', 'Portable Bluetooth Speaker with built-in microphone for hands-free calling ', '1999.00', 20),
(4, 4, 'PVC Garden Hose', 'Heavy duty pvc garden hose with spray nozzle set PVC Hose 10 / 20 /30 meters', '500.00', 20),
(5, 2, 'Oversize Streetwear T shirt', 'Oversize Streetwear T shirt Urban Fashion trendy unisex oversized black tee OST1', '800.00', 100),
(6, 2, 'Masid Clothing', 'The design shows how positive we can be as a hood, a team, a friend, a family, a partners, whatever you want to call yourselves..  Everyone is welcome, Who loves adventure, nature, beaches, mountains, lakes, road trips, camping and outing, just to have fun and find their happiness in it. Who love to live and love life.', '800.00', 35),
(7, 2, 'Men\'s Short Sleeve Printed Shirt', 'Men\'s Short Sleeve Printed Shirt Fashion Short Sleeve Shirt Hong Kong Style Loose Shirt Cool Casual Newspaper Shirt Top', '299.00', 50),
(8, 3, 'Electronic Multifunction ruler', 'Xiaomi Mijia DUKA Electronic Ruler Rechargeable 8 Functions Rangefinder Portable HD LCD Screen Long Standbuy Multifunction ruler', '769.00', 90),
(15, 3, 'Flash Drive', '16gb Flash Drive', '394.00', 150),
(16, 3, 'Cellphone', 'Samsung ', '20000.00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `product_category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

CREATE TABLE `productimage` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productimage`
--

INSERT INTO `productimage` (`product_image_id`, `product_id`, `image_url`) VALUES
(1, 1, '/images/polo1.jpeg'),
(4, 3, '/images/speaker1.jpeg'),
(8, 2, '/images/tv2.jpeg'),
(11, 5, '/images/shirt1.jfif'),
(12, 4, '/images/hose1.jfif'),
(13, 6, '/images/masid-shirt.jfif'),
(14, 7, '/images/short-sleeve.jfif'),
(15, 8, '/images/electronic-ruler.jpg'),
(16, 15, '/images/default.png'),
(17, 16, '/images/default.png');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `recipient_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_description` text DEFAULT NULL,
  `business_reg_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_id`, `user_id`, `address_id`, `store_name`, `store_description`, `business_reg_number`) VALUES
(2, 2, 1, 'Otha\'s Boutique', 'A trendy clothing store with a focus on casual wear for young adults. Features affordable prices and frequent sales.', 'BP-2022-001-1234'),
(3, 14, 2, 'Elite Electronics', 'A trendy clothing store with a focus on casual wear for young adults. Features affordable prices and frequent sales.', 'BP-2022-002-5678'),
(4, 20, 3, 'Green Thumb Garden Supply', 'A family-owned garden center with a large selection of plants, seeds, and gardening tools. Known for friendly staff and expert advice on all things horticulture.', 'BP-2022-003-9012'),
(5, 30, 9, 'Sample Store', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse quis arcu ullamcorper nulla scelerisque vestibulum non in urna. Curabitur tincidunt pellentesque risus, at sagittis odio posuere vel. Morbi egestas, mauris ut luctus vulputate, lorem sem sollicitudin felis, sed blandit nisi elit nec nisl. Etiam id gravida risus. In hac habitasse platea dictumst. Nam egestas vel mauris nec placerat. Donec diam nisl, pellentesque quis suscipit vel, viverra sed sem. Ut ultricies ullamcorper sagittis. Nunc lacinia tellus sit amet nisi porttitor, sed varius lacus placerat. Morbi fermentum orci eu ipsum ullamcorper molestie. In hac habitasse platea dictumst.', 'BP-2022-003-9000'),
(6, 33, 10, 'asdasdasd', 'asdasdasd', 'asdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_type_id`, `first_name`, `last_name`, `email`, `username`, `password`, `phone_number`, `date_of_birth`, `gender`, `created_at`) VALUES
(1, 1, 'Tyler', 'Queripel', 'tqueripel0@unc.edu', 'tqueripel0', 'aDSwsVTvm', '3653088717', '1996-08-29', 'Male', '2023-03-28 04:29:43'),
(2, 2, 'Otha', 'Janczak', 'ojanczak1@cbslocal.com', 'ojanczak11', 'abcde', '808567', '1999-08-06', 'Female', '2023-03-28 04:53:50'),
(14, 2, 'John', 'Doe', 'johndoe@email.com', 'johndoe', 'abc123', '+123456', '2023-03-02', 'Male', '2023-03-26 14:42:32'),
(18, 1, 'Sherlocke', 'Ackerley', 'sackerley2@indiegogo.com', 'sackerley2', 'SkpsTszf6', '+63 999 908 3294', '2001-04-24', 'Male', '2023-03-22 17:40:05'),
(19, 1, 'Addy', 'Narrie', 'anarrie7@networkadvertising.org', 'anarrie7', 'YJb1ODyOYk', '+63 919 485 2394', '1993-08-21', 'Male', '2023-03-22 17:48:43'),
(20, 2, 'Dianne', 'Dumblton', 'ddumblton9@facebook.com', 'ddumblton9', 'GnEuQGNpWir1', '+63 909 920 9042', '1993-01-06', 'Female', '2023-03-22 18:00:38'),
(21, 3, 'Jane', 'Doe', 'janedoe@gmail.com', 'janedoe', 'abc123', '+909 898 9209', '1990-11-10', 'Female', '2023-03-26 00:57:16'),
(22, 1, 'Jane', 'Smit', 'janesmith@email.com', 'janesmith', '1234', '+2139102931', '1999-02-21', 'Female', '2023-04-05 09:14:42'),
(23, 1, 'John', 'Smith', 'johnsmith@email.com', 'johnsmith', 'abc123', '+23912397 01041', '1987-10-05', 'Male', '2023-03-26 00:53:33'),
(25, 1, 'Jane', 'Doe', 'jdoe@email.com', 'jdoe', 'abc123', '12039128319231', '2002-02-02', 'Female', '2023-03-25 10:18:26'),
(26, 1, 'Chris', 'Ryan', 'Christian@email.com', 'chrisryan', 'abc123', '_1293819238', '1999-10-02', 'Male', '2023-03-25 12:38:39'),
(27, 1, 'Rici', 'Davidson', 'rdavidsson5@taobao.com', 'rdavidsson5', '12345', '+63987 897 2938', '1998-04-24', 'Male', '2023-03-26 16:48:42'),
(30, 2, 'Bertina', 'bmackneis', 'bmackneis6@mit.edu', 'bmackneis6', 'abc123', '+92374 9123741', '1990-06-24', 'Female', '2023-03-26 16:45:11'),
(32, 1, 'John', 'Doe', 'sample@email.com', 'johndoe01', 'abc123', '293945', '2023-03-01', 'Male', '2023-03-28 02:19:00'),
(33, 2, 'abc123', 'asdasd', 'asdasd', 'asdasd', '123123', 'asdasd', '2023-03-01', 'Male', '2023-03-28 03:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `user_type_id` int(11) NOT NULL,
  `user_type_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`user_type_id`, `user_type_name`) VALUES
(1, 'Consumer'),
(2, 'Seller'),
(3, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bulkemail`
--
ALTER TABLE `bulkemail`
  ADD PRIMARY KEY (`bulk_email_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `bulkemailrecipient`
--
ALTER TABLE `bulkemailrecipient`
  ADD PRIMARY KEY (`bulk_email_recipient_id`),
  ADD KEY `bulk_email_id` (`bulk_email_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `consumer`
--
ALTER TABLE `consumer`
  ADD PRIMARY KEY (`consumer_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`product_category_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productimage`
--
ALTER TABLE `productimage`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_type_id` (`user_type_id`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulkemail`
--
ALTER TABLE `bulkemail`
  MODIFY `bulk_email_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulkemailrecipient`
--
ALTER TABLE `bulkemailrecipient`
  MODIFY `bulk_email_recipient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `consumer`
--
ALTER TABLE `consumer`
  MODIFY `consumer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productimage`
--
ALTER TABLE `productimage`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bulkemail`
--
ALTER TABLE `bulkemail`
  ADD CONSTRAINT `bulkemail_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON UPDATE CASCADE;

--
-- Constraints for table `bulkemailrecipient`
--
ALTER TABLE `bulkemailrecipient`
  ADD CONSTRAINT `bulkemailrecipient_ibfk_1` FOREIGN KEY (`bulk_email_id`) REFERENCES `bulkemail` (`bulk_email_id`),
  ADD CONSTRAINT `bulkemailrecipient_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`recipient_id`);

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `consumer`
--
ALTER TABLE `consumer`
  ADD CONSTRAINT `consumer_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `consumer_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `consumer_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`) ON UPDATE CASCADE;

--
-- Constraints for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD CONSTRAINT `productcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `productcategory_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `productimage`
--
ALTER TABLE `productimage`
  ADD CONSTRAINT `productimage_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE;

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `seller_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `usertype` (`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
