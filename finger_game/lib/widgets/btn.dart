import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(0, 2)
              )]
            ),
            child: Text(text),
          );
  }
}