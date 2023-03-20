import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/model/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle ="";

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextFormField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                newTaskTitle = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () {
                if(newTaskTitle != ""){
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
