class ToDoListModel {
  final int id;
  final String title;
  final String dec;
  final String createdAt;
  final bool isComplrted;

  ToDoListModel({
    required this.id,
    required this.title,
    required this.dec,
    required this.createdAt,
    required this.isComplrted,
  });
}

class TodoLists {
  final List<ToDoListModel> todolist;

  TodoLists({required this.todolist});

  factory TodoLists.fromJson(dynamic json) {
    final rawList = json is List ? json : (json["todoList"] ?? []);
    final templist = (rawList as List).map<ToDoListModel>((temp) {
      return ToDoListModel(
        id: temp["id"] ?? 0,
        title: (temp["title"] ?? "").toString(),
        dec: (temp["description"] ?? temp["descreption"] ?? "").toString(),
        createdAt: (temp["createdAt"] ?? "").toString(),
        isComplrted: temp["isCompleted"] ?? false,
      );
    }).toList();
    return TodoLists(todolist: templist);
  }
}
