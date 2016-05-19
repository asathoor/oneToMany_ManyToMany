Basic Cardinalities: One-to-Many and Many-to-Many
=================================================

A few basic samples inspired by Ben Forta's: "MySQL Crash Course" and J.R.R. Tolkien's world of fantasy.

The basic SQL is:

## Many to Many

~~~~
-- see: Forta ch. 16
SELECT cake, who
FROM cakes, costumers, likes
WHERE costumers.costumers_id = likes.costumers_id
AND cakes.cakes_id = likes.cakes_id
~~~~


## One to Many

~~~~
-- ONE TO MANY
-- see Forta ch. 15
SELECT inventory .* , costumers.who
FROM inventory, costumers
WHERE inventory.costumers_id = costumers.costumers_id
~~~~

## The Database

Here's a dump of the database (see bakery.sql):

~~~~
-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 19, 2016 at 09:21 AM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bakery`
--

-- --------------------------------------------------------

--
-- Table structure for table `cakes`
--

CREATE TABLE IF NOT EXISTS `cakes` (
  `cakes_id` int(11) NOT NULL AUTO_INCREMENT,
  `cake` varchar(100) NOT NULL,
  PRIMARY KEY (`cakes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cakes`
--

INSERT INTO `cakes` (`cakes_id`, `cake`) VALUES
(1, 'Othello'),
(2, 'Sarah Bernard'),
(3, 'Vanilla Spunge'),
(4, 'Rye Spunge');

-- --------------------------------------------------------

--
-- Table structure for table `costumers`
--

CREATE TABLE IF NOT EXISTS `costumers` (
  `costumers_id` int(11) NOT NULL AUTO_INCREMENT,
  `who` varchar(250) NOT NULL,
  PRIMARY KEY (`costumers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `costumers`
--

INSERT INTO `costumers` (`costumers_id`, `who`) VALUES
(1, 'Bilbo Baggins'),
(2, 'Frodo Baggins'),
(3, 'Gandalf the Grey'),
(4, 'Saruman');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `costumers_id` int(11) NOT NULL,
  `what` varchar(250) NOT NULL,
  PRIMARY KEY (`inventory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `costumers_id`, `what`) VALUES
(1, 1, 'Ring'),
(2, 1, 'Elven Cloak');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `likes_id` int(11) NOT NULL AUTO_INCREMENT,
  `costumers_id` int(11) NOT NULL,
  `cakes_id` int(11) NOT NULL,
  PRIMARY KEY (`likes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likes_id`, `costumers_id`, `cakes_id`) VALUES
(1, 2, 1),
(2, 3, 1),
(5, 4, 3),
(10, 2, 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
~~~~
