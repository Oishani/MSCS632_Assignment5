#ifndef RIDE_SHARING_SYSTEM_H
#define RIDE_SHARING_SYSTEM_H

#include "Ride.h"
#include "Driver.h"
#include "Rider.h"
#include <vector>
#include <memory>
#include <map>

/**
 * RideSharingSystem - Main system class that manages the entire operation
 * Demonstrates composition and system-level functionality
 */
class RideSharingSystem {
private:
    std::vector<std::shared_ptr<Ride>> allRides;
    std::vector<std::unique_ptr<Driver>> drivers;
    std::vector<std::unique_ptr<Rider>> riders;
    int nextRideID;
    int nextDriverID;
    int nextRiderID;
    
public:
    /**
     * Constructor initializes the system
     */
    RideSharingSystem();
    
    /**
     * Create and add a new driver to the system
     * @param name Driver's name
     * @param rating Initial rating
     * @return Pointer to created driver
     */
    Driver* addDriver(const std::string& name, double rating = 5.0);
    
    /**
     * Create and add a new rider to the system
     * @param name Rider's name
     * @param paymentMethod Payment method
     * @return Pointer to created rider
     */
    Rider* addRider(const std::string& name, const std::string& paymentMethod = "Credit Card");
    
    /**
     * Create a ride and assign it to a driver and rider
     * @param rideType Type of ride ("standard", "premium", "economy")
     * @param pickup Pickup location
     * @param dropoff Dropoff location
     * @param distance Distance in miles
     * @param driverPtr Pointer to driver
     * @param riderPtr Pointer to rider
     * @return Shared pointer to created ride
     */
    std::shared_ptr<Ride> createRide(const std::string& rideType, 
                                   const std::string& pickup, 
                                   const std::string& dropoff, 
                                   double distance,
                                   Driver* driverPtr,
                                   Rider* riderPtr);
    
    /**
     * Demonstrate polymorphism by processing all rides in the system
     */
    void demonstratePolymorphism();
    
    /**
     * Display system statistics
     */
    void displaySystemStats();
    
    /**
     * Find driver by ID
     * @param id Driver ID
     * @return Pointer to driver or nullptr if not found
     */
    Driver* findDriver(int id);
    
    /**
     * Find rider by ID
     * @param id Rider ID
     * @return Pointer to rider or nullptr if not found
     */
    Rider* findRider(int id);
};

#endif // RIDE_SHARING_SYSTEM_H
