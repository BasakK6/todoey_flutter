import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        longPressCallback.call();
      },
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (bool? value) {
          checkboxCallback.call(value);
        },
      ),
    );
  }
}
