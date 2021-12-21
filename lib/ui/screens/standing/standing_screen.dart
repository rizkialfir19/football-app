import 'package:flutter/material.dart';
import 'package:football_app/common/common.dart';

class StandingScreen extends StatelessWidget {
  final Competition? data;

  const StandingScreen({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Standing Screen"),
    );
  }
}
