#ifndef DRIVER_H
#define DRIVER_H

#include "Ride.h"
#include <vector>
#include <memory>
#include <string>

/**
 * Driver class representing a driver in the ride sharing system
 * Demonstrates encapsulation with private member variables and controlled access
 */
class Driver {
private:
    int driverID;
    std::string name;
    double rating;
    // Using smart pointers for automatic memory management
    std::vector<std::shared_ptr<Ride>> assignedRides; // Encapsulated - private access only
    
public:
    /**
     * Constructor to create a driver
     * @param id Unique driver identifier
     * @param driverName Name of the driver
     * @param initialRating Initial rating (default 5.0)
     */
    Driver(int id, const std::string& driverName, double initialRating = 5.0);
    
    /**
     * Add a ride to the driver's assigned rides list
     * Demonstrates controlled access to private data
     * @param ride Shared pointer to the ride object
     */
    void addRide(std::shared_ptr<Ride> ride);
    
    /**
     * Display driver information including all assigned rides
     */
    void getDriverInfo() const;
    
    /**
     * Calculate total earnings from all assigned rides
     * @return Total earnings
     */
    double getTotalEarnings() const;
    
    /**
     * Update driver rating based on ride feedback
     * @param newRating New rating value (1.0 - 5.0)
     */
    void updateRating(double newRating);
    
    // Getter methods for controlled access
    int getDriverID() const { return driverID; }
    std::string getName() const { return name; }
    double getRating() const { return rating; }
    size_t getRideCount() const { return assignedRides.size(); }
};

#endif // DRIVER_H
