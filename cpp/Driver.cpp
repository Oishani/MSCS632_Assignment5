#include "Driver.h"
#include <iostream>
#include <iomanip>

Driver::Driver(int id, const std::string& driverName, double initialRating)
    : driverID(id), name(driverName), rating(initialRating) {
    std::cout << "[LOG] Created driver: " << name << " (ID: " << driverID << ")" << std::endl;
}

void Driver::addRide(std::shared_ptr<Ride> ride) {
    if (ride) {
        assignedRides.push_back(ride);
        std::cout << "[LOG] Driver " << name << " assigned to ride ID: " << ride->getRideID() << std::endl;
    }
}

void Driver::getDriverInfo() const {
    std::cout << "\n=== Driver Information ===" << std::endl;
    std::cout << "Driver ID: " << driverID << std::endl;
    std::cout << "Name: " << name << std::endl;
    std::cout << "Rating: " << std::fixed << std::setprecision(1) << rating << "/5.0" << std::endl;
    std::cout << "Total Rides: " << assignedRides.size() << std::endl;
    std::cout << "Total Earnings: $" << std::fixed << std::setprecision(2) << getTotalEarnings() << std::endl;
    
    if (!assignedRides.empty()) {
        std::cout << "\n--- Assigned Rides ---" << std::endl;
        for (const auto& ride : assignedRides) {
            std::cout << "Ride " << ride->getRideID() << ": " 
                     << ride->getPickupLocation() << " → " << ride->getDropoffLocation()
                     << " ($" << std::fixed << std::setprecision(2) << ride->fare() << ")" << std::endl;
        }
    }
}

double Driver::getTotalEarnings() const {
    double total = 0.0;
    for (const auto& ride : assignedRides) {
        total += ride->fare();
    }
    return total;
}

void Driver::updateRating(double newRating) {
    if (newRating >= 1.0 && newRating <= 5.0) {
        // Simple average of current and new rating
        rating = (rating + newRating) / 2.0;
        std::cout << "[LOG] Driver " << name << " rating updated to " 
                 << std::fixed << std::setprecision(1) << rating << std::endl;
    } else {
        std::cout << "[ERROR] Invalid rating. Must be between 1.0 and 5.0" << std::endl;
    }
}
