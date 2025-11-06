"Main CLI Application and Demo for SmallTalk Ride Sharing System
Demonstrates all OOP principles: Encapsulation, Inheritance, and Polymorphism"

Object subclass: #RideSharingSystemCLI
    instanceVariableNames: 'system'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!RideSharingSystemCLI class methodsFor: 'instance creation' stamp: 'RideSystem 11/5/2025'!
new
    "Create a new CLI instance"
    | cli |
    cli := super new.
    cli initialize.
    ^cli
! !

!RideSharingSystemCLI methodsFor: 'initialization' stamp: 'RideSystem 11/5/2025'!
initialize
    "Initialize the CLI with a new system"
    system := RideSharingSystem new.
! !

!RideSharingSystemCLI methodsFor: 'utilities' stamp: 'RideSystem 11/5/2025'!
printHeader: title
    "Print a formatted header"
    Transcript cr.
    Transcript show: (String new: 50 withAll: $=); cr.
    Transcript show: title; cr.
    Transcript show: (String new: 50 withAll: $=); cr.
! !

!RideSharingSystemCLI methodsFor: 'utilities' stamp: 'RideSystem 11/5/2025'!
pauseForDemo
    "Pause for demonstration (simulated)"
    Transcript cr.
    Transcript show: '[Press Enter to continue...]'; cr.
    "In a real Smalltalk environment, you might use: 
     (UIManager default request: 'Press Enter to continue') ifNil: ['']"
! !

!RideSharingSystemCLI methodsFor: 'menu' stamp: 'RideSystem 11/5/2025'!
displayMenu
    "Display the main menu"
    Transcript cr.
    Transcript show: '=== RIDE SHARING SYSTEM CLI ==='; cr.
    Transcript show: '1. Add Driver'; cr.
    Transcript show: '2. Add Rider'; cr.
    Transcript show: '3. Create Ride'; cr.
    Transcript show: '4. View Driver Info'; cr.
    Transcript show: '5. View Rider Info'; cr.
    Transcript show: '6. Demonstrate Polymorphism'; cr.
    Transcript show: '7. System Statistics'; cr.
    Transcript show: '8. Run Demo (All Features)'; cr.
    Transcript show: '9. Exit'; cr.
    Transcript show: 'Enter your choice: '; cr.
! !

!RideSharingSystemCLI methodsFor: 'demo' stamp: 'RideSystem 11/5/2025'!
runAutomatedDemo
    "Run comprehensive demonstration of OOP principles"
    | driver1 driver2 driver3 rider1 rider2 rider3 ride1 ride2 ride3 ride4 ride5 |
    
    self printHeader: 'AUTOMATED DEMO - RIDE SHARING SYSTEM'.
    Transcript show: '[LOG] Starting comprehensive demonstration of OOP principles...'; cr.
    
    "Step 1: Creating Drivers (Encapsulation)"
    self printHeader: 'STEP 1: CREATING DRIVERS (ENCAPSULATION)'.
    Transcript show: '[LOG] Demonstrating encapsulation with Driver class...'; cr.
    
    driver1 := system addDriver: 'John Smith' rating: 4.8.
    driver2 := system addDriver: 'Maria Garcia' rating: 4.9.
    driver3 := system addDriver: 'David Chen' rating: 4.7.
    
    Transcript show: '[LOG] Drivers created successfully with encapsulated data members'; cr.
    self pauseForDemo.
    
    "Step 2: Creating Riders (Encapsulation)"
    self printHeader: 'STEP 2: CREATING RIDERS (ENCAPSULATION)'.
    Transcript show: '[LOG] Demonstrating encapsulation with Rider class...'; cr.
    
    rider1 := system addRider: 'Alice Johnson' paymentMethod: 'Credit Card'.
    rider2 := system addRider: 'Bob Wilson' paymentMethod: 'PayPal'.
    rider3 := system addRider: 'Carol Brown' paymentMethod: 'Apple Pay'.
    
    Transcript show: '[LOG] Riders created with private data members accessible only through methods'; cr.
    self pauseForDemo.
    
    "Step 3: Creating Different Types of Rides (Inheritance & Polymorphism)"
    self printHeader: 'STEP 3: CREATING RIDES (INHERITANCE & POLYMORPHISM)'.
    Transcript show: '[LOG] Demonstrating inheritance with different ride types...'; cr.
    
    "Create various types of rides to show inheritance"
    ride1 := system createRide: 'standard' pickup: 'Downtown' dropoff: 'Airport' distance: 15.5 driver: driver1 rider: rider1.
    ride2 := system createRide: 'premium' pickup: 'Hotel District' dropoff: 'Business Center' distance: 8.2 driver: driver2 rider: rider2.
    ride3 := system createRide: 'economy' pickup: 'University' dropoff: 'Shopping Mall' distance: 12.0 driver: driver3 rider: rider3.
    ride4 := system createRide: 'premium' pickup: 'City Center' dropoff: 'Suburbs' distance: 22.7 driver: driver1 rider: rider2.
    ride5 := system createRide: 'standard' pickup: 'Train Station' dropoff: 'Hospital' distance: 6.3 driver: driver2 rider: rider1.
    
    Transcript show: '[LOG] Different ride types created, showing inheritance hierarchy'; cr.
    self pauseForDemo.
    
    "Step 4: Demonstrating Polymorphism"
    system demonstratePolymorphism.
    self pauseForDemo.
    
    "Step 5: Show Individual Driver Information"
    self printHeader: 'STEP 5: DRIVER INFORMATION (ENCAPSULATION)'.
    Transcript show: '[LOG] Accessing encapsulated driver data through public methods...'; cr.
    
    driver1 getDriverInfo.
    driver2 getDriverInfo.
    driver3 getDriverInfo.
    
    self pauseForDemo.
    
    "Step 6: Show Individual Rider Information"
    self printHeader: 'STEP 6: RIDER INFORMATION (ENCAPSULATION)'.
    Transcript show: '[LOG] Accessing encapsulated rider data through public methods...'; cr.
    
    rider1 viewRides.
    rider2 viewRides.
    rider3 viewRides.
    
    self pauseForDemo.
    
    "Step 7: Update Driver Ratings (Encapsulation)"
    self printHeader: 'STEP 7: UPDATING DRIVER RATINGS (ENCAPSULATION)'.
    Transcript show: '[LOG] Demonstrating controlled access to private data...'; cr.
    
    driver1 updateRating: 5.0.
    driver2 updateRating: 4.6.
    driver3 updateRating: 4.9.
    
    self pauseForDemo.
    
    "Step 8: System Statistics"
    system displaySystemStats.
    
    "Step 9: Final Summary"
    self printHeader: 'DEMO COMPLETE - OOP PRINCIPLES DEMONSTRATED'.
    Transcript show: '[LOG] Successfully demonstrated:'; cr.
    Transcript show: '✓ ENCAPSULATION: Private instance variables with controlled access'; cr.
    Transcript show: '✓ INHERITANCE: Base Ride class with derived classes'; cr.
    Transcript show: '✓ POLYMORPHISM: Virtual methods called on base class references'; cr.
    Transcript cr.
    Transcript show: 'Additional Features Implemented:'; cr.
    Transcript show: '• Factory pattern for ride creation'; cr.
    Transcript show: '• Collection-based data management'; cr.
    Transcript show: '• Comprehensive logging system'; cr.
    Transcript show: '• Interactive CLI interface'; cr.
    Transcript cr.
    Transcript show: '[LOG] Ride Sharing System demo completed successfully!'; cr.
! !

!RideSharingSystemCLI methodsFor: 'running' stamp: 'RideSystem 11/5/2025'!
run
    "Main entry point for the CLI application"
    Transcript show: 'Welcome to the SmallTalk Ride Sharing System!'; cr.
    Transcript show: 'Choose mode:'; cr.
    Transcript show: '1. Interactive Mode'; cr.
    Transcript show: '2. Automated Demo'; cr.
    Transcript show: 'Running Automated Demo...'; cr.
    
    self runAutomatedDemo.
! !
