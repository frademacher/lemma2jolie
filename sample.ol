///@beginCtx(ChargingStationManagement)
///@aggregate
///@entity
type ParkingArea {
    ///@identifier
    id: long
    ownerId: long
    name: string
    description: string
    ///@part
    location: Location
    parkingSpaceCount: int
    ///@part
    availability: TimePeriods
    pricePerHour: double
    pricePerKwh: double
    chargerSpeed: ChargerSpeed
    plugType: string
    activated: bool
    blocked: bool
    offered: bool
    createdDate: string
    lastModifiedDate: string
}
type toParkingAreaInformation_type {
    self? ParkingArea
}
interface ParkingArea_interface {
    RequestResponse:
        toParkingAreaInformation(toParkingAreaInformation_type)(ParkingAreaInformation)
}

///@valueObject
type Location {
    latitude: double
    longitude: double
}

///@valueObject
type TimePeriod {
    start: string
    end: string
}

type TimePeriods {
    p*: TimePeriod
}

type ChargerSpeed {
    literal: string(enum(["FAST", "NORMAL"]))
}

///@factory
type fromParkingAreaInformation_type {
    info: ParkingAreaInformation
    self? ParkingAreaFactory
}
interface ParkingAreaFactory_interface {
    RequestResponse:
        fromParkingAreaInformation(fromParkingAreaInformation_type)(ParkingArea)
}

///@repository
type ParkingAreaRepository {
    managedParkingAreas: ParkingAreas
}

type ParkingAreas {
    p*: ParkingArea
}

///@valueObject
type CreateParkingAreaCommand {
    info: ParkingAreaInformation
}

///@valueObject
type ParkingAreaInformation {
    ownerId: long
    name: string
    description: string
    location: Location
    parkingSpaceCount: int
    availability: TimePeriods
    pricePerHour: double
    pricePerKwh: double
    activated: bool
    blocked: bool
    offered: bool
    chargerSpeed: ChargerSpeed
    plugType: string
}

type ParkingAreaInformationList {
    i*: ParkingAreaInformation
}

///@domainEvent
///@valueObject
type ParkingAreaCreatedEvent {
    parkingAreaId: long
    info: ParkingAreaInformation
}

///@valueObject
type UpdateParkingAreaCommand {
    info: ParkingAreaInformation
}

///@domainEvent
///@valueObject
type ParkingAreaUpdatedEvent {
    parkingAreaId: long
    info: ParkingAreaInformation
}

///@domainEvent
///@valueObject
type ParkingAreaDeletedEvent {
    parkingAreaId: long
}
///@endCtx
