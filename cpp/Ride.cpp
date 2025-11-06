#include "Ride.h"

// Static member definitions
const double Ride::BASE_RATE = 2.5;
const double PremiumRide::PREMIUM_MULTIPLIER = 1.8;
const double EconomyRide::ECONOMY_DISCOUNT = 0.7;

// Base Ride class implementation
Ride::Ride(int id, const std::string& pickup, const std::string& dropoff, double dist)
    : rideID(id), pickupLocation(pickup), dropoffLocation(dropoff), distance(dist) {
    std::cout << "[LOG] Created ride with ID: " << rideID << std::endl;
}

void Ride::rideDetails() const {
    std::cout << "=== Ride Details ===" << std::endl;
    std::cout << "Ride ID: " << rideID << std::endl;
    std::cout << "From: " << pickupLocation << std::endl;
    std::cout << "To: " << dropoffLocation << std::endl;
    std::cout << "Distance: " << std::fixed << std::setprecision(2) << distance << " miles" << std::endl;
    std::cout << "Fare: $" << std::fixed << std::setprecision(2) << fare() << std::endl;
}

// StandardRide implementation
StandardRide::StandardRide(int id, const std::string& pickup, const std::string& dropoff, double dist)
    : Ride(id, pickup, dropoff, dist) {
    std::cout << "[LOG] StandardRide created" << std::endl;
}

double StandardRide::fare() const {
    return BASE_RATE * getDistance();
}

void StandardRide::rideDetails() const {
    std::cout << "Type: Standard Ride" << std::endl;
    Ride::rideDetails();
}

// PremiumRide implementation
PremiumRide::PremiumRide(int id, const std::string& pickup, const std::string& dropoff, double dist)
    : Ride(id, pickup, dropoff, dist) {
    std::cout << "[LOG] PremiumRide created" << std::endl;
}

double PremiumRide::fare() const {
    return BASE_RATE * getDistance() * PREMIUM_MULTIPLIER;
}

void PremiumRide::rideDetails() const {
    std::cout << "Type: Premium Ride (Luxury vehicle, complimentary refreshments)" << std::endl;
    Ride::rideDetails();
}

// EconomyRide implementation
EconomyRide::EconomyRide(int id, const std::string& pickup, const std::string& dropoff, double dist)
    : Ride(id, pickup, dropoff, dist) {
    std::cout << "[LOG] EconomyRide created" << std::endl;
}

double EconomyRide::fare() const {
    return BASE_RATE * getDistance() * ECONOMY_DISCOUNT;
}

void EconomyRide::rideDetails() const {
    std::cout << "Type: Economy Ride (Budget-friendly option)" << std::endl;
    Ride::rideDetails();
}
