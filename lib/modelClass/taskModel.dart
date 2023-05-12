class AddTaskModel {
  String task;
  String id;
  String descripation;
  String Place;
  String time;
  String userId;
  String notification;

  AddTaskModel(
      {required this.task,
      required this.descripation,
      required this.Place,
      required this.time,
      required this.notification,
      required this.id,
      required this.userId});
}
