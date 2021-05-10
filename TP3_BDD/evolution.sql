use tp_bdd;


/** ADD COLUMN **/
alter table Segment add column nbSalle tinyint(2) default 0, add column nbPoste tinyint(2) default 0;
alter table Logiciel add column nbInstall tinyint(2) default 0;
alter table Poste add column nbLog tinyint(2) default 0;

/** OTHER METHOD
  alter table Segment add column (nbSalle tinyint(2) default 0, nbPoste tinyint(2) default 0);
 */

describe Segment;
describe Logiciel;
describe Poste;

select * from Segment;
select * from Logiciel;
select * from Poste;

/** CHANGE COLUMN **/

alter table Salle modify column nomSalle varchar(30);
alter table Segment modify column nomSegment varchar(15);

/** ERREUR car on a une valeur insérée qui à un nomSegments qui est > 14 **/
/** alter table Segment modify column nomSegment varchar(14); **/

describe Salle;
describe Segment;

select * from Salle;
select * from Segment;

/** ADD CONSTRAINTS **/

/** Check constraints **/

select indIP from Salle where indIP not in (select indIP from Segment);
select nSalle from Poste where nSalle not in (select nSalle from Salle);
select indIp from Poste where indIP not in (select indIP from Segment);
select typePoste from Poste where typePoste not in (select TypeLP from Types);
select nLog from Installer where nLog not in (select nLog from Logiciel);
select nPoste from Installer where nPoste not in (select nPoste from Poste);
select typeLog from Logiciel where typeLog not in (select typeLP from Types);

/** Clean Data **/

delete from Salle where indIP not in (select indIP from Segment);
insert into Types values ('BeOS','Système Be');

/** Add Constraints **/

alter table Installer add unique uc_installer (nPoste, nLog);

alter table Salle add constraint fk_Salle_indIp foreign key (indIp) references Segment(indIp);
alter table Poste add (constraint fk_Poste_indIp foreign key (indIp) references Segment(indIp),constraint fk_Poste_nSalle foreign key (nSalle) references Salle(nSalle), constraint fk_Poste_typePoste_Types foreign key (typePoste) references Types(TypeLP));
alter table Installer add (constraint fk_Installer_nLog foreign key (nLog) references Logiciel(nLog),constraint fk_Installer_nPoste foreign key (nPoste) references Poste(nPoste));
alter table Logiciel add constraint fk_Logiciel_typeLog_Types foreign key (typeLog) references Types(TypeLP);

