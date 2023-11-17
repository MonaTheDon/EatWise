// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class v extends StatelessWidget {
  final double height;
  const v({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class h extends StatelessWidget {
  final double width;
  const h({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
