class TodoItemEntity {
  final String title;
  final String description;
  final bool? checked;

  TodoItemEntity({
    required this.title,
    required this.description,
    this.checked,
  });
}
