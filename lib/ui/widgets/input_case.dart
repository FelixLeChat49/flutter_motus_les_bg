import 'package:flutter/material.dart';

class InputCase extends StatefulWidget {
  const InputCase({Key? key}) : super(key: key);

  @override
  State<InputCase> createState() => _InputCaseState();
}

class _InputCaseState extends State<InputCase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/5,
      child: TextField(),
    );
  }
}
