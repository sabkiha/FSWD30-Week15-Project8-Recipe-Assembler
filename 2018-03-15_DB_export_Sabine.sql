-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2018 at 11:37 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recip_me`
--

-- --------------------------------------------------------

--
-- Table structure for table `amount_ingredients`
--

CREATE TABLE `amount_ingredients` (
  `idAmount` int(11) NOT NULL,
  `amount` int(55) NOT NULL,
  `fk_idUnits` int(11) DEFAULT NULL,
  `fk_idIngredients` int(11) DEFAULT NULL,
  `fk_idRecipe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `amount_ingredients`
--

INSERT INTO `amount_ingredients` (`idAmount`, `amount`, `fk_idUnits`, `fk_idIngredients`, `fk_idRecipe`) VALUES
(1, 1, 1, 7, 2),
(2, 250, 2, 1, 2),
(3, 100, 2, 2, 2),
(4, 250, 2, 3, 2),
(5, 3, 3, 4, 2),
(6, 1, 3, 5, 2),
(7, 1, 4, 6, 2),
(8, 2, 4, 6, 3),
(9, 100, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `idComment` int(11) NOT NULL,
  `fk_idRecipe` int(11) NOT NULL,
  `comment` varchar(600) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`idComment`, `fk_idRecipe`, `comment`, `timestamp`) VALUES
(1, 2, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata ', '2018-03-13 13:52:31'),
(2, 2, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata ', '2018-03-13 13:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `idImage` int(11) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`idImage`, `image`) VALUES
(1, 'vegetarian_default_portrait.gif'),
(2, '01_granola_dust.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `idIngredient` int(11) NOT NULL,
  `ingredient` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`idIngredient`, `ingredient`) VALUES
(1, 'unsalted mixed nuts'),
(2, 'mixed seeds'),
(3, 'mixed dried fruit'),
(4, 'cocoa powder'),
(5, 'ground coffee'),
(6, 'orange'),
(7, 'porridge oats');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `idRecipe` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `cookingMethod` varchar(8000) NOT NULL,
  `instructions` varchar(8000) NOT NULL,
  `origin` varchar(50) NOT NULL,
  `fk_idImage` int(11) NOT NULL DEFAULT '1',
  `fk_userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`idRecipe`, `name`, `cookingMethod`, `instructions`, `origin`, `fk_idImage`, `fk_userid`) VALUES
(2, 'Awesome granola dust', 'Preparation time 25 min\r\nOven 180&deg; for 15 min', '1. Preheat the oven to 180&deg;C/350&deg;F/gas 4.\r\n2. Place the oats, nuts and seeds in your largest roasting tray. Toss together and roast for 15 minutes, stirring halfway.\r\n3. Stir the dried fruit, cocoa and coffee into the mix, finely grate over the orange zest, then, in batches, simply blitz to a rough powder in a food processor, tipping it into a large airtight jar as you go for safekeeping.\r\n4. To serve, you can have loads of fun - the simplest way is 50g of granola dust per person, either with cold cow\'s, goat\'s, soya, nut or oat milk or 2 tablespoons of natural yoghurt, and a handful of fresh fruit (80g is one of our 5-a-day). You can make porridge using 50g of granola dust to 200ml of milk, then top with fresh fruit, and this ratio also works for a smoothie - I like to chuck 1 ripe banana and 1 handful of frozen raspberries into the mix too. It\'s even a great base for pancakes - simply beat 2 heaped tablespoons of granola dust with 1 heaped tablespoon of wholemeal self-raising flour, 1 mashed banana and 1 large free-range egg, then cook as normal. And in winter, try a hot drink - eat 25g of granola dust with 200ml of your favourite milk to your desired consistency', 'Jamie Oliver', 2, 1),
(3, 'Österreichisches Rezept mit Umlauten ÜÄÖ öäü ß', '10 min prep', 'a lot of work', 'myself', 1, 1),
(4, 'Awesome granola dust', 'Preparation time 25 min\r\nOven 180&deg; for 15 min', '1. Preheat the oven to 180&deg;C/350&deg;F/gas 4.\r\n2. Place the oats, nuts and seeds in your largest roasting tray. Toss together and roast for 15 minutes, stirring halfway.\r\n3. Stir the dried fruit, cocoa and coffee into the mix, finely grate over the orange zest, then, in batches, simply blitz to a rough powder in a food processor, tipping it into a large airtight jar as you go for safekeeping.\r\n4. To serve, you can have loads of fun - the simplest way is 50g of granola dust per person, either with cold cow\'s, goat\'s, soya, nut or oat milk or 2 tablespoons of natural yoghurt, and a handful of fresh fruit (80g is one of our 5-a-day). You can make porridge using 50g of granola dust to 200ml of milk, then top with fresh fruit, and this ratio also works for a smoothie - I like to chuck 1 ripe banana and 1 handful of frozen raspberries into the mix too. It\'s even a great base for pancakes - simply beat 2 heaped tablespoons of granola dust with 1 heaped tablespoon of wholemeal self-raising flour, 1 mashed banana and 1 large free-range egg, then cook as normal. And in winter, try a hot drink - eat 25g of granola dust with 200ml of your favourite milk to your desired consistency', 'Jamie Oliver', 2, 1),
(5, 'Österreichisches Rezept mit Umlauten ÜÄÖ öäü ß', '10 min prep', 'a lot of work', 'myself', 1, 1),
(6, 'Awesome granola dust', 'Preparation time 25 min\r\nOven 180&deg; for 15 min', '1. Preheat the oven to 180&deg;C/350&deg;F/gas 4.\r\n2. Place the oats, nuts and seeds in your largest roasting tray. Toss together and roast for 15 minutes, stirring halfway.\r\n3. Stir the dried fruit, cocoa and coffee into the mix, finely grate over the orange zest, then, in batches, simply blitz to a rough powder in a food processor, tipping it into a large airtight jar as you go for safekeeping.\r\n4. To serve, you can have loads of fun - the simplest way is 50g of granola dust per person, either with cold cow\'s, goat\'s, soya, nut or oat milk or 2 tablespoons of natural yoghurt, and a handful of fresh fruit (80g is one of our 5-a-day). You can make porridge using 50g of granola dust to 200ml of milk, then top with fresh fruit, and this ratio also works for a smoothie - I like to chuck 1 ripe banana and 1 handful of frozen raspberries into the mix too. It\'s even a great base for pancakes - simply beat 2 heaped tablespoons of granola dust with 1 heaped tablespoon of wholemeal self-raising flour, 1 mashed banana and 1 large free-range egg, then cook as normal. And in winter, try a hot drink - eat 25g of granola dust with 200ml of your favourite milk to your desired consistency', 'Jamie Oliver', 2, 1),
(7, 'Österreichisches Rezept mit Umlauten ÜÄÖ öäü ß', '10 min prep', 'a lot of work', 'myself', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tags`
--

CREATE TABLE `recipe_tags` (
  `idRecTag` int(11) NOT NULL,
  `fk_idRecipe` int(11) NOT NULL,
  `fk_idTag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe_tags`
--

INSERT INTO `recipe_tags` (`idRecTag`, `fk_idRecipe`, `fk_idTag`) VALUES
(7, 2, 1),
(8, 2, 3),
(10, 3, 4),
(11, 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `idTag` int(11) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`idTag`, `category`) VALUES
(1, 'main meal'),
(2, 'starter'),
(3, 'breakfast'),
(4, 'snack'),
(5, 'suger-free'),
(6, 'egg-free'),
(7, 'vegan'),
(8, 'vegetarian'),
(9, 'lactose-free');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `idUnits` int(11) NOT NULL,
  `unit_EN` varchar(255) NOT NULL,
  `unit_DE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`idUnits`, `unit_EN`, `unit_DE`) VALUES
(1, 'kg', 'kg'),
(2, 'g', 'g'),
(3, 'tablespoons', 'Esslöffel'),
(4, 'piece', 'Stück');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `userlastname` varchar(30) NOT NULL,
  `useremail` varchar(60) NOT NULL,
  `userpass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `userlastname`, `useremail`, `userpass`) VALUES
(1, 'test', 'test', 'test@test.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amount_ingredients`
--
ALTER TABLE `amount_ingredients`
  ADD PRIMARY KEY (`idAmount`),
  ADD KEY `fk_idUnits` (`fk_idUnits`),
  ADD KEY `fk_idIngredients` (`fk_idIngredients`),
  ADD KEY `fk_idRecipe` (`fk_idRecipe`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `fk_idRecipe` (`fk_idRecipe`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`idImage`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`idIngredient`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`idRecipe`),
  ADD KEY `fk_idImage` (`fk_idImage`),
  ADD KEY `fk_userid` (`fk_userid`);

--
-- Indexes for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD PRIMARY KEY (`idRecTag`),
  ADD KEY `fk_idRecipe` (`fk_idRecipe`),
  ADD KEY `fk_idTag` (`fk_idTag`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`idTag`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`idUnits`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `useremail` (`useremail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amount_ingredients`
--
ALTER TABLE `amount_ingredients`
  MODIFY `idAmount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `idImage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `idIngredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `idRecipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  MODIFY `idRecTag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `idTag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `idUnits` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amount_ingredients`
--
ALTER TABLE `amount_ingredients`
  ADD CONSTRAINT `amount_ingredients_ibfk_1` FOREIGN KEY (`fk_idUnits`) REFERENCES `units` (`idUnits`),
  ADD CONSTRAINT `amount_ingredients_ibfk_2` FOREIGN KEY (`fk_idIngredients`) REFERENCES `ingredient` (`idIngredient`),
  ADD CONSTRAINT `amount_ingredients_ibfk_3` FOREIGN KEY (`fk_idRecipe`) REFERENCES `recipe` (`idRecipe`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`fk_idRecipe`) REFERENCES `recipe` (`idRecipe`);

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `fk_idImage` FOREIGN KEY (`fk_idImage`) REFERENCES `images` (`idImage`),
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD CONSTRAINT `fk_idRecipe` FOREIGN KEY (`fk_idRecipe`) REFERENCES `recipe` (`idRecipe`),
  ADD CONSTRAINT `fk_idTag` FOREIGN KEY (`fk_idTag`) REFERENCES `tags` (`idTag`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
