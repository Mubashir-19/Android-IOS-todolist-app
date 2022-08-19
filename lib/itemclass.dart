import 'package:first_app/main.dart';
import 'package:flutter/material.dart';

class Itemstate extends StatefulWidget {
  final String content;
  final int index;
  final Function setQuestion;
  final Function deleteQuestion;
  const Itemstate(
      this.content, this.index, this.setQuestion, this.deleteQuestion,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Item();
  }
}

class Item extends State<Itemstate> {
  TextEditingController? _controller;
  bool isEditable = false;

  void editlist() {
    widget.setQuestion(_controller!.text, widget.index);
    isEditable = !isEditable;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ButtonStyle style(MaterialColor back) {
      return (ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(back),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ));
    }

    return Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            color: Colors.blueAccent,
            width: 400,
            padding: const EdgeInsets.all(10),
            child: Row(key: _formKey, children: [
              Expanded(
                  child: isEditable
                      ? TextField(
                          controller: _controller,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 238, 238, 238),
                              decorationColor:
                                  Color.fromARGB(255, 238, 238, 238)),
                        )
                      : Text(
                          widget.content,
                          style: const TextStyle(
                              fontSize: 10,
                              //backgroundColor: Col
                              //or.fromARGB(255, 218, 81, 81),
                              color: Color(0xFFFFFFFF)),
                          textAlign: TextAlign.left,
                        )),
              Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 5, bottom: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isEditable
                          ? ElevatedButton(
                              onPressed: editlist,
                              style: style(Colors.green),
                              child: const Text(
                                "Done",
                                style: TextStyle(fontSize: 10),
                              ))
                          : ElevatedButton(
                              onPressed: () => setState(() {
                                    _controller = TextEditingController(
                                        text: widget.content);
                                    isEditable = !isEditable;
                                  }),
                              style: style(Colors.green),
                              child: const Text(
                                "Edit",
                                style: TextStyle(fontSize: 10),
                              )),
                      const SizedBox(width: 5),
                      ElevatedButton(
                          onPressed: () => widget.deleteQuestion(widget.index),
                          style: style(Colors.red),
                          child: const Text("Delete",
                              style: TextStyle(fontSize: 10)))
                    ],
                  ))
            ]),
          )
        ])));
  }
}
