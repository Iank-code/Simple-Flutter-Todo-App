import 'package:flutter/material.dart';
import 'package:todo_app/components/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userInput = "";
  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.forward))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20.0, left: 70.0, right: 70.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(left: 20.0),
                labelText: 'Add a new todo',
                hintText: 'Add a new todo',
              ),
              onChanged: (text) {
                setState(
                  () {
                    userInput = text.characters.toString();
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  data.add(userInput);
                  userInput = "";
                });
              },
              child: const Text('Add'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Todo(data[index]); 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
