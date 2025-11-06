#include "RideSharingSystem.h"
#include <iostream>
#include <iomanip>
#include <algorithm>

RideSharingSystem::RideSharingSystem() 
    : nextRideID(1), nextDriverID(1), nextRiderID(1) {
    std::cout << "[LOG] Ride Sharing System initialized" << std::endl;
}

Driver* RideSharingSystem::addDriver(const std::string& name, double rating) {
    auto driver = std::make_unique<Driver>(nextDriverID++, name, rating);
    Driver* ptr = driver.get();
    drivers.push_back(std::move(driver));
    return ptr;
}

Rider* RideSharingSystem::addRider(const std::string& name, const std::string& paymentMethod) {
    auto rider = std::make_unique<Rider>(nextRiderID++, name, paymentMethod);
    Rider* ptr = rider.get();
    riders.push_back(std::move(rider));
    return ptr;
}

std::shared_ptr<Ride> RideSharingSystem::createRide(const std::string& rideType,
                                                   const std::string& pickup,
                                                   const std::string& dropoff,
                                                   double distance,
                                                   Driver* driverPtr,
                                                   Rider* riderPtr) {
    std::shared_ptr<Ride> ride;
    
    // Factory pattern implementation for creating different ride types
    if (rideType == "standard") {
        ride = std::make_shared<StandardRide>(nextRideID++, pickup, dropoff, distance);
    } else if (rideType == "premium") {
        ride = std::make_shared<PremiumRide>(nextRideID++, pickup, dropoff, distance);
    } else if (rideType == "economy") {
        ride = std::make_shared<EconomyRide>(nextRideID++, pickup, dropoff, distance);
    } else {
        std::cout << "[ERROR] Unknown ride type: " << rideType << std::endl;
        return nullptr;
    }
    
    if (ride && driverPtr && riderPtr) {
        allRides.push_back(ride);
        driverPtr->addRide(ride);
        riderPtr->requestRide(ride);
        
        std::cout << "[LOG] Ride created and assigned successfully!" << std::endl;
    }
    
    return ride;
}

void RideSharingSystem::demonstratePolymorphism() {
    std::cout << "\n========================================" << std::endl;
    std::cout << "DEMONSTRATING POLYMORPHISM" << std::endl;
    std::cout << "========================================" << std::endl;
    std::cout << "[LOG] Processing all rides polymorphically..." << std::endl;
    
    if (allRides.empty()) {
        std::cout << "No rides in the system to demonstrate." << std::endl;
        return;
    }
    
    double totalRevenue = 0.0;
    
    // Polymorphic behavior: calling virtual methods on base class pointers
    for (const auto& ride : allRides) {
        std::cout << "\n--- Processing Ride Polymorphically ---" << std::endl;
        // Call virtual methods - actual implementation depends on runtime type
        ride->rideDetails();
        totalRevenue += ride->fare();
        std::cout << std::endl;
    }
    
    std::cout << "=== Polymorphism Demonstration Summary ===" << std::endl;
    std::cout << "Total rides processed: " << allRides.size() << std::endl;
    std::cout << "Total revenue: $" << std::fixed << std::setprecision(2) << totalRevenue << std::endl;
    std::cout << "[LOG] Polymorphism demonstration completed!" << std::endl;
}

void RideSharingSystem::displaySystemStats() {
    std::cout << "\n========================================" << std::endl;
    std::cout << "SYSTEM STATISTICS" << std::endl;
    std::cout << "========================================" << std::endl;
    
    std::cout << "Total Drivers: " << drivers.size() << std::endl;
    std::cout << "Total Riders: " << riders.size() << std::endl;
    std::cout << "Total Rides: " << allRides.size() << std::endl;
    
    // Calculate total revenue
    double totalRevenue = 0.0;
    for (const auto& ride : allRides) {
        totalRevenue += ride->fare();
    }
    std::cout << "Total Revenue: $" << std::fixed << std::setprecision(2) << totalRevenue << std::endl;
    
    // Show ride type distribution
    int standardCount = 0, premiumCount = 0, economyCount = 0;
    for (const auto& ride : allRides) {
        if (std::dynamic_pointer_cast<StandardRide>(ride)) {
            standardCount++;
        } else if (std::dynamic_pointer_cast<PremiumRide>(ride)) {
            premiumCount++;
        } else if (std::dynamic_pointer_cast<EconomyRide>(ride)) {
            economyCount++;
        }
    }
    
    std::cout << "\nRide Type Distribution:" << std::endl;
    std::cout << "- Standard: " << standardCount << std::endl;
    std::cout << "- Premium: " << premiumCount << std::endl;
    std::cout << "- Economy: " << economyCount << std::endl;
}

Driver* RideSharingSystem::findDriver(int id) {
    auto it = std::find_if(drivers.begin(), drivers.end(),
                          [id](const std::unique_ptr<Driver>& driver) {
                              return driver->getDriverID() == id;
                          });
    return (it != drivers.end()) ? it->get() : nullptr;
}

Rider* RideSharingSystem::findRider(int id) {
    auto it = std::find_if(riders.begin(), riders.end(),
                          [id](const std::unique_ptr<Rider>& rider) {
                              return rider->getRiderID() == id;
                          });
    return (it != riders.end()) ? it->get() : nullptr;
}
