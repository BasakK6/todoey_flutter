import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/model/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy bread"),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get tasksCount => _tasks.length;

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

  void deleteTast(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
