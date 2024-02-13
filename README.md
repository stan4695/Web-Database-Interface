# Introduction
This repository contains the source code and necessary files for a university project focused on creating a web database interface. The project utilizes JSP (JavaServer Pages) technology for server-side scripting, MySQL for database management, and CSS for styling the webpages.

# Prerequisites

- ✅ [Apache Tomcat 10.0](https://tomcat.apache.org/download-10.cgi)
- ✅ [MySQL Connector](https://dev.mysql.com/downloads/connector/j/)
- ✅ [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)

# Project Structure

Inside the project folder, you will find the following files and folders:

```
├── build/classes/db
│   └── JavaBean.class
├── src/main/
│   ├── java/db/
|   |   └── JavaBean.java  
│   └── webapp
└── README.md
```

The `java/db` directory contains the `JavaBean.java` file which provide methods for CRUD operations (create, read, update, and delete).
The `webapp` directory contains all the JSP files running on the Tomcat server, alongside with their stylings.


![WebDatabaseApp_JSP_Implementation](https://github.com/stan4695/Web-Database-Interface/assets/101892959/3b176f4a-3ea0-4d9e-85ce-085164014815)

# Getting Started:

1. Clone the repository:
   
```
git clone https://github.com/stan4695/Web-Database-Interface
```

2. Install dependencies.
3. Configure connection details: Update database credentials in the `connect()` method inside of `JavaBean.java` file.

# Additional Notes:
[JSP Documentatie.pdf](https://github.com/stan4695/Web-Database-Interface/files/14269450/JSP.Documentatie.pdf)

