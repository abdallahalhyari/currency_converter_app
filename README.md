<p align="center">
<img src="Screenshots/6a6e3dcd-1356-436d-9f75-e4e5f5d564c8.jpg" width="200">
<img src="Screenshots/3933d909-e265-4c4c-bd8f-473e8a90c3bd.jpg" width="200">
<img src="Screenshots/87130960-6fe4-47f1-951d-9fc8047154f4.jpg" width="200">
<img src="Screenshots/b7425c1b-09d5-4e64-a2fb-3b186d2d394f.jpg" width="200">
</p>

# Currency 

A currency converter flutter app.

# Main Features

- List of supported currencies with their country’s flag. Store the data locally in a database
  after the first API request & load the data from it for future usage.
- Historical data for 2 currencies of your choosing for the last 7 days.
- Currency converter where the user can select 2 currencies with the amount to convert..


API used - https://free.currencyconverterapi.com
flags icons - https://flagcdn.com/

Packeages used -

- [http 1.2.1](https://pub.dev/packages/http)
- [page_transition 2.1.0](https://pub.dev/packages/page_transition)
- [flutter_bloc: ^8.1.6](https://pub.dev/packages/flutter_bloc)
- [get_it: ^7.7.0](https://pub.dev/packages/get_it)
- [syncfusion_flutter_charts: ^26.1.40](https://pub.dev/packages/syncfusion_flutter_charts)
- [intl: ^0.19.0](https://pub.dev/packages/intl)
- [sqflite: ^2.3.3+1](https://pub.dev/packages/sqflite)
- [shared_preferences: ^2.2.3](https://pub.dev/packages/shared_preferences)    
- [flutter_spinkit: ^5.2.1](https://pub.dev/packages/flutter_spinkit)
- [mockito: ^5.0.0](https://pub.dev/packages/mockito)
- [build_runner: ^2.1.2](https://pub.dev/packages/build_runner)
  
  
I have used **flutter_spinkit** and **sqflite** are consider the most popular libraries from flutter both of them have best higher liked and score 

**The state management and the pattern design :**<br />
**why bloc ??**<br />
  -Separation of Concerns: By separating the business logic from the UI, the code becomes more organized and easier to manage.<br />
  -Reusability: BLoC components can be reused across different parts of the application.<br />
  -Testability: Since the business logic is separated, it can be easily tested without depending on the UI.<br />
 **why bloc pattern ??**<br />
  -The BLoC pattern is a powerful approach to managing state in Flutter applications. By separating business logic from the UI, it promotes a cleaner and more maintainable codebase. <br/>
  -Implementing the BLoC pattern involves creating streams and sinks to handle data flow. <br/>
  -making the application more responsive and easy to test. As you build more complex applications.<br/> 
  -adopting the BLoC pattern can significantly improve your code's structure and maintainability.<br/>


**pre-build the app :**<br/>
  Set Up Your Development Environment<br/>
    1- Install Flutter SDK<br/>
  Go to the Flutter website.<br/>
  Follow the instructions for your operating system (Windows, macOS, or Linux).<br/>
   2- Set Up the PATH<br/>
      Extract the Flutter SDK to your desired location.<br/>
      Add the Flutter bin directory to your system's PATH environment variable.<br/>
   3- Install an Editor<br/>
      Install an IDE that supports Flutter, such as Visual Studio Code or Android Studio.<br/>
   4- Install Flutter and Dart Plugins <br/>
  For Visual Studio Code:<br/>
   Go to Extensions and install the Flutter and Dart plugins.<br/>
  For Android Studio:<br/>
   Go to Preferences > Plugins and install the Flutter and Dart plugins.<br/>

after the you are ready to open the app and run.


