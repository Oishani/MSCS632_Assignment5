# MSCS-632 Assignment 5: Object-Oriented Ride Sharing System

This project implements a comprehensive **Ride Sharing System** in both **C++** and **SmallTalk**, demonstrating 3 fundamental Object-Oriented Programming principles through a real-world application scenario.

## 🎯 OOP Principles Demonstrated

- **🔒 Encapsulation**: Private data members with controlled public interfaces
- **🧬 Inheritance**: Base classes with specialized derived implementations  
- **🔄 Polymorphism**: Virtual methods with runtime type resolution

## 🚀 Project Overview

This project demonstrates advanced Object-Oriented Programming concepts through a **Ride Sharing System** similar to Uber or Lyft. The system manages drivers, riders, and different types of rides while showcasing proper OOP design principles in two very different programming languages.

### Key Components:
- **Ride Management**: Base `Ride` class with specialized subclasses
- **Driver System**: Encapsulated driver profiles with ride tracking
- **Rider System**: Customer management with ride history
- **Polymorphic Processing**: Runtime type resolution for different ride types
- **Interactive CLI**: Full-featured command-line interfaces

## 💻 System Requirements

### C++ Implementation
- **Compiler**: GCC 7+ or Clang 5+ with C++17 support
- **Operating System**: Linux, macOS, or Windows (with appropriate compiler)
- **Build Tools**: Make utility
- **Memory**: Minimum 512MB RAM
- **Disk Space**: ~50MB for build artifacts

### SmallTalk Implementation
- **Environment**: GNU SmallTalk (gst)
  - **Installation**: `brew install gnu-smalltalk` (macOS) or package manager
  - **Alternative Systems**: Pharo, Squeak, VisualWorks (require file loading)
- **Memory**: Minimum 256MB RAM
- **Disk Space**: ~100MB for GNU SmallTalk installation

## 📦 Installation & Setup

### Quick Start (macOS/Linux)
```bash
# Clone or navigate to project directory
cd MSCS632_Assignment5

# Make scripts executable
chmod +x run_complete_demo.sh
chmod +x cpp/run_demo.sh

# Run complete demonstration (C++ + SmallTalk instructions)
./run_complete_demo.sh
```

### C++ Setup (Detailed)
```bash
# Navigate to C++ directory
cd cpp

# Install dependencies (if needed)
# On macOS:
xcode-select --install  # For build tools

# On Ubuntu/Debian:
sudo apt update && sudo apt install build-essential

# On CentOS/RHEL:
sudo yum groupinstall "Development Tools"

# Build the application
make clean && make

# Verify installation
./ride_sharing_system  # Should show menu
```

### SmallTalk Setup (GNU SmallTalk)
```bash
# Install GNU SmallTalk
# On macOS:
brew install gnu-smalltalk

# On Ubuntu/Debian:
sudo apt update && sudo apt install gnu-smalltalk

# On CentOS/RHEL:
sudo yum install gnu-smalltalk

# Verify installation
gst --version  # Should show GNU SmallTalk version
```

## 📁 Project Structure

```
MSCS632_Assignment5/
├── README.md                    # This comprehensive guide
├── .gitignore                   # Git ignore patterns
├── run_complete_demo.sh         # Master demo script
│
├── cpp/                         # C++ Implementation
│   ├── Ride.h                   # Base Ride class definition
│   ├── Ride.cpp                 # Ride class implementation
│   ├── Driver.h                 # Driver class definition
│   ├── Driver.cpp               # Driver class implementation  
│   ├── Rider.h                  # Rider class definition
│   ├── Rider.cpp                # Rider class implementation
│   ├── RideSharingSystem.h      # Main system class definition
│   ├── RideSharingSystem.cpp    # System class implementation
│   ├── main.cpp                 # CLI application entry point
│   ├── test.cpp                 # Comprehensive test suite
│   ├── Makefile                 # Build automation
│   └── run_demo.sh              # C++ demo script
│
└── smalltalk/                   # SmallTalk Implementation
    ├── Ride.st                  # Base Ride class
    ├── RideTypes.st             # StandardRide, PremiumRide, EconomyRide
    ├── Driver.st                # Driver class with encapsulation
    ├── Rider.st                 # Rider class with encapsulation
    ├── RideSharingSystem.st     # Main system management
    ├── CLI.st                   # Command-line interface
    ├── Test.st                  # Test suite
    └── Demo.st                  # Complete demonstration script
```

## 🛠 Features & Implementation

#### 1. **Ride Class Hierarchy** (Inheritance + Polymorphism)
```
Ride (Base Class)
├── StandardRide    # Basic fare: $2.50/mile
├── PremiumRide     # Premium fare: $2.50/mile × 1.8 multiplier  
└── EconomyRide     # Budget fare: $2.50/mile × 0.7 discount
```

**OOP Principles Demonstrated:**
- **Inheritance**: Common attributes (`rideID`, `pickup`, `dropoff`, `distance`) in base class
- **Polymorphism**: Virtual `fare()` method overridden in each subclass
- **Encapsulation**: Private data members with public interface methods

**Key Features:**
- Abstract base class with pure virtual methods
- Type-specific fare calculation algorithms
- Polymorphic `rideDetails()` method for display
- Factory pattern for ride creation

#### 2. **Driver Class** (Encapsulation Showcase)
```cpp
class Driver {
private:
    int driverID;
    string name;
    double rating;
    vector<shared_ptr<Ride>> assignedRides;  // ENCAPSULATED!
public:
    void addRide(shared_ptr<Ride> ride);     // Controlled access
    double getTotalEarnings();
    void getDriverInfo();
    // ... getters/setters
};
```

**OOP Principles Demonstrated:**
- **Encapsulation**: `assignedRides` is private, only accessible through methods
- **Data Hiding**: Internal state protected from direct manipulation
- **Interface Design**: Clean public API for ride management

#### 3. **Rider Class** (Encapsulation + Composition)
```cpp
class Rider {
private:
    int riderID;
    string name;
    string paymentMethod;
    vector<shared_ptr<Ride>> requestedRides;  // ENCAPSULATED!
public:
    void requestRide(shared_ptr<Ride> ride);  // Controlled access
    double getTotalSpending();
    void viewRides();
    // ... other methods
};
```

**OOP Principles Demonstrated:**
- **Encapsulation**: Private ride history with controlled access
- **Composition**: Contains collection of Ride objects
- **Abstraction**: High-level interface hiding implementation details

### MVP+ Enhanced Features 🚀

#### 4. **Advanced System Architecture**
- **Factory Pattern**: `RideSharingSystem::createRide()` creates appropriate ride types
- **Smart Pointers (C++)**: `shared_ptr` and `unique_ptr` for automatic memory management
- **Collection Management**: Dynamic arrays/collections for scalable data storage
- **Error Handling**: Comprehensive validation and graceful error recovery

#### 5. **Interactive CLI Applications**
Both implementations feature full CLI interfaces with:
- **Menu-driven navigation**
- **Real-time data display**
- **Input validation**
- **Interactive and automated modes**

#### 6. **Comprehensive Testing Framework**
- **Unit Tests**: Individual component testing
- **Integration Tests**: System-level functionality  
- **Polymorphism Tests**: Runtime type resolution verification
- **28 Test Cases** in C++ with 100% pass rate

#### 7. **Build Automation & Deployment**
```makefile
# Makefile targets:
make            # Build main application
make test       # Build and run test suite
make clean      # Clean build artifacts  
make run        # Build and run application
make demo       # Run automated demonstration
```

## 🏃‍♂️ Running the Applications

### 🎬 Complete Demonstration (Both Languages)
```bash
# Run the master demo script (recommended)
./run_complete_demo.sh
```
This script will:
1. Build and run the C++ demonstration
2. Execute the full test suite  
3. Provide instructions for SmallTalk setup

### 🔧 C++ Implementation

#### Option 1: Automated Demo Script
```bash
cd cpp
./run_demo.sh
```

#### Option 2: Step-by-Step Manual Execution
```bash
# Navigate to C++ directory
cd cpp

# Clean any previous builds
make clean

# Build the application
make

# Run interactive mode (choose options manually)
./ride_sharing_system

# OR run automated demo directly
echo "2" | ./ride_sharing_system

# Build and run comprehensive test suite
make test
./test_suite

# View available make targets
make help
```

#### C++ Demo Features:
- **Interactive Mode**: Menu-driven interface for manual testing
- **Automated Demo**: Complete scripted demonstration without user input
- **Polymorphism Showcase**: Live demonstration of virtual method dispatch
- **Memory Management**: Smart pointer demonstration
- **Error Handling**: Input validation and recovery examples

### 🎯 SmallTalk Implementation

#### Running with GNU SmallTalk (Recommended)
```bash
# Navigate to SmallTalk directory
cd smalltalk

# Option 1: Run complete demo (best output)
gst Demo.st

# Option 2: Simple test to verify installation
echo "Transcript show: 'GNU SmallTalk is working!'; cr." | gst

# Option 3: Load individual files manually
gst -f Ride.st -f RideTypes.st -f Driver.st -f Rider.st -f RideSharingSystem.st -f CLI.st -f Test.st -f Demo.st
```

#### SmallTalk Demo Features:
- **9-Step Comprehensive Demo**: Matches C++ implementation structure
- **3 Drivers & 3 Riders**: Multiple entities with unique IDs
- **5 Different Rides**: Various ride types with real locations
- **Dynamic Rating Updates**: Demonstrates encapsulation with controlled data access
- **System Statistics**: Revenue, distance, and fare calculations
- **Message-based OOP**: Pure object-oriented message passing
- **Dynamic typing**: Runtime type resolution

#### Alternative: Using Other SmallTalk Environments
**For Pharo/Squeak users:**
1. Load each `.st` file in order using the File Browser
2. Execute `Demo.st` in a Workspace

**Manual execution in any SmallTalk environment:**
```smalltalk
"Load and run the complete demo"
gst Demo.st
```

#### SmallTalk Demo Features:
- **Message-based OOP**: Pure object-oriented message passing
- **Dynamic Typing**: Runtime type resolution
- **Live Object Inspection**: Interactive object exploration
- **Transcript Output**: Real-time logging and feedback
- **Collection Management**: OrderedCollection usage examples

### 🧪 Testing Both Implementations

#### C++ Testing
```bash
cd cpp
make test        # Build test suite
./test_suite     # Run all tests (28 test cases)
make check       # Build and run in one command
```

#### SmallTalk Testing
```bash
# GNU SmallTalk testing (command line)
cd smalltalk

# Option 1: Run complete demo with integrated tests
gst Demo.st

# Option 2: Run separate test file (if using modular approach)
gst Test.st

# Option 3: Load all files then run tests manually
gst -e "FileStream fileIn: 'Ride.st'. FileStream fileIn: 'RideTypes.st'. FileStream fileIn: 'Driver.st'. FileStream fileIn: 'Test.st'. | testSuite | testSuite := RideSharingTestSuite new. testSuite runAllTests."
```

### 📊 Expected Output Examples

#### C++ Demo Output Sample:
```
[LOG] Ride Sharing System initialized
Welcome to the C++ Ride Sharing System!
Choose mode:
1. Interactive Mode
2. Automated Demo
Enter choice: 

==================================================
AUTOMATED DEMO - RIDE SHARING SYSTEM
==================================================
[LOG] Starting comprehensive demonstration of OOP principles...

==================================================
STEP 1: CREATING DRIVERS (ENCAPSULATION)
==================================================
[LOG] Demonstrating encapsulation with Driver class...
[LOG] Created driver: John Smith (ID: 1)
[LOG] Created driver: Maria Garcia (ID: 2)
[LOG] Created driver: David Chen (ID: 3)
```

#### SmallTalk Demo Output Sample (GNU SmallTalk):
```bash
$ cd smalltalk
$ gst Demo.st
==================================================
AUTOMATED DEMO - RIDE SHARING SYSTEM
==================================================
[LOG] Starting comprehensive demonstration of OOP principles...

==================================================
STEP 1: CREATING DRIVERS (ENCAPSULATION)
==================================================
[LOG] Demonstrating encapsulation with Driver class...
✓ Created Driver #1: John Smith (Rating: 5)
✓ Created Driver #2: Maria Garcia (Rating: 5)
✓ Created Driver #3: David Chen (Rating: 5)

==================================================
STEP 3: CREATING RIDES (INHERITANCE & POLYMORPHISM)
==================================================
[LOG] Demonstrating inheritance with different ride types...
✓ Created Standard Ride: Downtown → Airport (15.5 miles)
✓ Created Premium Ride: Hotel District → Business Center (8.2 miles)

==================================================
STEP 8: SYSTEM STATISTICS
==================================================
System Statistics:
  Total Drivers: 3
  Total Riders: 3
  Total Rides: 5
  Total Distance: 64 miles
  Total Revenue: $214

✓ ENCAPSULATION: Private data members with controlled access
✓ INHERITANCE: Base Ride class with derived classes  
✓ POLYMORPHISM: Virtual methods called on base class pointers
```