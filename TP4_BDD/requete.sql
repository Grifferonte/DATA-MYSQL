use tp_bdd;

/* 4.2 */

select typePoste from Poste where nPoste = 'p8';

select nomLog from Logiciel where typeLog = 'UNIX';

select nomPoste , indIp , nSalle from Poste where typePoste = 'UNIX' or typePoste = 'PCWS';

select nomPoste , indIp , nSalle from Poste where (typePoste = 'UNIX' or typePoste = 'PCWS') and indIp = '130.120.80' order by nSalle desc;

select nLog from Installer where nPoste = 'p6';

select nPoste from Installer where nLog = 'log1';

select nomPoste , concat(indIP , '.' , ad) as ' Adresse IP' from Poste where typePoste = 'TX';

/* 4.3 */

select count(nPoste) from Installer;

select nSalle , count(nPoste) from Poste group by (nSalle) order by 1 asc;

select nLog , count(nPoste) from Installer group by (nLog);

select avg(prix) from Logiciel where typeLog = 'UNIX';

select max(dateAch) from Logiciel;

select nPoste from Installer group by (nPoste) having (count(nLog) = 2);

select count(nPoste) from (select nPoste from Installer group by nPoste having count(nLog)=2) as Table_Transition;

/* 4.4 */

select distinct typeLP from Types where typeLP not in (select distinct typePoste from Poste);

select distinct typeLog from Logiciel where typeLog in (select distinct typePoste from Poste);

select distinct typePoste from Poste where typePoste not in (select distinct typeLog from Logiciel);

select concat(indIP , '.' , ad) as ' Adresse IP' from Poste where nPoste in (select nPoste from Installer where nLog = 'log6');

select concat(indIP , '.' , ad) as ' Adresse IP' from Poste where nPoste in (select nPoste from Installer where nLog = (select nLog from Logiciel where nomLog = 'Oracle 8'));

select nomSegment from Segment where indIp in (select indIp from Poste where typePoste = 'TX' group by (indIp) having count(nPoste) = 3);

select nomSalle from Salle where nSalle in (select nSalle from Poste where nPoste in (select nPoste from Installer where nLog = (select nLog from Logiciel where nomLog = 'Oracle 6')));

select nomLog from Logiciel where dateAch = (select max(dateAch) from Logiciel);

/* Relationnel */

select concat(P.indIP , '.' , P.ad) as ' Adresse IP' from Poste as P, Installer as I where P.nPoste = I.nPoste and I.nLog = 'log6';

select concat(P.indIP , '.' , P.ad) as ' Adresse IP' from Poste as P, Installer as I, Logiciel as L where P.nPoste = I.nPoste and L.nLog = I.nLog and L.nomLog = 'Oracle 8';

select S.nomSegment from Segment as S, Poste as P where S.indIp = P.indIp and P.typePoste = 'TX' group by (S.nomSegment) having count(P.nPoste) = 3;

select S.nomSalle from Salle as S, Poste as P, Installer as I, Logiciel as L where S.nSalle = P.nSalle and P.nPoste = I.nPoste and I.nLog = L.nLog and L.nomLog = 'Oracle 6';

select Sg.nomSegment, S.nomSalle, concat(P.indIP , '.' , P.ad) as ' Adresse IP', L.nomLog, I.dateIns from Segment as Sg, Salle as S, Poste as P, Logiciel as L, Installer as I where S.nSalle = P.nSalle and S.indIp = Sg.indIp and P.nPoste = I.nPoste and I.nLog = L.nLog ORDER BY 1,2,3;


/* SQL2 */

select concat(indIP , '.' , ad) as ' Adresse IP' from Poste natural join Installer where nLog = 'log6';

select concat(indIP , '.' , ad) as ' Adresse IP' from Poste natural join Installer natural join Logiciel where nomLog = 'Oracle 8';

select nomSegment from Segment natural join Poste where typePoste = 'TX' group by (indIp) having count(nPoste) = 3;
/*select nomSegment from Segment join Poste using (indIp) where typePoste = 'TX' group by (indIp) having count(nPoste) = 3; */

select nomSalle from Salle natural join Poste natural join Installer natural join Logiciel where nomLog = 'Oracle 6';

/* 4.6 */

select nomPoste from Poste P where exists (select distinct I.nLog from Installer I where I.nPoste = P.nPoste and I.nLog in (select I2.nLog from Installer I2 where  I2.nPoste = 'p6')) and not (nPoste ='p6');

select nomPoste from Poste P where not exists (select distinct I.nLog from Installer I where I.nPoste = 'p6' and I.nLog not in (select I2.nLog from Installer I2 where  I2.nPoste = P.nPoste)) and not (nPoste ='p6');

select nomPoste from Poste P where not exists (select I.nLog from Installer I where I.nPoste = 'p2'and I.nLog not in (select I2.nLog from Installer I2 WHERE  I2.nPoste = p.nPoste)) and not exists (select I3.nLog from Installer I3 where I3.nPoste = P.nPoste and I3.nLog not in  (select I4.nLog from Installer i4 where I4.nPoste = 'p2')) and not (nPoste ='p2');

