import 'package:flutter/material.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/ui/ui.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            Images.iconFootball,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
