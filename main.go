package main

import (
	"fmt"
)

func main() {
	fmt.Println("Hello Car Rental Gateway")

	fmt.Println("Ryanair Bookings:")
	RetrieveBookings("Ryanair")
	fmt.Println("Expedia Bookings:")
	RetrieveBookings("Expedia")

}
