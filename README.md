# Proof of Concept Application

Using Go and MySQL

### MySQL
Create a user `admin:admin` with DBA privileges
 - Run createDB SQL script: `mysql -u admin -p < createDB.sql`
 - Input password of `admin`
 


### Building and Running:
 - `go get github.com/go-sql-driver/mysql`
 - `go build`
 - `go install crg`
 - `crg`