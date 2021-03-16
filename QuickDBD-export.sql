﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" int  NOT NULL ,
    "dept_name" varchar  NOT NULL ,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
    )
)

GO

CREATE TABLE "Employees" (
    "emp_no" init  NOT NULL ,
    "birth_date" date  NOT NULL ,
    "first_name" varchar  NOT NULL ,
    "last_name" varchar  NOT NULL ,
    "hire_date" date  NOT NULL ,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
    )
)

GO

CREATE TABLE "Managers" (
    "dept_no" varchar  NOT NULL ,
    "emp_no" int  NOT NULL ,
    "from_date" date  NOT NULL ,
    "to_date" date  NOT NULL ,
    CONSTRAINT "pk_Managers" PRIMARY KEY (
        "dept_no"
    )
)

GO

CREATE TABLE "Dep_Emp" (
    "emp_no" int  NOT NULL ,
    "dept_no" int  NOT NULL ,
    "from_date" date  NOT NULL ,
    "to_date" date  NOT NULL ,
    CONSTRAINT "pk_Dep_Emp" PRIMARY KEY (
        "emp_no"
    )
)

GO

CREATE TABLE "Salaries" (
    "emp_no" int  NOT NULL ,
    "salary" int  NOT NULL ,
    "from_date" date  NOT NULL ,
    "to_date" date  NOT NULL ,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
    )
)

GO

CREATE TABLE "Titles" (
    "emp_no" int  NOT NULL ,
    "title" int  NOT NULL ,
    "from_date" date  NOT NULL ,
    "to_date" date  NOT NULL ,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "emp_no"
    )
)

GO

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no")
GO

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

ALTER TABLE "Dep_Emp" ADD CONSTRAINT "fk_Dep_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

ALTER TABLE "Dep_Emp" ADD CONSTRAINT "fk_Dep_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no")
GO

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

