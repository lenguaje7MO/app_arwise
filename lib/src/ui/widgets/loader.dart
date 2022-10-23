import 'package:flutter/material.dart';

Widget loader() {
  return const Center(
    child: SizedBox(
      height: 50.0,
      width: 50.0,
      child: CircularProgressIndicator(
        strokeWidth: 7.0,
      ),
    ),
  );
}
