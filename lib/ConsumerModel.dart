import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelClass/taskModel.dart';

class TaskModel extends ChangeNotifier {
// var uuid = const Uuid();
  final List<AddTaskModel> _taskList = [];

  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();

  final String _taskValue = "gg";

  List<AddTaskModel> get taskList => _taskList;

  String get taskValue => _taskValue;
//  GlobalKey<PopupMenuButtonState<int>> get key => _key;

  void add(AddTaskModel task, BuildContext context) {
    _taskList.add(task);
    FirebaseFirestore.instance.collection("task_table").doc(task.id).set({
      "task": task.task,
      "des": task.descripation,
      "time": task.time,
      "place": task.Place,
      "notify": task.notification,
      "id": task.id,
      "userid": task.userId,
    });

    notifyListeners();
    Navigator.pop(context);
  }

  getData() {
    print("ebfjqwebrjwberjthbjrwh");
    FirebaseFirestore.instance.collection("task_table").get().then((value) {
      _taskList.clear();
      notifyListeners();
      for (var element in value.docs) {
        AddTaskModel data = AddTaskModel(
            Place: element['place'],
            task: element["task"],
            notification: element["notify"],
            time: element["time"],
            id: element['id'],
            userId: element['userid'],
            descripation: element["des"]);

        _taskList.add(data);
        notifyListeners();
      }
    });
  }

  void update(AddTaskModel task, context) {
    int index = _taskList.indexWhere((t) => t.id == task.id);
    _taskList[index] = task;
    FirebaseFirestore.instance.collection("task_table").doc(task.id).update({
      "task": task.task,
      "des": task.descripation,
      "time": task.time,
      "place": task.Place,
      "notify": task.notification,
      "id": task.id,
      "userid": task.userId
    });
    notifyListeners();
    Navigator.pop(context);
  }

  remove(AddTaskModel todo) {
    print(todo.id);
    print("=======");
    _taskList.remove(todo);
    FirebaseFirestore.instance.collection('task_table').doc(todo.id).delete();
    notifyListeners();
  }
}
