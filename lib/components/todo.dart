import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  final String userInput;

  const Todo(this.userInput);
  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  // Added semicolon to the constructor
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 10.0, left: 40.0, right: 40.0, bottom: 10.0),
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black, spreadRadius: 1),
          ]),
      child: Row(
        children: [
          Text(widget.userInput), // Removed const from Text widget
          IconButton(
            onPressed: () {
              print("Check button pressed");
            },
            icon: const Icon(Icons.check),
          ),
          IconButton(
            onPressed: () {
              // setState() {
              // }
              print(widget.userInput.hashCode);
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
