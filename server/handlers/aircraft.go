package handlers

import (
	"packages/server/services"

	"github.com/gofiber/fiber/v2"
)

type AircraftHandler struct {
	AircraftService services.AircraftService
}

func NewAircraftHandler() AircraftHandler {
	return AircraftHandler{
		AircraftService: services.NewAircraftService(),
	}
}

func (h AircraftHandler) GetAircrafts(c *fiber.Ctx) error {
	data := h.AircraftService.GetAircrafts()

	return c.JSON(data)
}
