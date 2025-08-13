import 'package:flutter/material.dart';

double mult(double b, double a) {
  return a * b;
}

double div(double b, double a) {
  if (b == 0) {
    throw ErrorDescription('You are trying to divide by zero');
  }
  return a / b;
}

double add(double b, double a) {
  return a + b;
}

double sus(double b, double a) {
  return a - b;
}
