-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public."Departments"
(
    department_id integer NOT NULL,
    department_name character varying(80),
    PRIMARY KEY (department_id)
);

CREATE TABLE public."Employers"
(
    "userId" integer NOT NULL,
    "CompanyName" character varying(120),
    "WebSite" character varying(120),
    phone character varying(20),
    website_email character varying(40),
    password character varying(100),
    PRIMARY KEY ("userId")
);

CREATE TABLE public."JobSeekers"
(
    job_seeker_id integer NOT NULL,
    job_seeker_name character varying(50),
    jon_seeker_lastname character varying(50),
    job_seeker_tckno character varying(11),
    job_seeker_birthdate date,
    PRIMARY KEY (job_seeker_id)
);

CREATE TABLE public."SystemPersonal"
(
    personal_id integer NOT NULL,
    personel_name character varying(50),
    personel_surname character varying(50),
    personel_email character varying(40),
    personel_department character varying(90),
    PRIMARY KEY (personal_id)
);

CREATE TABLE public."Users"
(
    "Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "User_Id" integer NOT NULL,
    "FirstName" character varying(50),
    "LastName" character varying(50),
    "NationalityId" character(11),
    "DateOfBirth" date
);

ALTER TABLE public."Users"
    ADD FOREIGN KEY ("Id")
    REFERENCES public."JobSeekers" (job_seeker_id)
    NOT VALID;


ALTER TABLE public."Employers"
    ADD FOREIGN KEY ("userId")
    REFERENCES public."SystemPersonal" (personal_id)
    NOT VALID;

END;