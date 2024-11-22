-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2024 at 12:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `holiday_trip`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `number_of_people` int(11) NOT NULL,
  `booking_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `customer_name`, `email`, `phone`, `trip_id`, `number_of_people`, `booking_date`) VALUES
(70, 'Joyah', 'JoyyyyAH5@gmail.com', '9999999', 1, 2, '2024-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `inquiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int(11) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `destination`, `description`, `price`, `duration`, `category`, `image_url`) VALUES
(1, 'Hell', 'Prepare for an unforgettable adventure to the depths of the underworld. Explore fiery landscapes, treacherous paths, and encounter eerie creatures in a journey like no other. Brace yourself for the heat, the darkness, and the mysteries that lie within the heart of Hell.', 999.00, 666, 'Special', 'https://wallpapercave.com/wp/wp7400169.jpg'),
(2, 'Akihabara, Japan', 'Embark on an exciting journey to Japan, where tradition meets modernity. Explore the vibrant streets of Tokyo, visit serene temples in Kyoto, and experience the beauty of cherry blossoms in full bloom. Immerse yourself in the rich culture, delicious cuisine, and breathtaking landscapes that make Japan a unique and unforgettable destination.', 4500.00, 3, 'Cultural', 'https://cdn.cheapoguides.com/wp-content/uploads/sites/2/2020/05/akihabara-iStock-484915982-1024x600.jpg'),
(3, 'Paris', 'Discover the magic of Paris, the city of love and lights. Stroll along the Seine River, marvel at the iconic Eiffel Tower, and visit world-class museums like the Louvre. Indulge in exquisite French cuisine, explore charming cafes, and immerse yourself in the timeless beauty of Parisian architecture and culture. Whether you\'re wandering through Montmartre or shopping on the Champs-ÃlysÃ©es, Paris promises a romantic and unforgettable experience', 780.00, 9, 'Cultural', 'https://media.timeout.com/images/106181719/750/562/image.jpg'),
(4, 'Kuala Lumpur, Malaysia', 'Explore the vibrant city of Kuala Lumpur, where modern skyscrapers meet rich cultural heritage. Visit the iconic Petronas Twin Towers, shop at bustling markets, and indulge in a variety of delicious Malaysian cuisine. From the peaceful Batu Caves to the lively streets of Bukit Bintang, Kuala Lumpur offers a blend of tradition, shopping, and adventure for every traveler. Immerse yourself in the unique fusion of cultures that define this dynamic city', 400.00, 5, 'Advanture', 'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/473000/473015-Kuala-Lumpur.jpg'),
(5, 'Bromo, Indonesia', 'Experience the awe-inspiring beauty of Mount Bromo, Indonesia\'s iconic volcano. Watch a stunning sunrise over the Tengger caldera, hike through the Sea of Sand, and enjoy breathtaking views from the craterâs rim. A perfect blend of adventure and natural wonder.', 34.00, 2, 'Advanture', 'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/1052/2024/02/16/IMG_20240216_075232-199804192.jpg'),
(6, 'Thailand', 'Discover the vibrant culture, beautiful beaches, and rich history of Thailand. From exploring ancient temples and bustling markets to relaxing on stunning islands, this trip offers a perfect mix of adventure, relaxation, and Thai hospitality.', 780.00, 3, 'Cultural', 'https://asset.kompas.com/crops/prazdRVekyPoO3zOe3t8HsId2WM=/0x9:725x493/1200x800/data/photo/2020/03/29/5e8063f487c53.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin123', 'admin'),
(2, 'test', '123', 'customer'),
(3, 'test2', '123', 'customer'),
(4, 'rani', '123', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
