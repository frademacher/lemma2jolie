///@beginCtx(BookingManagement)
///@aggregate
///@entity
type ParkingSpaceBooking {
    ///@identifier
    bookingID: long
    ///@part
    parkingSpace: ParkingSpace
    ///@part
    driver: Driver
    ///@part
    timeSlot: TimeSlot
    priceInEuro: double
}
type priceInDollars_type {
    self?: ParkingSpaceBooking
}
interface ParkingSpaceBooking_interface {
    RequestResponse:
        priceInDollars(priceInDollars_type)(double)
}

///@entity
type ParkingSpace {
    ///@identifier
    id: long
    ownerId: long
    name: string
    description: string
    location: Location
    parkingSpaceCount: int
    availability: TimeSlots
    priceInEuroPerHour: double
    priceInEuroPerKwh: double
    chargerSpeed: ChargerSpeed
    plugType: string
    activated: bool
    blocked: bool
    offered: bool
    createdDate: string
    lastModifiedDate: string
}

///@valueObject
type Location {
    latitude: double
    longitude: double
}

type TimeSlots {
    s*: TimeSlot
}

type ChargerSpeed {
    literal: string(enum(["FAST", "NORMAL"]))
}

///@entity
type Driver {
    ///@identifier
    id: string
}

///@valueObject
type TimeSlot {
    start: string
    end: string
}

///@factory
type create_type {
    d: Driver
    p: ParkingSpace
    t: TimeSlot
    priceInEuro: double
}
interface ParkingSpaceBookingFactory_interface {
    RequestResponse:
        create(create_type)(ParkingSpaceBooking)
}

///@specification
type isExpired_type {
    b: ParkingSpaceBooking
}
interface BookingExpiration_interface {
    RequestResponse:
        ///@validator
        isExpired(isExpired_type)(bool)
}

///@valueObject
type ParkingSpaceBookingVO {
    driver: string
    parkingSpace: long
    timeSlot: TimeSlot
    priceInEuro: double
}
///@endCtx
