"Base Ride class representing a ride in the ride sharing system
Demonstrates encapsulation with private instance variables and public methods"

Object subclass: #Ride
    instanceVariableNames: 'rideID pickupLocation dropoffLocation distance'
    classVariableNames: 'BaseRate'
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!Ride class methodsFor: 'class initialization' stamp: 'RideSystem 11/5/2025'!
initialize
    "Initialize class variables"
    BaseRate := 2.5.
! !

!Ride class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
rideID: anID pickup: pickup dropoff: dropoff distance: dist
    "Create a new ride instance"
    | ride |
    ride := self new.
    ride initializeWithID: anID pickup: pickup dropoff: dropoff distance: dist.
    ^ride
! !

!Ride methodsFor: 'initialization' stamp: 'RideSystem 11/5/2025'!
initializeWithID: anID pickup: pickup dropoff: dropoff distance: dist
    "Initialize instance variables - demonstrates encapsulation"
    rideID := anID.
    pickupLocation := pickup.
    dropoffLocation := dropoff.
    distance := dist.
    Transcript show: '[LOG] Created ride with ID: ', rideID printString; cr.
! !

!Ride methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
rideID
    "Getter method for rideID - encapsulation in action"
    ^rideID
! !

!Ride methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
pickupLocation
    "Getter method for pickup location"
    ^pickupLocation
! !

!Ride methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
dropoffLocation
    "Getter method for dropoff location"
    ^dropoffLocation
! !

!Ride methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
distance
    "Getter method for distance"
    ^distance
! !

!Ride methodsFor: 'calculating' stamp: 'RideSystem 11/5/2025'!
fare
    "Abstract method for fare calculation - to be overridden by subclasses
    Demonstrates polymorphism"
    self subclassResponsibility
! !

!Ride methodsFor: 'displaying' stamp: 'RideSystem 11/5/2025'!
rideDetails
    "Display ride information"
    Transcript show: '=== Ride Details ==='; cr.
    Transcript show: 'Ride ID: ', rideID printString; cr.
    Transcript show: 'From: ', pickupLocation; cr.
    Transcript show: 'To: ', dropoffLocation; cr.
    Transcript show: 'Distance: ', distance printString, ' miles'; cr.
    Transcript show: 'Fare: $', self fare printString; cr.
! !

!Ride class methodsFor: 'constants' stamp: 'RideSystem 11/5/2025'!
baseRate
    "Return the base rate for fare calculation"
    ^BaseRate
! !
