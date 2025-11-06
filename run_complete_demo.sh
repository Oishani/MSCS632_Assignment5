#!/bin/bash

# Complete Ride Sharing System Demo Script
# Runs demonstrations for both C++ and SmallTalk implementations

echo "================================================================"
echo "MSCS632 ASSIGNMENT 5: RIDE SHARING SYSTEM"
echo "Object-Oriented Programming in C++ and SmallTalk"
echo "================================================================"
echo ""

# Function to run C++ demo
run_cpp_demo() {
    echo "Running C++ Implementation Demo..."
    echo "=================================="
    cd cpp
    
    if [ -f "run_demo.sh" ]; then
        chmod +x run_demo.sh
        ./run_demo.sh
    else
        echo "Building and running C++ demo manually..."
        make clean && make
        if [ $? -eq 0 ]; then
            echo "2" | ./ride_sharing_system
            echo ""
            echo "Running tests..."
            make test && ./test_suite
        fi
    fi
    
    cd ..
}

# Function to run SmallTalk demo
run_smalltalk_demo() {
    echo ""
    echo "Running SmallTalk Implementation Demo..."
    echo "========================================"
    cd smalltalk
    
    # Check if GNU SmallTalk is available
    if command -v gst >/dev/null 2>&1; then
        echo "GNU SmallTalk found. Running demonstration..."
        echo ""
        echo "Running SmallTalk demonstration..."
        gst Demo.st 2>&1 | cat
        echo ""
        echo "SmallTalk demo completed successfully!"
    else
        echo "GNU SmallTalk (gst) not found."
        echo "Install with: brew install gnu-smalltalk (macOS)"
        echo "           or: sudo apt install gnu-smalltalk (Ubuntu)"
        echo ""
        echo "Manual execution instructions:"
        echo "1. Install GNU SmallTalk"
        echo "2. Navigate to smalltalk/ directory"  
        echo "3. Run: cat CompleteDemo.st | gst"
        echo "   or: gst CompleteDemo.st (direct execution)"
        echo ""
        echo "Alternative SmallTalk environments (Pharo, Squeak):"
        echo "- Load each .st file in order using File Browser"
        echo "- Execute RunDemo.st in Workspace"
    fi
    
    cd ..
}

# Main execution
echo "Starting comprehensive demonstration..."
echo ""

# Change to project directory
cd "$(dirname "$0")"

# Run C++ demo
run_cpp_demo

# Run SmallTalk demo
run_smalltalk_demo