// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class reusable extends StatelessWidget {
  reusable(this.color, this.cardChild, this.onPress);

  final Color color;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // height: 200.0,
        // width: 400.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        // height: 200.0,
        // width: 170.0,
        child: cardChild,
      ),
    );
  }
}
