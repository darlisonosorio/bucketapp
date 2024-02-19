# bucketapp

A Flutter project that measures the operations to be performed in order to 
obtain de desired liters of water of the buckets in the most efficient 
way possible.

## About the Algorithm
This project makes use of Extended Euclid Augorithm for GCD (Greatest Common Divisor), 
to check if the gcd of x and y are divisors of z. 
After calculated GCD, the algorithm moves to the process of retrieveing the steps, starting from the value of x or y closest to z, and makes the operations empty, fill and transfer the buckets until one of them reach the desired value.

Example:
 X -> 3
 Y -> 5
 Z -> 4

Solution: (0,5) -> (3,2) -> (0,2) -> (2,0) -> (2,5) -> (3,4)


## How to Run

### Android
   - Install git in your system
   
   - Install flutter in your system by following the link [https://docs.flutter.dev/get-started/install]
   
   - Install Android Studio in your system
   
   - Run flutter doctor in your system terminal to see required uninstalled dependencies
   
   - Open Android Studio and go to SDK Manager to install the dependencies you saw in the previous step
   
   - Open your system terminal, go to the project page
   
   - Connect your device in the system. It's required to trust the system and enable USB Debug in your device developper settings.

   - Run the command in the terminal: flutter run android

### iOS
  - Download the project to a macOS system.

  - Make sure you have Xcode installed in your macOS system.

  - Follow the instructions in the link to install flutter in macOS [https://docs.flutter.dev/get-started/install/macos]

  - Connect your device in your macOS system

  - Double click in the Runner.xcworkspace to run the project in Xcode.

  - In XCode add your device as Target and select a Team in Signing configuration.

  - Press the play button

  -  More informations about how to run a flutter app in iOS are in the link [https://medium.com/front-end-weekly/how-to-test-your-flutter-ios-app-on-your-ios-device-75924bfd75a8]



