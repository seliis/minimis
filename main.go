package main

import (
	"packages/server/handlers"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
)

type Node struct {
	Aircraft handlers.AircraftHandler
}

var node Node

func init() {
	node = Node{
		Aircraft: handlers.NewAircraftHandler(),
	}
}

func main() {
	app := fiber.New()

	app.Use(cors.New(cors.Config{
		AllowOrigins: "*",
	}))

	setRoutes(app.Group("/api"))

	app.Listen(":8080")
}

func setRoutes(api fiber.Router) {
	api.Route("/aircrafts", func(method fiber.Router) {
		method.Get("/", node.Aircraft.GetAircrafts)
	})
}
