use tp_bdd;

/** DROP TABLE DATABSE CASCADE NOT WORKING ON MYSQL **/

SET FOREIGN_KEY_CHECKS = 0;

drop table Segment;
drop table Salle;
drop table Poste;
drop table Logiciel;
drop table Installer;
drop table Types;
drop table Softs;
drop table PCSeuls;

SET FOREIGN_KEY_CHECKS = 1;