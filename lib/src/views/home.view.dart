import 'package:flutter/material.dart';
import 'package:curso/src/widgets/widgets.dart';
import 'package:curso/src/entities/todo_item.entity.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  int _counter = 1;

  List<TodoItemEntity> task = [
    TodoItemEntity(
      title: "Minha tarefa",
      description: "Varrer a casa antes da esposa chegar",
    ),
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _incrementCounter() {
    showDialog(
      context: context,
      builder: (context) {
        return InputTaskDialogWidget(
          titleController: titleController,
          descriptionController: descriptionController,
        );
      },
    );
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _counter,
          itemBuilder: (context, index) {
            return TodoItemWidget(
              title: task[index].title,
              description: task[index].description,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blueAccent.shade200,
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Visibility(
            visible: _counter > 0,
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent.shade200,
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
