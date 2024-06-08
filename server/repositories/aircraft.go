package repositories

import "packages/server/entities"

type AircraftRepository struct{}

func NewAircraftRepository() AircraftRepository {
	return AircraftRepository{}
}

func (r AircraftRepository) GetAircrafts() []entities.Aircraft {
	return []entities.Aircraft{
		{
			Registration: "HL8384",
		},
	}
}
