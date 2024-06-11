CREATE TABLE Dept
(
	DeptCode  CHAR(3)  NOT NULL ,
	DeptName  VARCHAR(30)  NULL ,
	FactCode  CHAR(3)  NOT NULL 
);


CREATE  UNIQUE INDEX XPKDeut ON Dept
(
	DeptCode  ASC,
	FactCode  ASC
);


ALTER TABLE Dept
	ADD CONSTRAINT  XPKDeut PRIMARY KEY (DeptCode,FactCode);


CREATE TABLE Faculty
(
	FactCode  CHAR(3)  NOT NULL ,
	FactName  VARarCHAR(30)  NULL 
);


CREATE  UNIQUE INDEX XPKFaculty ON Faculty
(
	FactCode  ASC
);


ALTER TABLE Faculty
	ADD CONSTRAINT  XPKFaculty PRIMARY KEY (FactCode);


CREATE TABLE Registration
(
	Year  CHAR(4)  NOT NULL ,
	Term  CHAR(1)  NOT NULL ,
	SID  CHAR(11)  NOT NULL ,
	SubjCode  CHAR(8)  NOT NULL ,
	Grade  CHAR(3)  NULL 
);


CREATE  UNIQUE INDEX XPKRegistration ON Registration
(
	Year  ASC,
	Term  ASC,
	SID  ASC,
	SubjCode  ASC
);


ALTER TABLE Registration
	ADD CONSTRAINT  XPKRegistration PRIMARY KEY (Year,Term,SID,SubjCode);


CREATE TABLE Student
(
	SID  CHAR(11)  NOT NULL ,
	SFname  VARCHAR(25)  NULL ,
	SLname  VARCHAR(25)  NULL ,
	FactCode  CHAR(3)  NULL ,
	DeptCode  CHAR(3)  NULL 
);


CREATE  UNIQUE INDEX XPKStudent ON Student
(
	SID  ASC
);


ALTER TABLE Student
	ADD CONSTRAINT  XPKStudent PRIMARY KEY (SID);


CREATE TABLE Subject
(
	SubjCode  CHAR(8)  NOT NULL ,
	SubjName  VARCHAR(50)  NULL ,
	Credit  NUMBER(2)  NULL 
);


CREATE  UNIQUE INDEX XPKSubject ON Subject
(
	SubjCode  ASC
);


ALTER TABLE Subject
	ADD CONSTRAINT  XPKSubject PRIMARY KEY (SubjCode);


CREATE TABLE Teacher
(
	Tcode  CHAR(3)  NOT NULL ,
	TFname  VARCHAR(20)  NULL ,
	TLname  VARCHAR(25)  NULL ,
	FactCode  CHAR(3)  NULL ,
	DeptCode  CHAR(3)  NULL 
);


CREATE  UNIQUE INDEX XPKTeacher ON Teacher
(
	Tcode  ASC
);


ALTER TABLE Teacher
	ADD CONSTRAINT  XPKTeacher PRIMARY KEY (Tcode);


ALTER TABLE Dept
	ADD (CONSTRAINT  R_1 FOREIGN KEY (FactCode) REFERENCES Faculty(FactCode));


ALTER TABLE Registration
	ADD (CONSTRAINT  R_5 FOREIGN KEY (SID) REFERENCES Student(SID));


ALTER TABLE Registration
	ADD (CONSTRAINT  R_6 FOREIGN KEY (SubjCode) REFERENCES Subject(SubjCode));


ALTER TABLE Student
	ADD (CONSTRAINT  R_2 FOREIGN KEY (DeptCode,FactCode) REFERENCES Dept(DeptCode,FactCode) ON DELETE SET NULL);


ALTER TABLE Teacher
	ADD (CONSTRAINT  R_3 FOREIGN KEY (DeptCode,FactCode) REFERENCES Dept(DeptCode,FactCode) ON DELETE SET NULL);


CREATE  TRIGGER tI_Dept BEFORE INSERT ON Dept for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- INSERT trigger on Dept 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Faculty R/1 Dept on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f3d9", PARENT_OWNER="", PARENT_TABLE="Faculty"
    CHILD_OWNER="", CHILD_TABLE="Dept"
    P2C_VERB_PHRASE="R/1", C2P_VERB_PHRASE="R/1", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="FactCode" */
    SELECT count(*) INTO NUMROWS
      FROM Faculty
      WHERE
        /* %JoinFKPK(:%New,Faculty," = "," AND") */
        :new.FactCode = Faculty.FactCode;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Dept because Faculty does not exist.'
      );
    END IF;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tD_Dept AFTER DELETE ON Dept for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- DELETE trigger on Dept 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Dept R/2 Student on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0001c747", PARENT_OWNER="", PARENT_TABLE="Dept"
    CHILD_OWNER="", CHILD_TABLE="Student"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="DeptCode""FactCode" */
    UPDATE Student
      SET
        /* %SetFK(Student,NULL) */
        Student.FactCode = NULL,
        Student.DeptCode = NULL
      WHERE
        /* %JoinFKPK(Student,:%Old," = "," AND") */
        Student.FactCode = :old.FactCode AND
        Student.DeptCode = :old.DeptCode;

    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Dept R/3 Teacher on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Dept"
    CHILD_OWNER="", CHILD_TABLE="Teacher"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="R/3", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="DeptCode""FactCode" */
    UPDATE Teacher
      SET
        /* %SetFK(Teacher,NULL) */
        Teacher.FactCode = NULL,
        Teacher.DeptCode = NULL
      WHERE
        /* %JoinFKPK(Teacher,:%Old," = "," AND") */
        Teacher.FactCode = :old.FactCode AND
        Teacher.DeptCode = :old.DeptCode;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tU_Dept AFTER UPDATE ON Dept for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- UPDATE trigger on Dept 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Dept R/2 Student on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0003094e", PARENT_OWNER="", PARENT_TABLE="Dept"
    CHILD_OWNER="", CHILD_TABLE="Student"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="DeptCode""FactCode" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.FactCode <> :new.FactCode OR 
    :old.DeptCode <> :new.DeptCode
  THEN
    UPDATE Student
      SET
        /* %SetFK(Student,NULL) */
        Student.FactCode = NULL,
        Student.DeptCode = NULL
      WHERE
        /* %JoinFKPK(Student,:%Old," = ",",") */
        Student.FactCode = :old.FactCode AND
        Student.DeptCode = :old.DeptCode;
  END IF;

  /* Dept R/3 Teacher on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Dept"
    CHILD_OWNER="", CHILD_TABLE="Teacher"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="R/3", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="DeptCode""FactCode" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.FactCode <> :new.FactCode OR 
    :old.DeptCode <> :new.DeptCode
  THEN
    UPDATE Teacher
      SET
        /* %SetFK(Teacher,NULL) */
        Teacher.FactCode = NULL,
        Teacher.DeptCode = NULL
      WHERE
        /* %JoinFKPK(Teacher,:%Old," = ",",") */
        Teacher.FactCode = :old.FactCode AND
        Teacher.DeptCode = :old.DeptCode;
  END IF;

  /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
  /* Faculty R/1 Dept on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Faculty"
    CHILD_OWNER="", CHILD_TABLE="Dept"
    P2C_VERB_PHRASE="R/1", C2P_VERB_PHRASE="R/1", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="FactCode" */
  SELECT count(*) INTO NUMROWS
    FROM Faculty
    WHERE
      /* %JoinFKPK(:%New,Faculty," = "," AND") */
      :new.FactCode = Faculty.FactCode;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Dept because Faculty does not exist.'
    );
  END IF;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tD_Faculty AFTER DELETE ON Faculty for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- DELETE trigger on Faculty 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Faculty R/1 Dept on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000d432", PARENT_OWNER="", PARENT_TABLE="Faculty"
    CHILD_OWNER="", CHILD_TABLE="Dept"
    P2C_VERB_PHRASE="R/1", C2P_VERB_PHRASE="R/1", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="FactCode" */
    SELECT count(*) INTO NUMROWS
      FROM Dept
      WHERE
        /*  %JoinFKPK(Dept,:%Old," = "," AND") */
        Dept.FactCode = :old.FactCode;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Faculty because Dept exists.'
      );
    END IF;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tU_Faculty AFTER UPDATE ON Faculty for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- UPDATE trigger on Faculty 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
  /* Faculty R/1 Dept on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000febf", PARENT_OWNER="", PARENT_TABLE="Faculty"
    CHILD_OWNER="", CHILD_TABLE="Dept"
    P2C_VERB_PHRASE="R/1", C2P_VERB_PHRASE="R/1", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="FactCode" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.FactCode <> :new.FactCode
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Dept
      WHERE
        /*  %JoinFKPK(Dept,:%Old," = "," AND") */
        Dept.FactCode = :old.FactCode;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Faculty because Dept exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tI_Registration BEFORE INSERT ON Registration for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- INSERT trigger on Registration 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Student R/5 Registration on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f555", PARENT_OWNER="", PARENT_TABLE="Student"
    CHILD_OWNER="", CHILD_TABLE="Registration"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="R/5", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="SID" */
    SELECT count(*) INTO NUMROWS
      FROM Student
      WHERE
        /* %JoinFKPK(:%New,Student," = "," AND") */
        :new.SID = Student.SID;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Registration because Student does not exist.'
      );
    END IF;

    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Subject R/6 Registration on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Subject"
    CHILD_OWNER="", CHILD_TABLE="Registration"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="SubjCode" */
    SELECT count(*) INTO NUMROWS
      FROM Subject
      WHERE
        /* %JoinFKPK(:%New,Subject," = "," AND") */
        :new.SubjCode = Subject.SubjCode;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Registration because Subject does not exist.'
      );
    END IF;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tU_Registration AFTER UPDATE ON Registration for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- UPDATE trigger on Registration 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
  /* Student R/5 Registration on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f6f6", PARENT_OWNER="", PARENT_TABLE="Student"
    CHILD_OWNER="", CHILD_TABLE="Registration"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="R/5", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="SID" */
  SELECT count(*) INTO NUMROWS
    FROM Student
    WHERE
      /* %JoinFKPK(:%New,Student," = "," AND") */
      :new.SID = Student.SID;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Registration because Student does not exist.'
    );
  END IF;

  /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
  /* Subject R/6 Registration on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Subject"
    CHILD_OWNER="", CHILD_TABLE="Registration"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="SubjCode" */
  SELECT count(*) INTO NUMROWS
    FROM Subject
    WHERE
      /* %JoinFKPK(:%New,Subject," = "," AND") */
      :new.SubjCode = Subject.SubjCode;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Registration because Subject does not exist.'
    );
  END IF;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tI_Student BEFORE INSERT ON Student for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- INSERT trigger on Student 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Dept R/2 Student on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00010343", PARENT_OWNER="", PARENT_TABLE="Dept"
    CHILD_OWNER="", CHILD_TABLE="Student"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="DeptCode""FactCode" */
    UPDATE Student
      SET
        /* %SetFK(Student,NULL) */
        Student.FactCode = NULL,
        Student.DeptCode = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Dept
            WHERE
              /* %JoinFKPK(:%New,Dept," = "," AND") */
              :new.FactCode = Dept.FactCode AND
              :new.DeptCode = Dept.DeptCode
        ) 
        /* %JoinPKPK(Student,:%New," = "," AND") */
         and Student.SID = :new.SID;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tD_Student AFTER DELETE ON Student for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- DELETE trigger on Student 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Student R/5 Registration on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000dc90", PARENT_OWNER="", PARENT_TABLE="Student"
    CHILD_OWNER="", CHILD_TABLE="Registration"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="R/5", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="SID" */
    SELECT count(*) INTO NUMROWS
      FROM Registration
      WHERE
        /*  %JoinFKPK(Registration,:%Old," = "," AND") */
        Registration.SID = :old.SID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Student because Registration exists.'
      );
    END IF;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tU_Student AFTER UPDATE ON Student for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- UPDATE trigger on Student 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
  /* Student R/5 Registration on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00021c45", PARENT_OWNER="", PARENT_TABLE="Student"
    CHILD_OWNER="", CHILD_TABLE="Registration"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="R/5", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="SID" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.SID <> :new.SID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Registration
      WHERE
        /*  %JoinFKPK(Registration,:%Old," = "," AND") */
        Registration.SID = :old.SID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Student because Registration exists.'
      );
    END IF;
  END IF;

    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Dept R/2 Student on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Dept"
    CHILD_OWNER="", CHILD_TABLE="Student"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="DeptCode""FactCode" */
    UPDATE Student
      SET
        /* %SetFK(Student,NULL) */
        Student.FactCode = NULL,
        Student.DeptCode = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Dept
            WHERE
              /* %JoinFKPK(:%New,Dept," = "," AND") */
              :new.FactCode = Dept.FactCode AND
              :new.DeptCode = Dept.DeptCode
        ) 
        /* %JoinPKPK(Student,:%New," = "," AND") */
         and Student.SID = :new.SID;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tD_Subject AFTER DELETE ON Subject for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- DELETE trigger on Subject 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Subject R/6 Registration on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000ee0a", PARENT_OWNER="", PARENT_TABLE="Subject"
    CHILD_OWNER="", CHILD_TABLE="Registration"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="SubjCode" */
    SELECT count(*) INTO NUMROWS
      FROM Registration
      WHERE
        /*  %JoinFKPK(Registration,:%Old," = "," AND") */
        Registration.SubjCode = :old.SubjCode;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Subject because Registration exists.'
      );
    END IF;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tU_Subject AFTER UPDATE ON Subject for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- UPDATE trigger on Subject 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
  /* Subject R/6 Registration on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00010ba8", PARENT_OWNER="", PARENT_TABLE="Subject"
    CHILD_OWNER="", CHILD_TABLE="Registration"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="SubjCode" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.SubjCode <> :new.SubjCode
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Registration
      WHERE
        /*  %JoinFKPK(Registration,:%Old," = "," AND") */
        Registration.SubjCode = :old.SubjCode;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Subject because Registration exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tI_Teacher BEFORE INSERT ON Teacher for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- INSERT trigger on Teacher 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Dept R/3 Teacher on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="000107cc", PARENT_OWNER="", PARENT_TABLE="Dept"
    CHILD_OWNER="", CHILD_TABLE="Teacher"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="R/3", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="DeptCode""FactCode" */
    UPDATE Teacher
      SET
        /* %SetFK(Teacher,NULL) */
        Teacher.FactCode = NULL,
        Teacher.DeptCode = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Dept
            WHERE
              /* %JoinFKPK(:%New,Dept," = "," AND") */
              :new.FactCode = Dept.FactCode AND
              :new.DeptCode = Dept.DeptCode
        ) 
        /* %JoinPKPK(Teacher,:%New," = "," AND") */
         and Teacher.Tcode = :new.Tcode;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

CREATE  TRIGGER tU_Teacher AFTER UPDATE ON Teacher for each row
-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
-- UPDATE trigger on Teacher 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12 */
    /* Dept R/3 Teacher on child update set null */
    /* ERWIN_RELATION:CHECKSUM="000107cc", PARENT_OWNER="", PARENT_TABLE="Dept"
    CHILD_OWNER="", CHILD_TABLE="Teacher"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="R/3", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="DeptCode""FactCode" */
    UPDATE Teacher
      SET
        /* %SetFK(Teacher,NULL) */
        Teacher.FactCode = NULL,
        Teacher.DeptCode = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Dept
            WHERE
              /* %JoinFKPK(:%New,Dept," = "," AND") */
              :new.FactCode = Dept.FactCode AND
              :new.DeptCode = Dept.DeptCode
        ) 
        /* %JoinPKPK(Teacher,:%New," = "," AND") */
         and Teacher.Tcode = :new.Tcode;


-- ERwin Builtin 25 Á¡ÃÒ¤Á 2565 15:04:12
END;
/

