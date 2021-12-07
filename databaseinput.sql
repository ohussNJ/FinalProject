USE `airlinedb`;

INSERT INTO admin(admin_username, admin_password) VALUES ("admin", "admin");

INSERT INTO users(firstname, lastname, username, password, cid) VALUES ("omar", "hussein", "ohuss", "password", 1);
INSERT INTO users(firstname, lastname, username, password, cid) VALUES ("john", "doe", "jdoe", "password", 2);
INSERT INTO users(firstname, lastname, username, password, cid) VALUES ("jane", "doe", "jadoe", "password", 3);

INSERT INTO employee(eid, firstname, lastname, ssn, emp_username, emp_password) VALUES (10, "cus", "rep", 123, "cusrep", "password");

INSERT INTO airlinecompany(airlineid, name) VALUES("NY","New York Airport");
INSERT INTO airlinecompany(airlineid, name) VALUES("LA", "Los Angeles Airport");
INSERT INTO airlinecompany(airlineid, name) VALUES("NW", "Newark Airport");
INSERT INTO airlinecompany(airlineid, name) VALUES("LO", "London Intl Airport");

insert into aircraft(aircraftid, airlineid) VALUES ("delta1", "NY");
insert into aircraft(aircraftid, airlineid) VALUES ("united2", "LA");
insert into aircraft(aircraftid, airlineid) VALUES ("spicejet3", "NW");
insert into aircraft(aircraftid, airlineid) VALUES ("spirit4", "LO");

insert into airport(airportid, airportname) values ("JFK", "New York");
insert into airport(airportid, airportname) values ("EWR", "Newark");
insert into airport(airportid, airportname) values ("LAX", "Los Angeles");
insert into airport(airportid, airportname) values ("LCY", "London");

INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (1, "2022-04-24", "2022-04-24", "JFK", "LAX", 0, 1, 200, 1, '101012','121212', "delta1", "NY");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (2, "2022-05-24", "2022-05-24", "EWR", "LCY", 1, 0, 400, 2,'111012','111412', "spicejet3", "NW");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (3, "2022-06-24", "2022-06-24", "LAX" , "EWR", 0, 1, 600, 1,'121412','141412', "united2", "LA");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (4, "2022-07-24", "2022-07-24", "LCY", "JFK", 1, 0, 300, 2,'121112','151121', "spirit4", "LO");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (5, "2022-08-24", "2022-08-24", "EWR", "LAX", 0, 1, 600, 1,'111012','131212', "spicejet3", "NW");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (6, "2022-09-14", "2022-09-14", "LCY", "EWR", 1, 0, 700, 2,'111012','141212', "spirit4", "LO");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (7, "2022-10-15", "2022-10-15", "EWR", "JFK", 0, 1, 100, 1,'104012','131312', "spicejet3", "NW");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (8, "2022-11-16", "2022-11-16", "LCY", "LAX", 1, 0, 700, 2, '114012','142214',"spirit4", "LO");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (9, "2022-12-17", "2022-12-17", "LAX", "LCY", 1, 0, 700, 2,'112012','122120', "united2", "LA");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (10, "2022-09-24", "2022-09-24", "JFK", "LCY", 1, 0, 700, 2,'141012','151212', "delta1", "NY");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (11, "2022-10-24", "2022-10-24", "LCY", "EWR", 1, 0, 300, 2,'121012','141212', "spirit4", "LO");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (12, "2022-11-24", "2022-11-24", "LAX", "JFK", 1, 0, 300, 2,'131012','141212', "united2", "LA");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (13, "2022-12-24", "2022-12-24", "EWR", "JFK", 0, 1, 300, 2,'141012','161212', "spicejet3", "NW");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (14, "2022-08-25", "2022-08-25", "LCY", "JFK", 1, 0, 350, 2,'171012','191212', "spirit4", "LO");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (15, "2022-09-26", "2022-09-26", "JFK", "LAX", 1, 0, 600, 2,'201012','211212', "delta1", "NY");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (16, "2022-10-27", "2022-10-27", "LCY", "EWR", 1, 0, 500, 2,'151012','171212', "spirit4", "LO");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) 
VALUES (17, "2020-10-27", "2020-10-27", "LCY", "EWR", 1, 0, 500, 2,'151012','171212', "spirit4", "LO");

INSERT INTO ticket(cid, flightNum, ticketNum, isflexible, bookingcost, cancelfee, seatnum, fare, datebought, priorityNum, is_oneway, waitlist, is_roundtrip, classtype, is_cancelled)
VALUES (1, 17, 19, 1, 30, 25, 45, 300, "2022-12-07", 1, 0, 0, 1, "business", 0);
