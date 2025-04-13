import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pomodotimer/theme.dart';
import 'package:intl/intl.dart';
import 'package:pomodotimer/widgets/cardlevel_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int menuActive = 0;

  @override
  Widget build(BuildContext context) {
    // var format = DateFormat.yMd('id');
    // var dateString = format.format(DateTime.now());

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
                      Text('Monday 09/04/25',
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
                          "repeat 2x",
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
                        title: 'Medium',
                        arrayContent: const [
                          "work 25 min",
                          "break 5 min",
                          "repeat 2x",
                          "work 25 min",
                          "long break 30 min"
                        ],
                        isActive: menuActive == 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          menuActive = 3;
                        });
                      },
                      child: CardLevel(
                        title: 'Custom',
                        arrayContent: const [
                          "work 25 min",
                          "break 5 min",
                          "repeat 2x",
                          "work 25 min",
                          "long break 30 min"
                        ],
                        isActive: menuActive == 3,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  text: 'Tips: ',
                  style:
                      primaryTextStyle.copyWith(fontSize: 10, fontWeight: bold),
                  children: [
                    TextSpan(
                        text: 'Dont Waste Time for No Reason Be Productive!',
                        style: primaryTextStyle.copyWith(
                            fontSize: 10, fontWeight: regular)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
