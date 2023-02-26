-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2023 at 02:44 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizzadelivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(10001, 'Greenwich', 'Have our best-tasting products delivered to your doorstep!', '2023-02-21 11:21:32'),
(10003, 'Pizza Hut', 'Pizza Hut, a subsidiary of Yum! Brands, Inc. (NYSE: YUM), delivers more pizza, pasta and wings than any other restaurant in the world.', '2023-02-26 20:42:06'),
(10004, 'Shakey s', 'Shakeys is one of the leading operators of Fast Casual Restaurants in the Philippines, focused on family casual dining.', '2023-02-26 20:48:24'),
(10005, 'YELLOW CAB', 'Yellow Cab Pizza Co. is a pizza restaurant chain based in the Philippines. Founded in April 2001 by Eric Puno, Henry Lee and Albert Tan, ', '2023-02-26 20:49:58'),
(10006, 'S&R', 'Check S&R New York Style Pizza menu and prices ✓ Order online, get you food delivered to your home or office ✓ Fast order & easy payment.', '2023-02-26 21:11:30'),
(10007, 'Dominos Pizza', 'The squares on the logo make on think of a pizza box. The three dots stand for the first three Dominos restaurants. The company had originally planned to add a new dot every time it opened a new outlet, but that intention was never realized.', '2023-02-26 21:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(1, 1, 2000, 1),
(2, 1, 2005, 1),
(3, 2, 2000, 1),
(4, 2, 2006, 1),
(5, 2, 2010, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(1, 2, '1235 Taltal St., Sampaloc, tapat tindahan', 2222, 9566595176, 423, '0', '0', '2023-02-21 12:37:53'),
(2, 4, 'Sta. Mesa, Manila, ', 2322, 9566595176, 410, '0', '0', '2023-02-22 21:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(2000, 'Hawaiian Overload', 133, 'Our best-selling Hawaiian pizza with a delicious blend of sweet pineapples, ham, bacon, mozzarella and cheddar. May come with or without green bell peppers.', 10001, '2023-02-21 12:00:04'),
(2001, '5-Cheese & Veggies Overload', 144, 'No meat, less guilt, overloaded goodness with 5 different kinds of cheeses, creamy pesto and roasted mushrooms.', 10001, '2023-02-21 12:04:53'),
(2002, 'All-In Overload', 144, 'It s our Ultimate Overload made more delicious and more meaty-tasting with its 6 kinds of meat: Ham, Pepperoni, Bacon, Italian Sausage, Burger Crumbles, and Spanish Sausage.', 10001, '2023-02-21 12:09:16'),
(2003, 'Extreme Hawaiian Overload', 648, 'Our best-selling Hawaiian pizzas pushed to the extreme.', 10001, '2023-02-21 12:11:18'),
(2004, 'Extreme All-In Overload', 648, 'Its our everything on it pizza made more delicious and more meaty-tasting with its 6 kinds of meat pushed to the extreme', 10001, '2023-02-21 12:12:36'),
(2005, '4 Cheese Overload', 290, 'Our new Cheese pizza loaded with melt-in-your-mouth parmesan cheese, mozzarella, cheddar, and cream cheese.', 10001, '2023-02-21 12:14:02'),
(2006, 'Pepperoni Overload', 133, 'Our cheesy and flavor-loaded take on everyone’s favorite pepperoni.', 10001, '2023-02-21 12:14:54'),
(2007, 'Bacon Overload', 144, 'Our baconest pizza! Bacon, ham, mozzarella, cream cheese and mushrooms on freshly baked crust.', 10001, '2023-02-21 12:15:34'),
(2008, 'All Meat Overload', 144, 'Overloadedly topped with premium cuts of meats and cheeses.', 10001, '2023-02-21 12:16:11'),
(2009, 'All Beef Overload', 480, 'Overly topped with delicious burger crumbles, onions, and mushroom that go perfectly with melt-in-your-mouth cheese.', 10001, '2023-02-21 12:16:47'),
(2010, 'Beef & Sausage Overload', 144, 'No-pork pizza! An appetizing combination of delicious beef crumbles and savory italian sausage with melt-in-your-mouth cheese on freshly baked crust.', 10001, '2023-02-21 12:18:58'),
(2011, 'Cheeseburger Classic', 245, 'Cheesy pizza with burger crumbles and sliced mushrooms.', 10001, '2023-02-21 12:19:46'),
(2012, 'Cheesy Bacon & Ham Classic', 447, 'Creamy white cheese pizza with bacon and ham slices.', 10001, '2023-02-21 12:20:29'),
(2013, 'Ham & Pineapples Classic', 122, 'Classic Hawaiian combination of sweet pineapples, ham and cheese.', 10001, '2023-02-21 12:21:30'),
(2014, 'Carbonara Supreme', 429, 'Product Description: Carbonara sauce, mozzarella, holiday ham, mushroom, bacon bits, parmesan cheese, parsley.', 10003, '2023-02-26 20:53:42'),
(2015, 'Super Supreme ', 429, 'Product Description: Nine delicious toppings - beef, ham, Italian sausage, pepperoni, seasoned pork, bellpeppers, mushrooms, onions, and pineapples.\r\n', 10003, '2023-02-26 20:54:54'),
(2016, 'Meat Lovers ', 429, 'Product Description: Enjoy a protein-packed serving of bacon, beef, ham, italian sausage, pepperoni and seasoned pork.', 10003, '2023-02-26 20:55:20'),
(2017, 'BBQ CHICKEN SUPREME ', 399, 'Product Description: BBQ sauce, mozzarella, BBQ-coated chicken chunks, mushrooms, onions and parsley.', 10003, '2023-02-26 20:55:56'),
(2018, 'CHEESE SUPREME ', 519, 'Product Description: It’s your favorite Cheese Pizza now with 4 types of Cheese in each pop- Mozzarella, Cheddar, Cream Cheese, and Parmesan.', 10003, '2023-02-26 20:56:30'),
(2019, 'HAWAIIAN SUPREME', 399, 'Product Description: Say Aloha to our all-time favorite with double layers of ham and pineapple!', 10003, '2023-02-26 20:56:57'),
(2020, 'SUPREME', 399, 'Product Description: Six delightful toppings - beef, pepperoni, seasoned pork, bell pepper, onions, and mushrooms.', 10003, '2023-02-26 20:57:25'),
(2021, 'Classic Spinach Pizza Americana', 1149, ' The perfect balance of your creamy spinach and a blend of different cheeses.', 10004, '2023-02-26 21:00:24'),
(2022, 'Roast Beef Pizza', 409, 'Indulge in succulent roast beef, tender and done right now on a pizza! Made even more delicious with our Rosemary & Mushroom sauce!', 10004, '2023-02-26 21:00:49'),
(2023, 'Shakey s Special', 349, 'Loaded with beef, Italian sausage, pepperoni, salami, mushrooms, green bell pepper, and onions.', 10004, '2023-02-26 21:01:39'),
(2024, 'Hi Protein Pizza Americana', 1149, 'SUPERSIZED 18-inch ALL-MEAT pizza packed with beef, salami, pepperoni, ham and Italian sausage topped with a tangy ranch dressing and made with 100 Percent Mozzarella Cheese! Truly protein loaded!', 10004, '2023-02-26 21:02:19'),
(2025, 'Spinach & Mushroom Pizza Americana', 1149, 'Spinach & Mushroom Americana: SUPERSIZED 18-inch Fresh, Flavourful & Creamy spinach pizza prepared with savory mushrooms, and a blend of different cheeses.', 10004, '2023-02-26 21:02:48'),
(2026, 'Spinach & Shrimp Pizza Americana', 1149, 'Spinach & Mushroom Americana: SUPERSIZED 18-inch Fresh, Flavourful & Creamy spinach pizza prepared with savory mushrooms, and a blend of different cheeses.', 10004, '2023-02-26 21:03:29'),
(2027, 'Truffle Four Cheese Pizza Americana', 1029, 'Irresistibly rich and creamy SUPERSIZED 18-inch pizza topped with four types of cheese: Mozzarella, Parmesan, Cheddar, and Cream Cheese and drizzled with premium Truffle flavor!', 10004, '2023-02-26 21:04:02'),
(2028, 'Pepperoni', 380, 'Our take on a true New York favorite featuring edge-to-edge pepperoni.', 10005, '2023-02-26 21:06:18'),
(2029, 'Hawaiian ', 380, 'A local favorite with sweet pineapples, savory ham, and crumbled bacon.', 10005, '2023-02-26 21:06:42'),
(2030, 'BBQ Chicken', 490, 'Sweet and tangy with boneless chopped chicken, red onions, cilantro, and mozzarella top a layer of hickory-smoked barbecue sauce.\r\n\r\n', 10005, '2023-02-26 21:07:14'),
(2031, 'Garden Special', 490, 'A veggie lover s dream – Tomato, onions, green and red bell peppers, button mushrooms, and black olives.', 10005, '2023-02-26 21:07:43'),
(2032, 'Manhattan Meat Lovers', 490, 'Made to please with tons of pepperoni, ham, salami, ground beef, crumbled bacon, and Italian sausage.', 10005, '2023-02-26 21:08:02'),
(2033, 'Roasted Garlic & Shrimp', 490, 'Juicy shrimps, onions, and garlic on a bed of white wine sauce.', 10005, '2023-02-26 21:08:38'),
(2034, '#4 Cheese ', 490, 'A cheese party with mellow mozzarella, sharp cheddar, nutty parmesan, and salty feta.', 10005, '2023-02-26 21:09:04'),
(2035, 'Patty Melt', 490, 'Our newest Edge-to-Edge PizzaTM packed with flavorful burger patties with a bit of heat smothered with gooey melted cheese on our signature crust, and topped with juicy tomatoes and sweetened onions.', 10005, '2023-02-26 21:09:24'),
(2036, '18inches Cheese Pizza', 626, '18-inch pizza made with thick freshly baked pizza dough smothered with mozzarella cheese.', 10006, '2023-02-26 21:14:12'),
(2037, 'Pepperoni Pizza', 692, '18-inch oven baked thick crust pizza with imported beef & pork pepperoni slices on a bed of melted mozzarella cheese.', 10006, '2023-02-26 21:14:33'),
(2038, 'Combo Pizza', 692, '18-inch oven baked thick crust pizza with layers of mozzarella cheese, imported beef & pork pepperoni and Italian sausage crumbles, topped with fresh green bell pepper, white onion and black olives', 10006, '2023-02-26 21:14:55'),
(2039, 'Garlic & Shrimp Pizza', 692, '18-inch oven baked thick crust pizza with freshly peeled shrimp and garlic sitting on layers of mozzarella cheese topped with extra garlic bits.', 10006, '2023-02-26 21:15:19'),
(2040, 'Cream Cheese Pepperoni Pizza', 796, '18-inch oven baked thick crust pizza with layers of Mozzarella cheese topped with imported beef & pork pepperoni slices and large scoops of cream cheese', 10006, '2023-02-26 21:15:40'),
(2041, 'Tropical Hawaiian Pizza', 769, 'All-time Favorite 18-inch-thick crust Hawaiian Pizza with bacon, shredded mozzarella cheese and freshly sliced pineapple pieces.', 10006, '2023-02-26 21:16:04'),
(2042, 'All Meat Pizza Deli', 769, '18-inch oven baked thick crust pizza loaded with imported pork Italian sausage crumbles, ham, bacon, beef salami and topped with layers of mozzarella cheese.', 10006, '2023-02-26 21:16:24'),
(2043, 'Cheesy Burger Deluxe Pizza', 769, '18-inch oven baked thick crust pizza with chunks of seared juicy beef burger patty on top of onions and layers of mozzarella cheese.', 10006, '2023-02-26 21:16:45'),
(2044, 'MARGHERITA', 1049, 'Diced tomatoes & stretchy mozzarella, topped with oregano', 10007, '2023-02-26 21:26:44'),
(2045, 'PERI PERI CHICKEN', 1049, 'A flavoursome pairing of seasoned chicken pieces, Italian cherry tomatoes, sliced red onion & baby spinach, topped with our addictive peri peri sauce\r\n\r\n', 10007, '2023-02-26 21:27:29'),
(2046, 'MEGA MEATLOVERS', 1049, 'Mega loaded, mega tasty. Featuring seasoned chicken, smokey leg ham, crumbled beef, pepperoni slices, Italian sausage & crispy rasher bacon, brought together with a Hickory BBQ sauce', 10007, '2023-02-26 21:28:19'),
(2047, 'LOADED SUPREME', 1499, 'Ground beef, crispy rasher bacon, mushroom, pepperoni, Italian sausage, fresh baby spinach, smoked leg ham, pineapple, topped with oregano, tomato capsicum sauce & spring onion.', 10007, '2023-02-26 21:28:57'),
(2048, 'BBQ CHICKEN & RASHER BACON', 899, 'The perfect combination of succulent chicken pieces, crispy rasher bacon & slices of red onion on a BBQ sauce base', 10007, '2023-02-26 21:29:30'),
(2049, 'GARLIC PRAWN', 899, 'Juicy prawns with fresh baby spinach & diced tomato on a crème fraiche & zesty garlic sauce base, topped with oregano', 10007, '2023-02-26 21:30:00'),
(2050, 'MARGHERITA', 899, 'Diced tomatoes & stretchy mozzarella, topped with oregano', 10007, '2023-02-26 21:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'PizzaDelivery PH', 'PizzaDelivery@gmail.com', 639566574843, 639566574821, 'Sta. Mesa, Manila', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58'),
(2, 'lyndon1223', 'Lyndon', 'Ebue', 'lyndon@gmail.com', 9566595133, '0', '$2y$10$S9Kc5OVvwzNBcuKHDawAXufGMTExP1zPEcEfJk.4hkwsKkX8yd/.u', '2023-02-21 12:28:08'),
(3, 'RastaMan', 'Blengblong', 'Marcus', 'Blengblong123@gmail.com', 9999993453, '0', '$2y$10$c9YkB51vGqqN3UOXKEUsAOOPZ/eZJiK7Jd8/byF1GCCmtmchg4qXW', '2023-02-21 12:56:02'),
(4, 'jahren123', 'Jahren', 'Dayag', 'jahren@gmail.com', 9654445454, '0', '$2y$10$Mxev8CHYgNSnBfqr2wwoOuw1b6lP4DLyDzhhyMWWKjrki7E883jbW', '2023-02-22 21:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `pizzaId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(3, 2000, 1, 3, '2023-02-21 18:12:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10008;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2051;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
