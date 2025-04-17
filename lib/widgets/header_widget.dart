import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pomodotimer/theme.dart';

class HeaderPageWidget extends StatefulWidget {
  const HeaderPageWidget({super.key});

  @override
  State<HeaderPageWidget> createState() => _HeaderPageWidgetState();
}

class _HeaderPageWidgetState extends State<HeaderPageWidget> {
  @override
  Widget build(BuildContext context) {
    var format = DateFormat("EEEE, dd/MM/yyyy");
    var dateString = format.format(DateTime.now());

    return Container(
        margin: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "POMODOT1MER",
              style: titleTextStyle.copyWith(fontSize: 14, fontWeight: bold),
            ),
            Text(dateString,
                style: primaryTextStyle.copyWith(
                    fontSize: 12, fontWeight: regular)),
          ],
        ));
  }
}
