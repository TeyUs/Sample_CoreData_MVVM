# Basic Todo App

### It was created as an example of how to use [MVVMBaseProtocols](https://github.com/TeyhanYtu/MVVMBaseProtocols)

## Purpose of doing the project:
* Using the "Protocol Structure" on MWWM and CoreData in the best way in my opinion.
* To show an example of how the "BaseProtocols" folder can be used.

## Technical:

* Used MVVM as structural pattern.
* Attention was paid to the protocol structure.
* Seperated Storyboard prefered for all different page. "xib" was used only for TableView Cell.
* CoreData used for the local storage

## User can:

* User can see all todo at list screen.
* User can delete a created todo in list screen.
* User can delete and update a created todo in detail screen.
* User can create a new todo in new todo screen.

## Project Detail:

### Create Screen
<img width="439" alt="Screen Shot 2022-04-19 at 13 34 49" src="https://user-images.githubusercontent.com/53153396/163985728-4f3efd44-3c0f-4ce7-9917-07391ea57d81.png">

* Firstly user should create a new todo via plus signed navbar button.
* User can input todo title, details and color what it want. (User has to input todo title.)

### List Screen
<img width="439" alt="Screen Shot 2022-04-19 at 13 40 15" src="https://user-images.githubusercontent.com/53153396/163986616-178bcf4c-e82e-4159-b1bd-44484cfd1129.png">

* The app will return to the list screen, user can see created all todos.
* User can mark working switch.
* User can delete that todo by dragging the cell to the left.

### Detail Screen
<img width="439" alt="Screen Shot 2022-04-19 at 13 55 27" src="https://user-images.githubusercontent.com/53153396/163988948-a64ff634-6409-47c6-87ef-2e0c1a865fdc.png">

* If user touch any cell, that todo's detail screen will open.
* This screen looks pretty much like create screen.
* User can see title, details and chosen color in background.
* User also can mark working switch in this screen.
* User has to tap "Update" button after all change.
* User can delete this todo if tap trashcan icon in navbar.
