# Design Requirements
Please carefully read through the instructions in the `README.md` as well as this one. 

## Problem 
Build a Flutter app that fetches and displays quotes from an API server. 
 <br><br/>

## Requirements 
### App Design 
The app should contain the following screens:
#### **1. Home Screen**
Design a simple home screen that displays a list of quotes. Each item in the list should contain the quote content and the name of the author. When an item in the list is clicked, the Quote Details screen should be displayed. 

To fetch the list of quotes, use this API: `https://api.quotable.io/quotes/random?limit=50`, where `limit` is set to 50 to return a list of 50 items. 

Sample response:
```
[
  {
    "_id": "vbTwRyX9uu",
    "content": "Genius unrefined resembles a flash of lightning, but wisdom is like the sun.",
    "author": "Franz Grillparzer",
    "tags": [
      "Wisdom"
    ],
    "authorSlug": "franz-grillparzer",
    "length": 76,
    "dateAdded": "2019-02-11",
    "dateModified": "2023-04-14"
  }
...
]

```

#### 2. Quote Details Screen
Design a simple details screen that displays the following details about a quote item: 
* Content
* Author
* Tags
* Date Added
* Date Modified

To fetch details for a quote, use this API: `https://api.quotable.io/quotes/:id`, where `:id` is the quote ID. 

Sample response:
```
{
  "_id": "R80GBolDfAev",
  "content": "Life is like a sewer. What you get out of it depends on what you put into it.",
  "author": "Tom Lehrer",
  "tags": [
    "Famous Quotes"
  ],
  "authorSlug": "tom-lehrer",
  "length": 77,
  "dateAdded": "2021-01-20",
  "dateModified": "2023-04-14"
} 
```

Enable back navigation to the Home screen from the Quote Details screen.
### Sample UI 
Here are mockups of what the implementation could look like
![mockups](https://github.com/JArchitectMPlus/flutter-test/assets/169656293/6100e6a5-4585-414d-b116-ba6e8e3db565)



<br><br/>
### Recommended Tech Stack
The app should be built using Clean Architecture principles. While it is recommended that the following packages be used to build the stack, it is not a strict requirement. 
> No matter the components used in the stack be prepared with clear and detailed rationale for the choices. 
1. **Riverpod** for state management and dependency injection
2. **Dio** for networking
3. **Mockito** for testing
   
