CREATE TABLE Sessions(
   Id_Sessions INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(255),
   start_date DATETIME,
   end_date DATETIME,
   UNIQUE(name)
);

CREATE TABLE Courses(
   Id_Courses INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(255),
);

CREATE TABLE UserRoles(
   Id_UserRoles INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(50),
   UNIQUE(name)
);

CREATE TABLE EvaluationsTypes(
   Id_EvaluationsTypes INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(50),
   UNIQUE(name)
);

CREATE TABLE Users(
   Id_Users INT PRIMARY KEY AUTO_INCREMENT,
   email VARCHAR(255),
   pword VARCHAR(255),
   Id_UserRoles INT NOT NULL,
   UNIQUE(email),
   FOREIGN KEY(Id_UserRoles) REFERENCES UserRoles(Id_UserRoles)
);

CREATE TABLE Evaluations(
   Id_Evaluations INT PRIMARY KEY AUTO_INCREMENT,
   Id_Users INT NOT NULL,
   Id_EvaluationsTypes INT NOT NULL,
   FOREIGN KEY(Id_Users) REFERENCES Users(Id_Users),
   FOREIGN KEY(Id_EvaluationsTypes) REFERENCES EvaluationsTypes(Id_EvaluationsTypes)
);

CREATE TABLE Grades(
   Id_Grades INT PRIMARY KEY AUTO_INCREMENT,
   grade DECIMAL(3,1),
   Id_Users INT NOT NULL,
   Id_Evaluations INT NOT NULL,
   FOREIGN KEY(Id_Users) REFERENCES Users(Id_Users),
   FOREIGN KEY(Id_Evaluations) REFERENCES Evaluations(Id_Evaluations)
);

CREATE TABLE Sessions_Courses(
   Id_Sessions INT,
   Id_Courses INT,
   PRIMARY KEY(Id_Sessions, Id_Courses),
   FOREIGN KEY(Id_Sessions) REFERENCES Sessions(Id_Sessions),
   FOREIGN KEY(Id_Courses) REFERENCES Courses(Id_Courses)
);

CREATE TABLE Students_Sessions(
   Id_Users INT,
   Id_Sessions INT,
   PRIMARY KEY(Id_Users, Id_Sessions),
   FOREIGN KEY(Id_Users) REFERENCES Users(Id_Users),
   FOREIGN KEY(Id_Sessions) REFERENCES Sessions(Id_Sessions)
);
