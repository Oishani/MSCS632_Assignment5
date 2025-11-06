"RideSharingSystem - Main system class that manages the entire operation
Demonstrates composition and system-level functionality"

Object subclass: #RideSharingSystem
    instanceVariableNames: 'allRides drivers riders nextRideID nextDriverID nextRiderID'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!RideSharingSystem class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
new
    "Create a new ride sharing system"
    | system |
    system := super new.
    system initialize.
    ^system
! !

!RideSharingSystem methodsFor: 'initialization' stamp: 'RideSystem 11/5/2025'!
initialize
    "Initialize the system"
    allRides := OrderedCollection new.
    drivers := OrderedCollection new.
    riders := OrderedCollection new.
    nextRideID := 1.
    nextDriverID := 1.
    nextRiderID := 1.
    Transcript show: '[LOG] Ride Sharing System initialized'; cr.
! !

!RideSharingSystem methodsFor: 'driver management' stamp: 'RideSystem 11/5/2025'!
addDriver: aName rating: aRating
    "Create and add a new driver to the system"
    | driver |
    driver := Driver driverID: nextDriverID name: aName rating: aRating.
    drivers add: driver.
    nextDriverID := nextDriverID + 1.
    ^driver
! !

!RideSharingSystem methodsFor: 'driver management' stamp: 'RideSystem 11/5/2025'!
addDriver: aName
    "Create and add a new driver with default rating"
    ^self addDriver: aName rating: 5.0
! !

!RideSharingSystem methodsFor: 'rider management' stamp: 'RideSystem 11/5/2025'!
addRider: aName paymentMethod: aPayment
    "Create and add a new rider to the system"
    | rider |
    rider := Rider riderID: nextRiderID name: aName paymentMethod: aPayment.
    riders add: rider.
    nextRiderID := nextRiderID + 1.
    ^rider
! !

!RideSharingSystem methodsFor: 'rider management' stamp: 'RideSystem 11/5/2025'!
addRider: aName
    "Create and add a new rider with default payment method"
    ^self addRider: aName paymentMethod: 'Credit Card'
! !

!RideSharingSystem methodsFor: 'ride management' stamp: 'RideSystem 11/5/2025'!
createRide: rideType pickup: pickup dropoff: dropoff distance: distance driver: aDriver rider: aRider
    "Create a ride and assign it to a driver and rider
    Factory pattern implementation for creating different ride types"
    | ride |
    
    rideType = 'standard' ifTrue: [
        ride := StandardRide rideID: nextRideID pickup: pickup dropoff: dropoff distance: distance
    ].
    rideType = 'premium' ifTrue: [
        ride := PremiumRide rideID: nextRideID pickup: pickup dropoff: dropoff distance: distance
    ].
    rideType = 'economy' ifTrue: [
        ride := EconomyRide rideID: nextRideID pickup: pickup dropoff: dropoff distance: distance
    ].
    
    ride ifNil: [
        Transcript show: '[ERROR] Unknown ride type: ', rideType; cr.
        ^nil
    ].
    
    (ride notNil and: [aDriver notNil and: [aRider notNil]]) ifTrue: [
        allRides add: ride.
        aDriver addRide: ride.
        aRider requestRide: ride.
        nextRideID := nextRideID + 1.
        Transcript show: '[LOG] Ride created and assigned successfully!'; cr.
    ].
    
    ^ride
! !

!RideSharingSystem methodsFor: 'searching' stamp: 'RideSystem 11/5/2025'!
findDriver: driverID
    "Find driver by ID"
    drivers do: [:driver |
        driver driverID = driverID ifTrue: [^driver]
    ].
    ^nil
! !

!RideSharingSystem methodsFor: 'searching' stamp: 'RideSystem 11/5/2025'!
findRider: riderID
    "Find rider by ID"
    riders do: [:rider |
        rider riderID = riderID ifTrue: [^rider]
    ].
    ^nil
! !

!RideSharingSystem methodsFor: 'demonstration' stamp: 'RideSystem 11/5/2025'!
demonstratePolymorphism
    "Demonstrate polymorphism by processing all rides in the system"
    | totalRevenue |
    
    Transcript cr.
    Transcript show: '========================================'; cr.
    Transcript show: 'DEMONSTRATING POLYMORPHISM'; cr.
    Transcript show: '========================================'; cr.
    Transcript show: '[LOG] Processing all rides polymorphically...'; cr.
    
    allRides isEmpty ifTrue: [
        Transcript show: 'No rides in the system to demonstrate.'; cr.
        ^self
    ].
    
    totalRevenue := 0.
    
    "Polymorphic behavior: calling virtual methods on base class references"
    allRides do: [:ride |
        Transcript cr.
        Transcript show: '--- Processing Ride Polymorphically ---'; cr.
        "Call virtual methods - actual implementation depends on runtime type"
        ride rideDetails.
        totalRevenue := totalRevenue + ride fare.
        Transcript cr.
    ].
    
    Transcript show: '=== Polymorphism Demonstration Summary ==='; cr.
    Transcript show: 'Total rides processed: ', allRides size printString; cr.
    Transcript show: 'Total revenue: $', totalRevenue printString; cr.
    Transcript show: '[LOG] Polymorphism demonstration completed!'; cr.
! !

!RideSharingSystem methodsFor: 'displaying' stamp: 'RideSystem 11/5/2025'!
displaySystemStats
    "Display system statistics"
    | totalRevenue standardCount premiumCount economyCount |
    
    Transcript cr.
    Transcript show: '========================================'; cr.
    Transcript show: 'SYSTEM STATISTICS'; cr.
    Transcript show: '========================================'; cr.
    
    Transcript show: 'Total Drivers: ', drivers size printString; cr.
    Transcript show: 'Total Riders: ', riders size printString; cr.
    Transcript show: 'Total Rides: ', allRides size printString; cr.
    
    "Calculate total revenue"
    totalRevenue := 0.
    allRides do: [:ride |
        totalRevenue := totalRevenue + ride fare
    ].
    Transcript show: 'Total Revenue: $', totalRevenue printString; cr.
    
    "Show ride type distribution"
    standardCount := 0.
    premiumCount := 0.
    economyCount := 0.
    
    allRides do: [:ride |
        ride class = StandardRide ifTrue: [standardCount := standardCount + 1].
        ride class = PremiumRide ifTrue: [premiumCount := premiumCount + 1].
        ride class = EconomyRide ifTrue: [economyCount := economyCount + 1].
    ].
    
    Transcript cr.
    Transcript show: 'Ride Type Distribution:'; cr.
    Transcript show: '- Standard: ', standardCount printString; cr.
    Transcript show: '- Premium: ', premiumCount printString; cr.
    Transcript show: '- Economy: ', economyCount printString; cr.
! !
