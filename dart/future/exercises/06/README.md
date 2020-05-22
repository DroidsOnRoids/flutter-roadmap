# Exercise 6

![](https://img.shields.io/badge/Difficulty-medium-yellow)

Future in Flutter's UI tree.

Add `Text` widget as the `Column` child.  
Text should display message got from `_fetchMessage` method.  
Use FutureBuilder to handle asynchronous method in UI tree.  

1. Set `"Loading message..."` text when message is loading.  
   
   <img src="expected-loading.png" alt="drawing" height="300"/>

2. Set `"Ups! Something went wrong."` text when error occurred.  
   
   <img src="expected-error.png" alt="drawing" height="300"/>

3. Set fetched message as text in case of success.
   
   <img src="expected-success.png" alt="drawing" height="300"/>

