class Task {
  int id; //id of task
  String content; //content of the task
  // String description;
  bool completed; //bool if the task is complete or not
  DateTime? createdAt; //time of creation of task
  DateTime? expiredAt; //expired time of task

  Task(
      {required this.id,
      required this.content,
      required this.completed,
      this.createdAt,
      this.expiredAt});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      content: json['title'],
      completed: json['completed'],
      createdAt: DateTime.now(),
      expiredAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': content,
        'completed': completed,
      };
}
