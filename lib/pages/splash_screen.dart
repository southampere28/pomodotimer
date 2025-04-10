import 'package:flutter/material.dart';
import 'package:pomodotimer/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/app_logo.png",
                  width: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('POMODOT1MER',
                    style: titleTextStyle.copyWith(
                        fontSize: 20, fontWeight: bold)),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Setting Up Your Focus Session...',
                  style: subtitleTextStyle.copyWith(fontSize: 12),
                ),
              ],
            )),
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                'Developed By Pramudya',
                style: subtitleTextStyle.copyWith(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
