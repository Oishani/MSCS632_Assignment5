"Basic test suite for the SmallTalk Ride Sharing System
Tests core functionality and OOP principles"

Object subclass: #RideSharingTestSuite
    instanceVariableNames: 'testsPassed testsFailed'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!RideSharingTestSuite class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
new
    "Create a new test suite"
    | suite |
    suite := super new.
    suite initialize.
    ^suite
! !

!RideSharingTestSuite methodsFor: 'initialization' stamp: 'RideSystem 11/5/2025'!
initialize
    "Initialize test counters"
    testsPassed := 0.
    testsFailed := 0.
! !

!RideSharingTestSuite methodsFor: 'utilities' stamp: 'RideSystem 11/5/2025'!
runTest: testName result: result
    "Run a test and record the result"
    Transcript show: 'Testing ', testName, '... '.
    result ifTrue: [
        Transcript show: 'PASSED'; cr.
        testsPassed := testsPassed + 1.
    ] ifFalse: [
        Transcript show: 'FAILED'; cr.
        testsFailed := testsFailed + 1.
    ]
! !

!RideSharingTestSuite methodsFor: 'testing' stamp: 'RideSystem 11/5/2025'!
testRideCreation
    "Test ride creation and fare calculation"
    | standardRide premiumRide economyRide |
    
    Transcript cr.
    Transcript show: '=== Testing Ride Creation ==='; cr.
    
    "Test StandardRide"
    standardRide := StandardRide rideID: 1 pickup: 'A' dropoff: 'B' distance: 10.0.
    self runTest: 'StandardRide creation' result: (standardRide notNil).
    self runTest: 'StandardRide fare calculation' result: (standardRide fare = 25.0).
    
    "Test PremiumRide"
    premiumRide := PremiumRide rideID: 2 pickup: 'C' dropoff: 'D' distance: 10.0.
    self runTest: 'PremiumRide creation' result: (premiumRide notNil).
    self runTest: 'PremiumRide fare calculation' result: (premiumRide fare = 45.0).
    
    "Test EconomyRide"
    economyRide := EconomyRide rideID: 3 pickup: 'E' dropoff: 'F' distance: 10.0.
    self runTest: 'EconomyRide creation' result: (economyRide notNil).
    self runTest: 'EconomyRide fare calculation' result: (economyRide fare = 17.5).
! !

!RideSharingTestSuite methodsFor: 'testing' stamp: 'RideSystem 11/5/2025'!
testDriverFunctionality
    "Test driver functionality"
    | driver ride |
    
    Transcript cr.
    Transcript show: '=== Testing Driver Functionality ==='; cr.
    
    driver := Driver driverID: 1 name: 'Test Driver' rating: 4.5.
    
    self runTest: 'Driver creation' result: (driver name = 'Test Driver').
    self runTest: 'Driver ID' result: (driver driverID = 1).
    self runTest: 'Driver rating' result: (driver rating = 4.5).
    self runTest: 'Initial ride count' result: (driver rideCount = 0).
    
    "Add a ride"
    ride := StandardRide rideID: 1 pickup: 'A' dropoff: 'B' distance: 5.0.
    driver addRide: ride.
    self runTest: 'Ride added to driver' result: (driver rideCount = 1).
    self runTest: 'Driver earnings' result: (driver totalEarnings = 12.5).
    
    "Update rating"
    driver updateRating: 5.0.
    self runTest: 'Rating update' result: (driver rating = 4.75).
! !

!RideSharingTestSuite methodsFor: 'testing' stamp: 'RideSystem 11/5/2025'!
testRiderFunctionality
    "Test rider functionality"
    | rider ride |
    
    Transcript cr.
    Transcript show: '=== Testing Rider Functionality ==='; cr.
    
    rider := Rider riderID: 1 name: 'Test Rider' paymentMethod: 'Credit Card'.
    
    self runTest: 'Rider creation' result: (rider name = 'Test Rider').
    self runTest: 'Rider ID' result: (rider riderID = 1).
    self runTest: 'Payment method' result: (rider paymentMethod = 'Credit Card').
    self runTest: 'Initial ride count' result: (rider rideCount = 0).
    
    "Request a ride"
    ride := PremiumRide rideID: 1 pickup: 'X' dropoff: 'Y' distance: 8.0.
    rider requestRide: ride.
    self runTest: 'Ride requested' result: (rider rideCount = 1).
    self runTest: 'Rider spending' result: (rider totalSpending = 36.0).
    
    "Update payment method"
    rider setPaymentMethod: 'PayPal'.
    self runTest: 'Payment method update' result: (rider paymentMethod = 'PayPal').
! !

!RideSharingTestSuite methodsFor: 'testing' stamp: 'RideSystem 11/5/2025'!
testPolymorphism
    "Test polymorphic behavior"
    | rides totalFare standardRide premiumRide economyRide |
    
    Transcript cr.
    Transcript show: '=== Testing Polymorphism ==='; cr.
    
    "Create a collection of different ride types"
    rides := OrderedCollection new.
    standardRide := StandardRide rideID: 1 pickup: 'A' dropoff: 'B' distance: 10.0.
    premiumRide := PremiumRide rideID: 2 pickup: 'C' dropoff: 'D' distance: 10.0.
    economyRide := EconomyRide rideID: 3 pickup: 'E' dropoff: 'F' distance: 10.0.
    
    rides add: standardRide.
    rides add: premiumRide.
    rides add: economyRide.
    
    "Test polymorphic behavior"
    totalFare := 0.
    rides do: [:ride |
        totalFare := totalFare + ride fare. "Virtual method call"
    ].
    
    self runTest: 'Polymorphic fare calculation' result: (totalFare = 87.5).
! !

!RideSharingTestSuite methodsFor: 'testing' stamp: 'RideSystem 11/5/2025'!
testSystemIntegration
    "Test system integration"
    | system driver rider ride foundDriver foundRider |
    
    Transcript cr.
    Transcript show: '=== Testing System Integration ==='; cr.
    
    system := RideSharingSystem new.
    
    "Add entities"
    driver := system addDriver: 'Integration Driver'.
    rider := system addRider: 'Integration Rider'.
    
    self runTest: 'Driver added to system' result: (driver notNil).
    self runTest: 'Rider added to system' result: (rider notNil).
    
    "Create ride"
    ride := system createRide: 'standard' pickup: 'Start' dropoff: 'End' distance: 15.0 driver: driver rider: rider.
    
    self runTest: 'Ride created in system' result: (ride notNil).
    self runTest: 'Driver has ride' result: (driver rideCount = 1).
    self runTest: 'Rider has ride' result: (rider rideCount = 1).
    
    "Test find functions"
    foundDriver := system findDriver: (driver driverID).
    foundRider := system findRider: (rider riderID).
    
    self runTest: 'Find driver by ID' result: (foundDriver = driver).
    self runTest: 'Find rider by ID' result: (foundRider = rider).
! !

!RideSharingTestSuite methodsFor: 'running' stamp: 'RideSystem 11/5/2025'!
runAllTests
    "Run all tests and display results"
    Transcript show: '======================================'; cr.
    Transcript show: 'RIDE SHARING SYSTEM - TEST SUITE'; cr.
    Transcript show: '======================================'; cr.
    
    self testRideCreation.
    self testDriverFunctionality.
    self testRiderFunctionality.
    self testPolymorphism.
    self testSystemIntegration.
    
    Transcript cr.
    Transcript show: '======================================'; cr.
    Transcript show: 'TEST RESULTS'; cr.
    Transcript show: '======================================'; cr.
    Transcript show: 'Tests Passed: ', testsPassed printString; cr.
    Transcript show: 'Tests Failed: ', testsFailed printString; cr.
    Transcript show: 'Total Tests: ', (testsPassed + testsFailed) printString; cr.
    
    testsFailed = 0 ifTrue: [
        Transcript cr.
        Transcript show: '🎉 ALL TESTS PASSED! 🎉'; cr.
    ] ifFalse: [
        Transcript cr.
        Transcript show: '❌ SOME TESTS FAILED!'; cr.
    ]
! !
