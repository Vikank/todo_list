import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/task_model.dart';
import '../controllers/task_controller.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final TaskController controller = Get.put(TaskController());

  TaskItemWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          task.title,
          style: TextStyle(
              decoration: task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none
          )
      ),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (_) => controller.toggleTaskCompletion(task),
      ),
      onLongPress: () => controller.deleteTask(task),
    );
  }
}