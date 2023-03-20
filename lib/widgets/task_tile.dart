import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "This is a task",
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        isChecked: isChecked,
        toggleCheckboxState: (bool? checkboxState) {
          setState(() {
            isChecked = checkboxState ?? false;
          });
        },
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    super.key,
    required this.isChecked,
    required this.toggleCheckboxState,
  });

  final bool isChecked;
  final Function toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isChecked,
      onChanged: (bool? value) {
        toggleCheckboxState.call(value);
      },
    );
  }
}
