use tp_bdd;


insert into installer values ('p2' , 'log6' , null , sysdate() ,null);
insert into installer values ('p8' , 'log1' , null , sysdate() , null);
insert into installer values ('p10' , 'log1' , null , sysdate() , null);

select * from Installer;

update Segment as Sg set Sg.nbSalle = (select count(S.nSalle) from Salle as S where Sg.indIP = S.indIP);

update Segment as Sg set Sg.nbPoste = (select count(P.nPoste) from Poste as P where Sg.indIP = P.indIP);

select * from Segment;

update Logiciel as L set L.nbInstall = (select count(I.numIns) from Installer as I where  L.nLog = I.nLog);

select * from Logiciel ;

update Poste as P set P.nbLog = (select count(I.numIns) from Installer I where  P.nPoste = I.nPoste);

select * from Poste ;