abstract class Vehicle {
  // Protected variable _speed
  int _speed = 0;

  // Abstract method move()
  void move();

  // Non-abstract method to set speed
  void setSpeed(int speed) {
    _speed = speed;
  }

  // Getter method to access speed (for encapsulation)
  int getSpeed() {
    return _speed;
  }
}

class Car extends Vehicle {
  // Implement the move() method
  @override
  void move() {
    print("The car is moving at ${getSpeed()} km/h");
  }
}
