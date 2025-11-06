#include "Rider.h"
#include <iostream>
#include <iomanip>

Rider::Rider(int id, const std::string& riderName, const std::string& payment)
    : riderID(id), name(riderName), paymentMethod(payment) {
    std::cout << "[LOG] Created rider: " << name << " (ID: " << riderID << ")" << std::endl;
}

void Rider::requestRide(std::shared_ptr<Ride> ride) {
    if (ride) {
        requestedRides.push_back(ride);
        std::cout << "[LOG] Rider " << name << " requested ride ID: " << ride->getRideID() << std::endl;
    }
}

void Rider::viewRides() const {
    std::cout << "\n=== Ride History for " << name << " ===" << std::endl;
    
    if (requestedRides.empty()) {
        std::cout << "No rides requested yet." << std::endl;
        return;
    }
    
    for (size_t i = 0; i < requestedRides.size(); ++i) {
        const auto& ride = requestedRides[i];
        std::cout << "\n--- Ride " << (i + 1) << " ---" << std::endl;
        ride->rideDetails();
    }
    
    std::cout << "\nTotal Spending: $" << std::fixed << std::setprecision(2) 
             << getTotalSpending() << std::endl;
}

double Rider::getTotalSpending() const {
    double total = 0.0;
    for (const auto& ride : requestedRides) {
        total += ride->fare();
    }
    return total;
}

void Rider::setPaymentMethod(const std::string& newPayment) {
    paymentMethod = newPayment;
    std::cout << "[LOG] Payment method updated to: " << paymentMethod << std::endl;
}

void Rider::getRiderInfo() const {
    std::cout << "\n=== Rider Information ===" << std::endl;
    std::cout << "Rider ID: " << riderID << std::endl;
    std::cout << "Name: " << name << std::endl;
    std::cout << "Payment Method: " << paymentMethod << std::endl;
    std::cout << "Total Rides: " << requestedRides.size() << std::endl;
    std::cout << "Total Spending: $" << std::fixed << std::setprecision(2) 
             << getTotalSpending() << std::endl;
}
