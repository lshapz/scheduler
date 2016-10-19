CREATE TABLE "employees" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar);
CREATE TABLE "shifts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "designation" varchar);
CREATE TABLE "weeks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar);
CREATE TABLE "employee_shifts_no_good" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    "employee_id" integer, "shift_id" integer);
CREATE TABLE "employee_shifts_assigned" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "employee_id" integer, "shift_id" integer);
