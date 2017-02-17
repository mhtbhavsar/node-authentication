-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 29, 2013 at 06:50 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chad`
--

-- --------------------------------------------------------

--
-- Table structure for table `ilance_buynow_orders`
--

CREATE TABLE IF NOT EXISTS `ilance_buynow_orders` (
  `orderid` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(5) NOT NULL DEFAULT '0',
  `project_id` int(10) NOT NULL DEFAULT '0',
  `buyer_id` int(10) NOT NULL DEFAULT '0',
  `owner_id` int(10) NOT NULL DEFAULT '0',
  `invoiceid` int(10) NOT NULL DEFAULT '0',
  `attachid` int(10) NOT NULL DEFAULT '0',
  `qty` int(5) NOT NULL DEFAULT '1',
  `amount` double(17,2) NOT NULL DEFAULT '0.00',
  `salestax` double(10,2) NOT NULL DEFAULT '0.00',
  `salestaxstate` varchar(250) NOT NULL DEFAULT '',
  `salestaxrate` varchar(10) NOT NULL DEFAULT '0',
  `salestaxshipping` int(1) NOT NULL DEFAULT '0',
  `escrowfee` double(10,2) NOT NULL DEFAULT '0.00',
  `escrowfeebuyer` double(10,2) NOT NULL DEFAULT '0.00',
  `fvf` double(10,2) NOT NULL DEFAULT '0.00',
  `fvfbuyer` double(10,2) NOT NULL DEFAULT '0.00',
  `isescrowfeepaid` int(1) NOT NULL DEFAULT '0',
  `isescrowfeebuyerpaid` int(1) NOT NULL DEFAULT '0',
  `isfvfpaid` int(1) NOT NULL DEFAULT '0',
  `isfvfbuyerpaid` int(1) NOT NULL DEFAULT '0',
  `escrowfeeinvoiceid` int(10) NOT NULL DEFAULT '0',
  `escrowfeebuyerinvoiceid` int(10) NOT NULL DEFAULT '0',
  `fvfinvoiceid` int(10) NOT NULL DEFAULT '0',
  `fvfbuyerinvoiceid` int(10) NOT NULL DEFAULT '0',
  `ship_required` int(1) NOT NULL DEFAULT '1',
  `ship_location` mediumtext,
  `orderdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `canceldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `arrivedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paiddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `releasedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `winnermarkedaspaid` int(1) NOT NULL DEFAULT '0',
  `winnermarkedaspaiddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `winnermarkedaspaidmethod` mediumtext,
  `buyerpaymethod` varchar(250) NOT NULL DEFAULT '',
  `buyershipcost` double(10,2) NOT NULL DEFAULT '0.00',
  `buyershipperid` int(5) NOT NULL DEFAULT '0',
  `sellermarkedasshipped` int(1) NOT NULL DEFAULT '0',
  `sellermarkedasshippeddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shiptracknumber` varchar(250) NOT NULL DEFAULT '',
  `buyerfeedback` int(1) NOT NULL DEFAULT '0',
  `sellerfeedback` int(1) NOT NULL DEFAULT '0',
  `status` enum('paid','cancelled','pending_delivery','delivered','fraud','offline','offline_delivered') NOT NULL DEFAULT 'paid',
  PRIMARY KEY (`orderid`),
  KEY `parentid` (`parentid`),
  KEY `project_id` (`project_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `owner_id` (`owner_id`),
  KEY `attachid` (`attachid`),
  KEY `invoiceid` (`invoiceid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ilance_buynow_orders`
--


-- --------------------------------------------------------

--
-- Table structure for table `ilance_projects`
--

CREATE TABLE IF NOT EXISTS `ilance_projects` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(15) NOT NULL DEFAULT '0',
  `escrow_id` int(10) NOT NULL DEFAULT '0',
  `cid` int(10) NOT NULL DEFAULT '0',
  `description` mediumtext,
  `ishtml` enum('0','1') NOT NULL DEFAULT '0',
  `description_videourl` mediumtext,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_starts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gtc` int(1) NOT NULL DEFAULT '0',
  `gtc_cancelled` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(100) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `views` int(10) NOT NULL DEFAULT '0',
  `project_title` varchar(250) NOT NULL DEFAULT '',
  `bids` int(10) NOT NULL DEFAULT '0',
  `bidsdeclined` int(10) NOT NULL DEFAULT '0',
  `bidsretracted` int(10) NOT NULL DEFAULT '0',
  `bidsshortlisted` int(10) NOT NULL DEFAULT '0',
  `budgetgroup` varchar(30) NOT NULL DEFAULT '',
  `additional_info` mediumtext,
  `status` enum('draft','open','closed','expired','delisted','wait_approval','approval_accepted','frozen','finished','archived') NOT NULL DEFAULT 'draft',
  `close_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transfertype` enum('userid','email') NOT NULL DEFAULT 'userid',
  `transfer_to_userid` int(10) NOT NULL DEFAULT '0',
  `transfer_from_userid` int(10) NOT NULL DEFAULT '0',
  `transfer_to_email` varchar(50) NOT NULL DEFAULT '',
  `transfer_status` enum('','pending','accepted','rejected') NOT NULL DEFAULT '',
  `transfer_code` varchar(32) NOT NULL DEFAULT '',
  `project_details` enum('public','invite_only','realtime','unique','penny') NOT NULL DEFAULT 'public',
  `project_type` enum('reverse','forward') NOT NULL DEFAULT 'reverse',
  `project_state` enum('service','product') NOT NULL DEFAULT 'service',
  `bid_details` enum('open','sealed','blind','full') NOT NULL DEFAULT 'open',
  `filter_rating` enum('0','1') NOT NULL DEFAULT '0',
  `filter_country` enum('0','1') NOT NULL DEFAULT '0',
  `filter_state` enum('0','1') NOT NULL DEFAULT '0',
  `filter_city` enum('0','1') NOT NULL DEFAULT '0',
  `filter_zip` enum('0','1') NOT NULL DEFAULT '0',
  `filter_underage` enum('0','1') NOT NULL DEFAULT '0',
  `filter_businessnumber` enum('0','1') NOT NULL DEFAULT '0',
  `filter_bidtype` enum('0','1') NOT NULL DEFAULT '0',
  `filter_budget` enum('0','1') NOT NULL DEFAULT '0',
  `filter_escrow` int(1) NOT NULL DEFAULT '0',
  `filter_gateway` int(1) NOT NULL DEFAULT '0',
  `filter_ccgateway` int(1) NOT NULL DEFAULT '0',
  `filter_offline` int(1) NOT NULL DEFAULT '0',
  `filter_publicboard` enum('0','1') NOT NULL DEFAULT '0',
  `filtered_rating` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `filtered_country` varchar(50) NOT NULL DEFAULT '',
  `filtered_state` varchar(50) NOT NULL DEFAULT '',
  `filtered_city` varchar(20) NOT NULL DEFAULT '',
  `filtered_zip` varchar(10) NOT NULL DEFAULT '',
  `filter_bidlimit` int(1) NOT NULL DEFAULT '0',
  `filtered_bidlimit` int(10) NOT NULL DEFAULT '10',
  `filtered_bidtype` enum('entire','hourly','daily','weekly','monthly','lot','weight','item') NOT NULL DEFAULT 'entire',
  `filtered_bidtypecustom` varchar(250) NOT NULL DEFAULT '',
  `filtered_budgetid` int(5) NOT NULL DEFAULT '0',
  `filtered_auctiontype` enum('regular','fixed','classified') NOT NULL DEFAULT 'regular',
  `classified_phone` varchar(32) NOT NULL DEFAULT '',
  `classified_price` double(17,2) NOT NULL DEFAULT '0.00',
  `urgent` int(1) NOT NULL DEFAULT '0',
  `buynow` int(1) NOT NULL DEFAULT '0',
  `buynow_price` double(17,2) NOT NULL DEFAULT '0.00',
  `buynow_qty` int(10) NOT NULL DEFAULT '0',
  `buynow_qty_lot` int(1) NOT NULL DEFAULT '0',
  `items_in_lot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `buynow_purchases` int(10) NOT NULL DEFAULT '0',
  `reserve` int(1) NOT NULL DEFAULT '0',
  `reserve_price` double(17,2) NOT NULL DEFAULT '0.00',
  `featured` int(1) NOT NULL DEFAULT '0',
  `featured_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `featured_searchresults` int(1) NOT NULL DEFAULT '0',
  `highlite` int(1) NOT NULL DEFAULT '0',
  `bold` int(1) NOT NULL DEFAULT '0',
  `autorelist` int(1) NOT NULL DEFAULT '0',
  `autorelist_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `startprice` double(17,2) NOT NULL DEFAULT '0.00',
  `retailprice` double(10,2) NOT NULL DEFAULT '0.00',
  `uniquebidcount` int(5) NOT NULL DEFAULT '0',
  `paymethod` mediumtext,
  `paymethodcc` mediumtext,
  `paymethodoptions` mediumtext,
  `paymethodoptionsemail` mediumtext,
  `keywords` varchar(250) NOT NULL DEFAULT '',
  `currentprice` double(17,2) NOT NULL DEFAULT '0.00',
  `insertionfee` double(10,2) NOT NULL DEFAULT '0.00',
  `enhancementfee` double(10,2) NOT NULL DEFAULT '0.00',
  `fvf` double(10,2) NOT NULL DEFAULT '0.00',
  `isfvfpaid` int(1) NOT NULL DEFAULT '0',
  `isifpaid` int(1) NOT NULL DEFAULT '0',
  `isenhancementfeepaid` int(1) NOT NULL DEFAULT '0',
  `ifinvoiceid` int(5) NOT NULL DEFAULT '0',
  `enhancementfeeinvoiceid` int(5) NOT NULL DEFAULT '0',
  `fvfinvoiceid` int(5) NOT NULL DEFAULT '0',
  `returnaccepted` int(1) NOT NULL DEFAULT '0',
  `returnwithin` enum('0','3','7','14','30','60') NOT NULL DEFAULT '0',
  `returngivenas` enum('none','exchange','credit','moneyback') NOT NULL DEFAULT 'none',
  `returnshippaidby` enum('none','buyer','seller') NOT NULL DEFAULT 'none',
  `returnpolicy` mediumtext,
  `buyerfeedback` int(1) NOT NULL DEFAULT '0',
  `sellerfeedback` int(1) NOT NULL DEFAULT '0',
  `hasimage` int(1) NOT NULL DEFAULT '0',
  `hasimageslideshow` int(1) NOT NULL DEFAULT '0',
  `hasdigitalfile` int(1) NOT NULL DEFAULT '0',
  `haswinner` int(1) NOT NULL DEFAULT '0',
  `hasbuynowwinner` int(1) NOT NULL DEFAULT '0',
  `winner_user_id` int(5) NOT NULL DEFAULT '0',
  `donation` int(1) NOT NULL DEFAULT '0',
  `charityid` int(5) NOT NULL DEFAULT '0',
  `donationpercentage` int(5) NOT NULL DEFAULT '0',
  `donermarkedaspaid` int(1) NOT NULL DEFAULT '0',
  `donermarkedaspaiddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `donationinvoiceid` int(5) NOT NULL DEFAULT '0',
  `currencyid` int(5) NOT NULL DEFAULT '0',
  `countryid` int(5) NOT NULL DEFAULT '0',
  `country` varchar(250) NOT NULL DEFAULT '',
  `state` varchar(250) NOT NULL DEFAULT '',
  `city` varchar(250) NOT NULL DEFAULT '',
  `zipcode` varchar(50) NOT NULL DEFAULT '',
  `sku` varchar(250) NOT NULL DEFAULT '',
  `upc` varchar(250) NOT NULL DEFAULT '',
  `ean` varchar(250) NOT NULL DEFAULT '',
  `isbn10` varchar(250) NOT NULL DEFAULT '',
  `isbn13` varchar(250) NOT NULL DEFAULT '',
  `partnumber` varchar(250) NOT NULL DEFAULT '',
  `modelnumber` varchar(250) NOT NULL DEFAULT '',
  `salestaxstate` varchar(250) NOT NULL DEFAULT '',
  `salestaxrate` varchar(10) NOT NULL DEFAULT '0',
  `salestaxentirecountry` int(1) NOT NULL DEFAULT '0',
  `salestaxshipping` int(1) NOT NULL DEFAULT '0',
  `countdownresets` int(5) NOT NULL DEFAULT '0',
  `bulkid` int(5) NOT NULL DEFAULT '0',
  `updateid` int(5) NOT NULL DEFAULT '1',
  `storeid` int(10) NOT NULL DEFAULT '0',
  `itemcondition` mediumtext,
  `imageurl` mediumtext,
  `imageurl_attachid` int(10) NOT NULL DEFAULT '0',
  `download_attachid` int(10) NOT NULL DEFAULT '0',
  `itemstatus` int(1) NOT NULL DEFAULT '1',
  `storecid` int(10) NOT NULL DEFAULT '0',
  `tags` varchar(100) NOT NULL,
  `genre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `cid` (`cid`),
  KEY `project_title` (`project_title`),
  KEY `status` (`status`),
  KEY `project_details` (`project_details`),
  KEY `project_type` (`project_type`),
  KEY `project_state` (`project_state`),
  KEY `charityid` (`charityid`),
  KEY `countryid` (`countryid`),
  KEY `zipcode` (`zipcode`),
  KEY `sku` (`sku`),
  KEY `isbn10` (`isbn10`),
  KEY `isbn13` (`isbn13`),
  KEY `partnumber` (`partnumber`),
  KEY `modelnumber` (`modelnumber`),
  KEY `hasimage` (`hasimage`),
  KEY `hasimageslideshow` (`hasimageslideshow`),
  KEY `hasdigitalfile` (`hasdigitalfile`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `ilance_projects`
--

INSERT INTO `ilance_projects` (`id`, `project_id`, `escrow_id`, `cid`, `description`, `ishtml`, `description_videourl`, `date_added`, `date_starts`, `date_end`, `gtc`, `gtc_cancelled`, `user_id`, `visible`, `views`, `project_title`, `bids`, `bidsdeclined`, `bidsretracted`, `bidsshortlisted`, `budgetgroup`, `additional_info`, `status`, `close_date`, `transfertype`, `transfer_to_userid`, `transfer_from_userid`, `transfer_to_email`, `transfer_status`, `transfer_code`, `project_details`, `project_type`, `project_state`, `bid_details`, `filter_rating`, `filter_country`, `filter_state`, `filter_city`, `filter_zip`, `filter_underage`, `filter_businessnumber`, `filter_bidtype`, `filter_budget`, `filter_escrow`, `filter_gateway`, `filter_ccgateway`, `filter_offline`, `filter_publicboard`, `filtered_rating`, `filtered_country`, `filtered_state`, `filtered_city`, `filtered_zip`, `filter_bidlimit`, `filtered_bidlimit`, `filtered_bidtype`, `filtered_bidtypecustom`, `filtered_budgetid`, `filtered_auctiontype`, `classified_phone`, `classified_price`, `urgent`, `buynow`, `buynow_price`, `buynow_qty`, `buynow_qty_lot`, `items_in_lot`, `buynow_purchases`, `reserve`, `reserve_price`, `featured`, `featured_date`, `featured_searchresults`, `highlite`, `bold`, `autorelist`, `autorelist_date`, `startprice`, `retailprice`, `uniquebidcount`, `paymethod`, `paymethodcc`, `paymethodoptions`, `paymethodoptionsemail`, `keywords`, `currentprice`, `insertionfee`, `enhancementfee`, `fvf`, `isfvfpaid`, `isifpaid`, `isenhancementfeepaid`, `ifinvoiceid`, `enhancementfeeinvoiceid`, `fvfinvoiceid`, `returnaccepted`, `returnwithin`, `returngivenas`, `returnshippaidby`, `returnpolicy`, `buyerfeedback`, `sellerfeedback`, `hasimage`, `hasimageslideshow`, `hasdigitalfile`, `haswinner`, `hasbuynowwinner`, `winner_user_id`, `donation`, `charityid`, `donationpercentage`, `donermarkedaspaid`, `donermarkedaspaiddate`, `donationinvoiceid`, `currencyid`, `countryid`, `country`, `state`, `city`, `zipcode`, `sku`, `upc`, `ean`, `isbn10`, `isbn13`, `partnumber`, `modelnumber`, `salestaxstate`, `salestaxrate`, `salestaxentirecountry`, `salestaxshipping`, `countdownresets`, `bulkid`, `updateid`, `storeid`, `itemcondition`, `imageurl`, `imageurl_attachid`, `download_attachid`, `itemstatus`, `storecid`, `tags`, `genre`) VALUES
(40, 51515282, 0, 3, 'DES', '0', NULL, '2012-10-29 08:55:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1, 0, 'Song Name', 0, 0, 0, 0, '', NULL, 'draft', '0000-00-00 00:00:00', 'userid', 0, 0, '', '', '', 'public', 'reverse', 'service', 'open', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, '0', '1', '', '', '', '', 0, 10, 'entire', '', 0, 'regular', '', 0.00, 0, 0, 15.00, 0, 0, 0, 0, 0, 14.00, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0000-00-00 00:00:00', 0.00, 0.00, 0, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '0', 'none', 'none', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '0', 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 1, 0, 'Laptop', 'male'),
(41, 11515348, 0, 3, 'jkl', '0', NULL, '2012-10-29 08:57:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1, 0, 'kjl', 0, 0, 0, 0, '', NULL, 'draft', '0000-00-00 00:00:00', 'userid', 0, 0, '', '', '', 'public', 'reverse', 'service', 'open', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, '0', '1', '', '', '', '', 0, 10, 'entire', '', 0, 'regular', '', 0.00, 0, 0, 15.00, 0, 0, 0, 0, 0, 7.50, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0000-00-00 00:00:00', 0.00, 0.00, 0, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '0', 'none', 'none', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '0', 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 1, 0, 'Laptop', 'Female'),
(42, 86325138, 0, 3, 'dfgdf', '0', NULL, '2012-12-23 23:59:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1, 0, 'gdfg', 0, 0, 0, 0, '', NULL, 'draft', '0000-00-00 00:00:00', 'userid', 0, 0, '', '', '', 'public', 'reverse', 'service', 'open', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, '0', '1', '', '', '', '', 0, 10, 'entire', '', 0, 'regular', '', 0.00, 0, 0, 12.00, 0, 0, 0, 0, 0, 12.00, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0000-00-00 00:00:00', 0.00, 0.00, 0, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '0', 'none', 'none', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '0', 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 1, 0, 'dfg', 'male'),
(43, 36325191, 0, 3, '', '0', NULL, '2012-12-24 00:06:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1, 0, '', 0, 0, 0, 0, '', NULL, 'draft', '0000-00-00 00:00:00', 'userid', 0, 0, '', '', '', 'public', 'reverse', 'service', 'open', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, '0', '1', '', '', '', '', 0, 10, 'entire', '', 0, 'regular', '', 0.00, 0, 0, 0.00, 0, 0, 0, 0, 0, 0.00, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0000-00-00 00:00:00', 0.00, 0.00, 0, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '0', 'none', 'none', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '0', 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 1, 0, 'sad', 'male'),
(44, 26325585, 0, 3, '', '0', NULL, '2012-12-24 00:11:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1, 0, 'kjjkj', 0, 0, 0, 0, '', NULL, 'draft', '0000-00-00 00:00:00', 'userid', 0, 0, '', '', '', 'public', 'reverse', 'service', 'open', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, '0', '1', '', '', '', '', 0, 10, 'entire', '', 0, 'regular', '', 0.00, 0, 0, 0.00, 0, 0, 0, 0, 0, 0.00, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0000-00-00 00:00:00', 0.00, 0.00, 0, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '0', 'none', 'none', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '0', 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 1, 0, 'sdf', 'male'),
(45, 26325897, 0, 3, 'sdfsdf', '0', NULL, '2012-12-24 00:11:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1, 0, '', 0, 0, 0, 0, '', NULL, 'draft', '0000-00-00 00:00:00', 'userid', 0, 0, '', '', '', 'public', 'reverse', 'service', 'open', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, '0', '1', '', '', '', '', 0, 10, 'entire', '', 0, 'regular', '', 0.00, 0, 0, 0.00, 0, 0, 0, 0, 0, 0.00, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0000-00-00 00:00:00', 0.00, 0.00, 0, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '0', 'none', 'none', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '0', 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 1, 0, 'sdfdsf', 'male'),
(46, 56325919, 0, 3, '', '0', NULL, '2012-12-24 00:12:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1, 0, '', 0, 0, 0, 0, '', NULL, 'draft', '0000-00-00 00:00:00', 'userid', 0, 0, '', '', '', 'public', 'reverse', 'service', 'open', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, '0', '1', '', '', '', '', 0, 10, 'entire', '', 0, 'regular', '', 0.00, 0, 0, 0.00, 0, 0, 0, 0, 0, 0.00, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0000-00-00 00:00:00', 0.00, 0.00, 0, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '0', 'none', 'none', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '0', 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 1, 0, 'sdf', 'male'),
(47, 36325956, 0, 3, 'sdfsdf', '0', NULL, '2012-12-24 00:13:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, 1, 0, '', 0, 0, 0, 0, '', NULL, 'draft', '0000-00-00 00:00:00', 'userid', 0, 0, '', '', '', 'public', 'reverse', 'service', 'open', '0', '0', '0', '0', '0', '0', '0', '0', '0', 0, 0, 0, 0, '0', '1', '', '', '', '', 0, 10, 'entire', '', 0, 'regular', '', 0.00, 0, 0, 0.00, 0, 0, 0, 0, 0, 0.00, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0000-00-00 00:00:00', 0.00, 0.00, 0, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '0', 'none', 'none', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '0', 0, 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 1, 0, 'sdfsdf', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `ilance_subscription_user`
--

CREATE TABLE IF NOT EXISTS `ilance_subscription_user` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `subscriptionid` int(10) NOT NULL DEFAULT '1',
  `user_id` int(100) NOT NULL DEFAULT '-1',
  `paymethod` enum('account','bank','visa','amex','mc','disc','paypal','paypal_pro','check','stormpay','cashu','moneybookers') NOT NULL DEFAULT 'account',
  `startdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `renewdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `autopayment` int(1) NOT NULL DEFAULT '1',
  `autorenewal` enum('0','1') NOT NULL DEFAULT '1',
  `active` enum('yes','no','cancelled') NOT NULL DEFAULT 'no',
  `cancelled` int(1) NOT NULL DEFAULT '0',
  `migrateto` int(10) NOT NULL DEFAULT '0',
  `migratelogic` enum('none','waived','unpaid','paid') NOT NULL DEFAULT 'none',
  `recurring` int(1) NOT NULL DEFAULT '0',
  `invoiceid` int(10) NOT NULL DEFAULT '0',
  `roleid` int(5) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `subscriptionid` (`subscriptionid`),
  KEY `user_id` (`user_id`),
  KEY `paymethod` (`paymethod`),
  KEY `active` (`active`),
  KEY `migratelogic` (`migratelogic`),
  KEY `invoiceid` (`invoiceid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ilance_subscription_user`
--

INSERT INTO `ilance_subscription_user` (`id`, `subscriptionid`, `user_id`, `paymethod`, `startdate`, `renewdate`, `autopayment`, `autorenewal`, `active`, `cancelled`, `migrateto`, `migratelogic`, `recurring`, `invoiceid`, `roleid`) VALUES
(1, 1, 2, 'account', '2012-10-22 04:43:03', '2013-10-23 04:43:03', 1, '1', 'yes', 0, 0, 'none', 0, 0, 1),
(2, 1, 3, 'account', '2012-10-22 04:45:20', '2013-10-23 04:45:20', 1, '1', 'yes', 0, 0, 'none', 0, 2, 1),
(3, 1, 4, 'account', '2012-10-22 05:06:39', '2013-10-23 05:06:39', 1, '1', 'yes', 0, 0, 'none', 0, 3, 1),
(4, 1, 5, 'account', '2012-10-22 05:09:09', '2013-10-23 05:09:09', 1, '1', 'yes', 0, 0, 'none', 0, 4, 1),
(5, 1, 6, 'account', '2012-10-22 05:12:55', '2013-10-23 05:12:56', 1, '1', 'yes', 0, 0, 'none', 0, 5, 1),
(6, 1, 7, 'account', '2012-10-22 05:13:44', '2013-10-23 05:13:44', 1, '1', 'yes', 0, 0, 'none', 0, 6, 1),
(7, 1, 8, 'account', '2012-10-23 04:14:33', '2013-10-24 04:14:34', 1, '1', 'yes', 0, 0, 'none', 0, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ilance_users`
--

CREATE TABLE IF NOT EXISTS `ilance_users` (
  `user_id` int(100) NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(25) NOT NULL DEFAULT '',
  `iprestrict` int(1) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `salt` varchar(5) NOT NULL DEFAULT '',
  `secretquestion` varchar(200) NOT NULL DEFAULT '',
  `secretanswer` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL DEFAULT '',
  `address2` varchar(200) DEFAULT NULL,
  `city` varchar(100) NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  `zip_code` varchar(10) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `country` int(10) NOT NULL DEFAULT '500',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subcategories` mediumtext,
  `status` enum('active','suspended','cancelled','unverified','banned','moderated') NOT NULL DEFAULT 'active',
  `serviceawards` int(5) NOT NULL DEFAULT '0',
  `productawards` int(5) NOT NULL DEFAULT '0',
  `servicesold` int(5) NOT NULL DEFAULT '0',
  `productsold` int(5) NOT NULL DEFAULT '0',
  `rating` double NOT NULL DEFAULT '0',
  `score` int(5) NOT NULL DEFAULT '0',
  `feedback` double NOT NULL DEFAULT '0',
  `bidstoday` int(10) NOT NULL DEFAULT '0',
  `bidsthismonth` int(10) NOT NULL DEFAULT '0',
  `auctiondelists` int(5) NOT NULL DEFAULT '0',
  `bidretracts` int(5) NOT NULL DEFAULT '0',
  `lastseen` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dob` date NOT NULL DEFAULT '0000-00-00',
  `rid` varchar(10) NOT NULL DEFAULT '',
  `account_number` varchar(25) NOT NULL DEFAULT '',
  `available_balance` double(17,2) NOT NULL DEFAULT '0.00',
  `total_balance` double(17,2) NOT NULL DEFAULT '0.00',
  `income_reported` double(17,2) NOT NULL DEFAULT '0.00',
  `income_spent` double(17,2) NOT NULL DEFAULT '0.00',
  `startpage` varchar(250) NOT NULL DEFAULT 'main',
  `styleid` int(3) NOT NULL,
  `project_distance` int(1) NOT NULL DEFAULT '1',
  `currency_calculation` int(1) NOT NULL DEFAULT '1',
  `languageid` int(3) NOT NULL,
  `currencyid` int(3) NOT NULL,
  `timezone` varchar(250) NOT NULL,
  `notifyservices` int(1) NOT NULL,
  `notifyproducts` int(1) NOT NULL,
  `notifyservicescats` mediumtext,
  `notifyproductscats` mediumtext,
  `lastemailservicecats` date NOT NULL DEFAULT '0000-00-00',
  `lastemailproductcats` date NOT NULL DEFAULT '0000-00-00',
  `displayprofile` int(1) NOT NULL,
  `emailnotify` int(1) NOT NULL,
  `displayfinancials` int(1) NOT NULL,
  `vatnumber` varchar(250) NOT NULL,
  `regnumber` varchar(250) NOT NULL,
  `dnbnumber` varchar(250) NOT NULL,
  `companyname` varchar(100) NOT NULL,
  `usecompanyname` int(1) NOT NULL,
  `timeonsite` int(10) NOT NULL,
  `daysonsite` int(10) NOT NULL,
  `isadmin` int(1) NOT NULL DEFAULT '0',
  `permissions` mediumtext,
  `searchoptions` mediumtext,
  `rateperhour` double(10,2) NOT NULL DEFAULT '0.00',
  `profilevideourl` mediumtext,
  `profileintro` mediumtext,
  `gender` enum('','male','female') NOT NULL DEFAULT '',
  `freelancing` enum('','individual','business') NOT NULL DEFAULT '',
  `autopayment` int(1) NOT NULL DEFAULT '1',
  `posthtml` int(1) NOT NULL DEFAULT '0',
  `username_history` mediumtext,
  `password_lastchanged` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `role` int(10) NOT NULL DEFAULT '0',
  `store` int(10) NOT NULL DEFAULT '0',
  `store_pay` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `zip_code` (`zip_code`),
  KEY `country` (`country`),
  KEY `rating` (`rating`),
  KEY `city` (`city`),
  KEY `state` (`state`),
  KEY `status` (`status`),
  KEY `serviceawards` (`serviceawards`),
  KEY `score` (`score`),
  KEY `gender` (`gender`),
  KEY `freelancing` (`freelancing`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ilance_users`
--

INSERT INTO `ilance_users` (`user_id`, `ipaddress`, `iprestrict`, `username`, `password`, `salt`, `secretquestion`, `secretanswer`, `email`, `first_name`, `last_name`, `address`, `address2`, `city`, `state`, `zip_code`, `phone`, `country`, `date_added`, `subcategories`, `status`, `serviceawards`, `productawards`, `servicesold`, `productsold`, `rating`, `score`, `feedback`, `bidstoday`, `bidsthismonth`, `auctiondelists`, `bidretracts`, `lastseen`, `dob`, `rid`, `account_number`, `available_balance`, `total_balance`, `income_reported`, `income_spent`, `startpage`, `styleid`, `project_distance`, `currency_calculation`, `languageid`, `currencyid`, `timezone`, `notifyservices`, `notifyproducts`, `notifyservicescats`, `notifyproductscats`, `lastemailservicecats`, `lastemailproductcats`, `displayprofile`, `emailnotify`, `displayfinancials`, `vatnumber`, `regnumber`, `dnbnumber`, `companyname`, `usecompanyname`, `timeonsite`, `daysonsite`, `isadmin`, `permissions`, `searchoptions`, `rateperhour`, `profilevideourl`, `profileintro`, `gender`, `freelancing`, `autopayment`, `posthtml`, `username_history`, `password_lastchanged`, `role`, `store`, `store_pay`) VALUES
(1, '', 0, 'admin', '85db96ea4df0cafc47254bdab484de3f', '*YW%Z', '', '', 'prasad@ilancecustomization.com', '', '', '', NULL, '', '', '', '1-111-111-1111', 500, '2012-10-16 16:36:07', NULL, 'active', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-12-26 23:23:56', '0000-00-00', '', '8706297133857', 0.00, 0.00, 0.00, 0.00, 'main', 1, 1, 0, 1, 1, 'America/New_York', 0, 0, NULL, NULL, '0000-00-00', '0000-00-00', 0, 1, 0, '0', '0', '0', 'N/A', 0, 0, 0, 1, NULL, NULL, 0.00, NULL, NULL, '', '', 1, 1, NULL, '0000-00-00 00:00:00', 0, 0, 0),
(2, '127.0.0.1', 0, 'asas', '698252e0eea968cc2294e7d0e6b04ca8', 'UQAYA', '', '', 'asas', '', '', '', '', '', 'Ontario', '', '', 330, '2012-10-22 04:43:03', NULL, 'unverified', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-22 04:43:03', '0000-00-00', 'QGZROE', 'IL2981986281934', 0.00, 0.00, 0.00, 0.00, 'main', 1, 1, 1, 1, 1, 'America/Toronto', 0, 0, '', '', '0000-00-00', '0000-00-00', 1, 1, 0, '', '', '', '', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, NULL, '', '', 1, 0, NULL, '0000-00-00 00:00:00', 0, 0, 0),
(3, '127.0.0.1', 0, 'asasdf', '948b6f01d27ab9003d76bccb6946305f', '{@Wy&', '', '', 'asasdf', '', '', '', '', '', 'Ontario', '', '', 330, '2012-10-22 04:45:20', NULL, 'unverified', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-22 04:45:20', '0000-00-00', 'QCEOUJ', 'IL4602636374235', 0.00, 0.00, 0.00, 0.00, 'main', 1, 1, 1, 1, 1, 'America/Toronto', 0, 0, '', '', '0000-00-00', '0000-00-00', 1, 1, 0, '', '', '', '', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, NULL, '', '', 1, 0, NULL, '0000-00-00 00:00:00', 2, 0, 0),
(4, '127.0.0.1', 0, 'prasad', 'a1fab5568bc5567f4107f589062520ef', '57^pB', '', '', 'kprasadbe@gmail.com', '', '', '', '', '', 'Ontario', '', '', 330, '2012-10-22 05:06:39', NULL, 'active', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-22 05:06:39', '0000-00-00', 'MONTAG', 'IL9604385557097', 0.00, 0.00, 0.00, 0.00, 'main', 1, 1, 1, 1, 1, 'America/Toronto', 0, 0, '', '', '0000-00-00', '0000-00-00', 1, 1, 0, '', '', '', '', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, NULL, '', '', 1, 0, NULL, '0000-00-00 00:00:00', 2, 0, 0),
(5, '127.0.0.1', 0, 'ravish', '3ca821c65e00894d75e22303b6357a9e', '{^JKv', '', '', 'kprasadbe@gmail.comd', '', '', '', '', '', 'Ontario', '', '', 330, '2012-10-22 05:09:09', NULL, 'active', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-22 05:09:09', '0000-00-00', 'APIDSG', 'IL9322186446382', 0.00, 0.00, 0.00, 0.00, 'main', 1, 1, 1, 1, 1, 'America/Toronto', 0, 0, '', '', '0000-00-00', '0000-00-00', 1, 1, 0, '', '', '', '', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, NULL, '', '', 1, 0, NULL, '0000-00-00 00:00:00', 2, 0, 0),
(6, '127.0.0.1', 0, 'asasdfs', '1dba9b8f5c237063a754fb323e17b56a', 'f?7DZ', '', '', 'prasan_1327040101_per@gmail.com', '', '', '', '', '', 'Ontario', '', '', 330, '2012-10-22 05:12:55', NULL, 'active', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-22 05:12:55', '0000-00-00', 'NRNFAJ', 'IL8859963475747', 0.00, 0.00, 0.00, 0.00, 'main', 1, 1, 1, 1, 1, 'America/Toronto', 0, 0, '', '', '0000-00-00', '0000-00-00', 1, 1, 0, '', '', '', '', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, NULL, '', '', 1, 0, NULL, '0000-00-00 00:00:00', 2, 0, 0),
(7, '127.0.0.1', 0, 'prasadk', 'd44d35dfed03f1299d63aa59e9c3812d', '}*8.;', '', '', 'prasad@keer.ana', '', '', '', '', '', 'Ontario', '', '', 330, '2012-10-22 05:13:44', NULL, 'active', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-22 05:13:44', '0000-00-00', 'DLPNQE', 'IL6968465832587', 0.00, 0.00, 0.00, 0.00, 'main', 1, 1, 1, 1, 1, 'America/Toronto', 0, 0, '', '', '0000-00-00', '0000-00-00', 1, 1, 0, '', '', '', '', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, NULL, '', '', 1, 0, NULL, '0000-00-00 00:00:00', 2, 0, 0),
(8, '127.0.0.1', 0, 'prasads', 'ead94c50549fae56d5a5ad4146850104', 'Ny?aP', '', '', 'prasad@keer.anas', '', '', '', '', '', 'Ontario', '', '', 330, '2012-10-23 04:14:33', NULL, 'active', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-23 04:14:33', '0000-00-00', 'ZSEIOK', 'IL5081502786828', 0.00, 0.00, 0.00, 0.00, 'main', 1, 1, 1, 1, 1, 'America/Toronto', 0, 0, '', '', '0000-00-00', '0000-00-00', 1, 1, 0, '', '', '', '', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, NULL, '', '', 1, 0, NULL, '0000-00-00 00:00:00', 2, 0, 0);
