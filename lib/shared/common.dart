import 'package:flutter/material.dart';

const textboxDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.black45,
  ),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF795548),
      width: 1.0,
    ),
  ),
);
