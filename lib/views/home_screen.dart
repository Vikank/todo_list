import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../widgets/task_item_widget.dart';
import '../views/add_task_dialog.dart';

class HomeScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
        itemCount: taskController.tasks.length,
        itemBuilder: (context, index) {
          final task = taskController.tasks[index];
          return TaskItemWidget(task: task);
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(AddTaskDialog()),
        child: const Icon(Icons.add),
      ),
    );
  }
}