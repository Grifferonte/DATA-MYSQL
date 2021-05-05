use td1_bdd;

create table Segment (
    indIp varchar(11),
    nomSegment varchar(20) not null ,
    etage tinyint(1),
    constraint primary key (indIp)
);

create table Salle (
    nSalle varchar(7),
    nomSalle varchar(20) not null ,
    nbPoste varchar(7),
    indIp varchar(11),
    constraint primary key (nSalle)
    /**FOREIGN KEY (indIp) REFERENCES Segment(indIp)**/
);

create table Poste (
    nPoste varchar(7),
    nomPoste varchar(20) not null ,
    indIp varchar(11),
    ad varchar(3),
    typePoste varchar(9),
    nSalle varchar(7),
    constraint primary key (nPoste),
    constraint ad check ( ad between 0 and 255)
    /**FOREIGN KEY (indIp) REFERENCES Segment(indIp),
    FOREIGN KEY (nSalle) REFERENCES Salle(nSalle)**/
);

create table Logiciel (
    nLog varchar(7),
    nomLog varchar(20),
    dateAch datetime,
    version varchar(7),
    typeLog varchar(9),
    prix decimal(6,2),
    constraint  primary key (nLog),
    constraint prix check ( prix>=0 )
);

create table Installer (
    nPoste varchar(7),
    nLog varchar(7),
    numIns integer(5),
    dateIns timestamp default current_timestamp,
    delai smallint,
    constraint primary key (numIns)
    /** FOREIGN KEY (nPoste) REFERENCES Poste(nPoste),
    FOREIGN KEY (nLog) REFERENCES Logiciel(nLog)**/
);

create table Types (
    TypeLP varchar(9),
    nomType varchar(20),
    constraint primary key (TypeLP)
);
