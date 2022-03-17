class Task {
  int id; //id of task
  String content; //content of the task
  // String description;
  bool completed; //bool if the task is complete or not
  DateTime? createdAt; //time of creation of task

  Task(this.id, this.content, this.completed, this.createdAt);
  // Task(this.id, this.content, this.description, this.completed, this.createdAt,
  //     {Key? key});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(json['id'], json['title'], json['completed'], DateTime.now());
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': content,
        'completed': completed,
      };
}
