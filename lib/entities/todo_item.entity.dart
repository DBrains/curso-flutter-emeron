class TodoItemEntity {
  final String title;
  final String description;
  final bool? checked;
  final List<dynamic>? subtask;

  TodoItemEntity( {
    required this.title,
    required this.description,
    this.checked,
    this.subtask,
  });
}
