use td1_bdd;

update Segment set etage = 0 where nomSegment = 'Brin RDC';
update Segment set etage = 1 where nomSegment = 'Brin 1er etage';
update Segment set etage = 2 where nomSegment = 'Brin 2e etage';

update Logiciel set prix = prix - prix * 0.10 where typeLog = 'PCNT';
/**
update Segment set etage = 0 where indIp = '130.120.80';
update Segment set etage = 1 where indIp = '130.120.81';
update Segment set etage = 2 where indIp = '130.120.82';

update Segment set etage = case nomSegment
    when 'Brin RDC' then 0
    when 'Brin 1er etage' then 1
    when 'Brin 2e etage' then 2
    END
where nomSegment in ('Brin RDC','Brin 1er etage','Brin 2e etage');
**/


