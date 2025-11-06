"StandardRide - Derived class with basic fare calculation
Demonstrates inheritance and polymorphism"

Ride subclass: #StandardRide
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!StandardRide class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
rideID: anID pickup: pickup dropoff: dropoff distance: dist
    "Create a new StandardRide instance"
    | ride |
    ride := self new.
    ride initializeWithID: anID pickup: pickup dropoff: dropoff distance: dist.
    Transcript show: '[LOG] StandardRide created'; cr.
    ^ride
! !

!StandardRide methodsFor: 'calculating' stamp: 'RideSystem 11/5/2025'!
fare
    "Override fare calculation for standard rides
    Demonstrates polymorphism"
    ^self class baseRate * distance
! !

!StandardRide methodsFor: 'displaying' stamp: 'RideSystem 11/5/2025'!
rideDetails
    "Override ride details to show ride type"
    Transcript show: 'Type: Standard Ride'; cr.
    super rideDetails.
! !


"PremiumRide - Derived class with premium fare calculation
Demonstrates inheritance and polymorphism"

Ride subclass: #PremiumRide
    instanceVariableNames: ''
    classVariableNames: 'PremiumMultiplier'
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!PremiumRide class methodsFor: 'class initialization' stamp: 'RideSystem 11/5/2025'!
initialize
    "Initialize class variables"
    super initialize.
    PremiumMultiplier := 1.8.
! !

!PremiumRide class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
rideID: anID pickup: pickup dropoff: dropoff distance: dist
    "Create a new PremiumRide instance"
    | ride |
    ride := self new.
    ride initializeWithID: anID pickup: pickup dropoff: dropoff distance: dist.
    Transcript show: '[LOG] PremiumRide created'; cr.
    ^ride
! !

!PremiumRide class methodsFor: 'constants' stamp: 'RideSystem 11/5/2025'!
premiumMultiplier
    "Return the premium multiplier"
    ^PremiumMultiplier
! !

!PremiumRide methodsFor: 'calculating' stamp: 'RideSystem 11/5/2025'!
fare
    "Override fare calculation for premium rides
    Demonstrates polymorphism"
    ^self class baseRate * distance * self class premiumMultiplier
! !

!PremiumRide methodsFor: 'displaying' stamp: 'RideSystem 11/5/2025'!
rideDetails
    "Override ride details to show ride type"
    Transcript show: 'Type: Premium Ride (Luxury vehicle, complimentary refreshments)'; cr.
    super rideDetails.
! !


"EconomyRide - Additional ride type for extra functionality
Demonstrates extensibility of the system"

Ride subclass: #EconomyRide
    instanceVariableNames: ''
    classVariableNames: 'EconomyDiscount'
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!EconomyRide class methodsFor: 'class initialization' stamp: 'RideSystem 11/5/2025'!
initialize
    "Initialize class variables"
    super initialize.
    EconomyDiscount := 0.7.
! !

!EconomyRide class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
rideID: anID pickup: pickup dropoff: dropoff distance: dist
    "Create a new EconomyRide instance"
    | ride |
    ride := self new.
    ride initializeWithID: anID pickup: pickup dropoff: dropoff distance: dist.
    Transcript show: '[LOG] EconomyRide created'; cr.
    ^ride
! !

!EconomyRide class methodsFor: 'constants' stamp: 'RideSystem 11/5/2025'!
economyDiscount
    "Return the economy discount factor"
    ^EconomyDiscount
! !

!EconomyRide methodsFor: 'calculating' stamp: 'RideSystem 11/5/2025'!
fare
    "Override fare calculation for economy rides
    Demonstrates polymorphism"
    ^self class baseRate * distance * self class economyDiscount
! !

!EconomyRide methodsFor: 'displaying' stamp: 'RideSystem 11/5/2025'!
rideDetails
    "Override ride details to show ride type"
    Transcript show: 'Type: Economy Ride (Budget-friendly option)'; cr.
    super rideDetails.
! !
