import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/model/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final task = taskData.tasks[index];

            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTast(task);
              },
            );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}
