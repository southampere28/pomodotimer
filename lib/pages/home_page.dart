import 'package:flutter/material.dart';
import 'package:pomodotimer/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('This is Home',
            style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: bold)),
      ),
    );
  }
}
