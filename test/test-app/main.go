package main

import (
	"fmt"
	"log"
	"net/http"

	"rsc.io/quote"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, quote.Hello())
}

func main() {
	log.Println("Starting webserver")
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
