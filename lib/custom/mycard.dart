import 'package:flutter/material.dart';
class myCard extends StatelessWidget {

  final String title;
  const myCard({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white.withOpacity(0.5),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}