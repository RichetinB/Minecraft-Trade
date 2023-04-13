package main

import (
	"fmt"
	"html/template"
	"net/http"
)

const port = ":8080"

func main() {

	fs := http.FileServer(http.Dir("./static"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))

	http.HandleFunc("/", handler)
	fmt.Println("(http://localhost:8080/) - Server started on port", port)
	http.ListenAndServe("localhost"+port, nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	tmpl := template.Must(template.ParseFiles("index.html"))
	tmpl.Execute(w, nil)

}
