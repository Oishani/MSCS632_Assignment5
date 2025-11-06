#ifndef RIDER_H
#define RIDER_H

#include "Ride.h"
#include <vector>
#include <memory>
#include <string>

/**
 * Rider class representing a passenger in the ride sharing system
 * Demonstrates encapsulation with private data members
 */
class Rider {
private:
    int riderID;
    std::string name;
    std::string paymentMethod;
    // Private collection - demonstrates encapsulation
    std::vector<std::shared_ptr<Ride>> requestedRides;
    
public:
    /**
     * Constructor to create a rider
     * @param id Unique rider identifier
     * @param riderName Name of the rider
     * @param payment Payment method (default: "Credit Card")
     */
    Rider(int id, const std::string& riderName, const std::string& payment = "Credit Card");
    
    /**
     * Request a ride and add it to the rider's history
     * Controlled access to private data
     * @param ride Shared pointer to the ride object
     */
    void requestRide(std::shared_ptr<Ride> ride);
    
    /**
     * Display all rides requested by this rider
     */
    void viewRides() const;
    
    /**
     * Calculate total spending on rides
     * @return Total amount spent
     */
    double getTotalSpending() const;
    
    /**
     * Update payment method
     * @param newPayment New payment method
     */
    void setPaymentMethod(const std::string& newPayment);
    
    /**
     * Get rider information summary
     */
    void getRiderInfo() const;
    
    // Getter methods for controlled access
    int getRiderID() const { return riderID; }
    std::string getName() const { return name; }
    std::string getPaymentMethod() const { return paymentMethod; }
    size_t getRideCount() const { return requestedRides.size(); }
};

#endif // RIDER_H
