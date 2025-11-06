#include "RideSharingSystem.h"
#include <iostream>
#include <cassert>
#include <memory>

/**
 * Basic test suite for the Ride Sharing System
 * Tests core functionality and OOP principles
 */

class TestSuite {
private:
    int testsPassed = 0;
    int testsFailed = 0;
    
    void runTest(const std::string& testName, bool result) {
        std::cout << "Testing " << testName << "... ";
        if (result) {
            std::cout << "PASSED" << std::endl;
            testsPassed++;
        } else {
            std::cout << "FAILED" << std::endl;
            testsFailed++;
        }
    }
    
public:
    void testRideCreation() {
        std::cout << "\n=== Testing Ride Creation ===" << std::endl;
        
        // Test StandardRide
        auto standardRide = std::make_shared<StandardRide>(1, "A", "B", 10.0);
        runTest("StandardRide creation", standardRide != nullptr);
        runTest("StandardRide fare calculation", standardRide->fare() == 25.0); // 2.5 * 10
        
        // Test PremiumRide
        auto premiumRide = std::make_shared<PremiumRide>(2, "C", "D", 10.0);
        runTest("PremiumRide creation", premiumRide != nullptr);
        runTest("PremiumRide fare calculation", premiumRide->fare() == 45.0); // 2.5 * 10 * 1.8
        
        // Test EconomyRide
        auto economyRide = std::make_shared<EconomyRide>(3, "E", "F", 10.0);
        runTest("EconomyRide creation", economyRide != nullptr);
        runTest("EconomyRide fare calculation", economyRide->fare() == 17.5); // 2.5 * 10 * 0.7
    }
    
    void testDriverFunctionality() {
        std::cout << "\n=== Testing Driver Functionality ===" << std::endl;
        
        Driver driver(1, "Test Driver", 4.5);
        
        runTest("Driver creation", driver.getName() == "Test Driver");
        runTest("Driver ID", driver.getDriverID() == 1);
        runTest("Driver rating", driver.getRating() == 4.5);
        runTest("Initial ride count", driver.getRideCount() == 0);
        
        // Add a ride
        auto ride = std::make_shared<StandardRide>(1, "A", "B", 5.0);
        driver.addRide(ride);
        runTest("Ride added to driver", driver.getRideCount() == 1);
        runTest("Driver earnings", driver.getTotalEarnings() == 12.5);
        
        // Update rating
        driver.updateRating(5.0);
        runTest("Rating update", driver.getRating() == 4.75); // (4.5 + 5.0) / 2
    }
    
    void testRiderFunctionality() {
        std::cout << "\n=== Testing Rider Functionality ===" << std::endl;
        
        Rider rider(1, "Test Rider", "Credit Card");
        
        runTest("Rider creation", rider.getName() == "Test Rider");
        runTest("Rider ID", rider.getRiderID() == 1);
        runTest("Payment method", rider.getPaymentMethod() == "Credit Card");
        runTest("Initial ride count", rider.getRideCount() == 0);
        
        // Request a ride
        auto ride = std::make_shared<PremiumRide>(1, "X", "Y", 8.0);
        rider.requestRide(ride);
        runTest("Ride requested", rider.getRideCount() == 1);
        runTest("Rider spending", rider.getTotalSpending() == 36.0); // 2.5 * 8 * 1.8
        
        // Update payment method
        rider.setPaymentMethod("PayPal");
        runTest("Payment method update", rider.getPaymentMethod() == "PayPal");
    }
    
    void testPolymorphism() {
        std::cout << "\n=== Testing Polymorphism ===" << std::endl;
        
        // Create a vector of base class pointers
        std::vector<std::shared_ptr<Ride>> rides;
        rides.push_back(std::make_shared<StandardRide>(1, "A", "B", 10.0));
        rides.push_back(std::make_shared<PremiumRide>(2, "C", "D", 10.0));
        rides.push_back(std::make_shared<EconomyRide>(3, "E", "F", 10.0));
        
        // Test polymorphic behavior
        double totalFare = 0.0;
        for (const auto& ride : rides) {
            totalFare += ride->fare(); // Virtual method call
        }
        
        runTest("Polymorphic fare calculation", totalFare == 87.5); // 25 + 45 + 17.5
    }
    
    void testSystemIntegration() {
        std::cout << "\n=== Testing System Integration ===" << std::endl;
        
        RideSharingSystem system;
        
        // Add entities
        Driver* driver = system.addDriver("Integration Driver");
        Rider* rider = system.addRider("Integration Rider");
        
        runTest("Driver added to system", driver != nullptr);
        runTest("Rider added to system", rider != nullptr);
        
        // Create ride
        auto ride = system.createRide("standard", "Start", "End", 15.0, driver, rider);
        
        runTest("Ride created in system", ride != nullptr);
        runTest("Driver has ride", driver->getRideCount() == 1);
        runTest("Rider has ride", rider->getRideCount() == 1);
        
        // Test find functions
        Driver* foundDriver = system.findDriver(driver->getDriverID());
        Rider* foundRider = system.findRider(rider->getRiderID());
        
        runTest("Find driver by ID", foundDriver == driver);
        runTest("Find rider by ID", foundRider == rider);
    }
    
    void runAllTests() {
        std::cout << "======================================" << std::endl;
        std::cout << "RIDE SHARING SYSTEM - TEST SUITE" << std::endl;
        std::cout << "======================================" << std::endl;
        
        testRideCreation();
        testDriverFunctionality();
        testRiderFunctionality();
        testPolymorphism();
        testSystemIntegration();
        
        std::cout << "\n======================================" << std::endl;
        std::cout << "TEST RESULTS" << std::endl;
        std::cout << "======================================" << std::endl;
        std::cout << "Tests Passed: " << testsPassed << std::endl;
        std::cout << "Tests Failed: " << testsFailed << std::endl;
        std::cout << "Total Tests: " << (testsPassed + testsFailed) << std::endl;
        
        if (testsFailed == 0) {
            std::cout << "\n🎉 ALL TESTS PASSED! 🎉" << std::endl;
        } else {
            std::cout << "\n❌ SOME TESTS FAILED!" << std::endl;
        }
    }
};

int main() {
    TestSuite suite;
    suite.runAllTests();
    return 0;
}
