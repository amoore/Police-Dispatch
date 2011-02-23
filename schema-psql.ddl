drop table officer cascade;
create table officer (
  officerid serial primary key,
  name varchar(50),
  serial_number int,
  crew smallint references crew
);

drop table crew cascade;
create table crew (
  crewid serial primary key,
  radio_number smallint
);

drop table call cascade;
create table call (
  callid serial primary key,
  type varchar(50),
  address varchar(50),
  case_number int,
  created timestamp DEFAULT now() NOT NULL,
  cleared timestamp
);

drop table crewcall cascade;
create table crewcall (
  crewcallid serial primary key,
  crew integer references crew,
  call integer references call,
  outofservice timestamp,
  inservice timestamp
);

  
