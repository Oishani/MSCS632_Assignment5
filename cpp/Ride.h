#ifndef RIDE_H
#define RIDE_H

#include <string>
#include <iostream>
#include <iomanip>

/**
 * Base class representing a ride in the ride sharing system
 * Demonstrates encapsulation with private data members and public interface
 */
class Ride {
private:
    int rideID;
    std::string pickupLocation;
    std::string dropoffLocation;
    double distance;

protected:
    // Base fare rate accessible to derived classes
    static const double BASE_RATE;

public:
    /**
     * Constructor to initialize a ride
     * @param id Unique identifier for the ride
     * @param pickup Starting location
     * @param dropoff Destination location
     * @param dist Distance in miles
     */
    Ride(int id, const std::string& pickup, const std::string& dropoff, double dist);
    
    /**
     * Virtual destructor for proper cleanup in inheritance hierarchy
     */
    virtual ~Ride() = default;
    
    /**
     * Virtual method to calculate fare - demonstrates polymorphism
     * Subclasses will override this to provide specific fare calculation
     * @return Calculated fare amount
     */
    virtual double fare() const = 0;
    
    /**
     * Display ride information
     */
    virtual void rideDetails() const;
    
    // Getter methods - encapsulation in action
    int getRideID() const { return rideID; }
    std::string getPickupLocation() const { return pickupLocation; }
    std::string getDropoffLocation() const { return dropoffLocation; }
    double getDistance() const { return distance; }
};

/**
 * StandardRide - Derived class with basic fare calculation
 * Demonstrates inheritance and polymorphism
 */
class StandardRide : public Ride {
public:
    StandardRide(int id, const std::string& pickup, const std::string& dropoff, double dist);
    
    /**
     * Override fare calculation for standard rides
     * @return Standard fare (base rate * distance)
     */
    double fare() const override;
    
    /**
     * Override ride details to show ride type
     */
    void rideDetails() const override;
};

/**
 * PremiumRide - Derived class with premium fare calculation
 * Demonstrates inheritance and polymorphism
 */
class PremiumRide : public Ride {
private:
    static const double PREMIUM_MULTIPLIER;
    
public:
    PremiumRide(int id, const std::string& pickup, const std::string& dropoff, double dist);
    
    /**
     * Override fare calculation for premium rides
     * @return Premium fare (base rate * distance * premium multiplier)
     */
    double fare() const override;
    
    /**
     * Override ride details to show ride type
     */
    void rideDetails() const override;
};

/**
 * EconomyRide - Additional ride type for extra functionality
 * Demonstrates extensibility of the system
 */
class EconomyRide : public Ride {
private:
    static const double ECONOMY_DISCOUNT;
    
public:
    EconomyRide(int id, const std::string& pickup, const std::string& dropoff, double dist);
    
    /**
     * Override fare calculation for economy rides
     * @return Discounted fare for budget-conscious riders
     */
    double fare() const override;
    
    /**
     * Override ride details to show ride type
     */
    void rideDetails() const override;
};

#endif // RIDE_H
