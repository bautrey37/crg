package main

import (
	"database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
)

type Booking struct {
	BookingId int
	DistributorId int
	Name string
	Location string
}

// BookingCol returns a reference for a column of a Vehicle
func BookingCol(colname string, bk *Booking) interface{} {
	switch colname {
	case "booking_id":
		return &bk.BookingId
	case "distributor_id":
		return &bk.DistributorId
	case "booking_name":
		return &bk.Name
	case "location":
		return &bk.Location
	default:
		panic("unknown column " + colname)
	}
}

func panicOnErr(err error) {
	if err != nil {
		panic(err.Error())
	}
}

func RetrieveBookings(distributorName string) {
	db, err := sql.Open("mysql", "admin:admin@tcp(127.0.0.1:3306)/")
	panicOnErr(err)
	defer db.Close()

	_,err = db.Exec("USE CAR_RENTAL_GATEWAY")
	panicOnErr(err)

	var rows *sql.Rows
	if distributorName == "Ryanair" {
		rows, err = db.Query("select * from RyanairBooking")
		panicOnErr(err)
		defer db.Close()
	}
	if distributorName == "Expedia" {
		rows, err = db.Query("select * from ExpediaBooking")
		panicOnErr(err)
		defer db.Close()
	}

	// get the column names from the query
	var columns []string
	columns, err = rows.Columns()
	panicOnErr(err)

	colNum := len(columns)

	for rows.Next() {
		bk := Booking{}
		// make references for the cols with the aid of BookingCol
		cols := make([]interface{}, colNum)
		for i := 0; i < colNum; i++ {
			cols[i] = BookingCol(columns[i], &bk)
		}

		err = rows.Scan(cols...)
		panicOnErr(err)
		fmt.Printf(" - Booking Name: %v, Location: %v\n", bk.Name, bk.Location)

	}
	err = rows.Err()
	panicOnErr(err)
}

