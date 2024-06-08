package services

import (
	"packages/server/entities"
	"packages/server/repositories"
)

type AircraftService struct {
	AircraftRepository repositories.AircraftRepository
}

func NewAircraftService() AircraftService {
	return AircraftService{
		AircraftRepository: repositories.NewAircraftRepository(),
	}
}

func (s AircraftService) GetAircrafts() []entities.Aircraft {
	return s.AircraftRepository.GetAircrafts()
}
