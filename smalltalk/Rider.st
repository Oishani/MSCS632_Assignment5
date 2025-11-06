"Rider class representing a passenger in the ride sharing system
Demonstrates encapsulation with private instance variables"

Object subclass: #Rider
    instanceVariableNames: 'riderID name paymentMethod requestedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!Rider class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
riderID: anID name: aName paymentMethod: aPayment
    "Create a new rider instance"
    | rider |
    rider := self new.
    rider initializeWithID: anID name: aName paymentMethod: aPayment.
    ^rider
! !

!Rider class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
riderID: anID name: aName
    "Create a new rider instance with default payment method"
    ^self riderID: anID name: aName paymentMethod: 'Credit Card'
! !

!Rider methodsFor: 'initialization' stamp: 'RideSystem 11/5/2025'!
initializeWithID: anID name: aName paymentMethod: aPayment
    "Initialize instance variables - demonstrates encapsulation"
    riderID := anID.
    name := aName.
    paymentMethod := aPayment.
    requestedRides := OrderedCollection new.
    Transcript show: '[LOG] Created rider: ', name, ' (ID: ', riderID printString, ')'; cr.
! !

!Rider methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
riderID
    "Getter method for riderID - encapsulation in action"
    ^riderID
! !

!Rider methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
name
    "Getter method for name"
    ^name
! !

!Rider methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
paymentMethod
    "Getter method for payment method"
    ^paymentMethod
! !

!Rider methodsFor: 'accessing' stamp: 'RideSystem 11/5/2025'!
rideCount
    "Get number of requested rides"
    ^requestedRides size
! !

!Rider methodsFor: 'ride management' stamp: 'RideSystem 11/5/2025'!
requestRide: aRide
    "Request a ride and add it to the rider's history
    Controlled access to private data"
    aRide ifNotNil: [
        requestedRides add: aRide.
        Transcript show: '[LOG] Rider ', name, ' requested ride ID: ', aRide rideID printString; cr.
    ]
! !

!Rider methodsFor: 'calculating' stamp: 'RideSystem 11/5/2025'!
totalSpending
    "Calculate total spending on rides"
    | total |
    total := 0.
    requestedRides do: [:ride |
        total := total + ride fare
    ].
    ^total
! !

!Rider methodsFor: 'updating' stamp: 'RideSystem 11/5/2025'!
setPaymentMethod: newPayment
    "Update payment method"
    paymentMethod := newPayment.
    Transcript show: '[LOG] Payment method updated to: ', paymentMethod; cr.
! !

!Rider methodsFor: 'displaying' stamp: 'RideSystem 11/5/2025'!
getRiderInfo
    "Get rider information summary"
    Transcript cr.
    Transcript show: '=== Rider Information ==='; cr.
    Transcript show: 'Rider ID: ', riderID printString; cr.
    Transcript show: 'Name: ', name; cr.
    Transcript show: 'Payment Method: ', paymentMethod; cr.
    Transcript show: 'Total Rides: ', requestedRides size printString; cr.
    Transcript show: 'Total Spending: $', self totalSpending printString; cr.
! !

!Rider methodsFor: 'displaying' stamp: 'RideSystem 11/5/2025'!
viewRides
    "Display all rides requested by this rider"
    | index |
    Transcript cr.
    Transcript show: '=== Ride History for ', name, ' ==='; cr.
    
    requestedRides isEmpty ifTrue: [
        Transcript show: 'No rides requested yet.'; cr.
        ^self
    ].
    
    index := 1.
    requestedRides do: [:ride |
        Transcript cr.
        Transcript show: '--- Ride ', index printString, ' ---'; cr.
        ride rideDetails.
        index := index + 1.
    ].
    
    Transcript cr.
    Transcript show: 'Total Spending: $', self totalSpending printString; cr.
! !
