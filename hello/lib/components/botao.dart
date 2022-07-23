import 'package:flutter/material.dart';

import 'package:hello/screens/home.dart';

class Boat extends StatelessWidget {
  const Boat({Key? key, this.text = "Enviar", this.onPressed=null}) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
