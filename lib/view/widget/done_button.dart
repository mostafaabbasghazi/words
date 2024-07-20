import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  final int color;
  final VoidCallback onPressed;
  const DoneButton({super.key, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Center(child: Text("Done",style: TextStyle(color: Color(color),fontWeight: FontWeight.bold),),),
      ),
    );
  }
}