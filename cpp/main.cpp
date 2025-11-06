#include "RideSharingSystem.h"
#include <iostream>
#include <string>
#include <chrono>
#include <thread>

/**
 * CLI Application for Ride Sharing System
 * Demonstrates all OOP principles: Encapsulation, Inheritance, and Polymorphism
 */

void printHeader(const std::string& title) {
    std::cout << "\n" << std::string(50, '=') << std::endl;
    std::cout << title << std::endl;
    std::cout << std::string(50, '=') << std::endl;
}

void pauseForDemo() {
    std::cout << "\n[Press Enter to continue...]" << std::endl;
    std::cin.get();
}

void displayMenu() {
    std::cout << "\n=== RIDE SHARING SYSTEM CLI ===" << std::endl;
    std::cout << "1. Add Driver" << std::endl;
    std::cout << "2. Add Rider" << std::endl;
    std::cout << "3. Create Ride" << std::endl;
    std::cout << "4. View Driver Info" << std::endl;
    std::cout << "5. View Rider Info" << std::endl;
    std::cout << "6. Demonstrate Polymorphism" << std::endl;
    std::cout << "7. System Statistics" << std::endl;
    std::cout << "8. Run Demo (All Features)" << std::endl;
    std::cout << "9. Exit" << std::endl;
    std::cout << "Enter your choice: ";
}

void runInteractiveMode(RideSharingSystem& system) {
    int choice;
    std::string name, pickup, dropoff, rideType, payment;
    double distance, rating;
    int driverID, riderID;
    
    while (true) {
        displayMenu();
        std::cin >> choice;
        std::cin.ignore(); // Clear the newline character
        
        switch (choice) {
            case 1: {
                std::cout << "Enter driver name: ";
                std::getline(std::cin, name);
                std::cout << "Enter initial rating (1-5): ";
                std::cin >> rating;
                system.addDriver(name, rating);
                break;
            }
            case 2: {
                std::cout << "Enter rider name: ";
                std::getline(std::cin, name);
                std::cout << "Enter payment method: ";
                std::getline(std::cin, payment);
                system.addRider(name, payment);
                break;
            }
            case 3: {
                std::cout << "Enter ride type (standard/premium/economy): ";
                std::getline(std::cin, rideType);
                std::cout << "Enter pickup location: ";
                std::getline(std::cin, pickup);
                std::cout << "Enter dropoff location: ";
                std::getline(std::cin, dropoff);
                std::cout << "Enter distance (miles): ";
                std::cin >> distance;
                std::cout << "Enter driver ID: ";
                std::cin >> driverID;
                std::cout << "Enter rider ID: ";
                std::cin >> riderID;
                
                Driver* driver = system.findDriver(driverID);
                Rider* rider = system.findRider(riderID);
                
                if (driver && rider) {
                    system.createRide(rideType, pickup, dropoff, distance, driver, rider);
                } else {
                    std::cout << "Invalid driver or rider ID!" << std::endl;
                }
                break;
            }
            case 4: {
                std::cout << "Enter driver ID: ";
                std::cin >> driverID;
                Driver* driver = system.findDriver(driverID);
                if (driver) {
                    driver->getDriverInfo();
                } else {
                    std::cout << "Driver not found!" << std::endl;
                }
                break;
            }
            case 5: {
                std::cout << "Enter rider ID: ";
                std::cin >> riderID;
                Rider* rider = system.findRider(riderID);
                if (rider) {
                    rider->viewRides();
                } else {
                    std::cout << "Rider not found!" << std::endl;
                }
                break;
            }
            case 6:
                system.demonstratePolymorphism();
                break;
            case 7:
                system.displaySystemStats();
                break;
            case 8:
                std::cout << "Running full demo..." << std::endl;
                return; // Exit to run demo
            case 9:
                std::cout << "Thank you for using Ride Sharing System!" << std::endl;
                return;
            default:
                std::cout << "Invalid choice! Please try again." << std::endl;
        }
        
        std::cout << "\n";
    }
}

void runAutomatedDemo(RideSharingSystem& system) {
    printHeader("AUTOMATED DEMO - RIDE SHARING SYSTEM");
    std::cout << "[LOG] Starting comprehensive demonstration of OOP principles..." << std::endl;
    
    // Step 1: Creating Drivers (Encapsulation)
    printHeader("STEP 1: CREATING DRIVERS (ENCAPSULATION)");
    std::cout << "[LOG] Demonstrating encapsulation with Driver class..." << std::endl;
    
    Driver* driver1 = system.addDriver("John Smith", 4.8);
    Driver* driver2 = system.addDriver("Maria Garcia", 4.9);
    Driver* driver3 = system.addDriver("David Chen", 4.7);
    
    std::cout << "[LOG] Drivers created successfully with encapsulated data members" << std::endl;
    pauseForDemo();
    
    // Step 2: Creating Riders (Encapsulation)
    printHeader("STEP 2: CREATING RIDERS (ENCAPSULATION)");
    std::cout << "[LOG] Demonstrating encapsulation with Rider class..." << std::endl;
    
    Rider* rider1 = system.addRider("Alice Johnson", "Credit Card");
    Rider* rider2 = system.addRider("Bob Wilson", "PayPal");
    Rider* rider3 = system.addRider("Carol Brown", "Apple Pay");
    
    std::cout << "[LOG] Riders created with private data members accessible only through methods" << std::endl;
    pauseForDemo();
    
    // Step 3: Creating Different Types of Rides (Inheritance & Polymorphism)
    printHeader("STEP 3: CREATING RIDES (INHERITANCE & POLYMORPHISM)");
    std::cout << "[LOG] Demonstrating inheritance with different ride types..." << std::endl;
    
    // Create various types of rides to show inheritance
    auto ride1 = system.createRide("standard", "Downtown", "Airport", 15.5, driver1, rider1);
    auto ride2 = system.createRide("premium", "Hotel District", "Business Center", 8.2, driver2, rider2);
    auto ride3 = system.createRide("economy", "University", "Shopping Mall", 12.0, driver3, rider3);
    auto ride4 = system.createRide("premium", "City Center", "Suburbs", 22.7, driver1, rider2);
    auto ride5 = system.createRide("standard", "Train Station", "Hospital", 6.3, driver2, rider1);
    
    std::cout << "[LOG] Different ride types created, showing inheritance hierarchy" << std::endl;
    pauseForDemo();
    
    // Step 4: Demonstrating Polymorphism
    system.demonstratePolymorphism();
    pauseForDemo();
    
    // Step 5: Show Individual Driver Information
    printHeader("STEP 5: DRIVER INFORMATION (ENCAPSULATION)");
    std::cout << "[LOG] Accessing encapsulated driver data through public methods..." << std::endl;
    
    driver1->getDriverInfo();
    driver2->getDriverInfo();
    driver3->getDriverInfo();
    
    pauseForDemo();
    
    // Step 6: Show Individual Rider Information
    printHeader("STEP 6: RIDER INFORMATION (ENCAPSULATION)");
    std::cout << "[LOG] Accessing encapsulated rider data through public methods..." << std::endl;
    
    rider1->viewRides();
    rider2->viewRides();
    rider3->viewRides();
    
    pauseForDemo();
    
    // Step 7: Update Driver Ratings (Encapsulation)
    printHeader("STEP 7: UPDATING DRIVER RATINGS (ENCAPSULATION)");
    std::cout << "[LOG] Demonstrating controlled access to private data..." << std::endl;
    
    driver1->updateRating(5.0);
    driver2->updateRating(4.6);
    driver3->updateRating(4.9);
    
    pauseForDemo();
    
    // Step 8: System Statistics
    system.displaySystemStats();
    
    // Step 9: Final Summary
    printHeader("DEMO COMPLETE - OOP PRINCIPLES DEMONSTRATED");
    std::cout << "[LOG] Successfully demonstrated:" << std::endl;
    std::cout << "✓ ENCAPSULATION: Private data members with controlled access" << std::endl;
    std::cout << "✓ INHERITANCE: Base Ride class with derived classes" << std::endl;
    std::cout << "✓ POLYMORPHISM: Virtual methods called on base class pointers" << std::endl;
    std::cout << "\nAdditional Features Implemented:" << std::endl;
    std::cout << "• Factory pattern for ride creation" << std::endl;
    std::cout << "• Smart pointers for memory management" << std::endl;
    std::cout << "• Comprehensive logging system" << std::endl;
    std::cout << "• Interactive CLI interface" << std::endl;
    std::cout << "\n[LOG] Ride Sharing System demo completed successfully!" << std::endl;
}

int main() {
    RideSharingSystem system;
    
    std::cout << "Welcome to the C++ Ride Sharing System!" << std::endl;
    std::cout << "Choose mode:" << std::endl;
    std::cout << "1. Interactive Mode" << std::endl;
    std::cout << "2. Automated Demo" << std::endl;
    std::cout << "Enter choice: ";
    
    int mode;
    std::cin >> mode;
    std::cin.ignore();
    
    if (mode == 2) {
        runAutomatedDemo(system);
    } else {
        runInteractiveMode(system);
        if (mode == 1) {
            // If user chose demo from interactive menu
            runAutomatedDemo(system);
        }
    }
    
    return 0;
}
