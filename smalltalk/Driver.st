"Driver class representing a driver in the ride sharing system
Demonstrates encapsulation with private instance variables and controlled access"

Object subclass: #Driver
    instanceVariableNames: 'driverID name rating assignedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!Driver class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
driverID: anID name: aName rating: aRating
    "Create a new driver instance"
    | driver |
    driver := self new.
    driver initializeWithID: anID name: aName rating: aRating.
    ^driver
! !

!Driver methodsFor: 'initialization' stamp: 'RideSystem 11/5/2025'!
initializeWithID: anID name: aName rating: aRating
    "Initialize instance variables - demonstrates encapsulation"
    driverID := anID.
    name := aName.
    rating := aRating.
    assignedRides := OrderedCollection new.
    Transcript show: '[LOG] Created driver: ', name, ' (ID: ', driverID printString, ')'; cr.
! !

!Driver methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
driverID
    "Getter method for driverID - encapsulation in action"
    ^driverID
! !

!Driver methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
name
    "Getter method for name"
    ^name
! !

!Driver methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
rating
    "Getter method for rating"
    ^rating
! !

!Driver methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
rideCount
    "Get number of assigned rides"
    ^assignedRides size
! !

!Driver methodsFor: 'ride management' stamp: 'RideSystem 11/5/2025'!
addRide: aRide
    "Add a ride to the driver's assigned rides list
    Demonstrates controlled access to private data"
    aRide ifNotNil: [
        assignedRides add: aRide.
        Transcript show: '[LOG] Driver ', name, ' assigned to ride ID: ', aRide rideID printString; cr.
    ]
! !

!Driver methodsFor: 'calculating' stamp: 'RideSystem 11/5/2025'!
totalEarnings
    "Calculate total earnings from all assigned rides"
    | total |
    total := 0.
    assignedRides do: [:ride |
        total := total + ride fare
    ].
    ^total
! !

!Driver methodsFor: 'updating' stamp: 'RideSystem 11/5/2025'!
updateRating: newRating
    "Update driver rating based on ride feedback"
    (newRating >= 1.0 and: [newRating <= 5.0]) ifTrue: [
        rating := (rating + newRating) / 2.0.
        Transcript show: '[LOG] Driver ', name, ' rating updated to ', rating printString; cr.
    ] ifFalse: [
        Transcript show: '[ERROR] Invalid rating. Must be between 1.0 and 5.0'; cr.
    ]
! !

!Driver methodsFor: 'displaying' stamp: 'RideSystem 11/5/2025'!
getDriverInfo
    "Display driver information including all assigned rides"
    Transcript cr.
    Transcript show: '=== Driver Information ==='; cr.
    Transcript show: 'Driver ID: ', driverID printString; cr.
    Transcript show: 'Name: ', name; cr.
    Transcript show: 'Rating: ', rating printString, '/5.0'; cr.
    Transcript show: 'Total Rides: ', assignedRides size printString; cr.
    Transcript show: 'Total Earnings: $', self totalEarnings printString; cr.
    
    assignedRides isEmpty ifFalse: [
        Transcript cr.
        Transcript show: '--- Assigned Rides ---'; cr.
        assignedRides do: [:ride |
            Transcript show: 'Ride ', ride rideID printString, ': ',
                        ride pickupLocation, ' → ', ride dropoffLocation,
                        ' ($', ride fare printString, ')'; cr.
        ]
    ]
! !
