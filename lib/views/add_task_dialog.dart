import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';

class AddTaskDialog extends StatelessWidget {
  final TaskController controller = Get.find();
  final TextEditingController textEditingController = TextEditingController();

  AddTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Task'),
      content: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(
          hintText: 'Enter task title',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (textEditingController.text.isNotEmpty) {
              controller.addTask(textEditingController.text);
              Get.back();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}