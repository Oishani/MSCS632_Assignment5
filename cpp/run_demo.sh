#!/bin/bash

# C++ Ride Sharing System Demo Script
# This script compiles and runs the complete demonstration

echo "======================================="
echo "C++ RIDE SHARING SYSTEM DEMO"
echo "======================================="

# Navigate to cpp directory
cd "$(dirname "$0")"

echo "Building the application..."
make clean
make

if [ $? -eq 0 ]; then
    echo "Build successful!"
    echo ""
    echo "======================================="
    echo "RUNNING AUTOMATED DEMO"
    echo "======================================="
    echo ""
    
    # Run automated demo (option 2)
    echo "2" | ./ride_sharing_system
    
    echo ""
    echo "======================================="
    echo "RUNNING TESTS"
    echo "======================================="
    echo ""
    
    # Build and run tests
    make test
    if [ $? -eq 0 ]; then
        ./test_suite
    else
        echo "Test build failed!"
    fi
    
else
    echo "Build failed! Please check for compilation errors."
    exit 1
fi

echo ""
echo "======================================="
echo "DEMO COMPLETE"
echo "======================================="
echo "All C++ functionality has been demonstrated!"
echo "Files created:"
echo "- ride_sharing_system (main executable)"
echo "- test_suite (test executable)"
