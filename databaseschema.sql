CREATE DATABASE `airlinedb`;
USE `airlinedb`;

CREATE TABLE `admin` (
    `admin_username` varchar(50),
    `admin_password` varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `firstname` varchar(50),
  `lastname` varchar(50),
  `username` varchar(50),
  `password` varchar(50),
  `cid`int,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `airlinecompany` (
  `airlineid` varchar(2),
  `name` varchar(50),
PRIMARY KEY (`airlineid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `aircraft` (
`aircraftid` varchar(10),
`airlineid` varchar(2),
PRIMARY KEY (`aircraftid`),
FOREIGN KEY(`airlineid`) REFERENCES `airlinecompany` (`airlineid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `airport` (
  `airportid` varchar(3),
  `airportname` varchar(50),
  PRIMARY KEY (`airportid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `employee` (
  `eid` int,
  `firstname` varchar(50),
  `lastname` varchar(50),
  `ssn` int,
  `emp_username` varchar(50),
  `emp_password` varchar(50),
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `flight` (
  `flightNum` int,
  `departuredate` date,
  `destinationdate` date,
  `departureairport` varchar(3),
  `destinationairport` varchar(3),
  `isinternational` boolean,
  `isdomestic` boolean,
  `price` float,
  `stops` int,
  `takeoff_time` time,
  `landing_time` time,
  `aircraftid` varchar(10),
  `airlineid` varchar(2),
PRIMARY KEY (`flightNum`),
FOREIGN KEY (`airlineid`) REFERENCES airlinecompany (`airlineid`),
FOREIGN KEY (`aircraftid`) REFERENCES aircraft (`aircraftid` ),
FOREIGN KEY (`departureairport`) REFERENCES airport(`airportid`),
FOREIGN KEY (`destinationairport`) REFERENCES airport(`airportid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ticket` (
  `cid` int,
  `flightNum` int,
  `ticketNum` int NOT NULL AUTO_INCREMENT,
  `isflexible` boolean,
  `bookingcost` int DEFAULT 25,
  `cancelfee` int,
  `seatnum` int, 
  `fare` float,
  `datebought` date,
  `priorityNum` int,
  `is_oneway` boolean,
  `waitlist` boolean,
  `is_roundtrip` boolean,
  `is_cancelled` boolean,
  `classtype` varchar(10),
PRIMARY KEY (`ticketNum`),
FOREIGN KEY (`flightNum`) REFERENCES flight (`flightNum`),
FOREIGN KEY (`cid`) REFERENCES users (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE faq(
    `question` varchar(100),
    `answer` varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
