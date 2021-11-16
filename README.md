# Roomies

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Allows users to create Rooms with their house/roommates to assign and keep track of completion of household tasks.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Household/Organizational
- **Mobile:** iPhone app, Mobile first experience
- **Story:** Users can keep track of chores in shared spaces. Giving them a convient way to keep a list of tasks that 
             they have access to as long as they have a phone. 
- **Market:** College students, renters, families, office workers
- **Habit:** users can create tasks as the chores arise, so multiple times a day
- **Scope:** Allowing users to just keep track of tasks but would like to expand to messaging and commenting options 
             among users.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can create an account
    * ![](https://i.imgur.com/9ccHAqp.gif)

* Users can login
    * ![](https://i.imgur.com/Z0uyhBU.gif)

* Users can see a list of all tasks assigned to them
* Users can see a list of rooms they are in
* Users can create a room
   * Previous 3 stories in this gif 
	<img src='https://github.com/Sambusane/495_Roomies/blob/main/Roomies/Roomies/Milestone2Roomies.gif?raw=true' title='Video Walkthrough' width='' alt='Video Walkthrough' />
* Users can add other users to the room
* Users can create tasks in the room
* Users can assign tasks in the room
* Users can mark a task complete

**Optional Nice-to-have Stories**

* Users can delete a room
* Users can see how many tasks they have completed 
* Users can add personal tasks without creating a room
* Users can post comments in the room
* Users can message other users

### 2. Screen Archetypes

* Login
   * Users can login 
* Register
   * Users can create an account
* Stream
   * Users can see a list of all tasks assigned to them
   * Users can mark a task complete
* Rooms
   * Users can see a list of rooms they are in
   * Users can create a room
* Room
   * Users can add other users to a room
   * Users can create tasks in the room
   * Users can assign tasks to others users
   * Users can mark a task complete
* Task
   * Users can create a task

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Stream
* Rooms

**Flow Navigation** (Screen to Screen)

* Login
   * Stream
   * Register
* Register
   * Stream
* Stream
  * Task
  * Rooms
* Rooms
  * Room
* Room
  * Task   

## Wireframes

<img src="https://raw.githubusercontent.com/Sambusane/495_Roomies/main/IMG_0059.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
* Users:
	* userId: String, unique ID for each user that is created
	* Username: String, a unique identifier chosen by the user
	* Rooms: List, a list of roomIDs that the user has been assigned to
	* Password: String, a password created by the user 
* Rooms:
	* roomID: String, a unique identifier for each room created
	* Roomname: String, a non unique identifier for the room created by the user
	* Tasks: List, a list of tasks created for that room
	* Users: List, all users assigned to a room
* Tasks:
	* TaskID: string, a unique identifier generated for each task
	* Taskname:string,  a non unique identifier given by the user
	* Description: string, a description of the task given by the user
	* createrID: string, the id of the user who created the task
	* assignID: string, the id of the user assigned to the task

### Networking
- Login Screen
(Read/GET) Query logged in user object
let query = PFQuery(className:"User")
query.whereKey("id", equalTo: currentUser)
var user = [PFObject]?
   if let error = error {
      print(error.localizedDescription)
   } else if let user =  {
      print("Successfully retrieved \(user) ")
      // TODO: Do something with users...
   }
}
- Register Screen
(Create/OBJECT) Create a new user object
let newUser = PFUser()   
    // set user properties
    newUser.username = usernameField.text
    newUser.email = emailField.text
    newUser.password = passwordField.text
    // call sign up function on the object
    newUser.signUpInBackground { (success: Bool, error: Error?) in
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("User Registered successfully")
            // manually segue to logged in view
        }
    }
}
- Stream Screen
let query = PFQuery(className:"Task")
query.order(byDescending: "createdAt")
query.findObjectsInBackground { (tasks: [PFObject]?, error: Error?) in
   if let error = error {
      print(error.localizedDescription)
   } else if let tasks = tasks {
      print("Successfully retrieved \(tasks.count) tasks.")
      // TODO: Do something with posts...
   }
}
(Read/GET) Query existing task object(s)
- Rooms Home Screen
let query = PFQuery(className:"Room")
query.order(byDescending: "createdAt")
query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
   if let error = error {
      print(error.localizedDescription)
   } else if let rooms = rooms {
      print("Successfully retrieved \(rooms.count) rooms.")
      // TODO: Do something with rooms...
   }
}
(Read/GET) Query existing room object(s)
- Create Room Screen
(Create/OBJECT) Create a new room object
let newRoom = PFUser()   
    // set room properties
    newUser.roomName = roomnameField.text
    // call room creation on object
    newUser.signUpInBackground { (success: Bool, error: Error?) in
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Room created successfully")
            // manually segue to rooms view
        }
    }
}
- Individual Room Home Screen

let query = PFQuery(className:"Rooms")
query.whereKey("id", equalTo: currentUser)
query.order(byDescending: "createdAt")
query.findObjectsInBackground { (rooms: [PFObject]?, error: Error?) in
   if let error = error {
      print(error.localizedDescription)
   } else if let rooms = rooms {
      print("Successfully retrieved \(posts.count) posts.")
      // TODO: Do something with posts...
   }
}
(Read/GET) Query existing task object(s) for user-selected room

- Add People Screen
let query = PFQuery(className:"User")
query.whereKey("id", equalTo: currentUser)
var user = [PFObject]?
   if let error = error {
      print(error.localizedDescription)
   } else if let user =  {
      print("Successfully retrieved \(user) ")
      // TODO: Do something with users...
   }
}
(Read/GET) Query existing user object(s) for user-selected room
- Add Task Screen
let newTask = PFObject()   
    // set task properties
    newTask.name = nameField.text
    newTask.description = descriptionField.text
    // call task creation on the object
    newTask.createInBackground { (success: Bool, error: Error?) in
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Task created successfully")
            // manually segue to individual room view
        }
    }
}
(Create/OBJECT) Create a new task object
- Task Screen
(Read/GET) Query user-selected task object

