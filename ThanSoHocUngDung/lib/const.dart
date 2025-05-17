import 'package:flutter/material.dart';

const kInputDecoration = InputDecoration(
  hintText: 'Input the hint text',
  hintStyle: TextStyle(color: Color(0xff63717e)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  filled: true,
  fillColor: Color(0xff292D32),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF777777)),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff19363A), width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
);
