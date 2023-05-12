import 'package:elredtask/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../ConsumerModel.dart';
import '../../modelClass/taskModel.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String productType = 'Bag';
  TextEditingController placeController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  TextEditingController notifyController = TextEditingController();

  TextEditingController desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TaskModel task = Provider.of<TaskModel>(context);
    final GlobalKey<PopupMenuButtonState<int>> key = GlobalKey();
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[100],
        elevation: 0,
        title: const Text("Add new thing"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  shape: BoxShape.circle),
              child: const Icon(Icons.group_off),
            ),
            const SizedBox(
              height: 30,
            ),
            DropdownButton<String>(
              value: productType,
              onChanged: (newValue) {
                setState(() {
                  productType = newValue!;
                });
              },
              items: <String>['Bag', 'Computer', 'Dress', 'Phone', 'Shoes']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Text(value)),
                );
              }).toList(),
            ),
            TextField(
              controller: desController,
              decoration: const InputDecoration(hintText: "Descripation"),
            ),
            TextField(
              controller: placeController,
              decoration: const InputDecoration(hintText: "Place"),
            ),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(hintText: "Time"),
            ),
            TextField(
              controller: notifyController,
              decoration: const InputDecoration(hintText: "Notification"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  var uuid = const Uuid().v4();

                  task.add(
                      AddTaskModel(
                          task: productType,
                          descripation: desController.text,
                          Place: placeController.text,
                          time: timeController.text,
                          id: uuid,
                          userId: userLoginDetail.id!,
                          notification: timeController.text),
                      context);
                },
                child: const Text("Add your thing")),
          ],
        ),
      ),
    );
  }
}
