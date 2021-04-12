# Exercise 5

![](https://img.shields.io/badge/Difficulty-medium-yellow)

The `_fetchMessageWithTimeout` method returns `"Dart is easy!"` message after 10s.  
That takes too long.  

Add timeout handling that, after 2 seconds if `_fetchMessage` is not completed  
screen displays `"Fetching message took too long!"`

Run `dart main.dart` in terminal and check results.  

Terminal output after 2 seconds:  
```shell
Loading message...
Fetching message took too long!
```