import 'package:flutter/material.dart';
import './itemclass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //int a = 1;

  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  List<String> questions = [
    "What is youapooirngoieusargnpiuesrngoiseugrnpiaerngpiijigpr name: ",
    "What is your age: ",
    "What is your name: ",
    "What is your age: ",
    "What is your name: ",
    "What is your age: "
  ];
  void setQuestion(String s, int i) {
    setState(() {
      questions[i] = s;
    });
  }

  void deleteQuestion(int i) {
    setState(() {
      questions.removeAt(i);
    });
  }

  void addTodo() {
    setState(() {
      questions.add(_controller!.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Todo List App')),
            body: Container(
                child: Column(children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(20),
                  width: 400,
                  child: Column(
                    children: [
                      const Text(
                        "TodoList App",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 172, 172, 172)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 59, 59, 59),
                                  decorationColor:
                                      Color.fromARGB(255, 36, 128, 182)),
                            ),
                          ),
                          Flexible(
                            child: ElevatedButton(
                                onPressed: addTodo, child: const Text("add")),
                          )
                        ],
                      ),
                    ],
                  )),
              for (int i = 1; i < questions.length; i++) ...<Widget>[
                Itemstate(questions[i], i, setQuestion, deleteQuestion),
              ]
            ]))));
  }
}
