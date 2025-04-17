import 'package:flutter/material.dart';
import 'package:pomodotimer/theme.dart';
import 'package:pomodotimer/widgets/header_widget.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({super.key});

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  List<Map<String, dynamic>> dataExample = [
    {"title": "work", "time": "25 min"},
    {"title": "break", "time": "5 min"},
    {"title": "work", "time": "25 min"},
    {"title": "break", "time": "5 min"},
    {"title": "work", "time": "25 min"},
    {"title": "break", "time": "5 min"},
  ];

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

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
                  for (int index = 0; index < dataExample.length; index += 1)
                    Padding(
                      key: Key('$index'),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${dataExample[index]["time"]}'),
                          ListTile(
                            tileColor: evenItemColor,
                            title: Text(dataExample[index]["title"]),
                          ),
                        ],
                      ),
                    ),
                ],
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final item = dataExample.removeAt(oldIndex);
                    dataExample.insert(newIndex, item);
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Total : 2 Hour 15 min')
            ],
          ),
        ),
      ),
    );
  }
}
