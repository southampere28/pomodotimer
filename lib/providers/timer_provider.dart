import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pomodotimer/model/timer_item.dart';

class TimerProvider with ChangeNotifier {
  List<TimerItem> _customTimers = [
    TimerItem(title: "Work", timer: 25),
    TimerItem(title: "Break", timer: 5),
    TimerItem(title: "Work", timer: 25),
    TimerItem(title: "Break", timer: 5),
  ];

  List<TimerItem> get customTimers => _customTimers;

  void addTimer(TimerItem timer) {
    _customTimers.add(timer);
    notifyListeners();
  }

  void removeTimer(int index) {
    _customTimers.removeAt(index);
    notifyListeners();
  }

  void reorderTimer(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = _customTimers.removeAt(oldIndex);
    _customTimers.insert(newIndex, item);
    notifyListeners();
  }

  int countTimeLength() {
    int sum = 0;
    for (int index = 0; index < _customTimers.length; index++) {
      sum += _customTimers[index].timer;
    }
    return sum;
  }
}
