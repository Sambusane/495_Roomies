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
* Users can login
* Users can see a list of all tasks assigned to them
* Users can see a list of rooms they are in
* Users can create a room
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
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
