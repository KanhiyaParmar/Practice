import 'package:elredtask/Screens/TaskScreens/updateTaskScreen.dart';
import 'package:elredtask/modelClass/taskModel.dart';
import 'package:elredtask/provider/loginProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ConsumerModel.dart';
import '../../utils/constant.dart';
import 'addTaskScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callFunction();
  }

  callFunction() {
    Provider.of<TaskModel>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    TaskModel task = Provider.of<TaskModel>(context);
    GoogleSignInProvider userProvider =
        Provider.of<GoogleSignInProvider>(context);

    //  task.getData();
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                userLoginDetail == null
                    ? const CircleAvatar()
                    : CircleAvatar(
                        maxRadius: 40,
                        backgroundImage: NetworkImage(userLoginDetail
                                .photourl ??
                            "https://www.freeiconspng.com/thumbs/person-icon/clipart--person-icon--cliparts-15.png"),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Text(userLoginDetail.name ?? "")
              ],
            )),
            ListTile(
              onTap: () {
                userProvider.googleLogout(context);
              },
              leading: const Icon(Icons.logout),
              title: const Text("LogOut"),
            )
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: false,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.network(
                  "https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg",
                  fit: BoxFit.cover,
                ) //Images.network
                ), //FlexibleSpaceBar
            expandedHeight: 230,
            backgroundColor: Colors.greenAccent[400],

            // ), //IconButton
            // actions: <Widget>[
            //   IconButton(
            //     icon: const Icon(Icons.comment),
            //     tooltip: 'Comment Icon',
            //     onPressed: () {},
            //   ), //IconButton
            //   IconButton(
            //     icon: const Icon(Icons.settings),
            //     tooltip: 'Setting Icon',
            //     onPressed: () {},
            //   ), //IconButton
            // ],
            //<Widget>[]
          ),

          SliverFillRemaining(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: task.taskList.length,
              itemBuilder: (BuildContext context, int index) {
                AddTaskModel taskModel = task.taskList[index];
                return ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text('Task'),
                              content: Text(
                                  taskModel.userId == userLoginDetail.id
                                      ? 'This is content'
                                      : "You Cannot Edit it"),
                              actions: [
                                taskModel.userId == userLoginDetail.id
                                    ? Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UpdateTask(
                                                                addTaskModel:
                                                                    taskModel)));
                                              },
                                              child: const Text("Update")),
                                          ElevatedButton(
                                              onPressed: () {
                                                task.remove(taskModel);
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Delete")),
                                        ],
                                      )
                                    : ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ok"))
                              ],
                            ));
                  },
                  tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
                  leading: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        shape: BoxShape.circle),
                    child: const Icon(Icons.group_off),
                  ),
                  title: Text(taskModel.task),
                  subtitle: Text(taskModel.descripation),
                  trailing: Column(
                    children: [Text(taskModel.time)],
                  ),
                );

                // SlideWidget(
                //   taskModel: task.taskList[index],
                // );
              },
            ),
          ),
          //SliverList
        ], //<Widget>[]
      ), //CustonScroll

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // task.getData();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTask(),
            ),
          );
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
