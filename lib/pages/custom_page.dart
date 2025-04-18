import 'package:flutter/material.dart';
import 'package:pomodotimer/model/timer_item.dart';
import 'package:pomodotimer/providers/timer_provider.dart';
import 'package:pomodotimer/theme.dart';
import 'package:pomodotimer/widgets/header_widget.dart';
import 'package:provider/provider.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({super.key});

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    TimerProvider timerprovider = Provider.of<TimerProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const HeaderPageWidget(),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 50, bottom: 24),
                child: Text(
                  'Modify Your Timer',
                  style:
                      primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ReorderableListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                children: <Widget>[
                  for (int index = 0;
                      index < timerprovider.customTimers.length;
                      index += 1)
                    Padding(
                      key: Key('$index'),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${timerprovider.customTimers[index].timer}'),
                          ListTile(
                            tileColor: Colors.grey.shade300,
                            title: Text(
                              timerprovider.customTimers[index].title,
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            trailing: GestureDetector(
                                onTap: () {
                                  timerprovider.removeTimer(index);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: alertColor,
                                )),
                          ),
                        ],
                      ),
                    ),
                ],
                onReorder: (int oldIndex, int newIndex) {
                  timerprovider.reorderTimer(oldIndex, newIndex);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                  'Total : ${convertMinutesToHoursAndMinutes(timerprovider.countTimeLength())}'),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              timerprovider
                  .addTimer(TimerItem(title: "Short Break", timer: 15));
            }),
      ),
    );
  }
}

String convertMinutesToHoursAndMinutes(int totalMinutes) {
  // Handle negative input
  if (totalMinutes < 0) {
    return "Invalid input: minutes cannot be negative";
  }

  // Calculate hours and remaining minutes
  final hours = totalMinutes ~/ 60; // Integer division in Dart
  final minutes = totalMinutes % 60;

  // Format the output
  if (hours == 0) {
    return "$minutes min";
  } else if (minutes == 0) {
    return "$hours hour${hours != 1 ? 's' : ''}";
  } else {
    return "$hours hour${hours != 1 ? 's' : ''} $minutes min";
  }
}
