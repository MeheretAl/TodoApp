import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class button extends StatelessWidget {
  final String text;
  VoidCallback onClicked;
  button({super.key,required this.text,required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClicked,
      color: Theme.of(context).primaryColor,
      child: Text(text),
      

      );
    
  }
}