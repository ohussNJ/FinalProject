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

INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, aircraftid, airlineid) 
VALUES (1, "2022-04-24", "2022-04-24", "JFK", "LAX", 0, 1, 200, 1, "delta1", "NY");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, aircraftid, airlineid) 
VALUES (2, "2022-05-24", "2022-05-24", "EWR", "LCY", 1, 0, 400, 2, "spicejet3", "NW");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, aircraftid, airlineid) 
VALUES (3, "2022-06-24", "2022-06-24", "LAX" , "EWR", 0, 1, 600, 1, "united2", "LA");
INSERT INTO flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, aircraftid, airlineid) 
VALUES (4, "2022-07-24", "2022-07-24", "LCY", "JFK", 1, 0, 300, 2, "spirit4", "LO");

INSERT INTO ticket(cid, flightNum, ticketNum, isflexible, bookingcost, cancelfee, seatnum, fare, datebought, priorityNum, is_oneway, waitlist, is_roundtrip, classtype)
VALUES (1, 1, 1, 1, 30, 25, 45, 300, "2022-07-24", 1, 0, 0, 1, "business");