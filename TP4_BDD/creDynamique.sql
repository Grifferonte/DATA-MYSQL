use tp_bdd;
/* Création dynamique de tables */

CREATE TABLE Softs AS SELECT nomLog as 'nomSoft', version, prix FROM Logiciel;

/*CREATE TABLE Softs AS SELECT nomLog, version, prix FROM Logiciel;

ALTER TABLE Softs CHANGE nomLog nomSoft VARCHAR(20);
*/
SELECT * FROM Softs;

CREATE TABLE PCSeuls
	AS SELECT nPoste, nomPoste, IndIP, ad, typePoste, nSalle
	FROM Poste
	WHERE typePoste = 'PCNT' OR typePoste = 'PCWS';

/*CREATE TABLE PCSeuls
	AS SELECT nPoste as 'np', nomPoste 'nomP', IndIP as 'seg', ad, typePoste as 'typeP', nSalle as 'salle'
	FROM Poste
	WHERE typePoste = 'PCNT' OR typePoste = 'PCWS';
*/

ALTER TABLE PCSeuls CHANGE nPoste np VARCHAR(7);

ALTER TABLE PCSeuls CHANGE nomPoste nomP VARCHAR(20);

ALTER TABLE PCSeuls CHANGE IndIP seg VARCHAR(11);

ALTER TABLE PCSeuls CHANGE typePoste typeP VARCHAR(9);

ALTER TABLE PCSeuls CHANGE nSalle salle VARCHAR(9);

SELECT * FROM PCSeuls;