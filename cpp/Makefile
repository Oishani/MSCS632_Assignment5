# Compiler settings
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2
TARGET = ride_sharing_system
TEST_TARGET = test_suite

# Source files
SOURCES = Ride.cpp Driver.cpp Rider.cpp RideSharingSystem.cpp main.cpp
TEST_SOURCES = Ride.cpp Driver.cpp Rider.cpp RideSharingSystem.cpp test.cpp

# Header files (for dependency tracking)
HEADERS = Ride.h Driver.h Rider.h RideSharingSystem.h

# Object files
OBJECTS = $(SOURCES:.cpp=.o)
TEST_OBJECTS = $(TEST_SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Build main application
$(TARGET): $(OBJECTS)
	@echo "Linking $(TARGET)..."
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJECTS)
	@echo "Build complete! Run with: ./$(TARGET)"

# Build test suite
test: $(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJECTS)
	@echo "Linking test suite..."
	$(CXX) $(CXXFLAGS) -o $(TEST_TARGET) $(filter-out main.o, $(TEST_OBJECTS))
	@echo "Test suite built! Run with: ./$(TEST_TARGET)"

# Compile source files
%.o: %.cpp $(HEADERS)
	@echo "Compiling $<..."
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run the application
run: $(TARGET)
	./$(TARGET)

# Run automated demo
demo: $(TARGET)
	echo "2" | ./$(TARGET)

# Run tests
check: $(TEST_TARGET)
	./$(TEST_TARGET)

# Clean build files
clean:
	@echo "Cleaning build files..."
	rm -f $(OBJECTS) $(TEST_TARGET).o $(TARGET) $(TEST_TARGET)
	@echo "Clean complete!"

# Install dependencies (if needed)
install:
	@echo "No external dependencies required for this C++ project."

# Show help
help:
	@echo "Available targets:"
	@echo "  all      - Build the main application (default)"
	@echo "  test     - Build the test suite"
	@echo "  run      - Build and run the application"
	@echo "  demo     - Build and run automated demo"
	@echo "  check    - Build and run tests"
	@echo "  clean    - Remove build files"
	@echo "  help     - Show this help message"

# Phony targets
.PHONY: all test run demo check clean install help
