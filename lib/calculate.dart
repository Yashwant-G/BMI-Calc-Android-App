import 'package:flutter/material.dart';
import 'dart:math';

class Calculate {
  Calculate(this.height, this.weight);

  final int height;
  final int weight;
  double _BMI = 0.0;

  String calculateBMI() {
    _BMI = weight / pow(height / 100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getResults() {
    if (_BMI >= 25) {
      return 'Overweight';
    } else if (_BMI <= 18) {
      return 'Underweight';
    } else {
      return 'Normal';
    }
  }

  String getTips() {
    if (_BMI >= 25) {
      return 'Being overweight increases the risk of a number of serious diseases and health conditions';
    } else if (_BMI > 18.5) {
      return 'You have a normal body weight, Gud Job😜';
    } else {
      return 'Underweight can be a sign of some underlying condition or disease such as anorexia nervosa, which has its own risks';
    }
  }
}
