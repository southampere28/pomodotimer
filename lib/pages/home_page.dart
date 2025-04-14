import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodotimer/theme.dart';
import 'package:intl/intl.dart';
import 'package:pomodotimer/widgets/cardlevel_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int menuActive = 0; // index menus
  int currentIndex = 0; // Index showing tips Message
  late Timer _timer; // timer for tips messages indexing

  // Tips Message
  List<String> tips = [
    "Don't Waste Time for No Reason, Be Productive!",
    "Focus on One Task at a Time.",
    "Set Clear Goals and Prioritize Your Tasks.",
    "Take Breaks to Refresh Your Mind and Body.",
    "Stay Organized and Plan Your Day.",
    "Use the Pomodoro Technique for Maximum Focus.",
    "Keep Your Workspace Clean for Better Productivity.",
    "Don't Procrastinate, Take Action Now!",
    "Remember: Time is Your Most Valuable Asset.",
    "Consistency is Key to Achieving Your Goals."
  ];

  @override
  void initState() {
    super.initState();
    // Mengatur timer untuk mengubah teks setiap 3 detik
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        // Update index untuk mengganti teks
        currentIndex = (currentIndex + 1) % tips.length;
      });
    });
  }

  @override
  void dispose() {
    // Hentikan timer ketika widget dihapus dari tree
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat("EEEE, dd/MM/yyyy");
    var dateString = format.format(DateTime.now());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "POMODOT1MER",
                        style: titleTextStyle.copyWith(
                            fontSize: 14, fontWeight: bold),
                      ),
                      Text(dateString,
                          style: primaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: regular)),
                    ],
                  )),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 50, bottom: 50),
                child: Text(
                  'Choose Your Difficulty',
                  style:
                      primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          menuActive = 0;
                        });
                      },
                      child: CardLevel(
                        title: 'Easy',
                        arrayContent: const [
                          "work 25 min",
                          "break 5 min",
                          "repeat 2x",
                          "work 25 min",
                          "long break 30 min"
                        ],
                        isActive: menuActive == 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          menuActive = 1;
                        });
                      },
                      child: CardLevel(
                        title: 'Medium',
                        arrayContent: const [
                          "work 25 min",
                          "break 5 min",
                          "repeat 3x",
                          "work 25 min",
                          "long break 30 min"
                        ],
                        isActive: menuActive == 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          menuActive = 2;
                        });
                      },
                      child: CardLevel(
                        title: 'Hard',
                        arrayContent: const [
                          "work 25 min",
                          "break 5 min",
                          "repeat 3x",
                          "work 25 min",
                          "long break 15 min"
                        ],
                        isActive: menuActive == 2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          menuActive = 3;
                        });
                      },
                      child: CardLevelCustom(isActive: menuActive == 3),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  text: 'Tips: ',
                  style:
                      primaryTextStyle.copyWith(fontSize: 10, fontWeight: bold),
                  children: [
                    TextSpan(
                        text: tips[currentIndex],
                        style: subtitleTextStyle.copyWith(
                            fontSize: 10, fontWeight: regular)),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Test');
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(whiteColor),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return whiteColor; // Warna saat ditekan
                              }
                              return blackColor;
                            },
                          ),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return blackActiveColor; // Warna saat ditekan
                              }
                              return null; // default
                            },
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side:
                                  const BorderSide(color: blackColor, width: 2),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(4),
                          shadowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.black)),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Text('Start Now',
                              style: (GoogleFonts.poppins().copyWith(
                                  fontSize: 14, fontWeight: medium))))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
