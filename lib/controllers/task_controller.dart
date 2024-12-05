import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/task_model.dart';

class TaskController extends GetxController {
  final RxList<Task> tasks = <Task>[].obs;

  void addTask(String title) {
    final newTask = Task(
        id: const Uuid().v4(),
        title: title
    );
    tasks.add(newTask);
  }

  void toggleTaskCompletion(Task task) {
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task.copyWith(isCompleted: !task.isCompleted);
    }
  }

  void deleteTask(Task task) {
    tasks.removeWhere((t) => t.id == task.id);
  }
}