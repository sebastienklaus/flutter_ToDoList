# Todo List app in Flutter (february/april 2022)

Made by Sébastien Klaus - LP CIASIE1 2021-2022

Welcome to my repo of the Todo List app developp with the [Flutter framework](https://flutter.dev/)

## Summary
- [Todo List app structure](#todo-list-app-structure)
- [The Flutter aspects addressed](#the-flutter-aspects-addressed)
- [Issues & Solutions](#issues--solutions)

## Todo List app structure

<p align="center">
<img src="https://github.com/sebastienklaus/flutter_ToDoList/blob/master/TodoList%20tree.drawio.png" alt="Todo List structure" width="600"/>
</p>

## The Flutter aspects addressed

There is many aspects of Flutter addressed in this project : 
- Stateless/Stateful widgets
- Design patterns : Refactoring, Observer
- Classes
- Route system
- Communication parent-child (in both ways)
- Provider (Consumer, Listeners)
- Communication with [API REST](https://jsonplaceholder.typicode.com/todos)

## Issues & Solutions

In this project, I encountered several major/minors issues, some about new discoveries (some issues are just because of tiredness :sleeping:) :
- Provider structure: [Issue solved](https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple#changenotifier)
- Sort by completed attribute : [Issue solved](https://stackoverflow.com/questions/61881850/sort-list-based-on-boolean#answers-header)
- decode the JSON datas from API : [Issue solved](https://stackoverflow.com/questions/55666787/how-to-fix-type-errors-when-parsing-json-in-flutter#answers-header)
