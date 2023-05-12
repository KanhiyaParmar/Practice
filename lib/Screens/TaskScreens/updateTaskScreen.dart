import 'package:elredtask/ConsumerModel.dart';

import 'package:elredtask/modelClass/taskModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateTask extends StatefulWidget {
  final AddTaskModel addTaskModel;

  const UpdateTask({super.key, required this.addTaskModel});

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  TextEditingController _desController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _notifyController = TextEditingController();
  final GlobalKey<PopupMenuButtonState<int>> key = GlobalKey();
  String productType = 'Bag';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  readData() {
    productType = widget.addTaskModel.task;

    _desController =
        TextEditingController(text: widget.addTaskModel.descripation);

    _placeController = TextEditingController(text: widget.addTaskModel.Place);

    _timeController = TextEditingController(text: widget.addTaskModel.time);

    _notifyController =
        TextEditingController(text: widget.addTaskModel.notification);
  }

  @override
  Widget build(BuildContext context) {
    TaskModel task = Provider.of<TaskModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Update new thing"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const CircleAvatar(child: Icon(Icons.edit_attributes_outlined)),
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
              controller: _desController,
              decoration: const InputDecoration(hintText: "Descripation"),
            ),
            TextField(
              controller: _placeController,
              decoration: const InputDecoration(hintText: "Place"),
            ),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(hintText: "Time"),
            ),
            TextField(
              controller: _notifyController,
              decoration: const InputDecoration(hintText: "Notification"),
            ),
            ElevatedButton(
                onPressed: () {
                  task.update(
                      AddTaskModel(
                          task: productType,
                          descripation: _desController.text,
                          Place: _placeController.text,
                          time: _timeController.text,
                          id: widget.addTaskModel.id,
                          userId: widget.addTaskModel.userId,
                          notification: _timeController.text),
                      context);
                },
                child: const Text("Update your thing")),
          ],
        ),
      ),
    );
  }
}
