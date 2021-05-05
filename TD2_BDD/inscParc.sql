use td1_bdd;

/**
  - insert into table values (XX,XX,XX);
  - insert into table (param1, param2, param3) values (XX,XX,XX);
  - insert into table (param1, param2, param3) values (XX,XX,XX), (XX,XX,XX);
  - insert into table (param1, param2, param3) values (XX,XX,XX) values (XX,XX,XX), (XX,XX,XX);
**/

/** INSERT : **/

insert into Segment values ('130.120.80', 'Brin RDC', null);
insert into Segment values ('130.120.81', 'Brin 1er etage', null);
insert into Segment values ('130.120.82', 'Brin 2e etage', null);

insert into Salle values ('a01', 'Salle 1','3','130.120.80');
insert into Salle values ('a02', 'Salle 2','2','130.120.80');
insert into Salle values ('a03', 'Salle 3','2','130.120.80');
insert into Salle values ('a011', 'Salle 11','2','130.120.81');
insert into Salle values ('a012', 'Salle 12','1','130.120.81');
insert into Salle values ('a021', 'Salle 21','2','130.120.82');
insert into Salle values ('a022', 'Salle 22','0','130.120.83');
insert into Salle values ('a023', 'Salle 23','0','130.120.83');

insert into Poste values ('p1', 'Poste 1','130.120.80','01','TX','a01');
insert into Poste values ('p2', 'Poste 2','130.120.80','02', 'UNIX','a01');
insert into Poste values ('p3', 'Poste 3','130.120.80','03','TX','a01');
insert into Poste values ('p4', 'Poste 4','130.120.80','04','PCWS','a02');
insert into Poste values ('p5', 'Poste 5','130.120.80','05','PCWS','a02');
insert into Poste values ('p6', 'Poste 6','130.120.80','06','UNIX','a03');
insert into Poste values ('p7', 'Poste 7','130.120.80','07','TX','a03');
insert into Poste values ('p8', 'Poste 8','130.120.81','01','UNIX','a11');
insert into Poste values ('p9', 'Poste 9','130.120.81','02','TX','a11');
insert into Poste values ('p10', 'Poste 10','130.120.81','03','UNIX','a12');
insert into Poste values ('p11', 'Poste 11','130.120.82','01','PCNT','a21');
insert into Poste values ('p12', 'Poste 12','130.120.82','02','PCWS','a21');

insert into Logiciel values ('log1', 'Oracle 6', '1995-05-13', '6.2', 'UNIX', 3000);
insert into Logiciel values ('log2', 'Oracle 8', '1999-09-15', '8i', 'UNIX', 5600);
insert into Logiciel values ('log3', 'SQL Server', '1998-04-12', '7', 'PCNT', 2700);
insert into Logiciel values ('log4', 'Front Page', '1997-06-03', '5', 'PCWS', 500);
insert into Logiciel values ('log5', 'Windev', '1997-05-12', '5', 'PCWS', 750);
insert into Logiciel values ('log6', 'SQL*NET', null, '2.0', 'UNIX', 500);
insert into Logiciel values ('log7', 'I. I. S.', '2002-04-12', '2', 'PCNT', 810);
insert into Logiciel values ('log8', 'DreamWeaver', '2003-09-21', '2.0', 'BeOS', 1400);

insert into Types values ('TX',  'Terminal X-Window');
insert into Types values ('UNIX', 'Système Unix');
insert into Types values ('PCNT', 'PC Windows NT');
insert into Types values ('PCWS', 'PC Windows');
insert into Types values ('NC', 'Network Computer');


alter table Installer modify numIns integer(5) AUTO_INCREMENT;

insert into Installer (nPoste, nLog, dateIns, delai) values ('p2', 'log1', '2003-05-15', null);
insert into Installer (nPoste, nLog, dateIns, delai) values ('p2', 'log2', '2003-09-17', null);
insert into Installer (nPoste, nLog, dateIns, delai) values  ('p4', 'log5', null, null);
insert into Installer (nPoste, nLog, dateIns, delai) values  ('p6', 'log6', '2003-05-20', null);
insert into Installer (nPoste, nLog, dateIns, delai) values  ('p6', 'log1', '2003-05-20', null);
insert into Installer (nPoste, nLog, dateIns, delai) values  ('p8', 'log2', '2003-05-19', null);
insert into Installer (nPoste, nLog, dateIns, delai) values  ('p8', 'log6', '2003-05-20', null);
insert into Installer (nPoste, nLog, dateIns, delai) values  ('p11','log3', '2003-04-20', null);
insert into Installer (nPoste, nLog, dateIns, delai) values  ('p12','log4', '2003-04-20', null);
insert into Installer (nPoste, nLog, dateIns, delai) values  ('p11','log7', '2003-04-20', null);
insert into Installer (nPoste, nLog, dateIns, delai) values  ('p7', 'log7', '2002-04-01', null);

/** SEQUENCE : **/
/**CREATE SEQUENCE incrementInstallerIns START WITH 1 INCREMENT BY 1;**/
/**insert into Installer values  ('p2', 'log1', incrementInstallerIns.nextval, '2003-05-15', null);
insert into Installer values  ('p2', 'log2', incrementInstallerIns.nextval, '2003-09-17', null);
insert into Installer values  ('p4', 'log5', incrementInstallerIns.nextval, null, null);
insert into Installer values  ('p6', 'log6', incrementInstallerIns.nextval, '2003-05-20', null);
insert into Installer values  ('p6', 'log1', incrementInstallerIns.nextval, '2003-05-20', null);
insert into Installer values  ('p8', 'log2', incrementInstallerIns.nextval, '2003-05-19', null);
insert into Installer values  ('p8', 'log6', incrementInstallerIns.nextval, '2003-05-20', null);
insert into Installer values  ('p11','log3', incrementInstallerIns.nextval, '2003-04-20', null);
insert into Installer values  ('p12','log4', incrementInstallerIns.nextval, '2003-04-20', null);
insert into Installer values  ('p11','log7', incrementInstallerIns.nextval, '2003-04-20', null);
insert into Installer values  ('p7', 'log7', incrementInstallerIns.nextval, '2002-04-01', null);**/

/**
  WITH FOREIGN KEY :
    - insert into table values ((select XX from XX where condition = condition), XX, XX, XX)
**/